IMPLEMENTATION MODULE BIOS;
(*$S-*)
(*$T-*)

FROM SYSTEM IMPORT CODE, ADR, PUSH, POP, REGISTER, ADDRESS;

CONST TRAP13 = 04E4DH;


PROCEDURE GetMPB(VAR mpb: MPB);
BEGIN
  PUSH(ADR(mpb));
  PUSH(0);
  CODE(TRAP13);
END GetMPB;


PROCEDURE BConStat(dev: Device): BOOLEAN;
BEGIN
  PUSH(ORD(dev));
  PUSH(1);
  CODE(TRAP13);
  RETURN BOOLEAN(BITSET(REGISTER(0)) * BITSET(1));
END BConStat;


PROCEDURE BCosStat(dev: Device): BOOLEAN;
BEGIN
  PUSH(ORD(dev));
  PUSH(8);
  CODE(TRAP13);
  RETURN BOOLEAN(BITSET(REGISTER(0)) * BITSET(1));
END BCosStat;


PROCEDURE BConIn(dev: Device): LONGCARD;
BEGIN
  PUSH(ORD(dev));
  PUSH(2);
  CODE(TRAP13);
  RETURN LONGCARD(REGISTER(0));
END BConIn;


PROCEDURE BConOut(dev: Device; ch: CHAR);
BEGIN
  PUSH(ORD(ch));
  PUSH(ORD(dev));
  PUSH(3);
  CODE(TRAP13);
END BConOut;


PROCEDURE RWAbs(mode: RW; buffer: ADDRESS; count: CARDINAL; recno: CARDINAL; dev: CARDINAL): LONGINT;
BEGIN
  PUSH(dev);
  PUSH(recno);
  PUSH(count);
  PUSH(buffer);
  PUSH(ORD(mode));
  PUSH(4);
  CODE(TRAP13);
  RETURN LONGINT(REGISTER(0));
END RWAbs;


PROCEDURE SetException(excno: CARDINAL; p: PROC);
BEGIN
  PUSH(p);
  PUSH(excno);
  PUSH(5);
  CODE(TRAP13);
END SetException;


PROCEDURE GetException(excno: CARDINAL): ADDRESS;
BEGIN
  PUSH(ADDRESS(-1));
  PUSH(excno);
  PUSH(5);
  CODE(TRAP13);
  RETURN REGISTER(0);
END GetException;


PROCEDURE TimerCalibration(): LONGCARD;
BEGIN
  PUSH(6);
  CODE(TRAP13);
  RETURN LONGCARD(REGISTER(0));
END TimerCalibration;


PROCEDURE GetBPB(dev: CARDINAL): BPBPtr;
BEGIN
  PUSH(dev);
  PUSH(7);
  CODE(TRAP13);
  RETURN REGISTER(0);
END GetBPB;


PROCEDURE MediaChange(dev: CARDINAL): MCState;
BEGIN
  PUSH(dev);
  PUSH(9);
  CODE(TRAP13);
  RETURN MCState(REGISTER(0));
END MediaChange;


PROCEDURE DriveMap(): DriveSet;
BEGIN
  PUSH(10);
  CODE(TRAP13);
  RETURN DriveSet(REGISTER(0));
END DriveMap;


PROCEDURE SetKBShift(keys: KBShifts);
BEGIN
  PUSH(CARDINAL(keys));
  PUSH(11);
  CODE(TRAP13);
END SetKBShift;


PROCEDURE GetKBShift(): KBShifts;
BEGIN
  PUSH(-1);
  PUSH(11);
  CODE(TRAP13);
  RETURN KBShifts(REGISTER(0));
END GetKBShift;



END BIOS.
