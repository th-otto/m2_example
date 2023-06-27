/*
 * decsym: utility to decode TDI modula *.sym files
 *
 * Ported to C by Thorsten Otto
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <limits.h>
#include <errno.h>
#include <stdint.h>

#include "symdefs.h"

#ifndef FALSE
# define FALSE 0
# define TRUE  1
#endif

typedef char StrBuf[256];

static FILE *infile;
static FILE *outfile;
static unsigned int indentLevel;
#define INDENT 2
static SymFileSymbols lastByte;
static unsigned int outputX;
static unsigned int maxOutputLen = 75;
static int printExports = TRUE;

/******************************************************************************/
/*** ---------------------------------------------------------------------- ***/
/******************************************************************************/

static char *basename(char *filename)
{
	char *slash, *slash2;

	slash = strrchr(filename, '/');
	slash2 = strrchr(filename, '\\');
	if (slash == NULL || slash2 > slash)
		slash = slash2;
	if (slash == NULL)
		slash = filename;
	else
		++slash;
	return slash;
}

/*** ---------------------------------------------------------------------- ***/

static int OpenFiles(const char *filename)
{
	char outname[PATH_MAX];
	char *dot;
	
	infile = fopen(filename, "rb");
	if (infile == NULL)
	{
		fprintf(stderr, "%s: %s\n", filename, strerror(errno));
		return FALSE;
	}
	strcpy(outname, filename);
	dot = strrchr(basename(outname), '.');
	if (dot == NULL)
		strcat(outname, ".dec");
	else
		strcpy(dot, ".dec");
	outfile = fopen(outname, "w");
	if (outfile == NULL)
	{
		fprintf(stderr, "%s: %s\n", outname, strerror(errno));
		fclose(infile);
		infile = NULL;
		return FALSE;
	}
	return TRUE;
}

/*** ---------------------------------------------------------------------- ***/

static void CloseFiles(void)
{
	if (infile != NULL)
	{
		fclose(infile);
		infile = NULL;
	}
	if (outfile != NULL)
	{
		fclose(outfile);
		outfile = NULL;
	}
}

/*** ---------------------------------------------------------------------- ***/

static void Error(const char *str)
{
	fprintf(stderr, "%s\n Error in SymbolFile\n", str);
	CloseFiles();
	exit(EXIT_FAILURE);
}

/*** ---------------------------------------------------------------------- ***/

static void WriteLn(void)
{
	putc('\n', outfile);
	outputX = 0;
}

/*** ---------------------------------------------------------------------- ***/

static void checkLineLine(void)
{
	if (maxOutputLen != 0 && outputX > maxOutputLen)
		WriteLn();
}

/*** ---------------------------------------------------------------------- ***/

static void Write(int ch)
{
	checkLineLine();
	putc(ch, outfile);
	++outputX;
}

/*** ---------------------------------------------------------------------- ***/

static void WriteString(const char *str)
{
	checkLineLine();
	fputs(str, outfile);
	outputX += (unsigned int)strlen(str);
}

/*** ---------------------------------------------------------------------- ***/

static void WriteCard(unsigned int val, int len)
{
	checkLineLine();
	outputX += fprintf(outfile, "%*u", len, val);
}

/*** ---------------------------------------------------------------------- ***/

static void WriteHexCard(unsigned int val, int len)
{
	checkLineLine();
	outputX += fprintf(outfile, "%*XH", len, val);
}

/*** ---------------------------------------------------------------------- ***/

static void WriteLong(uint32_t val)
{
	checkLineLine();
	outputX += fprintf(outfile, "%lu", (unsigned long)val);
}

/*** ---------------------------------------------------------------------- ***/

static void WriteSpaces(unsigned int n)
{
	WriteLn();
	while (n != 0)
	{
		Write(' ');
		--n;
	}
}

/*** ---------------------------------------------------------------------- ***/

static void IndentUp(const char *str)
{
	indentLevel = outputX + INDENT;
	WriteString(str);
}

/*** ---------------------------------------------------------------------- ***/

static void IndentDown(const char *str)
{
	indentLevel -= INDENT;
	WriteSpaces(indentLevel);
	WriteString(str);
}

/******************************************************************************/
/*** ---------------------------------------------------------------------- ***/
/******************************************************************************/

static SymFileSymbols ReadByte(void)
{
	lastByte = fgetc(infile);
	return lastByte;
}

/*** ---------------------------------------------------------------------- ***/

static void ReadString(char *str, size_t len)
{
	int ch;
	
	--len;
	for (;;)
	{
		ch = fgetc(infile);
		if (ch == '\0' || ch == EOF)
			break;
		if (len != 0)
		{
			*str++ = ch;
			--len;
		}
	}
	*str = '\0';
}

/*** ---------------------------------------------------------------------- ***/

static unsigned int Read16Bit(void)
{
	unsigned int hi, lo;
	
	hi = fgetc(infile);
	lo = fgetc(infile);
	return (hi << 8) | lo;
}

/*** ---------------------------------------------------------------------- ***/

static uint32_t Read32Bit(void)
{
	uint32_t hi, lo;
	
	hi = Read16Bit();
	lo = Read16Bit();
	return (hi << 16) | lo;
}

/*** ---------------------------------------------------------------------- ***/

static void Expect(SymFileSymbols b)
{
	if (lastByte != b)
	{
		WriteString("incorrect symbol on symbol file");
		Error("");
	}
}

/*** ---------------------------------------------------------------------- ***/

static SymFileSymbols NextIf(SymFileSymbols b)
{
	Expect(b);
	return ReadByte();
}

/*** ---------------------------------------------------------------------- ***/

/******************************************************************************/
/*** ---------------------------------------------------------------------- ***/
/******************************************************************************/

static unsigned int DecodeShortConst(void)
{
	unsigned int w;
	
	Expect(shortconstSS);
	w = Read16Bit();
	ReadByte();
	return w;
}

/*** ---------------------------------------------------------------------- ***/

static uint32_t DecodeLongConst(void)
{
	uint32_t l;
	
	Expect(normalconstSS);
	l = Read32Bit();
	ReadByte();
	return l;
}

/*** ---------------------------------------------------------------------- ***/

static int DecodeIdent(int first, int force)
{
	StrBuf s;
	
	Expect(identSS);
	ReadString(s, sizeof(s));
	ReadByte();
	if (force || !(s[0] >= '0' && s[0] <= '9'))
	{
		if (!first)
			WriteString(", ");
		WriteString(s);
		return TRUE;
	}
	return FALSE;
}

/*** ---------------------------------------------------------------------- ***/

static SymFileSymbols SkipIdent(void)
{
	StrBuf s;
	
	Expect(identSS);
	ReadString(s, sizeof(s));
	return ReadByte();
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeModuleKey(void)
{
	WriteLn();
	WriteSpaces(indentLevel);
	WriteString("(* module key = ");
	WriteHexCard(DecodeShortConst(), 5);
	WriteHexCard(DecodeShortConst(), 5);
	WriteHexCard(DecodeShortConst(), 5);
	WriteString(" *)");
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeFileKey(void)
{
	unsigned int version;

	version = DecodeShortConst();
	WriteString("(* syntax version = ");
	WriteHexCard(version, 5);
	WriteString(" *)");
	if (version != symFileKey)
	{
		fprintf(outfile, "error: SymFileSyntaxVersion must be %u, not %u\n", symFileKey, version);
		Error("");
	}
}

/*** ---------------------------------------------------------------------- ***/

static SymFileSymbols DecodeSubModuleIdent(char *ident, size_t len)
{
	Expect(identSS);
	ReadString(ident, len);
	WriteSpaces(indentLevel);
	WriteString("MODULE ");
	WriteString(ident);
	Write(';');
	WriteLn();
	return ReadByte();
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeBaseType(void)
{
	DecodeIdent(TRUE, TRUE);
	while (lastByte == periodSS)
	{
		ReadByte();
		Write('.');
		DecodeIdent(TRUE, TRUE);
	}
}

/*** ---------------------------------------------------------------------- ***/

static SymFileSymbols DecodeReal(void)
{
	union {
		uint32_t l;
		float f;
	} u;
	char buf[80];
	
	u.l = Read32Bit();
	sprintf(buf, "%e", u.f);
	WriteString(buf);
	return ReadByte();
}

/*** ---------------------------------------------------------------------- ***/

static SymFileSymbols DecodeString(void)
{
	StrBuf str;
	char term;
	
	ReadString(str, sizeof(str));
	term = strchr(str, '"') != NULL ? '\'' : '"';
	Write(term);
	WriteString(str);
	Write(term);
	return ReadByte();
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeConst(void)
{
	switch (lastByte)
	{
	case shortconstSS:
		WriteCard(DecodeShortConst(), 1);
		WriteString(" (*");
		DecodeBaseType();
		WriteString("*)");
		break;
	case normalconstSS:
		WriteLong(DecodeLongConst());
		WriteString(" (*");
		DecodeBaseType();
		WriteString("*)");
		break;
	case realconstSS:
		DecodeReal();
		break;
	case stringconstSS:
		DecodeString();
		break;
	default:
		Error(" illegal symbol in CONST-Declaration ");
		break;
	}
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeList(void)
{
	unsigned int oldindentLevel;

	ReadByte();
	Write('(');
	oldindentLevel = indentLevel;
	while (lastByte == identSS)
	{
		DecodeIdent(TRUE, TRUE);
		WriteString(" (*");
		WriteCard(DecodeShortConst(), 1);
		WriteString("*)");
		if (lastByte == identSS)
		{
			Write(',');
			WriteSpaces(oldindentLevel);
		}
	}
	NextIf(rparentSS);
	Write(')');
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeRange(void)
{
	ReadByte();
	Write('[');
	DecodeConst();
	NextIf(rangeSS);
	WriteString("..");
	DecodeConst();
	NextIf(rbracketSS);
	Write(']');
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeSimpleType(void)
{
	switch (lastByte)
	{
	case identSS:
		DecodeBaseType();
		break;
	case lparentSS:
		DecodeList();
		break;
	case lbracketSS:
		DecodeRange();
		break;
	default:
		Error(" illegal symbol in Simple Type ");
		break;
	}
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeType(void);

static void DecodeArrayType(void)
{
	ReadByte();
	WriteString("ARRAY ");
	DecodeSimpleType();
	NextIf(ofSS);
	WriteString(" OF ");
	DecodeType();
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeSize(void)
{
	WriteString(" (*size: ");
	WriteLong(DecodeLongConst());
	WriteString("*)");
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeOffset(void)
{
	WriteString("(*offset: ");
	WriteLong(DecodeLongConst());
	WriteString("*) ");
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeRecordIdent(void)
{
	WriteSpaces(indentLevel);
	DecodeIdent(TRUE, TRUE);
	DecodeOffset();
	NextIf(colonSS);
	WriteString(" : ");
	DecodeType();
	Write(';');
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeVariantVal(void)
{
	WriteCard(DecodeShortConst(), 2);
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeVariant(void)
{
	WriteSpaces(indentLevel);
	ReadByte();
	IndentUp("CASE");
	NextIf(colonSS);
	WriteString(" : ");
	DecodeBaseType();
	WriteString(" OF ");
	WriteSpaces(indentLevel);
	while (lastByte == ofSS)
	{
		ReadByte();
		while (lastByte == shortconstSS)
		{
			DecodeVariantVal();
			if (lastByte == shortconstSS)
				WriteString(", ");
		}
		NextIf(colonSS);
		WriteString(" : ");
		if (lastByte == caseSS)
			DecodeVariant();
		DecodeSize();
		if (lastByte == ofSS)
		{
			WriteSpaces(indentLevel - INDENT);
			WriteString("| ");
		}
	}
	if (lastByte == elseSS)
	{
		ReadByte();
		WriteSpaces(indentLevel);
		WriteString("ELSE ");
		if (lastByte == caseSS)
		{
			DecodeVariant();
			DecodeSize();
		}
	}
	NextIf(endSS);
	IndentDown("END;");
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeRecordType(void)
{
	ReadByte();
	IndentUp("RECORD");
	while (lastByte == identSS)
		DecodeRecordIdent();
	if (lastByte == caseSS)
		DecodeVariant();
	NextIf(endSS);
	WriteSpaces(indentLevel);
	DecodeSize();
	IndentDown("END");
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeSetType(void)
{
	ReadByte();
	WriteString("SET OF ");
	DecodeSimpleType();
}

/*** ---------------------------------------------------------------------- ***/

static void DecodePointerType(void)
{
	ReadByte();
	WriteString("POINTER TO ");
	DecodeType();
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeProcedureType(void)
{
	ReadByte();
	WriteString("PROCEDURE ");
	NextIf(lparentSS);
	Write('(');
	while (lastByte == varSS || lastByte == arraytypSS || lastByte == identSS)
	{
		if (lastByte == varSS)
		{
			WriteString("VAR ");
			ReadByte();
		}
		if (lastByte == arraytypSS)
		{
			WriteString("ARRAY OF ");
			ReadByte();
		}
		DecodeBaseType();
		if (lastByte != rparentSS)
			WriteString("; ");
	}
	NextIf(rparentSS);
	Write(')');
	if (lastByte == colonSS)
	{
		ReadByte();
		WriteString(" : ");
		DecodeBaseType();
	}
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeType(void)
{
	switch (lastByte)
	{
	case identSS:
	case lparentSS:
	case lbracketSS:
		DecodeSimpleType();
		break;
	case hiddentypSS:
		ReadByte();
		WriteString(" (*hidden type*) ");
		break;
	case arraytypSS:
		DecodeArrayType();
		break;
	case recordtypSS:
		DecodeRecordType();
		break;
	case settypSS:
		DecodeSetType();
		break;
	case pointertypSS:
		DecodePointerType();
		break;
	case procSS:
		DecodeProcedureType();
		break;
	default:
		Error(" illegal symbol in TYPE-Declaration ");
		break;
	}
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeConstDecl(void)
{
	WriteSpaces(indentLevel);
	DecodeIdent(TRUE, TRUE);
	WriteString(" = ");
	DecodeConst();
	Write(';');
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeTypeDecl(void)
{
	WriteSpaces(indentLevel);
	DecodeIdent(TRUE, TRUE);
	WriteString(" = ");
	DecodeType();
	Write(';');
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeProcParams(void)
{
	NextIf(procSS);
	NextIf(lparentSS);
	Write('(');
	while (lastByte == varSS || lastByte == arraytypSS || lastByte == identSS)
	{
		if (lastByte == varSS)
		{
			WriteString("VAR ");
			ReadByte();
		}
		if (lastByte == arraytypSS)
		{
			WriteString("ARRAY OF ");
			ReadByte();
		}
		DecodeBaseType();
		if (lastByte != rparentSS)
			WriteString("; ");
	}
	NextIf(rparentSS);
	Write(')');
	if (lastByte == colonSS)
	{
		ReadByte();
		WriteString(" : ");
		DecodeBaseType();
	}
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeProcDecl(void)
{
	StrBuf ident;
	unsigned int procnum;
	
	Expect(identSS);
	ReadString(ident, sizeof(ident));
	ReadByte();

	procnum = DecodeShortConst();
	WriteString("(* ProcNum:");
	WriteCard(procnum, 1);
	WriteString(" *) ");

	WriteString(ident);
	DecodeProcParams();
	Write(';');
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeVarAddr(void)
{
	WriteString(" (* ");
	if (lastByte == lbracketSS)
	{
		WriteString("absaddr: ");
		NextIf(lbracketSS);
		WriteLong(DecodeLongConst());
		NextIf(rbracketSS);
	} else
	{
		WriteString("reladdr: ");
		WriteLong(DecodeLongConst());
	}
	WriteString("*) ");
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeVarDecl(void)
{
	WriteSpaces(indentLevel);
	DecodeIdent(TRUE, TRUE);
	DecodeVarAddr();
	NextIf(colonSS);
	WriteString(" : ");
	DecodeType();
	Write(';');
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeDecl(void)
{
	indentLevel = 2 * INDENT;
	WriteSpaces(indentLevel);
	switch (lastByte)
	{
	case constSS:
		IndentUp("CONST");
		ReadByte();
		while (lastByte == identSS)
			DecodeConstDecl();
		break;
	case typSS:
		IndentUp("TYPE");
		ReadByte();
		while (lastByte == identSS)
			DecodeTypeDecl();
		break;
	case procSS:
		IndentUp("PROCEDURE ");
		ReadByte();
		DecodeProcDecl();
		break;
	case varSS:
		IndentUp("VAR");
		ReadByte();
		while (lastByte == identSS)
			DecodeVarDecl();
		break;
	default:
		Error(" illegal SymFileSymbol ");
		break;
	}
	IndentDown("");
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeUnit(void)
{
	StrBuf unitIdent;
	int first;

	NextIf(unitSS);
	indentLevel = INDENT;
	DecodeModuleKey();
	DecodeSubModuleIdent(unitIdent, sizeof(unitIdent));
	if (lastByte == importSS)
	{
		ReadByte();
		WriteSpaces(2 * INDENT);
		WriteString("IMPORT ");
		first = TRUE;
		while (lastByte == identSS)
		{
			if (DecodeIdent(first, TRUE))
				first = FALSE;
		}
		Write(';');
		WriteLn();
	}
	if (lastByte == exportSS)
	{
		ReadByte();
		if (printExports)
		{
			WriteSpaces(2 * INDENT);
			WriteString("EXPORT QUALIFIED ");
			first = TRUE;
			while (lastByte == identSS)
			{
				if (DecodeIdent(first, FALSE))
					first = FALSE;
			}
			Write(';');
			WriteLn();
		} else
		{
			while (lastByte == identSS)
				SkipIdent();
		}
	}
	while (lastByte == constSS || lastByte == typSS || lastByte == procSS || lastByte == varSS)
		DecodeDecl();
	NextIf(endunitSS);
	WriteSpaces(INDENT);
	WriteString("END ");
	WriteString(unitIdent);
	Write(';');
}

/*** ---------------------------------------------------------------------- ***/

static SymFileSymbols DecodeModuleIdent(char *ident, size_t len)
{
	Expect(identSS);
	ReadString(ident, len);
	WriteLn();
	WriteString("DEFINITION MODULE ");
	WriteString(ident);
	Write(';');
	WriteLn();
	return ReadByte();
}

/*** ---------------------------------------------------------------------- ***/

static void Decode(void)
{
	StrBuf moduleident;
	
	DecodeFileKey();
	DecodeModuleKey();
	DecodeModuleIdent(moduleident, sizeof(moduleident));

	while (lastByte == unitSS)
		DecodeUnit();
	Expect(endfileSS);
	WriteLn();
	WriteLn();
	WriteString("END ");
	WriteString(moduleident);
	Write('.');
	WriteLn();
}

/******************************************************************************/
/*** ---------------------------------------------------------------------- ***/
/******************************************************************************/

int main(int argc, char **argv)
{
	char *filename;

	printf("Symbol file decoder   Version  3.00a\n\n");
	
	if (argc != 2)
	{
		fprintf(stderr, "missing filename\n");
		return EXIT_FAILURE;
	}
	filename = argv[1];
	
	if (OpenFiles(filename))
	{
		outputX = 0;
		indentLevel = 0;
		ReadByte();
		Decode();
	} else
	{
		return EXIT_FAILURE;
	}
	
	CloseFiles();
	
	printf("End of decode\n");
	
	return EXIT_SUCCESS;
}
