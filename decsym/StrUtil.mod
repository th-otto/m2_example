IMPLEMENTATION MODULE StrUtil;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$Q+*) (* short calls *)

FROM SYSTEM IMPORT CODE;

CONST nop = 04E71H;


TYPE basetype = (oct, dec, hex);

VAR conv : RECORD CASE : BOOLEAN OF
    FALSE: hi, lo: CARDINAL;
  | TRUE: l: LONGCARD;
  END;
END;


PROCEDURE FormatCard(val: CARDINAL; len: CARDINAL; VAR result: ARRAY OF CHAR);
BEGIN
  (* FIXME: endian-dependent *)
  conv.hi := 0;
  conv.lo := val;
  CODE(nop); (* XXX *)
  FormatVal(conv.l, len, dec, ' ', FALSE, result);
END FormatCard;


PROCEDURE FormatHexCard(val: CARDINAL; len: CARDINAL; VAR result: ARRAY OF CHAR);
BEGIN
  (* FIXME: endian-dependent *)
  conv.hi := 0;
  conv.lo := val;
  CODE(nop); (* XXX *)
  FormatVal(conv.l, len, hex, ' ', FALSE, result);
END FormatHexCard;


PROCEDURE FormatHexLong(val: LONGCARD; len: CARDINAL; VAR result: ARRAY OF CHAR);
BEGIN
  CODE(nop); (* XXX *)
  FormatVal(val, len, hex, ' ', FALSE, result);
END FormatHexLong;


PROCEDURE FormatVal(val: LONGCARD; len: CARDINAL; type: basetype; fill: CHAR; negativ: BOOLEAN; VAR result: ARRAY OF CHAR);
VAR buf: ARRAY[1..12] OF CHAR;
    i: CARDINAL;
    j: CARDINAL;
    spaces: CARDINAL;
    base: LONGCARD;
    v: LONGCARD;
BEGIN
  i := 0;
  CASE type OF
    oct:
    base := 8;
    INC(i);
    buf[i] := 'B';
  | hex:
    base := 16;
    INC(i);
    buf[i] := 'H';
  | dec:
    base := 10;
  | ELSE
  END;
  REPEAT
    INC(i);
    v := val MOD base;
    IF v < 10 THEN
      buf[i] := CHAR(v + ORD('0'));
    ELSE
      buf[i] := CHAR(v + (ORD('A') - 10));
    END;
    val := val DIV base;
  UNTIL val = 0;
  IF negativ THEN
    INC(i);
    buf[i] := '-';
  END;
  IF len < i THEN
    spaces := 0;
  ELSE
    spaces := len - i;
  END;
  j := 0;
  REPEAT
    IF j < spaces THEN
      result[j] := fill;
    ELSE
      result[j] := buf[i];
      DEC(i);
    END;
    INC(j);
  UNTIL i = 0;
  IF j <= HIGH(result) THEN
    result[j] := 0C;
  END;
END FormatVal;


END StrUtil.
