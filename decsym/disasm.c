#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdint.h>
#include "disasm.h"

struct disasm_info {
	uint32_t addr;
	OpCode *pc;
	unsigned int *numOpcodes;
	char *strbuf;
	char *strptr;
	OpCode opcode;
	int opsize;
	SignedWord disp;
};

/******************************************************************************/
/*** ---------------------------------------------------------------------- ***/
/******************************************************************************/

#define addch(info, ch) *(info)->strptr++ = ch

/*** ---------------------------------------------------------------------- ***/

static void addstr(struct disasm_info *info, const char *s)
{
	while (*s != '\0')
		addch(info, *s++);
}

/*** ---------------------------------------------------------------------- ***/

static void addspaces(struct disasm_info *info)
{
	int n = (int)(info->strptr - info->strbuf);
	
	while (n < 8)
	{
		addch(info, ' ');
		++n;
	}
}

/*** ---------------------------------------------------------------------- ***/

static void printhexchar(struct disasm_info *info, unsigned int v)
{
	if (v < 10)
		addch(info, v + '0');
	else
		addch(info, v + 'A' - 10);
}

/*** ---------------------------------------------------------------------- ***/

static void printquickval(struct disasm_info *info, unsigned int v)
{
	v &= 7;
	if (v == 0)
		printhexchar(info, 8);
	else
		printhexchar(info, v);
}

/*** ---------------------------------------------------------------------- ***/

static void printsize(struct disasm_info *info)
{
	addch(info, '.');
	switch ((info->opcode >> 6) & 3)
	{
	case 0:
		addch(info, 'B');
		info->opsize = 0;
		break;
	case 1:
		addch(info, 'W');
		info->opsize = 1;
		break;
	case 2:
		addch(info, 'L');
		info->opsize = 2;
		break;
	default:
		addch(info, '?');
		info->opsize = 1;
		break;
	}
}

/*** ---------------------------------------------------------------------- ***/

static void printhexbyte(struct disasm_info *info, unsigned int v)
{
	printhexchar(info, (v >> 4) & 0x0f);
	printhexchar(info, v & 0x0f);
	addch(info, 'H');
}

/*** ---------------------------------------------------------------------- ***/

static void printhexword(struct disasm_info *info, unsigned int v)
{
	printhexchar(info, (v >> 12) & 0x0f);
	printhexchar(info, (v >> 8) & 0x0f);
	printhexchar(info, (v >> 4) & 0x0f);
	printhexchar(info, (v >> 0) & 0x0f);
}

/*** ---------------------------------------------------------------------- ***/

static void incpc(struct disasm_info *info)
{
	info->pc++;
	(*info->numOpcodes)++;
}

/*** ---------------------------------------------------------------------- ***/

static void printword(struct disasm_info *info, unsigned int v)
{
	info->strptr += sprintf(info->strptr, "%u", v);
}

/*** ---------------------------------------------------------------------- ***/

static void printsignedword(struct disasm_info *info, int v)
{
	info->strptr += sprintf(info->strptr, "%d", v);
}

/*** ---------------------------------------------------------------------- ***/

static void fetchword(struct disasm_info *info, int format)
{
	info->disp = *(info->pc);
	switch (format)
	{
	case 0:
		printhexword(info, (unsigned short)info->disp);
		addch(info, 'H');
		break;
	case 1:
		printword(info, (unsigned short)info->disp);
		break;
	case 2:
		printsignedword(info, info->disp);
		break;
	case 3:
		printhexword(info, (unsigned short)info->disp);
		break;
	}
	incpc(info);
}

/*** ---------------------------------------------------------------------- ***/

static void printtarget(struct disasm_info *info, unsigned int offset)
{
	uint32_t dest;

	dest = info->addr - offset + *info->numOpcodes * 2 + info->disp;
	printhexword(info, (unsigned int)(dest >> 16));
	printhexword(info, (unsigned int)dest);
	addch(info, 'H');
}
  
/*** ---------------------------------------------------------------------- ***/

static void printaddrreg(struct disasm_info *info, unsigned int v)
{
	addch(info, 'A');
	v &= 7;
	printhexchar(info, v);
}

/*** ---------------------------------------------------------------------- ***/

static void printdatareg(struct disasm_info *info, unsigned int v)
{
	addch(info, 'D');
	v &= 7;
	printhexchar(info, v);
}

/*** ---------------------------------------------------------------------- ***/

static void printeamode(struct disasm_info *info, unsigned int mode, unsigned int reg)
{
	switch (mode & 7)
	{
	case 0: /* Dn */
		printdatareg(info, reg);
		break;
	case 1: /* An */
		printaddrreg(info, reg);
		break;
	case 2: /* (An) */
		addch(info, '(');
		printaddrreg(info, reg);
		addch(info, ')');
		break;
	case 3: /* (An)+ */
		addch(info, '(');
		printaddrreg(info, reg);
		addstr(info, ")+");
		break;
	case 4: /* -(An) */
		addstr(info, "-(");
		printaddrreg(info, reg);
		addch(info, ')');
		break;
	case 5: /* d16(An) */
		fetchword(info, 2);
		addch(info, '(');
		printaddrreg(info, reg);
		addch(info, ')');
		break;
	case 6: /* d8(An,Xn.s) */
		info->disp = *info->pc & 0xff;
		if (info->disp >= 128)
			info->disp -= 256;
		printsignedword(info, info->disp);
		addch(info, '(');
		printaddrreg(info, reg);
		addch(info, ',');
		if (*info->pc & 0x8000)
			printaddrreg(info, *info->pc >> 12);
		else
			printdatareg(info, *info->pc >> 12);
		addch(info, '.');
		if (*info->pc & 0x0800)
			addch(info, 'L');
		else
			addch(info, 'W');
		addch(info, ')');
		incpc(info);
		break;
	case 7:
		switch (reg & 7)
		{
		case 0: /* abs.w */
			fetchword(info, 0);
			break;
		case 1: /* abs.l */
			fetchword(info, 3);
			fetchword(info, 3);
			addch(info, 'H');
			break;
		case 2: /* d16(pc) */
			addch(info, '[');
			fetchword(info, 2);
			addstr(info, "(PC)] = ");
			printtarget(info, 2);
			break;
		case 3: /* d8(pc,Xn) */
			addch(info, '[');
			info->disp = *info->pc & 0xff;
			if (info->disp >= 128)
				info->disp -= 256;
			printsignedword(info, info->disp);
			addstr(info, "(PC)] = ");
			printtarget(info, 2);
			addch(info, '(');
			if (*info->pc & 0x8000)
				printaddrreg(info, *info->pc >> 12);
			else
				printdatareg(info, *info->pc >> 12);
			addch(info, '.');
			if (*info->pc & 0x0800)
				addch(info, 'L');
			else
				addch(info, 'W');
			addch(info, ')');
			incpc(info);
			break;
		case 4: /* #imm */
			addch(info, '#');
			switch (info->opsize)
			{
			case 0:
				printhexbyte(info, *info->pc & 0xff);
				incpc(info);
				break;
			case 1:
				fetchword(info, 2);
				break;
			case 2:
				fetchword(info, 3);
				fetchword(info, 3);
				addch(info, 'H');
				break;
			default:
				addstr(info, "???");
				break;
			}
			break;
		default:
			addstr(info, "???");
			break;
		}
	}
}

/*** ---------------------------------------------------------------------- ***/

static void printea(struct disasm_info *info)
{
	printeamode(info, info->opcode >> 3, info->opcode);
}

/*** ---------------------------------------------------------------------- ***/

static void printdataorpredec(struct disasm_info *info)
{
	if (info->opcode & 0x08)
	{
		printaddrreg(info, info->opcode);
		addstr(info, "),-(");
		printaddrreg(info, info->opcode >> 9);
		addch(info, ')');
	} else
	{
		printdatareg(info, info->opcode);
		addch(info, ',');
		printdatareg(info, info->opcode >> 9);
		addstr(info, "-(");
	}
}

/*** ---------------------------------------------------------------------- ***/

static void printcc(struct disasm_info *info)
{
	switch ((info->opcode >> 8) & 15)
	{
	case 0:
		addch(info, 'T');
		break;
	case 1:
		addch(info, 'F');
		break;
	case 2:
		addch(info, 'H');
		addch(info, 'I');
		break;
	case 3:
		addch(info, 'L');
		addch(info, 'S');
		break;
	case 4:
		addch(info, 'C');
		addch(info, 'C');
		break;
	case 5:
		addch(info, 'C');
		addch(info, 'S');
		break;
	case 6:
		addch(info, 'N');
		addch(info, 'E');
		break;
	case 7:
		addch(info, 'E');
		addch(info, 'Q');
		break;
	case 8:
		addch(info, 'V');
		addch(info, 'C');
		break;
	case 9:
		addch(info, 'V');
		addch(info, 'S');
		break;
	case 10:
		addch(info, 'P');
		addch(info, 'L');
		break;
	case 11:
		addch(info, 'M');
		addch(info, 'I');
		break;
	case 12:
		addch(info, 'G');
		addch(info, 'E');
		break;
	case 13:
		addch(info, 'L');
		addch(info, 'T');
		break;
	case 14:
		addch(info, 'G');
		addch(info, 'T');
		break;
	case 15:
		addch(info, 'L');
		addch(info, 'E');
		break;
	}
}

/*** ---------------------------------------------------------------------- ***/

static void printshiftinst(struct disasm_info *info, OpCode opc)
{
	switch (opc & 3)
	{
	case 0:
		addstr(info, "AS");
		break;
	case 1:
		addstr(info, "LS");
		break;
	case 2:
		addstr(info, "ROX");
		break;
	case 3:
		addstr(info, "RO");
		break;
	}
	if (info->opcode & 0x100)
		addch(info, 'L');
	else
		addch(info, 'R');
}
  
/*** ---------------------------------------------------------------------- ***/

static void printimmedinst(struct disasm_info *info, const char *s)
{
	addstr(info, s);
	if ((info->opcode & 63) == 60)
	{
		addspaces(info);
		addch(info, '#');
		if (info->opcode & 0x40)
		{
			fetchword(info, 0);
			addstr(info, ",SR");
		} else
		{
			printhexbyte(info, *info->pc & 0xff);
			incpc(info);
			addstr(info, ",CCR");
		}
	} else
	{
		printsize(info);
		addspaces(info);
		addch(info, '#');
		switch ((info->opcode >> 6) & 3)
		{
		case 0:
			printhexbyte(info, *info->pc & 0xff);
			incpc(info);
			break;
		case 1:
			fetchword(info, 0);
			break;
		case 2:
			fetchword(info, 3);
			fetchword(info, 3);
			addch(info, 'H');
			break;
		default:
			addstr(info, "???");
			break;
		}
		addch(info, ',');
		printea(info);
	}
}
  
/*** ---------------------------------------------------------------------- ***/

static void printmoveinst(struct disasm_info *info, const char *s)
{
	addstr(info, s);
	addspaces(info);
	printeamode(info, info->opcode >> 3, info->opcode);
	addch(info, ',');
	printeamode(info, info->opcode >> 6, info->opcode >> 9);
}

/*** ---------------------------------------------------------------------- ***/

static void printmonadicinst(struct disasm_info *info, const char *s)
{
	addstr(info, s);
	printsize(info);
	addspaces(info);
	printea(info);
}
	
/*** ---------------------------------------------------------------------- ***/

static void printdyadicinst(struct disasm_info *info, const char *s)
{
	addstr(info, s);
	if (((info->opcode >> 6) & 3) == 3)
	{
		addstr(info, "A.");
		if (info->opcode & 0x100)
		{
			info->opsize = 2;
			addch(info, 'L');
		} else
		{
			info->opsize = 1;
			addch(info, 'W');
		}
		addspaces(info);
		printea(info);
		addch(info, ',');
		printaddrreg(info, info->opcode >> 9);
	} else
	{
		printsize(info);
		addspaces(info);
		if (info->opcode & 0x100)
		{
			printdatareg(info, info->opcode >> 9);
			addch(info, ',');
			printea(info);
		} else
		{
			printea(info);
			addch(info, ',');
			printdatareg(info, info->opcode >> 9);
		}
	}
}

/*** ---------------------------------------------------------------------- ***/

static void group0(struct disasm_info *info)
{
	if (((info->opcode >> 3) & 7) == 1)
	{
		if (info->opcode & 0x40)
		{
			addstr(info, "MOVEP.L");
			info->opsize = 2;
		} else
		{
			addstr(info, "MOVEP.W");
			info->opsize = 1;
		}
		addspaces(info);
		if (info->opcode & 0x80)
		{
			printdatareg(info, info->opcode >> 9);
			addch(info, ',');
			fetchword(info, 2);
			addch(info, '(');
			printaddrreg(info, info->opcode);
			addch(info, ')');
		} else
		{
			fetchword(info, 2);
			addch(info, '(');
			printaddrreg(info, info->opcode);
			addch(info, ')');
			addch(info, ',');
			printdatareg(info, info->opcode >> 9);
		}
	} else
	{
		switch ((info->opcode >> 8) & 15)
		{
		case 0:
			printimmedinst(info, "ORI");
			break;
		case 2:
			printimmedinst(info, "ANDI");
			break;
		case 4:
			printimmedinst(info, "SUBI");
			break;
		case 6:
			printimmedinst(info, "ADDI");
			break;
		case 8:
			switch ((info->opcode >> 6) & 3)
			{
			case 0:
				addstr(info, "BTST");
				break;
			case 1:
				addstr(info, "BCHG");
				break;
			case 2:
				addstr(info, "BCLR");
				break;
			case 3:
				addstr(info, "BSET");
				break;
			}
			addspaces(info);
			addch(info, '#');
			fetchword(info, 1);
			addch(info, ',');
			if (((info->opcode >> 3) & 7) == 0)
				info->opsize = 0;
			else
				info->opsize = 2;
			printea(info);
			break;
		case 10:
			printimmedinst(info, "EORI");
			break;
		case 12:
			printimmedinst(info, "CMPI");
			break;
		default:
			if (info->opcode & 0x0100)
			{
				switch ((info->opcode >> 6) & 3)
				{
				case 0:
					addstr(info, "BTST");
					break;
				case 1:
					addstr(info, "BCHG");
					break;
				case 2:
					addstr(info, "BCLR");
					break;
				case 3:
					addstr(info, "BSET");
					break;
				}
				addspaces(info);
				printdatareg(info, info->opcode >> 9);
				addch(info, ',');
				if (((info->opcode >> 3) & 7) == 0)
					info->opsize = 0;
				else
					info->opsize = 2;
				printea(info);
			} else
			{
				addstr(info, "ILLEGAL"); /* FIXME: can be moves */
			}
			break;
		}
	}
}

/*** ---------------------------------------------------------------------- ***/

static void group4(struct disasm_info *info)
{
	OpCode reglist;
	
	switch ((info->opcode >> 8) & 15)
	{
	case 0:
		if (((info->opcode >> 6) & 3) == 3)
		{
			addstr(info, "MOVE");
			info->opsize = 1;
			addspaces(info);
			addstr(info, "SR,");
			printea(info);
		} else
		{
			printmonadicinst(info, "NEGX");
		}
		break;

	case 2:
		printmonadicinst(info, "CLR");
		break;

	case 4:
		if (((info->opcode >> 6) & 3) == 3)
		{
			addstr(info, "MOVE");
			info->opsize = 0;
			addspaces(info);
			printea(info);
			addstr(info, ",CCR");
		} else
		{
			printmonadicinst(info, "NEG");
		}
		break;
	
	case 6:
		if (((info->opcode >> 6) & 3) == 3)
		{
			addstr(info, "MOVE");
			info->opsize = 1;
			addspaces(info);
			printea(info);
			addstr(info, ",SR");
		} else
		{
			printmonadicinst(info, "NOT");
		}
		break;
	
	case 8:
		switch ((info->opcode >> 3) & 31)
		{
		case 24:
			addstr(info, "EXT.L");
			addspaces(info);
			printdatareg(info, info->opcode);
			break;
		case 16:
			addstr(info, "EXT.W");
			addspaces(info);
			printdatareg(info, info->opcode);
			break;
		case 8:
			addstr(info, "SWAP");
			addspaces(info);
			printdatareg(info, info->opcode);
			break;
		default:
			switch ((info->opcode >> 6) & 3)
			{
			case 0:
				addstr(info, "NBCD");
				info->opsize = 0;
				addspaces(info);
				break;
			case 1:
				addstr(info, "PEA");
				info->opsize = 2;
				addspaces(info);
				break;
			case 2:
				addstr(info, "MOVEM.W");
				info->opsize = 1;
				addspaces(info);
				/* FIXME: decode register list instead of writing constant */
				addch(info, '#');
				fetchword(info, 0);
				addch(info, ',');
				break;
			case 3:
				addstr(info, "MOVEM.L");
				info->opsize = 2;
				addspaces(info);
				/* FIXME: decode register list instead of writing constant */
				addch(info, '#');
				fetchword(info, 0);
				addch(info, ',');
				break;
			}
			printea(info);
			break;
		}
		break;
	
	case 10:
		if (((info->opcode >> 6) & 3) == 3)
		{
			addstr(info, "TAS");
			info->opsize = 0;
			addspaces(info);
			printea(info);
		} else
		{
			addstr(info, "TST");
			printsize(info);
			addspaces(info);
			printea(info);
		}
		break;
	
	case 12:
		switch ((info->opcode >> 6) & 3)
		{
		case 0:
		case 1:
			addstr(info, "ILLEGAL");
			break;
		case 2:
			addstr(info, "MOVEM.W");
			info->opsize = 1;
			addspaces(info);
			reglist = *info->pc;
			incpc(info);
			printea(info);
			/* FIXME: decode register list instead of writing constant */
			addch(info, ',');
			addch(info, '#');
			printhexword(info, reglist);
			addch(info, 'H');
			break;
		case 3:
			addstr(info, "MOVEM.L");
			info->opsize = 2;
			addspaces(info);
			reglist = *info->pc;
			incpc(info);
			printea(info);
			/* FIXME: decode register list instead of writing constant */
			addch(info, ',');
			addch(info, '#');
			printhexword(info, reglist);
			addch(info, 'H');
			break;
		}
		break;
	
	case 14:
		switch (info->opcode & 255)
		{
		case 64:
		case 65:
		case 66:
		case 67:
		case 68:
		case 69:
		case 70:
		case 71:
		case 72:
		case 73:
		case 74:
		case 75:
		case 76:
		case 77:
		case 78:
		case 79:
			addstr(info, "TRAP");
			addspaces(info);
			addch(info, '#');
			printword(info, info->opcode & 15);
			break;
		case 80:
		case 81:
		case 82:
		case 83:
		case 84:
		case 85:
		case 86:
		case 87:
			addstr(info, "LINK");
			addspaces(info);
			printaddrreg(info, info->opcode);
			addch(info, ',');
			addch(info, '#');
			fetchword(info, 2);
			break;
		case 88:
		case 89:
		case 90:
		case 91:
		case 92:
		case 93:
		case 94:
		case 95:
			addstr(info, "UNLK");
			addspaces(info);
			printaddrreg(info, info->opcode);
			break;
		case 96:
		case 97:
		case 98:
		case 99:
		case 100:
		case 101:
		case 102:
		case 103:
			addstr(info, "MOVE");
			addspaces(info);
			printaddrreg(info, info->opcode);
			addstr(info, ",USP");
			break;
		case 104:
		case 105:
		case 106:
		case 107:
		case 108:
		case 109:
		case 110:
		case 111:
			addstr(info, "MOVE");
			addspaces(info);
			addstr(info, "USP,");
			printaddrreg(info, info->opcode);
			break;
		case 112:
			addstr(info, "RESET");
			break;
		case 113:
			addstr(info, "NOP");
			break;
		case 114:
			addstr(info, "STOP");
			break;
		case 115:
			addstr(info, "RTE");
			break;
		case 117:
			addstr(info, "RTS");
			break;
		case 118:
			addstr(info, "TRAPV");
			break;
		case 119:
			addstr(info, "RTR");
			break;
		case 128: case 129: case 130: case 131: case 132: case 133: case 134: case 135:
		case 136: case 137: case 138: case 139: case 140: case 141: case 142: case 143:
		case 144: case 145: case 146: case 147: case 148: case 149: case 150: case 151:
		case 152: case 153: case 154: case 155: case 156: case 157: case 158: case 159:
		case 160: case 161: case 162: case 163: case 164: case 165: case 166: case 167:
		case 168: case 169: case 170: case 171: case 172: case 173: case 174: case 175:
		case 176: case 177: case 178: case 179: case 180: case 181: case 182: case 183:
		case 184: case 185: case 186: case 187: case 188: case 189: case 190: case 191:
			addstr(info, "JSR");
			addspaces(info);
			printea(info);
			break;
		case 192: case 193: case 194: case 195: case 196: case 197: case 198: case 199:
		case 200: case 201: case 202: case 203: case 204: case 205: case 206: case 207:
		case 208: case 209: case 210: case 211: case 212: case 213: case 214: case 215:
		case 216: case 217: case 218: case 219: case 220: case 221: case 222: case 223:
		case 224: case 225: case 226: case 227: case 228: case 229: case 230: case 231:
		case 232: case 233: case 234: case 235: case 236: case 237: case 238: case 239:
		case 240: case 241: case 242: case 243: case 244: case 245: case 246: case 247:
		case 248: case 249: case 250: case 251: case 252: case 253: case 254: case 255:
			addstr(info, "JMP");
			addspaces(info);
			printea(info);
			break;
		default:
			addstr(info, "ILLEGAL");
			break;
		}
		break;
	
	default:
		switch ((info->opcode >> 6) & 3)
		{
		case 2:
			addstr(info, "CHK");
			info->opsize = 1;
			addspaces(info);
			printea(info);
			addch(info, ',');
			printdatareg(info, info->opcode >> 9);
			break;
		case 3:
			addstr(info, "LEA");
			info->opsize = 2;
			addspaces(info);
			printea(info);
			addch(info, ',');
			printaddrreg(info, info->opcode >> 9);
			break;
		default:
			addstr(info, "ILLEGAL");
			break;
		}
		break;
	}
}

/*** ---------------------------------------------------------------------- ***/

void disasm(uint32_t addr, OpCode *pc, unsigned int *numOpcodes, char *strbuf)
{
	struct disasm_info _info;
	struct disasm_info *info = &_info;
	
	info->addr = addr;
	info->pc = pc;
	info->numOpcodes = numOpcodes;
	info->opcode = *info->pc;
	*numOpcodes = 0;
	incpc(info);
	info->strbuf = strbuf;
	info->strptr = strbuf;
	info->opsize = 4;

	switch ((info->opcode >> 12) & 15)
	{
	case 0:
		group0(info);
		break;
		
	case 1:
		info->opsize = 0;
		printmoveinst(info, "MOVE.B");
		break;
		
	case 2:
		info->opsize = 2;
		printmoveinst(info, "MOVE.L");
		break;
		
	case 3:
		info->opsize = 1;
		printmoveinst(info, "MOVE.W");
		break;
		
	case 4:
		group4(info);
		break;
		
	case 5:
		switch ((info->opcode >> 6) & 7)
		{
		case 0:
		case 1:
		case 2:
			addstr(info, "ADDQ");
			printsize(info);
			addspaces(info);
			addch(info, '#');
			printquickval(info, info->opcode >> 9);
			addch(info, ',');
			printea(info);
			break;
		case 3:
		case 7:
			if (((info->opcode >> 3) & 7) == 1)
			{
				addstr(info, "DB");
				if (((info->opcode >> 8) & 15) == 1)
					addstr(info, "RA");
				else
					printcc(info);
				addspaces(info);
				printdatareg(info, info->opcode);
				addch(info, ',');
				addch(info, '[');
				fetchword(info, 0);
				addstr(info, "] = ");
				printtarget(info, 2);
			} else
			{
				addch(info, 'S');
				info->opsize = 0;
				printcc(info);
				addspaces(info);
				printea(info);
			}
			break;
		case 4:
		case 5:
		case 6:
			addstr(info, "SUBQ");
			printsize(info);
			addspaces(info);
			addch(info, '#');
			printquickval(info, info->opcode >> 9);
			addch(info, ',');
			printea(info);
			break;
		}
		break;
		
	case 6:
		addch(info, 'B');
		if (((info->opcode >> 8) & 15) == 0)
			addstr(info, "RA");
		else if (((info->opcode >> 8) & 15) == 1)
			addstr(info, "SR");
		else
			printcc(info);
		addspaces(info);
		if ((info->opcode & 0xff) != 0)
		{
			addch(info, '[');
			printhexbyte(info, info->opcode & 0xff);
			addstr(info, "] = ");
			info->disp = info->opcode & 0xff;
			if (info->disp >= 128)
				info->disp -= 256;
			printtarget(info, 0);
		} else
		{
			addch(info, '[');
			fetchword(info, 0);
			addstr(info, "] = ");
			printtarget(info, 2);
		}
		break;
		
	case 7:
		if (info->opcode & 0x100)
		{
			addstr(info, "ILLEGAL");
		} else
		{
			addstr(info, "MOVEQ");
			addspaces(info);
			addch(info, '#');
			printhexbyte(info, info->opcode & 0xff);
			addch(info, ',');
			printdatareg(info, info->opcode >> 9);
		}
		break;
		
	case 8:
		if (((info->opcode >> 4) & 31) == 16)
		{
			addstr(info, "SBCD");
			addspaces(info);
			printdataorpredec(info);
		} else
		{
			switch ((info->opcode >> 6) & 7)
			{
			case 0:
			case 1:
			case 2:
			case 4:
			case 5:
			case 6:
				printdyadicinst(info, "OR");
				break;
			case 3:
				addstr(info, "DIVU");
				info->opsize = 1;
				addspaces(info);
				printea(info);
				addch(info, ',');
				printdatareg(info, info->opcode >> 9);
				break;
			case 7:
				addstr(info, "DIVS");
				info->opsize = 1;
				addspaces(info);
				printea(info);
				addch(info, ',');
				printdatareg(info, info->opcode >> 9);
				break;
			}
		}
		break;
		
	case 9:
		if ((info->opcode & 0x100) && (((info->opcode >> 4) & 3) == 0) && (((info->opcode >> 6) & 3) != 3))
		{
			addstr(info, "SUBX");
			printsize(info);
			addspaces(info);
			printdataorpredec(info);
		} else
		{
			printdyadicinst(info, "SUB");
		}
		break;
		
	case 11:
		if ((info->opcode & 0x100) && (((info->opcode >> 6) & 3) != 3))
		{
			if (((info->opcode >> 3) & 7) == 1)
			{
				addstr(info, "CMPM");
				printsize(info);
				addspaces(info);
				addch(info, '(');
				printaddrreg(info, info->opcode);
				addstr(info, ")+,(");
				printaddrreg(info, info->opcode >> 9);
				addstr(info, ")+");
			} else
			{
				printdyadicinst(info, "EOR");
			}
		} else
		{
			printdyadicinst(info, "CMP");
		}
		break;
		
	case 12:
		switch ((info->opcode >> 3) & 63)
		{
		case 40:
			addstr(info, "EXG");
			addspaces(info);
			printdatareg(info, info->opcode >> 9);
			addch(info, ',');
			printdatareg(info, info->opcode);
			break;
		case 41:
			addstr(info, "EXG");
			addspaces(info);
			printaddrreg(info, info->opcode >> 9);
			addch(info, ',');
			printaddrreg(info, info->opcode);
			break;
		case 49:
			addstr(info, "EXG");
			addspaces(info);
			printdatareg(info, info->opcode >> 9);
			addch(info, ',');
			printaddrreg(info, info->opcode );
			break;
		case 32:
		case 33:
			addstr(info, "ABCD");
			addspaces(info);
			printdataorpredec(info);
			break;
		case 56:
		case 57:
		case 58:
		case 59:
		case 60:
		case 61:
		case 62:
		case 63:
			addstr(info, "MULS");
			info->opsize = 1;
			addspaces(info);
			printea(info);
			addch(info, ',');
			printdatareg(info, info->opcode >> 9);
			break;
		case 24:
		case 25:
		case 26:
		case 27:
		case 28:
		case 29:
		case 30:
		case 31:
			addstr(info, "MULU");
			info->opsize = 1;
			addspaces(info);
			printea(info);
			addch(info, ',');
			printdatareg(info, info->opcode >> 9);
			break;
		default:
			printdyadicinst(info, "AND");
			break;
		}
		break;
		
	case 13:
		if ((info->opcode & 0x100) && (((info->opcode >> 4) & 3) == 0) && (((info->opcode >> 6) & 3) != 3))
		{
			addstr(info, "ADDX");
			printsize(info);
			addspaces(info);
			printdataorpredec(info);
		} else
		{
			printdyadicinst(info, "ADD");
		}
		break;
		
	case 14:
		if (((info->opcode >> 6) & 3) == 3)
		{
			printshiftinst(info, (info->opcode >> 9) & 3);
			addstr(info, ".W");
			info->opsize = 1;
			addspaces(info);
			printea(info);
		} else
		{
			printshiftinst(info, (info->opcode >> 3) & 3);
			printsize(info);
			addspaces(info);
			if (info->opcode & 0x20)
			{
				printdatareg(info, info->opcode >> 9);
			} else
			{
				addch(info, '#');
				printquickval(info, info->opcode >> 9);
			}
			addch(info, ',');
			printdatareg(info, info->opcode);
		}
		break;
		
	default:
		addstr(info, "ILLEGAL");
		break;
	}
	
	*info->strptr = '\0';
}
