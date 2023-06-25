IMPLEMENTATION MODULE GEMAESbase;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)

FROM SYSTEM IMPORT CODE, ADR, PUSH, REGISTER, SETREG, ADDRESS;


PROCEDURE GemCall(Opcode: INTEGER; nintin: INTEGER; nintout: INTEGER; naddrin: INTEGER; naddrout: INTEGER): INTEGER;
BEGIN
  WITH AESControl DO
    opcode := Opcode;
    sizeIntIn := nintin;
    sizeIntOut := nintout;
    sizeAddrIn := naddrin;
    sizeAddrOut := naddrout;
  END;
  SETREG(0, 200);
  SETREG(1, ADR(AESParameters));
  CODE(04E42H); (* trap #2 *)
  AESCallResult := AESIntOut[0];
  RETURN AESCallResult;
END GemCall;


PROCEDURE IntIn2(intin0, intin1: INTEGER);
BEGIN
  AESIntIn[0] := intin0;
  AESIntIn[1] := intin1;
END IntIn2;


PROCEDURE IntIn3(intin0, intin1, intin2: INTEGER);
BEGIN
  AESIntIn[0] := intin0;
  AESIntIn[1] := intin1;
  AESIntIn[2] := intin2;
END IntIn3;


PROCEDURE IntIn4(intin0, intin1, intin2, intin3: INTEGER);
BEGIN
  AESIntIn[0] := intin0;
  AESIntIn[1] := intin1;
  AESIntIn[2] := intin2;
  AESIntIn[3] := intin3;
END IntIn4;


PROCEDURE IntIn8(intin0, intin1, intin2, intin3, intin4, intin5, intin6, intin7: INTEGER);
BEGIN
  AESIntIn[0] := intin0;
  AESIntIn[1] := intin1;
  AESIntIn[2] := intin2;
  AESIntIn[3] := intin3;
  AESIntIn[4] := intin4;
  AESIntIn[5] := intin5;
  AESIntIn[6] := intin6;
  AESIntIn[7] := intin7;
END IntIn8;


PROCEDURE IntOut2(VAR intout1: INTEGER; VAR intout2: INTEGER);
BEGIN
  intout1 := AESIntOut[1];
  intout2 := AESIntOut[2];
END IntOut2;


PROCEDURE IntOut4(VAR intout1: INTEGER; VAR intout2: INTEGER; VAR intout3: INTEGER; VAR intout4: INTEGER);
BEGIN
  intout1 := AESIntOut[1];
  intout2 := AESIntOut[2];
  intout3 := AESIntOut[3];
  intout4 := AESIntOut[4];
END IntOut4;


BEGIN (* GEMAESbase *)
  WITH AESGlobal DO
    apPTree := ADDRESS(0);
    ap1Resv := 0;
    ap2Resv := 0;
    ap3Resv := 0;
    ap4Resv := 0;
  END;
  WITH AESParameters DO
    control := ADR(AESControl);
    global := ADR(AESGlobal);
    intIn := ADR(AESIntIn);
    intOut := ADR(AESIntOut);
    addrIn := ADR(AESAddrIn);
    addrOut := ADR(AESAddrOut);
  END;
END GEMAESbase.
