IMPLEMENTATION MODULE Clock;
(* V#005 *)

FROM SYSTEM IMPORT CARDINAL16, SHIFT;

IMPORT GEMDOS;

(*
  06.08.89  TT  Uebernahme der DateUtil-Funktionen (V2.00) von Markus Kilbinger
  10.11.90  TT  $L+ bei DateUtil-Funktionen - sollten nun laufen
*)

PROCEDURE PackDate(d: Date): CARDINAL;
VAR y, m, day: CARDINAL;
BEGIN
  y := d.year;
  m := d.month;
  day := d.day;
  IF y >= 1980 THEN
    DEC(y, 1980);
  END;
  RETURN CARDINAL(SHIFT(BITSET(y) * BITSET(127), 9) + SHIFT(BITSET(m) * BITSET(15), 5) + BITSET(day) * BITSET(31));
END PackDate;


PROCEDURE UnpackDate(d: CARDINAL): Date;
VAR pd: Date;
BEGIN
  pd.year := CARDINAL(SHIFT(BITSET(d), -9) * BITSET(127)) + 1980;
  pd.month := CARDINAL(SHIFT(BITSET(d), -5) * BITSET(15));
  pd.day := CARDINAL(BITSET(d) * BITSET(31));
  RETURN pd;
END UnpackDate;


PROCEDURE PackTime(t: Time): CARDINAL;
VAR h, m, s: CARDINAL;
BEGIN
  h := t.hour;
  m := t.minute;
  s := t.second;
  RETURN CARDINAL(SHIFT(BITSET(h) * BITSET(31), 11) + SHIFT(BITSET(m) * BITSET(63), 5) + SHIFT(BITSET(s) * BITSET(63), -1));
END PackTime;


PROCEDURE UnpackTime(t: CARDINAL): Time;
VAR pt: Time;
BEGIN
  pt.hour := CARDINAL(SHIFT(BITSET(t), -11) * BITSET(31));
  pt.minute := CARDINAL(SHIFT(BITSET(t), -5) * BITSET(63));
  pt.second := CARDINAL(SHIFT(BITSET(t), 1) * BITSET(63));
  RETURN pt;
END UnpackTime;


PROCEDURE CurrentDate(): Date;
VAR d: CARDINAL16;
BEGIN
  GEMDOS.GetDate(d);
  RETURN UnpackDate(d);
END CurrentDate;


PROCEDURE CurrentTime(): Time;
VAR t: CARDINAL16;
BEGIN
  GEMDOS.GetTime(t);
  RETURN UnpackTime(t);
END CurrentTime;


PROCEDURE SetDateAndTime(d: Date; t: Time);
BEGIN
  GEMDOS.SetTime(PackTime(t));
  GEMDOS.SetDate(PackDate(d));
END SetDateAndTime;


PROCEDURE GetDateAndTime(VAR date:Date; VAR time: Time);
VAR d: CARDINAL16;
VAR t: CARDINAL16;
BEGIN
  GEMDOS.GetTime(t);
  GEMDOS.GetDate(d);
  (* FIXME: may have race-condition when fetching time on last second of day *)
  time := UnpackTime(t);
  date := UnpackDate(d);
END GetDateAndTime;



CONST
    SYear       =       4;   (* MOD fuer Schaltjahr.       *)
    Century     =     100;   (* MOD fuer Jahrhundert.      *)
    SCentury    =     400;   (* MOD fuer Schaltjahrhundert. *)
    DaysPerWeek =       7;   (* MOD fuer Wochentag.        *)
    WeekdayOff  =       5;   (* Offset fuer Wochentag.     *)
    January     =       1;   (* Nr. vom Januar.            *)
    February    =       2;   (* Nr. vom Februar.           *)
    March       =       3;   (* Nr. vom Maerz.             *)
    December    =      12;   (* Nr. vom Dezember.          *)
    DaysPerYear =     365;   (* Tage pro Jahr.             *)
    Dividend    =     400;   (* kgV von 4, 100, 400.       *)
    Divisor     =  146097;   (* 400 * 365 + 100 - 4 + 1.   *)

VAR off : ARRAY [January..December] OF CARDINAL;   (* Offsets der Monate. *)


(* Testet, ob 'y' ein Schaltjahr ist unter Beruecksichtigung des
   gregorianischen Kalenders: Jahre, die mit zwei Nullen enden, sind nur
   dann ein Schaltjahr, wenn sie durch 400 teilbar sind. *)
PROCEDURE IsSYear(y : CARDINAL) : BOOLEAN;
BEGIN
  IF (y MOD 4) <> 0  THEN RETURN FALSE END;
  IF (y MOD 100) <> 0  THEN RETURN TRUE END;
  IF (y MOD 400) = 0  THEN RETURN TRUE END;
  RETURN FALSE;
END IsSYear;
  
  
PROCEDURE DayOfWeek(d : Date) : WeekDays;
VAR w: INTEGER;
    y: CARDINAL;
    m: CARDINAL;
BEGIN
  y := d.year;
  m := d.month;
  w := y + (y DIV SYear) - (y DIV Century) +
       (y DIV SCentury) + off[m] + VAL(CARDINAL, d.day) + WeekdayOff;
  IF (IsSYear(y) AND (m < March)) THEN
    DEC(w);
  END;
  w := w MOD DaysPerWeek;
  RETURN WeekDays(w);
END DayOfWeek;
  
  
(* Berechnet den Teil des 'Factor', der durch das Jahr 'y' bedingt ist. *)
PROCEDURE YearFac(y : CARDINAL) : CARDINAL;
BEGIN
  RETURN ((y) * DaysPerYear + ((y DIV SYear) - (y DIV Century) + (y DIV SCentury)));
END YearFac;
  
  
(* Berechnet die Anzahl der Tage zu einem fiktiven Datum fuer Tag-Differenz. *)
PROCEDURE Factor(d : Date) : INTEGER;
VAR f, day : CARDINAL;
BEGIN
  day := d.day;
  f := YearFac(d.year) + (off[d.month] + day);
  IF (IsSYear(d.year) AND (d.month < March)) THEN
    DEC(f);
  END;
  RETURN f;
END Factor;
  
  
PROCEDURE DaysBetween(from, to : Date) : INTEGER;
BEGIN
  RETURN Factor(to) - Factor(from);
END DaysBetween;


(* Wandelt eine mit 'Factor' erzeugt Anzahl 'f' von Tagen in ein Datum um. *)
PROCEDURE UnFactor(f : INTEGER) : Date;
VAR
  g : INTEGER;
  d : Date;
  s : CARDINAL;
  i : CARDINAL;

BEGIN
  d.year := ((f - 1) * Dividend) DIV Divisor;
  g := YearFac(d.year);
  
  IF ((f - g) > DaysPerYear) THEN
    INC(d.year);
    g := YearFac(d.year);
  END;
  s := f - g;
  
  IF (IsSYear(d.year) AND (s <= off [March])) THEN
    INC(s);
    
    IF (s > off [February]) THEN
      d.month := February;
      DEC(s, off [February]);
    ELSE
      d.month := January;
    END;
  ELSE
    i := December;
    
    WHILE (i >= January) DO
      d.month := i;
      
      IF (s > off[i]) THEN
        i := January;
      END;
      DEC(i);
    END;
    DEC(s, off[d.month]);
  END;
  d.day := s;
  RETURN d;
END UnFactor;


PROCEDURE DaysAdded(d : Date; n : INTEGER) : Date;
BEGIN
  RETURN UnFactor(Factor(d) + n);
END DaysAdded;
  
  
BEGIN
  off[January] := 0;
  off[February] := 31;    (* + 31 *)
  off[March] := 59;       (* + 28 *)
  off[4] := 90;           (* + 31 *)
  off[5] := 120;          (* + 30 *)
  off[6] := 151;          (* + 31 *)
  off[7] := 181;          (* + 30 *)
  off[8] := 212;          (* + 31 *)
  off[9] := 243;          (* + 31 *)
  off[10] := 273;         (* + 30 *)
  off[11] := 304;         (* + 31 *)
  off[12] := 334;         (* + 30 *)
END Clock.
