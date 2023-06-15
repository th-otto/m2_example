IMPLEMENTATION MODULE GEMDOS;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$A+*) (* short calls *)

FROM SYSTEM IMPORT CODE, ADR, PUSH, REGISTER, ADDRESS, SETREG;

CONST TRAP1 = 04E41H;

PROCEDURE trap1w(n: INTEGER): LONGCARD;
BEGIN
  PUSH(n);
  CODE(TRAP1);
  RETURN LONGCARD(REGISTER(0));
END trap1w;


PROCEDURE trap1ww(n: INTEGER; a: INTEGER): LONGCARD;
BEGIN
  PUSH(a);
  PUSH(n);
  CODE(TRAP1);
  RETURN LONGCARD(REGISTER(0));
END trap1ww;


PROCEDURE trap1wwll(n: INTEGER; a: INTEGER; b: LONGCARD; c: LONGCARD): LONGCARD;
BEGIN
  PUSH(c);
  PUSH(b);
  PUSH(a);
  PUSH(n);
  CODE(TRAP1);
  RETURN LONGCARD(REGISTER(0));
END trap1wwll;


PROCEDURE trap1wwlll(n: INTEGER; a: INTEGER; b: LONGCARD; c: LONGCARD; d: LONGCARD): LONGCARD;
BEGIN
  PUSH(d);
  PUSH(c);
  PUSH(b);
  PUSH(a);
  PUSH(n);
  CODE(TRAP1);
  RETURN LONGCARD(REGISTER(0));
END trap1wwlll;


PROCEDURE trap1wl(n: INTEGER; a: LONGCARD): LONGCARD;
BEGIN
  PUSH(a);
  PUSH(n);
  CODE(TRAP1);
  RETURN LONGCARD(REGISTER(0));
END trap1wl;


PROCEDURE trap1wll(n: INTEGER; a, b: LONGCARD): LONGCARD;
BEGIN
  PUSH(b);
  PUSH(a);
  PUSH(n);
  CODE(TRAP1);
  RETURN LONGCARD(REGISTER(0));
END trap1wll;


PROCEDURE trap1wlw(n: INTEGER; a: LONGCARD; b: INTEGER): LONGCARD;
BEGIN
  PUSH(b);
  PUSH(a);
  PUSH(n);
  CODE(TRAP1);
  RETURN LONGCARD(REGISTER(0));
END trap1wlw;


PROCEDURE trap1wlww(n: INTEGER; a: LONGCARD; b: INTEGER; c: INTEGER): LONGCARD;
BEGIN
  PUSH(c);
  PUSH(b);
  PUSH(a);
  PUSH(n);
  CODE(TRAP1);
  RETURN LONGCARD(REGISTER(0));
END trap1wlww;


PROCEDURE trap1wwl(n: INTEGER; a: INTEGER; b: LONGCARD): LONGCARD;
BEGIN
  PUSH(b);
  PUSH(a);
  PUSH(n);
  CODE(TRAP1);
  RETURN LONGCARD(REGISTER(0));
END trap1wwl;


PROCEDURE trap1www(n: INTEGER; a, b: INTEGER): LONGCARD;
BEGIN
  PUSH(b);
  PUSH(a);
  PUSH(n);
  CODE(TRAP1);
  RETURN LONGCARD(REGISTER(0));
END trap1www;


(* Terminate process (old version) *)
PROCEDURE OldTerm();
VAR dummy: LONGCARD;
BEGIN
  dummy := trap1w(0);
END OldTerm;


(* Read character from standard input *)
PROCEDURE ConIn(VAR Ch: CHAR);
BEGIN
  Ch := CHAR(trap1w(1));
END ConIn;


(* Read character and scan code from standard input *)
PROCEDURE ConScanIn(VAR Ch, Scan: CHAR);
VAR r: LONGCARD;
BEGIN
  r := trap1w(1);
  Ch := CHAR(r);
  Scan := CHAR(r DIV 65536);
END ConScanIn;


(* Write character to standard output *)
PROCEDURE ConOut(Ch: CHAR);
VAR dummy: LONGCARD;
BEGIN
  dummy := trap1ww(2, ORD(Ch));
END ConOut;


(* Read character from auxiliary port *)
PROCEDURE AuxIn(VAR Ch: CHAR);
BEGIN
  Ch := CHAR(trap1w(3));
END AuxIn;


(* Write character to auxiliary port *)
PROCEDURE AuxOut(Ch: CHAR);
VAR dummy: LONGCARD;
BEGIN
  dummy := trap1ww(4, ORD(Ch));
END AuxOut;


(* Write character to printer port *)
PROCEDURE PrnOut(Ch: CHAR);
VAR dummy: LONGCARD;
BEGIN
  dummy := trap1ww(5, ORD(Ch));
END PrnOut;


(* Raw IO to standard input/output device *)
PROCEDURE RawIO(VAR Ch: CHAR; Mode: IOMode);
VAR dummy: CHAR;
BEGIN
  IF Mode = read THEN
    Ch := CHAR(trap1ww(6, 255));
  ELSE
    (* original, buggy code:
      SETREG(0, Ch);
      dummy := CHAR(trap1ww(6, 0)) *)
    dummy := CHAR(trap1ww(6, ORD(Ch)));
  END;
END RawIO;


(* Raw input from standard input *)
PROCEDURE RawIn(VAR Ch: CHAR);
BEGIN
  Ch := CHAR(trap1w(7));
END RawIn;


(* Raw input of character and scan code from standard input *)
PROCEDURE RawScanIn(VAR Ch, Scan: CHAR);
VAR r: LONGCARD;
BEGIN
  r := trap1w(7);
  Ch := CHAR(r);
  Scan := CHAR(r DIV 65536);
END RawScanIn;


(* Read character from standard input with no echo *)
PROCEDURE NecIn(VAR Ch: CHAR);
BEGIN
  Ch := CHAR(trap1w(8));
END NecIn;


(* Write null terminated string to standard output device *)
PROCEDURE ConWS(VAR String: ARRAY OF CHAR);
VAR dummy: LONGCARD;
BEGIN
  dummy := trap1wl(9, LONGCARD(ADR(String)));
END ConWS;


(* Read edited string from standard input device *)
PROCEDURE ConRS(VAR String: ARRAY OF CHAR);
VAR dummy: LONGCARD;
BEGIN
  dummy := trap1wl(10, LONGCARD(ADR(String)));
END ConRS;


(* Return status of standard input *)
PROCEDURE ConIS(): BOOLEAN;
BEGIN
  RETURN trap1w(11) <> 0;
END ConIS;


(* Set default drive *)
PROCEDURE SetDrv(Drive: CARDINAL; VAR DriveMap: LONGCARD);
BEGIN
  DriveMap := trap1ww(14, Drive);
END SetDrv;


(* Return output status of standard output *)
PROCEDURE ConOS(): BOOLEAN;
BEGIN
  RETURN trap1w(16) <> 0;
END ConOS;


(* Return output status of standard printer *)
PROCEDURE PrnOS(): BOOLEAN;
BEGIN
  RETURN trap1w(17) <> 0;
END PrnOS;


(* Return status of standard auxiliary *)
PROCEDURE AuxIS(): BOOLEAN;
BEGIN
  RETURN trap1w(18) <> 0;
END AuxIS;


(* Return output status of standard auxiliary *)
PROCEDURE AuxOS(): BOOLEAN;
BEGIN
  RETURN trap1w(19) <> 0;
END AuxOS;


(* Register 'Alternative' RAM with GEMDOS *)
PROCEDURE Maddalt(start: ADDRESS; size: LONGCARD): LONGINT;
BEGIN
  RETURN trap1wll(20, LONGCARD(start), size);
END Maddalt;


(* Allocate screen memory *)
PROCEDURE Srealloc(size: LONGCARD): LONGINT;
BEGIN
  RETURN trap1wl(21, size);
END Srealloc;


(* Get default drive *)
PROCEDURE GetDrv(VAR Drive: CARDINAL);
BEGIN
  Drive := CARDINAL(trap1w(25));
END GetDrv;


(* Set disk transfer address *)
PROCEDURE SetDTA(Address: ADDRESS);
VAR dummy: LONGCARD;
BEGIN
  dummy := trap1wl(26, LONGCARD(Address));
END SetDTA;


(* Get Date *)
PROCEDURE GetDate(VAR Date: CARDINAL);
BEGIN
  Date := CARDINAL(trap1w(42));
END GetDate;


(* Set Date *)
PROCEDURE SetDate(Date: CARDINAL);
VAR dummy: LONGCARD;
BEGIN
  dummy := trap1ww(43, Date);
END SetDate;


(* Get Date *)
PROCEDURE GetTime(VAR Time: CARDINAL);
BEGIN
  Time := CARDINAL(trap1w(44));
END GetTime;


(* Set Date *)
PROCEDURE SetTime(Time: CARDINAL);
VAR dummy: LONGCARD;
BEGIN
  dummy := trap1ww(45, Time);
END SetTime;


(* Get disk transfer address *)
PROCEDURE GetDTA(VAR Addr: ADDRESS);
BEGIN
  Addr := ADDRESS(trap1w(47));
END GetDTA;


(* Get version number *)
PROCEDURE Version(VAR Ver: CARDINAL);
BEGIN
  Ver := CARDINAL(trap1w(48));
END Version;


(* Terminate and stay resident *)
PROCEDURE TermRes(NumBytes: LONGCARD; ExitCode: CARDINAL);
VAR dummy: LONGCARD;
BEGIN
  dummy := trap1wlw(49, NumBytes, ExitCode);
END TermRes;


(* Configuration of parts of the operating system *)
PROCEDURE Sconfig(mode: INTEGER; flags: LONGCARD): LONGINT;
BEGIN
  RETURN trap1wwl(51, mode, flags);
END Sconfig;


(* Get drive free space *)
PROCEDURE DFree(VAR InfoBuffer: DiskInfoBuffer; Drive: CARDINAL);
VAR dummy: LONGCARD;
BEGIN
  dummy := trap1wlw(54, LONGCARD(ADR(InfoBuffer)), Drive);
END DFree;


(* Create a subdirectory *)
PROCEDURE DirCreate(VAR Path: ARRAY OF CHAR): BOOLEAN;
BEGIN
  RETURN trap1wl(57, LONGCARD(ADR(Path))) = 0;
END DirCreate;


(* Delete a subdirectory *)
PROCEDURE DirDelete(VAR Path: ARRAY OF CHAR): BOOLEAN;
BEGIN
  RETURN trap1wl(58, LONGCARD(ADR(Path))) = 0;
END DirDelete;


(* Set current directory *)
PROCEDURE SetPath(VAR Path: ARRAY OF CHAR): BOOLEAN;
BEGIN
  RETURN trap1wl(59, LONGCARD(ADR(Path))) = 0;
END SetPath;


(* Create a file *)
PROCEDURE Create(VAR Name: ARRAY OF CHAR; Attr: CARDINAL; VAR Handle: INTEGER);
BEGIN
  Handle := CARDINAL(trap1wlw(60, LONGCARD(ADR(Name)), Attr));
END Create;


(* Open a file *)
PROCEDURE Open(VAR Name: ARRAY OF CHAR; Mode: CARDINAL; VAR Handle: INTEGER);
BEGIN
  Handle := CARDINAL(trap1wlw(61, LONGCARD(ADR(Name)), Mode));
END Open;


(* Close a file *)
PROCEDURE Close(Handle: INTEGER): BOOLEAN;
BEGIN
  RETURN trap1ww(62, Handle) = 0;
END Close;


(* Read file *)
PROCEDURE Read(Handle: INTEGER; VAR Count: LONGCARD; Buffer: ADDRESS);
BEGIN
  Count := trap1wwll(63, Handle, Count, LONGCARD(Buffer));
END Read;


PROCEDURE Write(Handle: INTEGER; VAR Count: LONGCARD; Buffer: ADDRESS);(* Write file *)
BEGIN
  Count := trap1wwll(64, Handle, Count, LONGCARD(Buffer));
END Write;


(* Delete file *)
PROCEDURE Delete(VAR Name: ARRAY OF CHAR): BOOLEAN;
BEGIN
  RETURN trap1wl(65, LONGCARD(ADR(Name))) = 0;
END Delete;


(* Seek file pointer *)
PROCEDURE Seek(Offset: LONGINT; Handle: INTEGER; Mode: SeekMode; VAR Position: LONGCARD);
BEGIN
  Position := trap1wlww(66, Offset, Handle, ORD(Mode));
END Seek;


(* Get/Set file attributes *)
PROCEDURE Attrib(VAR Name: ARRAY OF CHAR; Which: SetOrGet; VAR Attr: CARDINAL);
VAR dummy: LONGCARD;
BEGIN
  IF Which = set THEN
    dummy := trap1wlww(67, LONGCARD(ADR(Name)), 1, Attr);
  ELSE
    Attr := CARDINAL(trap1wlww(67, LONGCARD(ADR(Name)), 0, Attr));
  END;
END Attrib;


(* 'Mxalloc': extended Alloc-function for the Atari TT. *)
PROCEDURE Xalloc(Bytes: LONGCARD; mode: CARDINAL; VAR Addr: ADDRESS);
BEGIN
  Addr := ADDRESS(trap1wwl(68, mode, Bytes));
END Xalloc;


(* 'Fdup': returns a copy of a standard-handle (0-5) *)
PROCEDURE Dup(stdHandle: INTEGER; VAR newHandle: INTEGER);
BEGIN
  newHandle := INTEGER(trap1ww(69, stdHandle));
END Dup;


(* 'Fforce': Redirect standard file *)
PROCEDURE Force(stdHandle, newHandle: INTEGER): BOOLEAN;
BEGIN
  RETURN trap1www(70, stdHandle, newHandle) = 0;
END Force;


(* Get current directory *)
PROCEDURE GetPath(VAR PathName: ARRAY OF CHAR; Drive: CARDINAL);
VAR dummy: LONGCARD;
BEGIN
  dummy := trap1wlw(71, LONGCARD(ADR(PathName)), Drive);
END GetPath;


(* Allocate memory *)
PROCEDURE Alloc(Bytes: LONGCARD; VAR Addr: ADDRESS);
BEGIN
  Addr := ADDRESS(trap1wl(72, Bytes));
END Alloc;


(* Free memory *)
PROCEDURE Free(Addr: ADDRESS): BOOLEAN;
BEGIN
  RETURN trap1wl(73, LONGCARD(Addr)) = 0;
END Free;


(* Shrink size of allocated memory *)
PROCEDURE Shrink(Addr: ADDRESS; NewSize: LONGCARD): BOOLEAN;
BEGIN
  RETURN trap1wwll(74, 0, LONGCARD(Addr), NewSize) = 0;
END Shrink;


(*
VAR regA5: ADDRESS;
VAR regA6: ADDRESS;
VAR regA7: ADDRESS;
*)

(* Load or execute a process *)
PROCEDURE Exec(Mode: ExecMode; VAR Name: ARRAY OF CHAR;
                 VAR Tail: ARRAY OF CHAR; VAR EnvStr: ARRAY OF CHAR;
                 VAR Result: INTEGER);
BEGIN
  PUSH(ADR(EnvStr));
  PUSH(ADR(Tail));
  PUSH(ADR(Name));
  PUSH(ORD(Mode));
  PUSH(75);
(*
  regA5 := REGISTER(13);
  regA6 := REGISTER(14);
  regA7 := REGISTER(15);
*)
  CODE(TRAP1);
(*
  SETREG(13, regA5);
  SETREG(14, regA6);
  SETREG(15, regA7);
*)
  Result := INTEGER(REGISTER(0));
END Exec;


(* Terminate a process *)
(* Why BOOLEAN? that function does not return *)
PROCEDURE Term(Code: INTEGER): BOOLEAN;
BEGIN
  RETURN trap1ww(76, Code) = 0;
END Term;


(* Search for first file *)
PROCEDURE SFirst(VAR Name: ARRAY OF CHAR; Attr: CARDINAL; VAR Result: INTEGER);
BEGIN
  Result := INTEGER(trap1wlw(78, LONGCARD(ADR(Name)), Attr));
END SFirst;


(* Search for next file *)
PROCEDURE SNext(VAR Result: INTEGER);
BEGIN
  Result := INTEGER(trap1w(79));
END SNext;


(* Rename a file *)
(* Why no return value here? *)
PROCEDURE Rename(VAR CurrentName, NewName: ARRAY OF CHAR);
VAR dummy: LONGCARD;
BEGIN
  dummy := trap1wwll(86, 0, LONGCARD(ADR(CurrentName)), LONGCARD(ADR(NewName)));
END Rename;


(* Get/Set file date and time stamp *)
PROCEDURE DaTime(Handle: INTEGER; Buffer: ADDRESS; Which: SetOrGet);
VAR dummy: LONGCARD;
BEGIN
  IF Which = set THEN
    dummy := trap1wlww(87, LONGCARD(Buffer), Handle, 1); (* was: 0 *)
  ELSE
    dummy := trap1wlww(87, LONGCARD(Buffer), Handle, 0); (* was: 1 *)
  END;
END DaTime;


(* enter supervisor mode if stack = 0, otherwise come out of
   supervisor mode with the given stack. *)
PROCEDURE Super(VAR stack: ADDRESS);
BEGIN
  stack := ADDRESS(trap1wl(32, LONGCARD(stack)));
END Super;


END GEMDOS.
