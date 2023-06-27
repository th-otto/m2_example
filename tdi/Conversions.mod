IMPLEMENTATION MODULE Conversions;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$Q+*)



(*   0 *) VAR tens: ARRAY [0..5] OF REAL;
(*  18 *) VAR round: ARRAY [2..8] OF REAL;
(*  34 *) VAR idx: CARDINAL;
(*  36 *) VAR ltens: ARRAY [0..8] OF LONGREAL;
VAR lround: ARRAY[2..16] OF LONGREAL;
(*  F6 *) VAR lzero: LONGREAL;
(*  FE *) VAR lone: LONGREAL;
(* 106 *) VAR lten: LONGREAL;


PROCEDURE times10(a: REAL): REAL;
BEGIN
  RETURN REAL(LONGCARD(a + REAL(LONGCARD(a) + LONGCARD(01000000H))) + LONGCARD(00800000H));
END times10;


PROCEDURE exppow10(exp: CARDINAL): REAL;
VAR i: INTEGER;
    r: REAL;
BEGIN
  i := 0;
  r := 1.0;
  WHILE exp > 0 DO
    IF ODD(exp) THEN
      r := tens[i] * r;
    END;
    exp := exp DIV 2;
    INC(i);
  END;
  RETURN r;
END exppow10;


PROCEDURE addch(ch: CHAR; VAR s: ARRAY OF CHAR);
BEGIN
  s[idx] := ch;
  INC(idx);
END addch;


PROCEDURE ConvertToString(n: LONGCARD; b: CARDINAL; neg: BOOLEAN; VAR s: ARRAY OF CHAR; VAR done: BOOLEAN);
BEGIN
END ConvertToString;


PROCEDURE ConvertFromString(VAR s: ARRAY OF CHAR; base: CARDINAL; neg: BOOLEAN; max: LONGCARD; VAR result: LONGCARD; VAR done: BOOLEAN);
BEGIN
END ConvertFromString;


PROCEDURE ConvertRealToString(r: REAL; VAR s: ARRAY OF CHAR; n: CARDINAL; VAR done: BOOLEAN);
VAR exp: CARDINAL;
    i: INTEGER;
BEGIN
  done := n < HIGH(s);
  IF done THEN
    idx := 0;
    IF r = 0.0 THEN
      REPEAT
        addch(' ', s);
        DEC(n);
      UNTIL n <= 1;
      addch('0', s);
    ELSE
      IF n <= 9 THEN
        n := 3;
      ELSE
        DEC(n, 6);
      END;
      REPEAT
        addch(' ', s);
        DEC(n);
      UNTIL n <= 8;
      IF r < 0.0 THEN
        addch('-', s);
        r := ABS(r);
      ELSE
        addch(' ', s);
      END;
      exp := CARDINAL(LONGCARD(r) DIV LONGCARD(8388608));
      IF exp >= 127 THEN
        exp := ((exp - 127) * 77) DIV 256;
        r := r / exppow10(exp);
        i := exp;
        IF r >= 1.0 THEN
          r := r * 0.1;
          INC(i);
        END;
      ELSE
        exp := ((127 - exp) * 77) DIV 256;
        r := r * exppow10(exp);
        i := -INTEGER(exp);
        IF r < 0.1 THEN
          r := r * 10.0;
          DEC(i);
        END;
      END;
      r := r + round[n];
      IF r >= 1.0 THEN
        r := r * 0.1;
        INC(i);
      END;
      r := times10(r);
      addch(CHR(CARDINAL(TRUNC(r)) + ORD('0')), s);
      r := r - FLOAT(CARDINAL(TRUNC(r)));
      addch('.', s);
      DEC(n);
      REPEAT
        r := times10(r);
        addch(CHR(CARDINAL(TRUNC(r)) + ORD('0')), s);
        r := r - FLOAT(CARDINAL(TRUNC(r)));
        DEC(n);
      UNTIL n = 0;
      addch('E', s);
      DEC(i);
      IF i < 0 THEN
        addch('-', s);
        i := -i;
      ELSE
        addch('+', s);
      END;
      addch(CHR(INTEGER(LONGINT((i DIV 10) + ORD('0')))), s);
      addch(CHR(INTEGER(LONGINT((i MOD 10) + ORD('0')))), s);
    END;
    s[idx] := 0C;
  END;
END ConvertRealToString;


PROCEDURE proc11();
BEGIN
END proc11;


PROCEDURE ConvertRealFromString(VAR r: REAL; VAR s: ARRAY OF CHAR; VAR done: BOOLEAN);
BEGIN
END ConvertRealFromString;


PROCEDURE proc12();
BEGIN
END proc12;


PROCEDURE ConvertRealToStringOct(x: REAL; VAR s: ARRAY OF CHAR; VAR done: BOOLEAN);
BEGIN
END ConvertRealToStringOct;


PROCEDURE calcLrounds();
  VAR i: INTEGER;
BEGIN
  lround[2] := FLOAT(LONGCARD(5)) / FLOAT(LONGCARD(1000));
  FOR i := 3 TO 16 DO
    lround[i] := lround[i - 1] / lten;
  END;
END calcLrounds;


PROCEDURE proc14();
BEGIN
END proc14;


PROCEDURE ConvertLongRealToString(x: LONGREAL; VAR s: ARRAY OF CHAR; n: CARDINAL; VAR done: BOOLEAN);
BEGIN
END ConvertLongRealToString;


PROCEDURE proc15();
BEGIN
END proc15;


PROCEDURE ConvertLongRealFromString(VAR r: LONGREAL; VAR s: ARRAY OF CHAR; VAR done: BOOLEAN);
BEGIN
END ConvertLongRealFromString;


BEGIN
  lzero := FLOATD(LONGCARD(0));
  lone := FLOATD(LONGCARD(1));
  lten := FLOATD(LONGCARD(10));
  calcLrounds();
  ltens[0] := FLOATD(LONGCARD(10));
  ltens[1] := FLOATD(LONGCARD(100));
  ltens[2] := FLOATD(LONGCARD(10000)); (* 10e4 *)
  ltens[3] := ltens[2] * ltens[2]; (* 10e8 *)
  ltens[4] := ltens[3] * ltens[3]; (* 10e16 *)
  ltens[5] := ltens[4] * ltens[4]; (* 10e32 *)
  ltens[6] := ltens[5] * ltens[5]; (* 10e64 *)
  ltens[7] := ltens[6] * ltens[6]; (* 10e128 *)
  ltens[8] := ltens[7] * ltens[7]; (* 10e256 *)
  tens[0] := 1.0E1;
  round[2] := 0.5E-2;
  tens[1] := 1.0E2;
  round[3] := 0.5E-3;
  tens[2] := 1.0E4;
  round[4] := 0.5E-4;
  tens[3] := 1.0E8;
  round[5] := 0.5E-5;
  tens[4] := 1.0E16;
  round[6] := 0.5E-6;
  tens[5] := 1.0E32;
  round[7] := 0.5E-7;
  
  round[8] := 0.0;
END Conversions.
