
(*      Include-Datei:
 *
 *      Konstantendefinitionen fÅr die Megamax Modula-2 GEM-Library
 *)


CONST
                (*  A E S - Opcodes  *)
                (*  ===============  *)
                
        (*  Application Manager
         *)
        APPL_INIT               = 10;
        APPL_READ               = 11;
        APPL_WRITE              = 12;
        APPL_FIND               = 13;
        APPL_TPLAY              = 14;
        APPL_TRECORD            = 15;
        APPL_EXIT               = 19;
        
        (*  Event Manager
          *)
        EVNT_KEYBD              = 20;
        EVNT_BUTTON             = 21;
        EVNT_MOUSE              = 22;
        EVNT_MESAG              = 23;
        EVNT_TIMER              = 24;
        EVNT_MULTI              = 25;
        EVNT_DCLICK             = 26;
        
        (*  Menu Manager
         *)
        MENU_BAR                = 30;
        MENU_ICHECK             = 31;
        MENU_IENABLE            = 32;
        MENU_TNORMAL            = 33;
        MENU_TEXT               = 34;
        MENU_REGISTER           = 35;
        
        (*  Object Manager
         *)
        OBJC_ADD                = 40;
        OBJC_DELETE             = 41;
        OBJC_DRAW               = 42;
        OBJC_FIND               = 43;
        OBJC_OFFSET             = 44;
        OBJC_ORDER              = 45;
        OBJC_EDIT               = 46;
        OBJC_CHANGE             = 47;
        
        (*  Form Manager
         *)
        FORM_DO                 = 50;
        FORM_DIAL               = 51;
        FORM_ALERT              = 52;
        FORM_ERROR              = 53;
        FORM_CENTER             = 54;
        FORM_KEYBD              = 55;
        FORM_BUTTON             = 56;
        
        (*  Graphics Manager
         *)
        GRAF_RUBBOX             = 70;
        GRAF_DRAGBOX            = 71;
        GRAF_MBOX               = 72;
        GRAF_GROWBOX            = 73;
        GRAF_SHRINKBOX          = 74;
        GRAF_WATCHBOX           = 75;
        GRAF_SLIDEBOX           = 76;
        GRAF_HANDLE             = 77;
        GRAF_MOUSE              = 78;
        GRAF_MKSTATE            = 79;
        
        (*  Scrap Manager
         *)
        SCRP_READ               = 80;
        SCRP_WRITE              = 81;
        
        (*  File Selector Manager
         *)
        FSEL_INPUT              = 90;
        FSEL_EX_INPUT           = 91;   (*  Ab TOS 1.4  *)
        
        (*  Window Manager
         *)
        WIND_CREATE             = 100;
        WIND_OPEN               = 101;
        WIND_CLOSE              = 102;
        WIND_DELETE             = 103;
        WIND_GET                = 104;
        WIND_SET                = 105;
        WIND_FIND               = 106;
        WIND_UPDATE             = 107;
        WIND_CALC               = 108;
        WIND_NEW                = 109;   (*  Ab TOS 1.4  *)
        
        (*  Resource Manager
         *)
        RSRC_LOAD               = 110;
        RSRC_FREE               = 111;
        RSRC_GADDR              = 112;
        RSRC_SADDR              = 113;
        RSRC_OBFIX              = 114;
        
        (*  Shell Manager
         *)
        SHEL_READ               = 120;
        SHEL_WRITE              = 121;
        SHEL_GET                = 122;
        SHEL_PUT                = 123;
        SHEL_FIND               = 124;
        SHEL_ENVRN              = 125;
        
        
                (*  V D I - Opcodes  *)
                (*  ===============  *)
    
        V_OPNWK                 = 1;
        V_CLSWK                 = 2;
        CLEAR_WORKSTATION       = 3;
        UPDATE_WORKSTATION      = 4;
        ESCAPE                  = 5;
        POLYLINE                = 6;
        POLYMARKER              = 7;
        GRAF_TEXT               = 8;
        FILLED_AREA             = 9;
    
        CELL_ARRAY              = 10;
        GRAF_STANDARD           = 11;
        SET_TEXT_HEIGHT_ABS     = 12;
        SET_TEXT_BASELINE       = 13;
        SET_COLOR_REP           = 14;
        SET_LINE_TYPE           = 15;
        SET_LINE_WIDTH          = 16;
        SET_LINE_COLOR          = 17;
        SET_MARKER_TYPE         = 18;
        SET_MARKER_HEIGHT       = 19;
        
        SET_MARKER_COLOR        = 20;
        SET_TEXT_FACE           = 21;
        SET_TEXT_COLOR          = 22;
        SET_FILL_INTERIOR       = 23;
        SET_FILL_INDEX          = 24;
        SET_FILL_COLOR          = 25;
        INQUIRE_COLOR           = 26;
        VQ_CELLARRAY            = 27;
        INPUT_LOCATOR           = 28;
        INPUT_VALUATOR          = 29;
        
        INPUT_CHOICE            = 30;
        INPUT_STRING            = 31;
        SET_WRITING_MODE        = 32;
        SET_INPUT_MODE          = 33;
        INQUIRE_LINE            = 35;
        INQUIRE_MARKER          = 36;
        INQUIRE_FILL            = 37;
        INQUIRE_TEXT            = 38;
        SET_TEXT_ALIG           = 39;
    
        OPEN_V_WORK             = 100;
        CLOSE_V_WORK            = 101;
        EXTENDED_INQUIRE        = 102;
        CONTOUR_FILL            = 103;
        SET_FILL_PERIMETER      = 104;
        GET_PIXEL               = 105;
        SET_TEXT_EFFECT         = 106;
        SET_TEXT_HEIGHT_PTS     = 107;
        SET_LINE_END            = 108;
        COPY_RASTER_OPAQUE      = 109;
        
        TRANSFORM_FORM          = 110;
        SET_MOUSE_FORM          = 111;
        SET_FILL_USER           = 112;
        SET_LINE_USER           = 113;
        FILL_RECTANGLE          = 114;
        INQUIRE_INPUT           = 115;
        TEXT_EXTENT             = 116;
        INQUIRE_CELL            = 117;
        EX_TIMER_INTER          = 118;
        LOAD_FONTS              = 119;
        
        UNLOAD_FONTS            = 120;
        COPY_RASTER_TRANSP      = 121;
        SHOW_CURSOR             = 122;
        HIDE_CURSOR             = 123;
        MOUSE_BUTTONS           = 124;
        EX_BUT_CHANGE           = 125;
        EX_MOUSE_MOVE           = 126;
        EX_MOUSE_CHANGE         = 127;
        KEY_STATE               = 128;
        SET_CLIPPING            = 129;
        
        VQT_NAME                = 130;
        VQT_FONTINFO            = 131;
        
        (*  ESCAPE SubCmds
         *)
                
        VQ_CHCELLS              = 1;
        V_EXIT_CUR              = 2;
        V_ENTER_CUR             = 3;
        V_CURUP                 = 4;
        V_CURDOWN               = 5;
        V_CURRIGHT              = 6;
        V_CURLEFT               = 7;
        V_CURHOME               = 8;
        V_EEOS                  = 9;
        V_EEOL                  = 10;
        VS_CURADDRESS           = 11;
        V_CURTEXT               = 12;
        V_RVON                  = 13;
        V_RVOFF                 = 14;
        VQ_CURADDRESS           = 15;
        VQ_TABSTATUS            = 16;
        V_HARDCOPY              = 17;
        V_DSPCUR                = 18;
        V_RMCUR                 = 19;
        V_FORM_ADV              = 20;
        V_OUTPUT_WINDOW         = 21;
        V_CLEAR_DISP_LIST       = 22;
        V_BIT_IMAGE             = 23;
        VS_PALETTE              = 60;
        VQP_FILMS               = 91;
        VQP_STATE               = 92;
        VSP_STATE               = 93;
        VSP_SAVE                = 94;
        VSP_MESSAGE             = 95;
        VSP_ERROR               = 96;
        V_META_EXTENTS          = 98;
        V_WRITE_META            = 99;
        VM_FILENAME             = 100;
        V_OFFSET                = 101;
        V_FONTINIT              = 102;
        
        
        (*  GRAF_STANDARD SubCmds
         *)
                
        BAR                     = 1;
        ARC                     = 2;
        PIE                     = 3;
        CIRCLE                  = 4;
        ELLIPSE                 = 5;
        ELLIPTICAL_ARC          = 6;
        ELLIPTICAL_PIE          = 7;
        ROUNDED_RECT            = 8;
        FILL_ROUND_RECT         = 9;
        JUST_TEXT               = 10;


(*
    assembler
    ;                             Application Manager
        DC.B    0, 1, 0            ; func 010  init
        DC.B    2, 1, 1            ; func 011  read
        DC.B    2, 1, 1            ; func 012  write
        DC.B    0, 1, 1            ; func 013  find
        DC.B    2, 1, 1            ; func 014  tplay
        DC.B    1, 1, 1            ; func 015  trec
        DC.B    0, 0, 0            ; func 016
        DC.B    0, 0, 0            ; func 017
        DC.B    0, 0, 0            ; func 008
        DC.B    0, 1, 0            ; func 019  exit
    ;                             Event Manager
        DC.B    0, 1, 0            ; func 020  evnt keybd
        DC.B    3, 5, 0            ; func 021  evnt but
        DC.B    5, 5, 0            ; func 022  e mouse
        DC.B    0, 1, 1            ; func 023  e msg
        DC.B    2, 1, 0            ; func 024  e timer
        DC.B    16, 7, 1           ; func 025  e multi
        DC.B    2, 1, 0            ; func 026
        DC.B    0, 0, 0            ; func 027
        DC.B    0, 0, 0            ; func 028
        DC.B    0, 0, 0            ; func 009
    ;                             Menu Manager
        DC.B    1, 1, 1            ; func 030  bar
        DC.B    2, 1, 1            ; func 031  icheck
        DC.B    2, 1, 1            ; func 032  ienable
        DC.B    2, 1, 1            ; func 033  tnormal
        DC.B    1, 1, 2            ; func 034  text
        DC.B    1, 1, 1            ; func 005  register
        DC.B    0, 0, 0            ; func 006
        DC.B    0, 0, 0            ; func 007
        DC.B    0, 0, 0            ; func 008
        DC.B    0, 0, 0            ; func 009
    ;                             Object Manager
        DC.B    2, 1, 1            ; func 040  add
        DC.B    1, 1, 1            ; func 041  del
        DC.B    6, 1, 1            ; func 042  draw
        DC.B    4, 1, 1            ; func 043  find
        DC.B    1, 3, 1            ; func 044  offset
        DC.B    2, 1, 1            ; func 045  order
        DC.B    4, 2, 1            ; func 046  edit
        DC.B    8, 1, 1            ; func 047  change
        DC.B    0, 0, 0            ; func 048
        DC.B    0, 0, 0            ; func 049
    ;                             Form Manager
        DC.B    1, 1, 1            ; func 050  do
        DC.B    9, 1, 1            ; func 051  dial
        DC.B    1, 1, 1            ; func 002  alert
        DC.B    1, 1, 0            ; func 003  error
        DC.B    0, 5, 1            ; func 004  center
        DC.B    3, 3, 1            ; func 005  keyboard
        DC.B    2, 2, 1            ; func 006  button
        DC.B    0, 0, 0            ; func 007
        DC.B    0, 0, 0            ; func 008
        DC.B    0, 0, 0            ; func 009
    ;                             Dialog Manager
        DC.B    0, 0, 0            ; func 060
        DC.B    0, 0, 0            ; func 061
        DC.B    0, 0, 0            ; func 062
        DC.B    0, 0, 0            ; func 003
        DC.B    0, 0, 0            ; func 004
        DC.B    0, 0, 0            ; func 005
        DC.B    0, 0, 0            ; func 006
        DC.B    0, 0, 0            ; func 007
        DC.B    0, 0, 0            ; func 008
        DC.B    0, 0, 0            ; func 009
    ;                            Graphics Manager
        DC.B    4, 3, 0            ; func 070  rubber
        DC.B    8, 3, 0            ; func 071  drag
        DC.B    6, 1, 0            ; func 072  move
        DC.B    8, 1, 0            ; func 073  grow
        DC.B    8, 1, 0            ; func 074  shrink
        DC.B    4, 1, 1            ; func 075  watch
        DC.B    3, 1, 1            ; func 076  slide
        DC.B    0, 5, 0            ; func 077  handle
X       DC.B    1, 1, 1            ; func 078  mouse
        DC.B    0, 5, 0            ; func 009  mkstate
    ;                            Scrap Manager
        DC.B    0, 1, 1            ; func 080  read
        DC.B    0, 1, 1            ; func 081  write
        DC.B    0, 0, 0            ; func 082
        DC.B    0, 0, 0            ; func 083
        DC.B    0, 0, 0            ; func 084
        DC.B    0, 0, 0            ; func 005
        DC.B    0, 0, 0            ; func 006
        DC.B    0, 0, 0            ; func 007
        DC.B    0, 0, 0            ; func 008
        DC.B    0, 0, 0            ; func 009
    ;                            fseler Manager
        DC.B    0, 2, 2            ; func 090  input
        DC.B    0, 2, 3            ; func 091           (*  Ab TOS 1.4  *)
        DC.B    0, 0, 0            ; func 092
        DC.B    0, 0, 0            ; func 003
        DC.B    0, 0, 0            ; func 004
        DC.B    0, 0, 0            ; func 005
        DC.B    0, 0, 0            ; func 006
        DC.B    0, 0, 0            ; func 007
        DC.B    0, 0, 0            ; func 008
        DC.B    0, 0, 0            ; func 009
    ;                            Window Manager
        DC.B    5, 1, 0            ; func 100
        DC.B    5, 1, 0            ; func 101
X       DC.B    1, 1, 0            ; func 102 close
X       DC.B    1, 1, 0            ; func 103 delete
        DC.B    2, 5, 0            ; func 104
        DC.B    6, 1, 0            ; func 105
        DC.B    2, 1, 0            ; func 106
X       DC.B    1, 1, 0            ; func 107 update
        DC.B    6, 5, 0            ; func 108
        DC.B    0, 0, 0            ; func 109           (*  Ab TOS 1.4  *)
    ;                            Resource Manger
        DC.B    0, 1, 1            ; func 110  load
        DC.B    0, 1, 0            ; func 111  free
        DC.B    2, 1, 0            ; func 112  gaddr
        DC.B    2, 1, 1            ; func 113  saddr
        DC.B    1, 1, 1            ; func 114  obfix
        DC.B    0, 0, 0            ; func 115
        DC.B    0, 0, 0            ; func 006
        DC.B    0, 0, 0            ; func 007
        DC.B    0, 0, 0            ; func 008
        DC.B    0, 0, 0            ; func 009
    ;                            Shell Manager
        DC.B    0, 1, 2            ; func 120  read
        DC.B    3, 1, 2            ; func 121  write
        DC.B    1, 1, 1            ; func 122  get
        DC.B    1, 1, 1            ; func 123  put
        DC.B    0, 1, 1            ; func 124  find
        DC.B    0, 1, 2            ; func 125  envrn
    END




PROCEDURE ctrl_cnts2;
                       (* Only sptsin, sintin; no sintout, sptsout *)
  BEGIN
    ASSEMBLER
    ;       PTSIN, INTIN
        DC.B    0, 0         ; func 000
        DC.B    0, 0         ; func 001
        DC.B    0, 0         ; func 002
        DC.B    0, 0         ; func 003 clear workstation
        DC.B    0, 0         ; func 004 update works.
        DC.B    0, 0         ; func 005 escape funktions
        DC.B    0, 0         ; func 006 polyline(ruft vdi_call direkt auf)
        DC.B    0, 0         ; func 007 polymarker(ruft vdi_call direkt auf)
        DC.B    0, 0         ; func 008 graftext(ruft vdi_call direkt auf)
        DC.B    0, 0         ; func 009 filled polygon(ruft vdi_call direkt)
    ;
        DC.B    0, 0         ; func 010  cell array(ruft vdi_call direkt auf)
        DC.B    0, 0         ; func 011   (* Graf.Grundfkten *)
        DC.B    1, 0         ; func 012  text height abs.
        DC.B    0, 1         ; func 013  baseline
        DC.B    0, 4         ; func 014  color rep
        DC.B    0, 1         ; func 015  line type
        DC.B    1, 0         ; func 016  line width
        DC.B    0, 1         ; func 017  line color
        DC.B    0, 1         ; func 008  marker type
        DC.B    1, 0         ; func 019  marker height
    ;
        DC.B    0, 1         ; func 020  marker color
        DC.B    0, 1         ; func 021  text face
        DC.B    0, 1         ; func 022  text color
        DC.B    0, 1         ; func 023  fill interior
        DC.B    0, 1         ; func 024  fill index
        DC.B    0, 1         ; func 025  fill color
        DC.B    0, 2         ; func 026  inq. color
        DC.B    2, 0         ; func 027  inq. cell array
        DC.B    1, 0         ; func 028  inp loc
        DC.B    0, 1         ; func 009  inp val
    ;
        DC.B    0, 0         ; func 030  inp choice ( vdi_call direkt )
        DC.B    1, 2         ; func 031  inp str
        DC.B    0, 1         ; func 032  writing mode
        DC.B    0, 2         ; func 033  set_input_mode
        DC.B    2, 0         ; func 034
        DC.B    0, 0         ; func 005  inq. line
        DC.B    0, 0         ; func 006  inq. mark
        DC.B    0, 0         ; func 007  inq. fill
        DC.B    0, 0         ; func 008  inq. text
        DC.B    0, 2         ; func 009  text alig
    ;
        DC.B    1, 0         ; func 040
        DC.B    1, 0         ; func 041
        DC.B    1, 0         ; func 042
        DC.B    1, 0         ; func 043
        DC.B    1, 0         ; func 044
        DC.B    1, 0         ; func 045
        DC.B    1, 0         ; func 046
        DC.B    1, 0         ; func 047
        DC.B    0, 0         ; func 048
        DC.B    0, 0         ; func 049
    ;
        DC.B    1, 0         ; func 050
        DC.B    1, 0         ; func 051
        DC.B    1, 0         ; func 002
        DC.B    0, 0         ; func 003
        DC.B    1, 0         ; func 004
        DC.B    1, 0         ; func 005
        DC.B    1, 0         ; func 006
        DC.B    0, 0         ; func 007
        DC.B    0, 0         ; func 008
        DC.B    0, 0         ; func 009
    ;
        DC.B    0, 0         ; func 060
        DC.B    0, 0         ; func 061
        DC.B    0, 0         ; func 062
        DC.B    0, 0         ; func 003
        DC.B    1, 0         ; func 004
        DC.B    1, 0         ; func 005
        DC.B    1, 0         ; func 006
        DC.B    0, 0         ; func 007
        DC.B    0, 0         ; func 008
        DC.B    0, 0         ; func 009
    ;
        DC.B    0, 0         ; func 070
        DC.B    0, 0         ; func 071
        DC.B    0, 0         ; func 072
        DC.B    0, 0         ; func 073
        DC.B    0, 0         ; func 074
        DC.B    1, 0         ; func 075
        DC.B    1, 0         ; func 076
        DC.B    0, 0         ; func 077
        DC.B    1, 0         ; func 078
        DC.B    0, 0         ; func 009
    ;
        DC.B    1, 0         ; func 080
        DC.B    1, 0         ; func 081
        DC.B    0, 0         ; func 082
        DC.B    0, 0         ; func 083
        DC.B    0, 0         ; func 084
        DC.B    1, 0         ; func 005
        DC.B    1, 0         ; func 006
        DC.B    0, 0         ; func 007
        DC.B    0, 0         ; func 008
        DC.B    0, 0         ; func 009
    ;
        DC.B    2, 0         ; func 090
        DC.B    0, 0         ; func 091
        DC.B    0, 0         ; func 092
        DC.B    0, 0         ; func 003
        DC.B    0, 0         ; func 004
        DC.B    1, 0         ; func 005
        DC.B    1, 0         ; func 006
        DC.B    0, 0         ; func 007
        DC.B    0, 0         ; func 008
        DC.B    0, 0         ; func 009
    ;
        DC.B    0, 11        ; func 100  open work
        DC.B    0, 0         ; func 101  close work
        DC.B    0, 1         ; func 102  ext. inquire
        DC.B    1, 1         ; func 103  contour fill
        DC.B    0, 1         ; func 104  fill perim.
        DC.B    1, 0         ; func 105  get pixel
        DC.B    0, 1         ; func 106  text effect
        DC.B    0, 1         ; func 107  text height pts
        DC.B    0, 2         ; func 108  line end
        DC.B    4, 1         ; func 109  copy opaque
    ;
        DC.B    0, 0         ; func 110  transform form
        DC.B    0, 37        ; func 111  mouse form
        DC.B    0, 0         ; func 112  user fill( ruft vdi_call direkt )
        DC.B    0, 1         ; func 113  user line
        DC.B    2, 0         ; func 114  fill rect
        DC.B    0, 1         ; func 115  inq. input
        DC.B    0, 0         ; func 116  text ext.( ruft vdi_call direkt )
        DC.B    0, 1         ; func 117  inq. cell
X       DC.B    0, 0         ; func 118  time inter
        DC.B    0, 1         ; func 119  load fonts
    ;
X       DC.B    0, 1         ; func 120  unload fonts
X       DC.B    4, 3         ; func 121  copy transp.
X       DC.B    0, 1         ; func 122  show cursor
X       DC.B    0, 0         ; func 123  hide cur.
        DC.B    0, 0         ; func 124  mouse buts
X       DC.B    0, 0         ; func 125  but change
X       DC.B    0, 0         ; func 126  mouse move
X       DC.B    0, 0         ; func 127  mouse change
        DC.B    0, 0         ; func 128  key state
        DC.B    2, 1         ; func 129  clipping
     ;
        DC.B    0, 1         ; func 130  face name
        DC.B    0, 0         ; func 131  face info
    END
  END ctrl_cnts2;
  
  (* Control Array Parameter fÅr die Generalized Drawing Primitives (GDP) *)
  
PROCEDURE ctrl_cnts3;

  BEGIN
    ASSEMBLER
        DC.B        0, 0      ; *DUMMY*
        DC.B        2, 0      ; #1  Bar
        DC.B        4, 2      ; #2  Arc
        DC.B        4, 2      ; #3  Pie
        DC.B        3, 0      ; #4  Circle
        DC.B        2, 0      ; #5  Ellipse
        DC.B        2, 2      ; #6  ElliptArc
        DC.B        2, 2      ; #7  ElliptPie
        DC.B        2, 0      ; #8  RoundRect
        DC.B        2, 0      ; #9  FillRoundRect
        DC.B        0, 0      ; #10 JustText ( ruft vdi_call direkt auf )
    END;
  END ctrl_cnts3;

    (* Control Array Parameter fÅr die VDI-Escape-Funktionen *)
  
PROCEDURE ctrl_cnts4;

  BEGIN
    ASSEMBLER
        DC.B    0, 0    ; *DUMMY*
        DC.B    0, 0    ; #1  GetCharCells
        DC.B    0, 0    ; #2  ExitCur
        DC.B    0, 0    ; #3  EnterCur
        DC.B    0, 0    ; #4  CurUp
        DC.B    0, 0    ; #5  CurDown
        DC.B    0, 0    ; #6  CurRight
        DC.B    0, 0    ; #7  CurLeft
        DC.B    0, 0    ; #8  CurHome
        DC.B    0, 0    ; #9  EEOS
        DC.B    0, 0    ; #10 EEOL
        DC.B    0, 2    ; #11 SetCurAdr
        DC.B    0, 0    ; #12 CurText  (* ruft vdi_call direkt *)
        DC.B    0, 0    ; #13 RVOn
        DC.B    0, 0    ; #14 RVOff
        DC.B    0, 0    ; #15 GetCurAdr
        DC.B    0, 0    ; #16 TabStatus
        DC.B    0, 0    ; #17 Hardcopy
        DC.B    1, 0    ; #18 DspCur
        DC.B    0, 0    ; #19 RmCur
        DC.B    0, 0    ; #20 FormAdv
        DC.B    2, 0    ; #21 OutWind
        DC.B    0, 0    ; #22 ClrDispList
        DC.B    0, 0    ; #23 BitImg (direkt)
        
      ; DC.B    0, 1    ; #60 SelPalette (direkt)
        
    END;
  END ctrl_cnts4;

CONST   start_cnts5   = 91;     (*  Erste Subcmd-Nummer in 'ctrl_cnts5'  *)

PROCEDURE ctrl_cnts5;

  BEGIN
    ASSEMBLER
        DC.B    0, 0    ; #91 vqp_films
        DC.B    0, 0    ; #92 vqp_state
        DC.B    0, 21   ; #93 vsp_state
        DC.B    0, 0    ; #94 vsp_save
        DC.B    0, 0    ; #95 vsp_message
        DC.B    0, 0    ; #96 vsp_error
        DC.B    0, 0    ; #97
        DC.B    2, 0    ; #98 v_meta_extents
        DC.B    0, 0    ; #99 v_write_meta (direkt)
        DC.B    0, 0    ; #100vm_filename (direkt)
        DC.B    0, 1    ; #101v_offset
        DC.B    0, 2    ; #102v_fontinit
    END;
  END ctrl_cnts5;

*)

PROCEDURE AES_CTRL_CODE(op, nintin, nintout, naddrin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(nintin), 16) + SHIFT(BITSET(nintout), 8) + SHIFT(BITSET(naddrin), 0));
END AES_CTRL_CODE;

PROCEDURE VDI_CTRL_CODE(op, subcmd, nptsin, nintin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(subcmd), 16) + SHIFT(BITSET(nptsin), 8) + SHIFT(BITSET(nintin), 0));
END VDI_CTRL_CODE;
