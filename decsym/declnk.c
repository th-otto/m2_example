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

#include "lnkdefs.h"
#include "disasm.h"

#ifndef FALSE
# define FALSE 0
# define TRUE  1
#endif

static FILE *infile;
static FILE *outfile;
static unsigned short crc;
static int printCrc = FALSE;

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

#define ParamErrStr "Decode parameter error."

static void ParameterError(const char *str)
{
	fprintf(stderr, "%s\n", str);
}

/*** ---------------------------------------------------------------------- ***/

static void Write(int ch)
{
	putc(ch, outfile);
}

/*** ---------------------------------------------------------------------- ***/

static void WriteLn(void)
{
	putc('\n', outfile);
}

/*** ---------------------------------------------------------------------- ***/

static void WriteString(const char *str)
{
	fputs(str, outfile);
}

/*** ---------------------------------------------------------------------- ***/

static void WriteCard(unsigned int val, int len)
{
	fprintf(outfile, "%*u", len, val);
}

/*** ---------------------------------------------------------------------- ***/

static void WriteHexCard(unsigned int val, int len)
{
	fprintf(outfile, "%*XH", len, val);
}

/*** ---------------------------------------------------------------------- ***/

static void WriteHexLongCard(uint32_t val, int len)
{
	fprintf(outfile, "%*lXH", len, (unsigned long)val);
}

/*** ---------------------------------------------------------------------- ***/

static void WriteHexZeroCard(unsigned int val)
{
	fprintf(outfile, "%04X", val);
}

/*** ---------------------------------------------------------------------- ***/

static void WriteLong(uint32_t val)
{
	fprintf(outfile, "%lu", (unsigned long)val);
}

/*** ---------------------------------------------------------------------- ***/

static void WriteSpaces(unsigned int n)
{
	while (n != 0)
	{
		Write(' ');
		--n;
	}
}

/******************************************************************************/
/*** ---------------------------------------------------------------------- ***/
/******************************************************************************/

static void resetCrc(void)
{
	crc = 0;
}

/*** ---------------------------------------------------------------------- ***/

static unsigned int Read16Bit(void)
{
	unsigned int hi, lo, v;
	
	hi = fgetc(infile);
	lo = fgetc(infile);
	v = (hi << 8) | lo;
	crc += v;
	return v;
}

/*** ---------------------------------------------------------------------- ***/

static uint32_t Read32Bit(void)
{
	uint32_t hi, lo;
	
	hi = Read16Bit();
	lo = Read16Bit();
	return (hi << 16) | lo;
}

/******************************************************************************/
/*** ---------------------------------------------------------------------- ***/
/******************************************************************************/

static void WriteRange(uint32_t val, uint32_t offset)
{
	WriteHexLongCard(val, 6);
	if (offset != 0)
		WriteHexLongCard(offset + val, 7);
	else
		WriteSpaces(8);
}

/*** ---------------------------------------------------------------------- ***/

static void WriteData(OpCode *data, unsigned int count)
{
	unsigned int i, n;
	
	n = 5 - count;
	i = 0;
	while (count != 0)
	{
		WriteHexZeroCard(data[i]);
		Write(' ');
		++i;
		--count;
	}
	while (n != 0)
	{
		WriteSpaces(5);
		--n;
	}
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeData(uint32_t offset, uint32_t size)
{
	unsigned int words;
    unsigned int w;
    uint32_t addr;

	WriteLn();
	WriteString("NO DECODE -------- DATA");
	WriteLn();
	addr = 0;
	words = 5;
	while (addr < size)
	{
		if (words == 5)
		{
			words = 0;
			WriteLn();
			WriteRange(addr, offset);
			Write(' ');
		}
		w = Read16Bit();
		WriteHexZeroCard(w);
		WriteSpaces(5);
		addr += 2;
		words += 1;
	}
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeInstructions(uint32_t entry, uint32_t offset, uint32_t size)
{
	unsigned int i;
	unsigned int numOpcodes;
	unsigned int nread;
	uint32_t addr;
	unsigned short w;
	OpCode opcodes[5];
	char strbuf[128];

	addr = 0;
	WriteLn();
	WriteString(" DECODE --------                        INSTRUCTION");
	WriteLn();
	if ((entry & 1) || (size & 1) || (entry > size))
	{
		ParameterError(ParamErrStr);
		WriteLn();
		WriteString(ParamErrStr);
	} else
	{
		while (addr < entry)
		{
			WriteRange(addr, offset);
			WriteSpaces(5);
			w = Read16Bit();
			WriteHexCard(w, 9);
			WriteLn();
			addr += 2;
		}
		nread = 0;
		do
		{
			while (addr < size && nread < 5)
			{
				opcodes[nread] = Read16Bit();
				addr += 2;
				nread += 1;
			}
			disasm(addr - nread * 2, opcodes, &numOpcodes, strbuf);
			WriteRange(addr - nread * 2, offset);
			WriteData(opcodes, numOpcodes);
			WriteString(strbuf);
			WriteLn();
			if (numOpcodes < nread && numOpcodes < 5 && nread > 0)
			{
				for (i = numOpcodes; i < nread; i++)
					opcodes[i - numOpcodes] = opcodes[i];
			}
			if (numOpcodes < nread)
				nread = nread - numOpcodes;
			else
				nread = 0;
		} while (addr < size || nread > 0);
	}
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeSymbol(LnkFileSymbols sy)
{
	switch (sy)
	{
		case scmodHeader: WriteString("scmod header"); break;
		case import: WriteString("import"); break;
		case dataSize: WriteString("data size"); break;
		case filledData: WriteString("filled data"); break;
		case procCode: WriteString("proc code"); break;
		case initCode: WriteString("init code"); break;
		case scmodInitCode: WriteString("scmod init code"); break;
		case excpCode: WriteString("excp code"); break;
		case refOwnData: WriteString("ref own data"); break;
		case refExtData: WriteString("ref ext data"); break;
		case refOwnCode: WriteString("ref own code"); break;
		case refOwnProcCall: WriteString("ref own proc call"); break;
		case refExtProcCall: WriteString("ref ext proc call"); break;
		case refOwnProcAss: WriteString("ref own proc ass"); break;
		case refExtProcAss: WriteString("ref ext proc ass"); break;
		case refOwnExcp: WriteString("ref own excp"); break;
		case refExtExcp: WriteString("ref ext excp"); break;
		case refExtInitCall: WriteString("ref ext init call"); break;
		case scmodEnd: WriteString("scmod end"); break;
		case linkCodeVersion: WriteString("link code version:"); break;
		case refAnyProcCall: WriteString("ref any proc call:"); break;
		case refAnyProcAss: WriteString("ref any proc ass:"); break;
		case stringData: WriteString("string data:"); break;
		case boundData: WriteString("bound data:"); break;
		case refOwnString: WriteString("ref own string:"); break;
		case refOwnBound: WriteString("ref own bound:"); break;
		case refUtil: WriteString("ref util:"); break;
		case loadUtil: WriteString("load util:"); break;
		case defAbsSymbol: WriteString("def abs symbol:"); break;
		case refAbsSymbol: WriteString("ref abs symbol:"); break;
		case refOwnQuickCall: WriteString("ref own quick call"); break;
		case refExtQuickCall: WriteString("ref ext quick call"); break;
		case refOwnQuickAss: WriteString("ref own quick ass"); break;
		case refExtQuickAss: WriteString("ref ext quick ass"); break;
		default: WriteString("--- unknown Symbol ---"); break;
	}
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeLinkCodeVersion(void)
{
	unsigned int w;

	DecodeSymbol(linkCodeVersion);
	w = Read16Bit();
	Write(' ');
	WriteHexCard(w >> 8, 2);
	Write(' ');
	WriteHexCard(w & 0xff, 2);
	WriteLn();
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeModuleName(void)
{
	char header[25];
	unsigned int i;
	unsigned int w;
	
	Write(' ');
	for (i = 0; i < 12; i++)
	{
		w = Read16Bit();
		header[i * 2 + 0] = (w >> 8) & 0xff;
		header[i * 2 + 1] = w & 0xff;
	}
	header[24] = '\0';
	WriteString(header);
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeWord(void)
{
	unsigned int w;
	
	w = Read16Bit();
	WriteHexCard(w, 6);
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeModuleKey(void)
{
	WriteString(", key =");
	DecodeWord();
	DecodeWord();
	DecodeWord();
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeModnum(void)
{
	unsigned int w;

	w = Read16Bit();
	WriteString(", modnum = ");
	WriteCard(w, 2);
}

/*** ---------------------------------------------------------------------- ***/

static unsigned int DecodeSize(void)
{
	unsigned int w;

	w = Read16Bit();
	WriteString(", number of bytes = ");
	WriteCard(w, 1);
	return w;
}

/*** ---------------------------------------------------------------------- ***/

static uint32_t DecodeLongSize(void)
{
	uint32_t v;
	
	v = Read32Bit();
	WriteString(", number of bytes = ");
	WriteLong(v);
	return v;
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeProcnum(void)
{
	unsigned int w;

	w = Read16Bit();
	WriteString(", procnum = ");
	WriteCard(w, 2);
}

/*** ---------------------------------------------------------------------- ***/

static unsigned int DecodeEntry(void)
{
	unsigned int w;

	w = Read16Bit();
	WriteString(", entrypoint =");
	WriteHexCard(w, 6);
	return w;
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeReference(void)
{
	unsigned int w;

	w = Read16Bit();
	WriteString(" at");
	WriteHexCard(w, 6);
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeCrc(void)
{
	unsigned short w, calculatedcrc;

	calculatedcrc = crc;
	w = Read16Bit();
	crc = calculatedcrc;
	if (crc == w)
	{
		WriteString("  checksum:");
		if (printCrc)
			WriteHexCard(w, 6);
		WriteString(" o.k.");
	} else
	{
		WriteString("  ---- checksum error: ");
		WriteHexCard(w, 6);
		WriteString(" should be ");
		WriteHexCard(crc, 6);
	}
	WriteLn();
}

/*** ---------------------------------------------------------------------- ***/

static void PrintDirective(const char *s, unsigned int sy)
{
	fprintf(stderr, "%s: %u\n", s, sy);
}

/*** ---------------------------------------------------------------------- ***/

static void DecodeModule(void)
{
	LnkFileSymbols sy;
	unsigned int entry;
	unsigned int size;
	unsigned int w;
	uint32_t datasize;

	w = Read16Bit();
	if (w == linkCodeVersion)
	{
		DecodeLinkCodeVersion();
		DecodeCrc();
		do
		{
			WriteLn();
			w = Read16Bit();
			if (w <= refExtQuickAss)
			{
				sy = (LnkFileSymbols)w;
				DecodeSymbol(sy);
				switch (sy)
				{
				case scmodHeader:
					WriteString(": MODULE ");
					DecodeModuleName();
					DecodeModuleKey();
					break;
				case import:
					DecodeModuleName();
					DecodeModuleKey();
					DecodeModnum();
					break;
				case dataSize:
					datasize = DecodeLongSize();
					break;
				case filledData:
					WriteString(", rel. start addr. =");
					DecodeWord();
					datasize = DecodeLongSize();
					DecodeData(0, datasize);
					break;
				case stringData:
				case boundData:
					datasize = DecodeLongSize();
					DecodeData(0, datasize);
					break;
				case procCode:
				case initCode:
				case scmodInitCode:
					DecodeProcnum();
					entry = DecodeEntry();
					size = DecodeSize();
					DecodeInstructions(entry, 0, size);
					break;
				case excpCode:
				case refOwnExcp:
					/* NYI? */
					break;
				case refOwnData:
				case refOwnCode:
				case refExtInitCall:
				case refOwnString:
				case refOwnBound:
					DecodeReference();
					break;
				case refOwnProcCall:
				case refOwnProcAss:
				case refUtil:
				case refOwnQuickCall:
				case refOwnQuickAss:
					DecodeReference();
					DecodeProcnum();
					break;
				case refExtData:
					DecodeReference();
					DecodeModnum();
					break;
				case refExtProcCall:
				case refExtProcAss:
				case refExtExcp:
				case refExtQuickCall:
				case refExtQuickAss:
					DecodeReference();
					DecodeProcnum();
					DecodeModnum();
					break;
				case loadUtil:
					DecodeProcnum();
					break;
				case scmodEnd:
					/* nothing to do */
					break;
				default: /* linkCodeVersion, refAnyProcCall, refAnyProcAss, defAbsSymbol, refAbsSymbol */
					PrintDirective(" ---- illegal Directive", sy);
					sy = scmodEnd;
					break;
				}
				DecodeCrc();
			} else
			{
				PrintDirective(" ---- unknown directive number", w);
				sy = scmodEnd;
			}
		} while (sy != scmodEnd);
	} else
	{
		fprintf(stderr, " ---- no LinkCodeVersion found - halt\n");
	}
}

/******************************************************************************/
/*** ---------------------------------------------------------------------- ***/
/******************************************************************************/

int main(int argc, char **argv)
{
	char *filename;

	resetCrc();

	printf("Link file decoder   Version  2.00a\n\n");
	
	if (argc != 2)
	{
		fprintf(stderr, "missing filename\n");
		return EXIT_FAILURE;
	}
	filename = argv[1];
	
	if (OpenFiles(filename))
	{
		DecodeModule();
	}
	CloseFiles();
	
	printf("End of decode\n");

	return EXIT_SUCCESS;
}
