MODULE WLTest;
#define REF

(*
 * Dies Modul demonstiert die Anwendung des Moduls "WindowLists", das
 * auf bequeme Weise Listen in Fenstern verwaltet.
 *)

FROM SYSTEM IMPORT ADDRESS,
                   ADR;

FROM StrIO IMPORT WriteLn, WriteString;
FROM NumberIO IMPORT WriteCard;

FROM Storage IMPORT ALLOCATE, DEALLOCATE;

FROM Strings IMPORT String, Relation,
                    Empty, Append, Assign, Concat, Length, PosLen, Delete,
                    Compare;

IMPORT Strings;

FROM Lists IMPORT List,
                  ResetList, PrevEntry, DeleteList, CreateList, AppendEntry,
                  NoOfEntries, RemoveEntry, CurrentEntry, InsertEntry,
                  NextEntry;

FROM Directory IMPORT DirEntry, FileAttr, FileAttrSet, DirQuery;

FROM FileNames IMPORT SplitPath, ConcatPath;

FROM GrafBase IMPORT Point, Rectangle,
                     Rect;

FROM GEMGlobals IMPORT GemChar, MouseButton, MButtonSet, SpecialKeySet, MaxStr;

FROM AESEvents IMPORT RectEnterMode, Event;

FROM EventHandler IMPORT EventProc,
                         HandleEvents;

FROM WindowLists IMPORT WindowList, NoWindowList, DetectModeWL, AttributesWL,
                        AttributeWL, MaxWindowWL, CenterWindowWL, ErrorStateWL,
                        CreateWL, DeleteWL, SetListWL, GetListWL,
                        ShowWindowWL, HideWindowWL, DetectWindowWL,
                        SetEntryAttributesWL, EntryAttributesWL, StateWL;


TYPE    PtrWEnv = POINTER TO RECORD
                    path        : String;
                    wl          : WindowList;
                  END;
        
        Entry   = POINTER TO DirEntry;


VAR     WEnv    : PtrWEnv;
        
        Worker  : ARRAY [0..1] OF EventProc;
        
        Success,
        Quit    : BOOLEAN;
        
        VoidO   : BOOLEAN;


VAR     CurrList        : List;

PROCEDURE InsertEntryInCurr (REF path: ARRAY OF CHAR; entry: DirEntry): BOOLEAN;

  VAR   data: Entry;
        e   : Entry;
        subdir,
        ins : BOOLEAN;

  BEGIN
    IF (entry.name [0] # '.') THEN
    
      NEW (data);
      data^ := entry;
      subdir:= subdirAttr IN data^.attr;

      (*  alphabetic order, folders first
       *)
       
      ResetList (CurrList);
      LOOP
        e := NextEntry (CurrList);
        IF e = NIL THEN
          AppendEntry (CurrList, data, VoidO); EXIT
        ELSE
          ins := subdir AND NOT (subdirAttr IN e^.attr);
          IF ~ ins AND (data^.attr = e^.attr) THEN
            ins := (Compare (data^.name, e^.name) = less);
          END;
          IF ins THEN
            e := PrevEntry (CurrList);
            InsertEntry (CurrList, data, VoidO);
            EXIT
          END;
        END;
      END;
    
    END;
      
    RETURN TRUE
  END InsertEntryInCurr;
  

PROCEDURE EntryToStr (entry, env: ADDRESS; VAR str: MaxStr);

  VAR   data    : Entry;

  BEGIN
    data := Entry (entry);
    
    IF subdirAttr IN data^.attr THEN
      Assign (' '+7C, str, VoidO)
    ELSE
      Assign ('  ', str, VoidO);
    END;
    Append (' ', str, VoidO);
    Strings.Append (data^.name, str);
    Append (' ', str, VoidO);
  END EntryToStr;


PROCEDURE CloseWList (wl: WindowList; env: ADDRESS);

  VAR   wEnv: PtrWEnv;
        i, j,
        len : INTEGER;
        folderName: String;

  BEGIN
    wEnv := PtrWEnv (env);
    
    WITH wEnv^ DO
      killList (wEnv);
      
      (* Pruefen ob Root-Dir oder Ordner geoeffnet ist. *)
       
      (*  Der Pfadname ist immer mit einem '\' abgeschlossen,
       *  deshalb kann einfach das letzte Zeichen entfernt werden. *)
      Delete (path, Length (path)-1, 1, VoidO);
      SplitPath (path, path, folderName);

      IF Empty (folderName) THEN
      
        (* Wir waren im Root -> Fenster schliessen *)
        path := '';
        HideWindowWL (wl);
        
      ELSE
        
        (* Vorigen Ordner anzeigen *)
        (*  ('path' enthaelt schon neuen Namen) *)
        newList (wEnv);
        
      END;
    END;
  END CloseWList;
  

PROCEDURE OpenFolder (wl: WindowList; entry, env: ADDRESS; selMode: LONGCARD);

  VAR   wEnvPtr : PtrWEnv;
        data    : Entry;
        attrs   : AttributesWL;

  BEGIN
    wEnvPtr := PtrWEnv (env);
    data := Entry (entry);
    
    attrs := EntryAttributesWL (wl, entry);
    IF selectedWL IN attrs THEN EXCL (attrs, selectedWL)
    ELSE INCL (attrs, selectedWL) END;
    SetEntryAttributesWL (wl, entry, attrs);
    
    IF subdirAttr IN data^.attr THEN
      killList (wEnvPtr);
      Append (data^.name, wEnvPtr^.path, VoidO);
      Append ('\', wEnvPtr^.path, VoidO);
      newList (wEnvPtr);
    END;
  END OpenFolder;
  

  
PROCEDURE newList (wEnvPtr: PtrWEnv);

  VAR   res     : INTEGER;
        wildName: String;

  BEGIN
    ConcatPath (wEnvPtr^.path, '*.*', wildName);
    CreateList (CurrList, VoidO);
    DirQuery (wildName, FileAttrSet{subdirAttr}, InsertEntryInCurr, res);
    SetListWL (wEnvPtr^.wl, CurrList, EntryToStr, CloseWList, OpenFolder,
               wEnvPtr, 16, wEnvPtr^.path);
  END newList;

PROCEDURE killList (wEnvPtr: PtrWEnv);

  VAR   l       : List;
        entry   : Entry;

  BEGIN
    GetListWL (wEnvPtr^.wl, l);
    
    ResetList (l);
    entry := PrevEntry (l);
    WHILE entry # NIL DO
      RemoveEntry (l, VoidO);
      DISPOSE (entry);
      entry := CurrentEntry (l);
    END;
    DeleteList (l, VoidO);
    IF VoidO THEN HALT END;
  END killList;
  
  
PROCEDURE KeyHdler (VAR ch: GemChar; VAR k: SpecialKeySet): BOOLEAN;

  BEGIN
    IF CAP (ch.ascii) = 'Q' THEN Quit := TRUE
    ELSIF (CAP (ch.ascii) >= 'A') AND (CAP (ch.ascii) <= 'P') THEN
      WITH WEnv^ DO
        IF Empty (path) THEN
          Append (CAP (ch.ascii), WEnv^.path, VoidO);
          Append (':\', path, VoidO);
          newList (WEnv);
          ShowWindowWL (wl);
        END;
      END
    END;
    RETURN FALSE
  END KeyHdler;

PROCEDURE ButHdler (clicks: CARDINAL; loc: Point; buts: MButtonSet;
                    keys: SpecialKeySet): BOOLEAN;

  VAR   wl   : WindowList;
        entry,
        env  : ADDRESS;

  BEGIN
    DetectWindowWL (WEnv^.wl, 0, loc, selectWL, 0, wl, entry, env, VoidO);
    RETURN FALSE
  END ButHdler;
  
  
BEGIN
  NEW (WEnv);
  CreateWL (WEnv^.wl, TRUE,  Rect (CenterWindowWL, CenterWindowWL,
                                   MaxWindowWL, MaxWindowWL));
  IF StateWL (WEnv^.wl) = okWL THEN
    WEnv^.path := '';
    
    WriteString ('Demo zum Modul "WindowLists"');
    WriteLn;
    WriteString ("Druecke 'Q' zum Beenden,");
    WriteLn;
    WriteString ("Laufwerksbuchstaben ('A'-'P'), um Fenster zu oeffnen");
    WriteLn;
    
    Worker[0].event := keyboard;
    Worker[0].keyHdler := KeyHdler;
    Worker[1].event := mouseButton;
    Worker[1].butHdler := ButHdler;
    Quit := FALSE;
    REPEAT
      HandleEvents (2, MButtonSet{msBut1}, MButtonSet{msBut1},
                    lookForEntry, Rect (0,0,0,0),
                    lookForEntry, Rect (0,0,0,0),
                    0,
                    Worker, 0);
    UNTIL Quit;
    
    IF ~ Empty (WEnv^.path) THEN killList (WEnv) END;
    DeleteWL (WEnv^.wl);
  END;
  DISPOSE (WEnv);
END WLTest.
