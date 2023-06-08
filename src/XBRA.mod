IMPLEMENTATION MODULE XBRA;

(*
  18.06.89 Thomas Tempelmann: Megamax-Version
  24.10.90 Thomas Tempelmann: $H+
  04.11.90 Thomas Tempelmann: $S-
  10.02.91 Thomas Tempelmann: Neben dem Null-Ptr wird nun auch ein Ptr auf sich
                              selbst als Listenende gewertet, da das proTOS fuer
                              den hyperCACHE 030 solche XBRA-Listen anlegt.
*)

FROM SYSTEM IMPORT ADR, ADDRESS, BYTE;

CONST
  JmpInstr = 04EF9H; (* Code fuer 'JMP <adr>.L' *)

CONST Magic = 058425241H; (* 'XBRA' *)

TYPE PtrHead = POINTER TO Head;

(*
 * Exportierte Funktionen
 * ----------------------
 *)

PROCEDURE Create (VAR carrier: Carrier; name: ID; call: PROC);
VAR p: ADDRESS;
BEGIN
    p := ADR(carrier); /* unused parameter without this?? */
    carrier.head.magic := Magic;
    carrier.head.name := name;
    carrier.head.prev.prev := NIL;
    carrier.entry.jmpInstr := JmpInstr; (* Code fuer 'JMP <adr>.L' *)
    carrier.entry.call := call;
END Create;


PROCEDURE Installed (name: ID; vector: ADDRESS): BOOLEAN;
VAR pprev: POINTER TO PtrHead;
    prev: PtrHead;
BEGIN
  pprev := vector;
  LOOP
    prev := pprev^;
    IF prev = NIL THEN
      RETURN FALSE;
    END;
    (* Ist dies ein XBRA-Eintrag? *)
    DEC(prev, SIZE(prev^));
    IF prev^.magic = Magic THEN
      (* XBRA-Kennung gefunden *)
      IF prev^.name = name THEN
        (* Ende, da Name gefunden *)
        RETURN TRUE;
      ELSE
        (* Vorgaenger pruefen *)
        pprev := ADR(prev^.prev.prev);
      END
    ELSE
      (* Ende, da XBRA-Kette zuende *)
      RETURN FALSE;
    END;
  END;
END Installed;


PROCEDURE Install (VAR carrier: Carrier; vector: ADDRESS);
VAR pprev: POINTER TO PtrHead;
BEGIN
    pprev := vector;
    carrier.head.prev.prev := pprev^;
    pprev^ := ADR(carrier.entry);
END Install;


PROCEDURE Remove (VAR carrier: Carrier; vector: ADDRESS);
VAR pprev: POINTER TO PtrHead;
    prev: PtrHead;
    entry: ADDRESS;
BEGIN
  pprev := vector;
  entry := ADR(carrier.entry);
  LOOP
    (* 'entry' gefunden? *)
    prev := pprev^;
    IF prev = entry THEN
      DEC(prev, SIZE(prev^));
      pprev^ := prev^.prev.prev;
      EXIT;
    END;
    IF prev = NIL THEN
      HALT;
    END;
    (* Ist dies ein XBRA-Eintrag? *)
    DEC(prev, SIZE(prev^));
    IF prev^.magic <> Magic THEN
      (* Nein -> entry hier trotzdem austragen *)
      pprev^ := carrier.head.prev.prev;
      EXIT;
    END;
    pprev := ADR(prev^.prev.prev);
  END;
END Remove;


PROCEDURE Query (vector: ADDRESS; with: QueryProc);
VAR pprev: POINTER TO PtrHead;
    prev: PtrHead;
    dummy: BOOLEAN;
BEGIN
  pprev := vector;
  LOOP
    prev := pprev^;
    IF (prev = NIL) THEN RETURN END;
    DEC(prev, SIZE(prev^));
    IF prev^.magic <> Magic THEN
      EXIT
    END;
    IF NOT with (pprev, prev^.name) THEN RETURN END;
    (* Vorgaenger ist dran *)
    pprev := ADR(prev^.prev.prev);
  END;
  dummy := with(vector, 03F3F3F3FH)
END Query;


PROCEDURE Entry (at: ADDRESS): ADDRESS;
VAR pprev: POINTER TO ADDRESS;
BEGIN
  pprev := at;
  RETURN pprev^;
END Entry;


PROCEDURE Called (at: ADDRESS): ADDRESS;
VAR pprev: POINTER TO PtrHead;
    prev: POINTER TO Carrier;
BEGIN
  pprev := at;
  prev := pprev^;
  IF prev <> NIL THEN
    DEC(prev, SIZE(Head));
    IF prev^.head.magic = Magic THEN
      IF prev^.entry.jmpInstr = JmpInstr THEN
        (* Wenn dies eine vom XBRA-Modul erzeugte Struktur ist, dann lie- *)
        (* fern wir die Code-Adresse, die bei 'Install' angegeben wurde.  *)
        RETURN ADDRESS(prev^.entry.call);
      END
    END;
    (* Ansonsten wird einfach die direkte Einsprungadr. geliefert *)
    RETURN ADR(prev^.entry);
  END;
  RETURN NIL
END Called;


PROCEDURE PreviousEntry (entry: ADDRESS): ADDRESS;
VAR pc: POINTER TO Carrier;
BEGIN
  IF entry <> NIL THEN
    pc := entry;
    DEC(pc, SIZE(Head));
    IF (pc^.head.magic = Magic) AND (pc^.head.prev.prev <> entry) THEN
      RETURN pc^.head.prev.prev;
    END
  END;
  RETURN NIL
END PreviousEntry;

END XBRA.
