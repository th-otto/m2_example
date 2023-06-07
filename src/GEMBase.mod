IMPLEMENTATION MODULE GEMBase;

(*  --------------------------------------------------------------------------
*  System-Version: MOS 2.2
*  --------------------------------------------------------------------------
*  Version       : 1.0
*  --------------------------------------------------------------------------
*  Text-Version  : V#0024
*  --------------------------------------------------------------------------
*  Modul-Holder  : Manuel Chakravarty
*  --------------------------------------------------------------------------
*  Copyright July 1988 by Manuel Chakravarty
*  Vertriebsrechte fuer ATARI ST unter MEGAMAX Modula-2
*                  liegen bei Application Systems Heidelberg
*  --------------------------------------------------------------------------
*  MCH : Manuel Chakravarty
*  --------------------------------------------------------------------------
*  Datum    Autor  Version  Bemerkung (Arbeitsbericht)
*
*  01.04.90 MCH    1.0      Creation; Decls + 'GetPBs', 'VDIHandle, 'CallVDI',
*                           'CallAES' def. + impl.
*  25.05.23 THO    1.1      Port to gm2
*  --------------------------------------------------------------------------
*  Modul-Beschreibung:
*
*  Dieses Modul soll das Programmieren von VDI- und AES-Aufrufen gestatten,
*  die die GEM-Library umgehen. Die Namen wurden soweit moeglich direkt von
*  entsprechenden C-Bindings uebernommen und deshalb sollte es unter zur
*  Hilfe nahme entsprechender GEM-Literatur moeglich sein dieses Modul ohne
*  grosse Erklaerungen, die diesen Rahmen sprengen wuerden zu benutzen.
*
*  --------------------------------------------------------------------------
*)


FROM    SYSTEM          IMPORT ADDRESS;

FROM    MOSGlobals      IMPORT IllegalPointer;

FROM GEMShare IMPORT cbMagic, deviceMagic;

FROM ErrBase IMPORT DoTRAP6, TRAP6_SELF, TRAP6_CONT;


(*  Abfrageroutinen  *)

PROCEDURE GetPBs (gemHdl: GemHandle; VAR vdipb: VDIPB; VAR aespb: AESPB);

BEGIN
  (*'aespb' loeschen (fuer Fehlerausgang) *)
  aespb.pcontrl := NIL;	
  aespb.pglobal := NIL;	
  aespb.pintin := NIL;	
  aespb.pintout := NIL;	
  aespb.paddrin := NIL;	
  aespb.paddrout := NIL;	

  (* 'vdipb' loeschen (fuer Fehlerausgang) *)
  vdipb.contrl := NIL;
  vdipb.intin := NIL;
  vdipb.ptsin := NIL;
  vdipb.intout := NIL;
  vdipb.ptsout := NIL;

  (* ueberpruefe ob 'gemHdl' o.k. ist  *)
  IF gemHdl <> NIL THEN
    (* ueberpruefe magic number *)
    IF (gemHdl^.MAGIC <> cbMagic) THEN
      DoTRAP6(IllegalPointer - TRAP6_SELF);
    ELSE
      (* kopiere VDI- und AES-Parameterblock *)
      vdipb := gemHdl^.vdipb;
      aespb := gemHdl^.aespb;
    END;
  END;
END GetPBs;


PROCEDURE VDIHandle (dev: DeviceHandle): INTEGER16;
BEGIN
  IF dev = NIL THEN RETURN 0; END;
  IF dev^.magic <> deviceMagic THEN
    DoTRAP6(IllegalPointer - TRAP6_SELF);
    RETURN 0;
  END;
  RETURN dev^.handle;
END VDIHandle;


(*  Aufrufroutinen  *)
PROCEDURE CallVDI (ptrpb: PtrVDIPB);
BEGIN
    ASM VOLATILE("move.l %0,%%d1; move.w #115,%%d0; trap #2"
       :
       : "g"(ptrpb)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
END CallVDI;


PROCEDURE CallAES (ptrpb: PtrAESPB);
BEGIN
    ASM VOLATILE("move.l %0,%%d1; move.w #200,%%d0; trap #2"
       :
       : "g"(ptrpb)
       : "d0", "d1", "d2", "a0", "a1", "a2", "cc", "memory"
    );
END CallAES;

END GEMBase.
