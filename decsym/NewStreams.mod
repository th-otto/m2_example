IMPLEMENTATION MODULE NewStreams;     (* LG 14.10.80 *)
  (* implementation for Personal Computer *)
  (* uses special SYS M-codes directly  - RS 10.8.83 *)

  IMPORT FileSystem, FilePool;
  FROM SYSTEM IMPORT WORD, TSIZE;
  FROM FileSystem IMPORT Response, File;
  FROM Terminal IMPORT WriteString, WriteLn;

  CONST eofc = 0C;

  TYPE STREAM = FilePool.FilePointer;

  (* system M-codes for portable interpreter *)

  PROCEDURE setopen(VAR f: File);
  BEGIN
    (* CODE 247B; 109 *)
    f.res := 0;
  END setopen;

  PROCEDURE setpos(VAR f: File; high, low: CARDINAL);
  BEGIN
    (* CODE 247B; 111 *)
    f.res := 0;
    IF high = 0 THEN END;
    IF low = 0 THEN END;
  END setpos;

  PROCEDURE close(VAR f: File);
  BEGIN
    (* CODE 247B; 103 *)
    f.res := 0;
  END close;

  PROCEDURE readword(VAR f: File; VAR w: WORD);
  BEGIN
    (* CODE 247B; 115 *)
    f.res := 0;
    IF w = 0 THEN END;
  END readword;

  PROCEDURE readchar(VAR f: File; VAR ch: CHAR);
  BEGIN
    (* CODE 247B; 116 *)
    f.res := 0;
    IF ch = 0C THEN END;
  END readchar;

  PROCEDURE writeword(VAR f: File; w: WORD);
  BEGIN
    (* CODE 247B; 117 *)
    f.res := 0;
    IF w = 0 THEN END;
  END writeword;

  PROCEDURE writechar(VAR f: File; ch: CHAR);
  BEGIN
    (* CODE 247B; 118 *)
    f.res := 0;
    IF ch = 0C THEN END;
  END writechar;

  PROCEDURE getpos(VAR f: File; VAR high, low: CARDINAL);
  BEGIN
    (* CODE 247B; 112 *)
    f.res := 0;
    high := 0;
    low := 0;
  END getpos;


  PROCEDURE Error(VAR s: STREAM);
  BEGIN
    IF s <> NIL THEN END;
    WriteString(" ---- illegal operation on stream");
    WriteLn;
    HALT;
  END Error;

  PROCEDURE Reset(s: STREAM);
  BEGIN
    setopen(s^);
    setpos(s^, 0, 0)
  END Reset;

  PROCEDURE Connect(VAR s: STREAM; filenum: CARDINAL; ws: BOOLEAN);
    VAR err : BOOLEAN;
  BEGIN
    ws := TRUE;
    FilePool.GetFileFromPool(filenum,s,err);
    IF err THEN Error(s);
    ELSE Reset(s);
    END;
  END Connect;

  PROCEDURE Disconnect(VAR s: STREAM; closefile: BOOLEAN);
  BEGIN
    IF closefile THEN
      close(s^);
      IF s^.res <> done THEN Error(s) END;
      FilePool.ReturnFileToPool(s);
    END;
  END Disconnect;

  PROCEDURE WriteWord(s: STREAM; w: WORD);
  BEGIN
    writeword(s^,w);
  END WriteWord;

  PROCEDURE WriteChar(s: STREAM; ch: CHAR);
  BEGIN
   writechar(s^,ch);
  END WriteChar;

  PROCEDURE EndWrite(s: STREAM);
  BEGIN
    setopen(s^);
    IF s^.res <> done THEN Error(s) END;
  END EndWrite;

  PROCEDURE ReadWord(s: STREAM; VAR w: WORD);
  BEGIN
    readword(s^,w);
  END ReadWord;

  PROCEDURE ReadChar(s: STREAM; VAR ch: CHAR);
  BEGIN
    readchar(s^,ch);
  END ReadChar;

  PROCEDURE EOS(s: STREAM): BOOLEAN;
  BEGIN
    RETURN s^.eof;
  END EOS;

  PROCEDURE GetPos(s: STREAM; VAR highpos, lowpos: CARDINAL);
  BEGIN
    getpos(s^,highpos,lowpos);
  END GetPos;

  PROCEDURE SetPos(s: STREAM; highpos, lowpos: CARDINAL);
  BEGIN
    setpos(s^,highpos,lowpos);
  END SetPos;

BEGIN (* NewStreams *)
  eolc := 36C;
END NewStreams.
