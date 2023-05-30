#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <stdio.h>
#include <signal.h>
#include <unistd.h>

/* Seconds to run */
#define SECONDS	15

/* Compiler dependent options */
#define	NOENUM							/* Define if compiler has no enum's */
								/* #define NOSTRUCTASSIGN *//* Define if compiler can't assign structures */


/* Define only one of the next two defines */
#define TIMES							/* Use times(2) time function */
						/*#define TIME	*//* Use time(2) time function */


#ifdef TIME
/* Ganularity of time(2) is of course 1 second */
#define HZ	1
#endif

#ifdef TIMES
/* Define the granularity of your times(2) function */
#include <sys/param.h>
#endif

/* For compatibility with goofed up version */
						/*#undef GOOF		*//* Define if you want the goofed up version */


#ifdef GOOF
char Version[] = "1.0";
#else
char Version[] = "1.1";
#endif


#ifdef	NOSTRUCTASSIGN
#define	structassign(d, s)	memcpy(&(d), &(s), sizeof(d))
#else
#define	structassign(d, s)	d = s
#endif


#ifdef	NOENUM
#define	Ident1	1
#define	Ident2	2
#define	Ident3	3
#define	Ident4	4
#define	Ident5	5
typedef int Enumeration;
#else
typedef enum
{
	Ident1, Ident2, Ident3, Ident4, Ident5
} Enumeration;
#endif

typedef int OneToThirty;
typedef int OneToFifty;
typedef char CapitalLetter;
typedef char String30[31];
typedef int Array1Dim[51];
typedef int Array2Dim[51][51];

struct Record
{
	struct Record *PtrComp;
	Enumeration Discr;
	Enumeration EnumComp;
	OneToFifty IntComp;
	String30 StringComp;
};

typedef struct Record RecordType;
typedef RecordType *RecordPtr;
typedef int boolean;

#ifdef NULL
#undef NULL
#endif

#define	NULL		0
#define	TRUE		1
#define	FALSE		0

#ifndef REG
#define	REG
#endif


#ifdef TIMES
#include <sys/times.h>
#endif


static Enumeration Func1(CapitalLetter CharPar1, CapitalLetter CharPar2)
{
	REG CapitalLetter CharLoc1;
	REG CapitalLetter CharLoc2;

	CharLoc1 = CharPar1;
	CharLoc2 = CharLoc1;
	if (CharLoc2 != CharPar2)
		return (Ident1);
	else
		return (Ident2);
}


static boolean Func2(String30 StrParI1, String30 StrParI2)
{
	REG OneToThirty IntLoc;
	REG CapitalLetter CharLoc;

	IntLoc = 1;
	while (IntLoc <= 1)
		if (Func1(StrParI1[IntLoc], StrParI2[IntLoc + 1]) == Ident1)
		{
			CharLoc = 'A';
			++IntLoc;
		}
	if (CharLoc >= 'W' && CharLoc <= 'Z')
		IntLoc = 7;
	if (CharLoc == 'X')
	{
		return (TRUE);
	} else
	{
		if (strcmp(StrParI1, StrParI2) > 0)
		{
			IntLoc += 7;
			return (TRUE);
		} else
			return (FALSE);
	}
}


static boolean Func3(REG Enumeration EnumParIn)
{
	REG Enumeration EnumLoc;

	EnumLoc = EnumParIn;
	if (EnumLoc == Ident3)
		return (TRUE);
	return (FALSE);
}



#ifdef TIMES
static unsigned long get_timer(void)
{
	struct tms tms;
	times(&tms);
	return tms.tms_utime;
}
#endif


#ifdef TIME
static unsigned long get_timer(void)
{
	return time(NULL);
}
#endif



/* Package 1  */
int IntGlob;
boolean BoolGlob;
char Char1Glob;
char Char2Glob;
Array1Dim Array1Glob;
Array2Dim Array2Glob;
RecordPtr PtrGlb;
RecordPtr PtrGlbNext;
RecordType rec1, rec2;


static void Proc7(OneToFifty IntParI1, OneToFifty IntParI2, OneToFifty *IntParOut)
{
	REG OneToFifty IntLoc;

	IntLoc = IntParI1 + 2;
	*IntParOut = IntParI2 + IntLoc;
}


static void Proc3(RecordPtr *PtrParOut)
{
	if (PtrGlb != NULL)
		*PtrParOut = PtrGlb->PtrComp;
	else
		IntGlob = 100;
	Proc7(10, IntGlob, &PtrGlb->IntComp);
}


static void Proc6(REG Enumeration EnumParIn, REG Enumeration *EnumParOut)
{
	*EnumParOut = EnumParIn;
	if (!Func3(EnumParIn))
		*EnumParOut = Ident4;
	switch (EnumParIn)
	{
	case Ident1:
		*EnumParOut = Ident1;
		break;
	case Ident2:
		if (IntGlob > 100)
			*EnumParOut = Ident1;
		else
			*EnumParOut = Ident4;
		break;
	case Ident3:
		*EnumParOut = Ident2;
		break;
	case Ident4:
		break;
	case Ident5:
		*EnumParOut = Ident3;
		break;
	}
}


static void Proc1(REG RecordPtr PtrParIn)
{
#define	NextRecord	(*(PtrParIn->PtrComp))

	structassign(NextRecord, *PtrGlb);
	PtrParIn->IntComp = 5;
	NextRecord.IntComp = PtrParIn->IntComp;
	NextRecord.PtrComp = PtrParIn->PtrComp;
	Proc3((RecordPtr *) NextRecord.PtrComp);
	if (NextRecord.Discr == Ident1)
	{
		NextRecord.IntComp = 6;
		Proc6(PtrParIn->EnumComp, &NextRecord.EnumComp);
		NextRecord.PtrComp = PtrGlb->PtrComp;
		Proc7(NextRecord.IntComp, 10, &NextRecord.IntComp);
	} else
		structassign(*PtrParIn, NextRecord);

#undef	NextRecord
}


static void Proc2(OneToFifty *IntParIO)
{
	REG OneToFifty IntLoc;
	REG Enumeration EnumLoc;

	IntLoc = *IntParIO + 10;
	for (;;)
	{
		if (Char1Glob == 'A')
		{
			--IntLoc;
			*IntParIO = IntLoc - IntGlob;
			EnumLoc = Ident1;
		}
		if (EnumLoc == Ident1)
			break;
	}
}


static void Proc4(void)
{
	REG boolean BoolLoc;

	BoolLoc = Char1Glob == 'A';
	BoolLoc |= BoolGlob;
	Char2Glob = 'B';
}


static void Proc5(void)
{
	Char1Glob = 'A';
	BoolGlob = FALSE;
}


static void Proc8(Array1Dim Array1Par, Array2Dim Array2Par, OneToFifty IntParI1, OneToFifty IntParI2)
{
	REG OneToFifty IntLoc;
	REG OneToFifty IntIndex;

	IntLoc = IntParI1 + 5;
	Array1Par[IntLoc] = IntParI2;
	Array1Par[IntLoc + 1] = Array1Par[IntLoc];
	Array1Par[IntLoc + 30] = IntLoc;
	for (IntIndex = IntLoc; IntIndex <= (IntLoc + 1); ++IntIndex)
		Array2Par[IntLoc][IntIndex] = IntLoc;
	++Array2Par[IntLoc][IntLoc - 1];
	Array2Par[IntLoc + 20][IntLoc] = Array1Par[IntLoc];
	IntGlob = 5;
}




static void Proc0(void)
{
	OneToFifty IntLoc1;
	REG OneToFifty IntLoc2;
	OneToFifty IntLoc3;
	REG char CharIndex;
	Enumeration EnumLoc;
	String30 String1Loc;
	String30 String2Loc;
	REG unsigned long i;
	unsigned long starttime;
	unsigned long endtime;
	unsigned long benchtime;
	unsigned long nullloops;
	unsigned long nulltime;
	unsigned long benchloops;

	i = 0;

	starttime = get_timer();
	endtime = starttime + 1 * HZ;
	while (get_timer() < endtime)
		i++;
	nullloops = i;
	nulltime = get_timer() - starttime;
	
	PtrGlbNext = &rec1;
	PtrGlb = &rec2;
	PtrGlb->PtrComp = PtrGlbNext;
	PtrGlb->Discr = Ident1;
	PtrGlb->EnumComp = Ident3;
	PtrGlb->IntComp = 40;
	strcpy(PtrGlb->StringComp, "DHRYSTONE PROGRAM, SOME STRING");
#ifndef	GOOF
	strcpy(String1Loc, "DHRYSTONE PROGRAM, 1'ST STRING");	/* GOOF */
#endif

	Array2Glob[8][7] = 10;				/* Was missing in published program */

	/*****************
	-- Start Timer --
	*****************/
	i = 0;

	starttime = get_timer();
	endtime = starttime + SECONDS * HZ;
	
	while (get_timer() < endtime)
	{
		i++;
		Proc5();
		Proc4();
		IntLoc1 = 2;
		IntLoc2 = 3;
		strcpy(String2Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
		EnumLoc = Ident2;
		BoolGlob = !Func2(String1Loc, String2Loc);
		while (IntLoc1 < IntLoc2)
		{
			IntLoc3 = 5 * IntLoc1 - IntLoc2;
			Proc7(IntLoc1, IntLoc2, &IntLoc3);
			++IntLoc1;
		}
		Proc8(Array1Glob, Array2Glob, IntLoc1, IntLoc3);
		Proc1(PtrGlb);
		for (CharIndex = 'A'; CharIndex <= Char2Glob; ++CharIndex)
			if (EnumLoc == Func1(CharIndex, 'C'))
				Proc6(Ident1, &EnumLoc);
		IntLoc3 = IntLoc2 * IntLoc1;
		IntLoc2 = IntLoc3 / IntLoc1;
		IntLoc2 = 7 * (IntLoc3 - IntLoc2) - IntLoc1;
		Proc2(&IntLoc1);
	}

	/*****************
	-- Stop Timer --
	*****************/

	benchtime = get_timer() - starttime;
	benchloops = i;

	/* Approximately correct benchtime to the nulltime. */
	benchtime -= (nulltime * benchloops) / nullloops;

	printf("Dhrystone(%s) time for %lu passes = %lu.%02lu\n",
		   Version, benchloops, benchtime / HZ, benchtime % HZ * 100 / HZ);
	printf("This machine benchmarks at %lu dhrystones/second\n", benchloops * HZ / benchtime);
}


int main(void)
{
	Proc0();
	return (0);
}
