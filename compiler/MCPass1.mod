(****************************************
*                                       *
*     MODULA-2 Multi-Pass Compiler      *
*     ****************************      *
*                                       *
*     Implementation for Lilith         *
*                                       *
*                                       *
*     MCPass1:                          *
*                                       *
*     Pass 1                            *
*     Syntactical analysis              *
*                                       *
*     Version C18 of 18.02.82           *
*                                       *
*     Institut fuer Informatik          *
*     ETH-Zuerich                       *
*     CH-8092 Zuerich                   *
*                                       *
****************************************)

MODULE MCPass1; (* SEK / LG *)

(* $T-,R- *)

FROM MCBase IMPORT Symbol, Spellix, mainmodp;
FROM MCPublic IMPORT Compilerstatus, compstat;
FROM MCP1IO IMPORT
  sy, spix,
  PutS, PutSy, PutSyVal, PutIdent, Error,
  InitSave, StopSave, RestartSave, ReleaseSys,
  GetSy,
  GetSeparateModule,
  GetDmId,
  InitInOut, TermInOut;
FROM MCP1Ident IMPORT InitIdTables;
IMPORT MCBase;

MODULE SymsetHandling;
  FROM MCBase IMPORT Symbol;

  EXPORT
    Symset, Set1, Set2, Set3,
    GenSet1, GenSet2, GenSet3, s0;

  TYPE Symset = SET OF [eop..option];

  VAR s0 : Symset;

  PROCEDURE Set1(VAR s : Symset; sy : Symbol);
  BEGIN
    INCL(s, sy);
  END Set1;

  PROCEDURE Set2(VAR s : Symset; sy1,sy2 : Symbol);
  BEGIN
    Set1(s,sy1); Set1(s,sy2);
  END Set2;

  PROCEDURE Set3(VAR s : Symset; sy1,sy2,sy3 : Symbol);
  BEGIN
    Set2(s,sy1,sy2); Set1(s,sy3);
  END Set3;

  PROCEDURE GenSet1(VAR s,s1 : Symset; sy : Symbol);
  BEGIN
    s := s1; Set1(s,sy);
  END GenSet1;

  PROCEDURE GenSet2(VAR s,s1 : Symset; sy1,sy2 : Symbol);
  BEGIN
    s := s1; Set2(s,sy1,sy2);
  END GenSet2;

  PROCEDURE GenSet3(VAR s,s1 : Symset; sy1,sy2,sy3 : Symbol);
  BEGIN
    s := s1; Set3(s,sy1,sy2,sy3);
  END GenSet3;

BEGIN (* SymsetHandling *)
  s0 := Symset{};
END SymsetHandling;

VAR constbegsys: Symset;
VAR actypbegsys: Symset;
VAR facbegsys: Symset;
VAR mulopsys: Symset;
VAR addopsys: Symset;
VAR relopsys: Symset;
VAR exprbegsys: Symset;
VAR statbegsys: Symset;
VAR stattersys: Symset;
VAR simplebegsys: Symset;
VAR declsys: Symset;
VAR bodysys: Symset;
VAR blocksys: Symset;
VAR statbegbodysys: Symset;
CONST idents = Symset{ident};
VAR plmis: Symset;
CONST arids = Symset{arraysy,ident};
VAR statbegids: Symset;
VAR semistattersys: Symset;
VAR rparcomma: Symset;
VAR comrbracks: Symset;
VAR thenset: Symset;
VAR iduntstatbegsys: Symset;
VAR toset: Symset;
VAR bydoset: Symset;
VAR doset: Symset;
VAR ofset: Symset;
VAR rparset: Symset;
VAR startset: Symset;

(* LEGENDE:
  constbegsys = [plus,minus,intcon,cardcon,intcarcon,realcon]
                +[charcon,ident,stringcon,lconbr,lparent,notsy];
  simplebegsys = [ident,lparent,lbrack];
  actypbegsys = simplebegsys+[arraysy,recordsy,setsy,pointersy,proceduresy];
  facbegsys   = [intcon,cardcon,intcarcon,charcon,realcon] +
                [ident,lparent,notsy,stringcon,lconbr];
  mulopsys = [times,slash,divsy,modsy,andsy];
  addopsys = [plus,minus,orsy];
  relopsys = [eql,neq,grt,geq,lss,leq,insy];
  exprbegsys = facbegsys + [plus,minus]
  statbegsys = [ifsy,whilesy,casesy,repeatsy,withsy,loopsy] +
               [exitsy,returnsy,forsy];
  stattersys = [elsifsy,elsesy,untilsy,endsy,variant];
  declsys = [constsy,varsy,typesy,proceduresy,modulesy];
  bodysys = [beginsy,codesy,endsy];
  blocksys = declsys + bodysys;
  statbegbodysys = statbegsys + bodysys;
  idents = [ident];
  plmis = [plus,minus];
  statbegids = statbegsys + [ident];
  semistattersys = [semicolon]+stattersys;
  rparcomma = [rparent,comma];
  comrbracks = [comma,rbrack];
  thenset = [thensy];
  iduntstatbegsys = [untilsy,semicolon] + statbegids;
  doset = [dosy]; ofset = [ofsy];
  toset = [tosy]; bydoset = [bysy,dosy];
  rparset = [rparent];
  startset = statbegsys + declsys + [beginsy,codesy,eop];  *)

PROCEDURE SymSetConstInit;
BEGIN
  GenSet3(constbegsys,s0,plus,minus,intcon);
  Set3(constbegsys,cardcon,intcarcon,realcon);
  Set3(constbegsys,charcon,ident,stringcon);
  Set3(constbegsys,lconbr,lparent,notsy);
  GenSet3(simplebegsys,s0,ident,lparent,lbrack);
  GenSet2(actypbegsys,simplebegsys,arraysy,recordsy);
  Set3(actypbegsys,setsy,pointersy,proceduresy);
  GenSet3(facbegsys,s0,intcon,cardcon,intcarcon);
  Set2(facbegsys,realcon,charcon);
  Set2(facbegsys,ident,lparent);
  Set3(facbegsys,notsy,stringcon,lconbr);
  GenSet3(mulopsys,s0,times,andsy,divsy);
  Set2(mulopsys,modsy,slash);
  GenSet3(addopsys,s0,plus,minus,orsy);
  GenSet2(relopsys,s0,eql,neq);
  Set2(relopsys,grt,geq);
  Set3(relopsys,lss,leq,insy);
  GenSet2(plmis,s0,plus,minus);
  exprbegsys := facbegsys + plmis;
  GenSet3(statbegsys,s0,ifsy,whilesy,repeatsy);
  Set3(statbegsys,casesy,withsy,loopsy);
  Set3(statbegsys,exitsy,returnsy,forsy);
  GenSet3(stattersys,s0,elsifsy,elsesy,variant);
  Set2(stattersys,untilsy,endsy);
  GenSet3(declsys,s0,constsy,typesy,varsy);
  Set2(declsys,proceduresy,modulesy);
  GenSet3(bodysys,s0,beginsy,codesy,endsy);
  blocksys := declsys + bodysys;
  statbegbodysys := statbegsys + bodysys;
  statbegids := statbegsys + idents;
  GenSet1(semistattersys,stattersys,semicolon);
  GenSet2(rparcomma,s0,rparent,comma);
  GenSet2(comrbracks,s0,comma,rbrack);
  GenSet1(thenset,s0,thensy);
  GenSet2(iduntstatbegsys, statbegids, semicolon, untilsy);
  GenSet1(doset,s0,dosy);
  GenSet1(ofset,s0,ofsy);
  GenSet1(toset,s0,tosy);
  GenSet2(bydoset,s0,bysy,dosy);
  GenSet1(rparset,s0,rparent);
  startset := statbegsys + declsys;
  Set3(startset,beginsy,codesy,eop);
END SymSetConstInit;

VAR copysepmod : BOOLEAN; (* separate module belonging to this *)
                          (* identifier must be copied *)
    globalmod : BOOLEAN;  (* current module is a global module *)
    defmod : BOOLEAN;     (* module is a definition module *)

PROCEDURE PutGetSy;
BEGIN
  PutS;
  GetSy;
END PutGetSy;


PROCEDURE PutDmId;
BEGIN
  GetDmId;
  PutIdent(spix);
END PutDmId;


PROCEDURE Skip(VAR fsys: Symset; nr: CARDINAL);
BEGIN
  Error(nr);
  WHILE NOT (sy IN fsys) DO GetSy END;
END Skip;


PROCEDURE Test(s1: Symset; VAR s2: Symset; nr: CARDINAL);
  VAR s: Symset;
BEGIN
  IF eop IN s2 THEN END; (* silence compiler *)
  s := s1;
  IF NOT (sy IN s) THEN s := s + s2; Skip(s, nr) END;
END Test;


PROCEDURE TestGet(s: Symbol; nr: CARDINAL);
BEGIN
  IF sy=s THEN GetSy ELSE Error(nr) END;
END TestGet;


PROCEDURE TestPutGet(s: Symbol; nr: CARDINAL);
BEGIN
  IF sy=s THEN PutGetSy ELSE Error(nr); PutSy(s) END;
END TestPutGet;


PROCEDURE TestSemicolon;
BEGIN
  IF sy = semicolon THEN GetSy ELSE Error(23) END;
END TestSemicolon;


PROCEDURE TestEndSemi;
BEGIN
  IF sy<>endsy THEN TestSemicolon END;
END TestEndSemi;


PROCEDURE TestIdent;
BEGIN
  IF sy = ident THEN
    IF copysepmod THEN
      IF spix <> mainmodp^.name THEN GetSeparateModule END;
      (* mainmodp points to module SYSTEM *)
    END;
    PutGetSy;
  ELSE
    Error(20);
    PutDmId
  END
END TestIdent;


PROCEDURE IdentList;
BEGIN
  TestIdent;
  WHILE sy=comma DO GetSy; TestIdent END
END IdentList;


PROCEDURE QualIdent();
BEGIN
  TestIdent;
  WHILE sy=period DO PutGetSy; TestIdent END;
END QualIdent;


PROCEDURE TestEndsy;
BEGIN
  TestPutGet(endsy, 40);
END TestEndsy;


PROCEDURE FormalType(VAR fsys: Symset);
BEGIN
  Test(arids,fsys,51);
  IF sy = arraysy THEN
    PutGetSy;
    TestGet(ofsy, 36);
  END;
  QualIdent();
END FormalType;


PROCEDURE SubrangeType(VAR (* REF *) fsys: Symset);
  VAR lfsys: Symset;
BEGIN
  PutGetSy;
  lfsys := fsys;
  INCL(lfsys, range);
  INCL(lfsys, rbrack);
  Constant(lfsys);
  TestPutGet(range,59);
  lfsys := fsys;
  INCL(lfsys, rbrack);
  Constant(lfsys);
  TestPutGet(rbrack,22);
END SubrangeType;


(* type-identifier, enumerations, subranges *)
PROCEDURE SimpleType(VAR (* REF *) fsys: Symset);
  VAR lfsys: Symset;
BEGIN
  IF sy = ident THEN
    QualIdent();
    IF sy = lbrack THEN
      SubrangeType(fsys);
    END;
  ELSIF sy = lparent THEN
    lfsys := fsys;
    INCL(lfsys, rparent);
    INCL(lfsys, comma);
    Test(idents, lfsys, 20);
    IdentList();
    TestPutGet(rparent, 41);
  ELSIF sy = lbrack THEN
    SubrangeType(fsys);
  ELSE
    Error(49);
    PutDmId();
  END;
  Test(fsys, s0, 49);
END SimpleType;


PROCEDURE ElemList(fsys: Symset; list: BOOLEAN);
  VAR lfsys: Symset;
BEGIN
  INCL(fsys, comma);
  lfsys := fsys;
  INCL(lfsys, range);
  IF (sy IN constbegsys) OR list THEN
    LOOP
      Constant(lfsys);
      IF sy=range THEN PutGetSy; Constant(fsys) END;
      IF sy=comma THEN PutGetSy ELSE EXIT END;
    END;
  END
END ElemList;


PROCEDURE SetConstructor(fsys: Symset);
BEGIN
  PutGetSy;
  INCL(fsys, rconbr);
  ElemList(fsys,FALSE);
  TestPutGet(rconbr,58)
END SetConstructor;


PROCEDURE Constant(VAR fsys: Symset);
  (* constant expression *)
  VAR lfsys: Symset;

  PROCEDURE ConstSimpleExpr(VAR fsys: Symset);
    (* simple expression in constants *)
    VAR lfsys : Symset;

    PROCEDURE ConstTerm(VAR fsys: Symset);
      (* term in constants *)
      VAR lfsys : Symset;

      PROCEDURE ConstFactor(VAR fsys: Symset);
        (* factor in constant *)
        VAR lfsys : Symset;
      BEGIN (* ConstFactor *)
        IF (sy >= intcon) AND (sy <= stringcon) THEN
          PutGetSy;
        ELSIF sy = ident THEN
          QualIdent();
          IF sy = lconbr THEN SetConstructor(fsys) END;
        ELSIF sy = lconbr THEN
          SetConstructor(fsys);
        ELSIF sy = lparent THEN
          PutGetSy;
          GenSet1(lfsys,fsys,rparent);
          Constant(lfsys);
          TestPutGet(rparent,41);
        ELSIF sy = notsy THEN
          PutGetSy;
          ConstFactor(fsys);
        ELSE
          Error(42);
          PutSyVal(intcarcon,1)
        END;
        Test(fsys,s0,42);
      END ConstFactor;

    BEGIN (* ConstTerm *)
      IF eop IN fsys THEN END; (* silence compiler *)
      lfsys := fsys + mulopsys;
      ConstFactor(lfsys);
      WHILE (sy IN mulopsys) DO
        PutGetSy;
        ConstFactor(lfsys);
      END;
    END ConstTerm;

  BEGIN (* ConstSimpleExpr *)
    IF (sy IN plmis) THEN PutGetSy END;
    IF eop IN fsys THEN END; (* silence compiler *)
    lfsys := fsys + addopsys;
    ConstTerm(lfsys);
    WHILE (sy IN addopsys) DO
      PutGetSy;
      ConstTerm(lfsys);
    END;
  END ConstSimpleExpr;

BEGIN (* Constant *)
  lfsys := fsys + relopsys;
  ConstSimpleExpr(lfsys);
  IF (sy IN relopsys) THEN
    PutGetSy;
    ConstSimpleExpr(fsys);
  END;
END Constant;


PROCEDURE ActualType(VAR fsys: Symset);
  VAR lsy: Symbol;

  PROCEDURE RecordType;
    VAR lfsys: Symset;

    PROCEDURE FieldlistSeq(VAR fsys : Symset);
      VAR lfsys : Symset; ospix: Spellix;

      PROCEDURE VariantFld(VAR fsys : Symset);
        VAR lfsys: Symset;
      BEGIN
        lfsys := fsys;
        INCL(lfsys, colon);
        ElemList(lfsys,TRUE);
        TestPutGet(colon, 37);
        FieldlistSeq(fsys)
      END VariantFld;

    BEGIN
      WHILE (sy = ident) OR (sy = casesy) DO
        IF sy = ident THEN
          IdentList;
          TestPutGet(colon, 37);
          ActualType(fsys)
        ELSE PutGetSy; (* sy = casesy *)
          IF sy = ident THEN
            ospix := spix;
            GetSy;
            IF sy = colon THEN
              PutIdent(ospix);
              PutGetSy;
              QualIdent();
            ELSE
              PutSy(colon);
              PutIdent(ospix);
              WHILE sy=period DO PutGetSy; TestIdent END
            END
          ELSE
            PutSy(colon);
            QualIdent();
          END;
          TestPutGet(ofsy, 36);
          GenSet2(lfsys,fsys,variant,elsesy); VariantFld(lfsys);
          WHILE sy = variant DO
            PutSy(ofsy); GetSy; VariantFld(lfsys);
          END;
          IF sy = elsesy THEN PutGetSy; FieldlistSeq(fsys) END;
          TestEndsy;
        END;
        IF sy = semicolon THEN
          GetSy
        ELSIF (sy<>variant) AND (sy<>endsy) AND (sy<>elsesy) THEN
          GenSet2(lfsys,fsys,casesy,ident); Skip(lfsys,23);
        END
      END
    END FieldlistSeq;

  BEGIN (* RecordType *)
    lfsys := fsys + Symset{endsy};
    FieldlistSeq(lfsys);
    TestEndsy;
  END RecordType;

  PROCEDURE ArrayType;
    VAR lfsys : Symset;
  BEGIN
    lfsys := fsys;
    INCL(lfsys, comma);
    INCL(lfsys, ofsy);
    LOOP
      SimpleType(lfsys);
      IF sy <> comma THEN EXIT END;
      GetSy;
    END;
    TestPutGet(ofsy, 36); ActualType(fsys);
  END ArrayType;

  PROCEDURE ProcedureType;
    VAR lfsys: Symset;
  BEGIN
    IF (sy = lparent) OR (sy = colon) THEN
      IF sy = lparent THEN
        PutGetSy;
        GenSet2(lfsys,fsys,comma,rparent);
        IF sy <> rparent THEN
          LOOP
            IF sy = varsy THEN PutGetSy END;
            FormalType(lfsys);
            IF sy <> comma THEN EXIT END;
            GetSy; (* skip comma *)
          END;
        END;
        TestPutGet(rparent,41);
      ELSE
        Error(45);
        PutSy(lparent); PutSy(rparent);
      END;
      IF sy = colon THEN PutGetSy; QualIdent(); END
    END;
  END ProcedureType;

BEGIN (* ActualType *)
  Test(actypbegsys,fsys,44);
  IF (sy IN simplebegsys) THEN
    SimpleType(fsys)
  ELSIF (sy IN actypbegsys) THEN
    lsy := sy;
    PutGetSy;
    IF lsy = arraysy THEN
      ArrayType
    ELSIF lsy = recordsy THEN
      RecordType
    ELSIF lsy = pointersy THEN
      TestGet(tosy, 56);
      ActualType(fsys);
    ELSIF lsy = setsy THEN
      TestGet(ofsy, 36);
      SimpleType(fsys);
    ELSIF lsy = proceduresy THEN
      ProcedureType
    END
  ELSE
    PutDmId
  END
END ActualType;


PROCEDURE Modul(VAR fsys : Symset);
  VAR lspix: Spellix;
      lfsys : Symset;

  PROCEDURE Block(VAR fsys : Symset);
    VAR lsy: Symbol;
        lfsys : Symset;

    PROCEDURE ConstDecl;
      VAR lfsys : Symset;
    BEGIN
      WHILE sy = ident DO
        PutGetSy;
        TestGet(eql, 43);
        GenSet1(lfsys,fsys,semicolon);
        Constant(lfsys);
        TestEndSemi;
      END;
      GenSet1(lfsys,fsys,endsy);
      Test(lfsys,s0,25);
    END ConstDecl;

    PROCEDURE TypeDecl;
      VAR lfsys : Symset;
    BEGIN
      GenSet1(lfsys,fsys,semicolon);
      WHILE sy = ident DO
        PutGetSy;
        IF sy = eql THEN
          GetSy;
          ActualType(lfsys);
        ELSIF defmod THEN
          PutSy(hidden)
        ELSE
          Error(43);
          ActualType(lfsys);
        END;
        TestEndSemi;
      END;
      GenSet1(lfsys,fsys,endsy);
      Test(lfsys,s0,25);
    END TypeDecl;

    PROCEDURE VarDecl;
      VAR lfsys : Symset;

      PROCEDURE Reference;
        VAR lfsys : Symset;
      BEGIN
        PutGetSy; (* lbrack *)
        lfsys := fsys + Symset{rbrack,comma,colon};
        Constant(lfsys);
        TestPutGet(rbrack, 22)
      END Reference;

    BEGIN
      WHILE sy = ident DO
        PutGetSy;
        IF sy = lbrack THEN Reference END; (* absolute address *)
        WHILE sy = comma DO
          GetSy;
          IF sy = ident THEN
            PutGetSy;
            IF sy = lbrack THEN Reference END; (* absolute address *)
          ELSE Error(20) END
        END;
        TestPutGet(colon, 37);
        GenSet1(lfsys,fsys,semicolon);
        ActualType(lfsys); TestEndSemi
      END;
      GenSet1(lfsys,fsys,endsy);
      Test(lfsys,s0,25);
    END VarDecl;

    PROCEDURE ModulDecl;
    BEGIN
      IF defmod THEN Error(57) END;
      Modul(fsys);
      TestEndSemi;
    END ModulDecl;

    PROCEDURE ProcFunDecl(VAR fsys : Symset);
      VAR lspix: Spellix;
          lfsys: Symset;

    BEGIN
      lfsys := fsys + Symset{lbrack,lparent,endsy};
      Test(idents,lfsys,20);
      IF sy <> ident THEN Error(20); PutDmId; lspix := spix
      ELSE lspix := spix; PutGetSy END;
      IF (sy = lparent) OR (sy = colon) THEN
        IF sy = lparent THEN
          PutGetSy;
          GenSet2(lfsys,fsys,rparent,semicolon);
          IF sy <> rparent THEN
            LOOP
              IF sy = varsy THEN PutGetSy END;
              IdentList;
              TestPutGet(colon, 37); FormalType(lfsys);
              IF sy <> semicolon THEN EXIT END;
              GetSy;
            END;
          END;
          TestPutGet(rparent, 41);
        ELSE
          Error(45);
          PutSy(lparent); PutSy(rparent);
        END;
        IF sy=colon THEN PutGetSy; QualIdent(); END;
      END;
      TestEndSemi;
      IF NOT defmod THEN
        Block(fsys);
        IF sy = ident THEN
          IF spix <> lspix THEN Error(24) END;
          GetSy;
        ELSE Error(20) END;
        TestEndSemi;
      END;
    END ProcFunDecl;

    PROCEDURE StatSeq( VAR fsys : Symset);
      VAR lfsys: Symset;
    BEGIN
      IF eop IN fsys THEN END;
      LOOP
        lfsys := fsys + Symset{semicolon};
        LOOP
          Statement(lfsys);
          IF sy <> semicolon THEN EXIT END;
          GetSy
        END;
        IF (sy IN stattersys) THEN EXIT END;
        Error(23);
        lfsys := fsys + semistattersys;
        Skip(lfsys,52);
        WHILE sy = semicolon DO GetSy END;
        IF NOT (sy IN statbegids) THEN EXIT END;
      END;
    END StatSeq;

    PROCEDURE Statement(VAR fsys : Symset);
      VAR lfsys, l2fsys: Symset;
          lsy: Symbol;

      PROCEDURE Selector(VAR fsys : Symset);
        VAR lsy: Symbol;
      BEGIN
        WHILE (sy=lbrack) OR (sy=period) OR (sy=arrow) DO
          lsy := sy; PutGetSy;
          IF lsy = lbrack THEN
            LOOP
              Expression(fsys,comrbracks);
              IF sy <> comma THEN EXIT END;
              GetSy; PutSy(rbrack); PutSy(lbrack)
            END;
            TestPutGet(rbrack, 22)
          ELSIF lsy = period THEN TestIdent
          END
        END
      END Selector;

      PROCEDURE Expression(VAR fsys, fsys1: Symset);
        VAR lfsys: Symset;

        PROCEDURE SimpleExpr(fsys: Symset);

          PROCEDURE Term(fsys: Symset);

            PROCEDURE Factor(VAR fsys: Symset);
            BEGIN (*Factor *)
              Test(facbegsys,fsys,48);
              IF sy = ident THEN
                QualIdent();
                IF sy=lconbr THEN
                  SetConstructor(fsys)
                ELSE
                  Selector(fsys);
                  IF sy = lparent THEN
                    PutGetSy;
                    IF (sy IN exprbegsys) THEN
                      LOOP
                        Expression(fsys,rparcomma);
                        IF sy<>comma THEN EXIT END;
                        PutGetSy
                      END
                    END;
                    TestPutGet(rparent, 41);
                  END
                END
              ELSIF sy = lconbr THEN
                SetConstructor(fsys)
              ELSIF sy = lparent THEN
                PutGetSy;
                Expression(fsys,rparset);
                TestPutGet(rparent, 41);
              ELSIF sy = notsy THEN
                PutGetSy;
                Factor(fsys);
              ELSIF (sy>=intcon) AND (sy<=stringcon) THEN
                PutGetSy;
              ELSE
                PutSyVal(intcarcon,0);
              END;
            END Factor;

          BEGIN (*Term*)
            fsys := fsys + mulopsys;
            LOOP
              Factor(fsys);
              IF NOT (sy IN mulopsys) THEN EXIT END;
              PutGetSy;
            END;
          END Term;

        BEGIN (*SimpleExpr*)
          IF (sy IN plmis) THEN PutGetSy END;
          fsys := fsys + addopsys;
          LOOP
            Term(fsys);
            IF NOT (sy IN addopsys) THEN EXIT END;
            PutGetSy;
          END;
        END SimpleExpr;

      BEGIN (*Expression*)
        lfsys := fsys + relopsys;
        SimpleExpr(lfsys);
        IF (sy IN relopsys) THEN
          PutGetSy;
          SimpleExpr(fsys);
        END;
        Test(fsys1,fsys,27);
      END Expression;

    BEGIN (* Statement *)
      (* assignment or call *)
      IF sy = ident THEN
        InitSave;
        PutGetSy;
        Selector(fsys);
        StopSave;
        IF sy = becomes THEN
          PutGetSy;
          ReleaseSys;
          PutSy(comma); (* to separate variable from expression *)
          Expression(fsys,semistattersys);
        ELSE
          PutSy(call);
          ReleaseSys;
          IF sy = lparent THEN
            PutGetSy; GenSet1(lfsys,fsys,semicolon);
            IF (sy IN exprbegsys) THEN
              LOOP
                Expression(lfsys, rparcomma);
                IF sy <> comma THEN EXIT END;
                PutGetSy
              END
            END;
            TestPutGet(rparent, 41);
          ELSE PutSy(lparent); PutSy(rparent)   (* TEMPORARY *)
          END
        END
      ELSIF (sy IN statbegsys) THEN
        lsy := sy; PutGetSy;
        CASE lsy OF
          ifsy: (* if statement *)
            Test(exprbegsys,fsys,27);
            LOOP
              GenSet3(lfsys,fsys,elsifsy,elsesy,endsy);
              Expression(lfsys,thenset);
              TestGet(thensy, 28);
              GenSet2(lfsys,fsys,elsifsy,elsesy); StatSeq(lfsys);
              IF sy <> elsifsy THEN EXIT END;
              PutGetSy;
            END;
            IF sy = elsesy THEN PutGetSy; StatSeq(fsys) END;
            TestEndsy;
         |loopsy: (* loop statement *)
            GenSet2(lfsys,statbegids,endsy,semicolon);
            Test(lfsys,fsys,29); StatSeq(fsys); TestEndsy;
         |repeatsy: (* repeat statement *)
            Test(iduntstatbegsys,fsys,31);
            GenSet1(lfsys,fsys,untilsy);
            StatSeq(lfsys); TestPutGet(untilsy, 32);
            Expression(fsys,semistattersys);
         |whilesy: (* while statement *)
            GenSet1(lfsys,fsys,dosy); Test(exprbegsys,lfsys,33);
            Expression(fsys,doset); TestGet(dosy, 34);
            StatSeq(fsys); TestEndsy;
         |casesy: (* case statement *)
            GenSet1(lfsys,fsys,ofsy); Test(exprbegsys,lfsys,35);
            lfsys := fsys + constbegsys;
            Expression(lfsys,ofset);
            TestGet(ofsy, 36);
            GenSet3(lfsys,fsys,variant, elsesy, endsy);
            GenSet1(l2fsys,fsys, colon);
            LOOP
              PutSy(ofsy); ElemList(l2fsys,TRUE);
              TestPutGet(colon, 37); StatSeq(lfsys);
              IF sy<>variant THEN EXIT END; GetSy
            END;
            IF sy=elsesy THEN PutGetSy;
              GenSet1(lfsys, fsys, endsy); StatSeq(lfsys)
            END;
            TestEndsy;
         |withsy: (* with statement *)
            GenSet1(lfsys,fsys,dosy); Test(idents,lfsys,39);
            IF sy = ident THEN QualIdent(); Selector(fsys) END;
            TestGet(dosy, 34); StatSeq(fsys); TestEndsy;
         |forsy: (* for statement *)
            TestIdent;
            TestGet(becomes, 26);
            PutSy(comma);
            GenSet3(lfsys,fsys,tosy,bysy,dosy);
            Set1(lfsys,endsy);
            Test(exprbegsys, lfsys,60);
            Expression(lfsys, toset);
            TestPutGet(tosy, 56);
            lfsys := lfsys - toset;
            Test(exprbegsys, lfsys, 60);
            Expression(lfsys, bydoset);
            IF sy=bysy THEN PutGetSy;
              GenSet2(lfsys, fsys, dosy, endsy); Constant(lfsys)
            END;
            TestGet(dosy, 34); StatSeq(fsys); TestEndsy;
         |returnsy: (* return statement *)
            IF (sy IN exprbegsys) THEN PutSy(lparent);
              Expression(fsys, semistattersys); PutSy(rparent)
            END;
         |exitsy: (* exit statement *)
        END; (* CASE *)
      END
    END Statement;

    PROCEDURE CodeSequence(VAR fsys: Symset);
      VAR lfsys: Symset;
    BEGIN
      GenSet1(lfsys,fsys,semicolon);
      LOOP
        IF (sy IN constbegsys) THEN
          Constant(lfsys);
        END;
        IF sy = semicolon THEN
          GetSy;
        ELSIF (sy IN constbegsys) THEN
          Error(23);
        ELSE
          EXIT;
        END;
      END;
      Test(fsys,s0,25);
    END CodeSequence;

  BEGIN (* Block *)
    Test(blocksys,fsys,25);
    GenSet1(lfsys,fsys,endsy);
    IF sy = codesy THEN
      IF defmod THEN (* no body allowed in definition module *)
        Error(55);
      END;
      PutGetSy; (* codesy *)
      CodeSequence(lfsys);
    ELSE
      REPEAT
        WHILE (sy IN declsys) DO
          lsy := sy; PutGetSy;
          IF lsy = varsy THEN VarDecl;
          ELSIF lsy = proceduresy THEN ProcFunDecl(fsys);
          ELSIF lsy = modulesy THEN ModulDecl;
          ELSIF lsy = typesy THEN TypeDecl;
          ELSIF lsy = constsy THEN ConstDecl;
          END;
        END;
        (* consider dummy program *)
        IF NOT ((sy IN bodysys) OR (sy=eop)) THEN
          Test(bodysys,fsys,25);
          IF (sy IN bodysys) AND NOT defmod THEN
            PutSy(proceduresy); PutDmId; Block(lfsys);
          END;
        END;
      UNTIL (sy IN statbegbodysys) OR (sy = eop);
      IF sy = beginsy THEN
        IF defmod THEN (* no body allowed in definition module *)
          Error(55);
        END;
        PutGetSy; StatSeq(lfsys)
      END;
      IF (sy IN statbegsys) THEN
        Error(38);
        PutSy(beginsy);
        StatSeq(lfsys);
      ELSIF sy = codesy THEN
        Error(38);
        PutGetSy; (* codesy *)
        CodeSequence(lfsys);
      END;
    END;
    TestGet(endsy, 40); PutSy(endblock);
  END Block;

  PROCEDURE InterfaceList(VAR (* REF *) fsys: Symset);
    VAR lfsys: Symset;
  BEGIN
    IF eop IN fsys THEN END;
    lfsys := fsys + Symset{semicolon};
    Test(idents, lfsys, 20);
    IdentList;
    TestEndSemi
  END InterfaceList;

  PROCEDURE InterfaceList2(fsys: Symset);
  BEGIN
    INCL(fsys, semicolon);
    Test(idents, fsys, 20);
    IdentList;
    TestEndSemi
  END InterfaceList2;

BEGIN (*Modul*)
  GenSet3(lfsys,fsys,lbrack,semicolon,endsy);
  Set3(lfsys,exportsy,importsy,fromsy);
  Test(idents,lfsys,20);
  IF sy <> ident THEN PutDmId; lspix := spix;
  ELSE lspix := spix; PutGetSy;
  END;
  IF sy = lbrack THEN
    PutGetSy; (* lbrack *)
    GenSet3(lfsys,fsys,rbrack,semicolon,endsy);
    Set3(lfsys,exportsy,importsy,fromsy);
    Constant(lfsys);
    TestPutGet(rbrack,22);
  END;
  TestEndSemi;
  WHILE (sy=fromsy) OR (sy=importsy) DO
    copysepmod := globalmod;
    IF sy = fromsy THEN
      PutGetSy;
      TestIdent;
      copysepmod := FALSE;
      IF sy<>importsy THEN Error(61) ELSE GetSy END
    ELSE PutGetSy END;
    GenSet1(lfsys, fsys, endsy);
    InterfaceList2(lfsys)
  END;
  IF globalmod THEN
    ReleaseSys;
    copysepmod := FALSE;
    IF symerrs IN compstat THEN RETURN END;
    (* if symbolfiles incomplete then stop compilation *)
  END;
  IF sy=exportsy THEN
    IF globalmod AND NOT defmod THEN Error(54) END;
    GetSy;
    IF sy = qualifiedsy THEN PutGetSy
    ELSIF globalmod THEN (* QUALIFIED expected *)
      Error(47);
      PutSy(qualifiedsy)
    ELSE PutSy(exportsy)
    END;
    GenSet3(lfsys, fsys, fromsy, importsy, endsy);
    InterfaceList(lfsys)
  END;
  globalmod := FALSE;
  Block(fsys);
  IF sy = ident THEN
    IF lspix <> spix THEN Error(24) END; GetSy;
  ELSE Error(20) END;
END Modul;


BEGIN (* MCPass1 *)
  s0 := Symset{};
  InitIdTables;
  InitInOut;
  SymSetConstInit;
  globalmod := TRUE;
  copysepmod := FALSE;
  GetSy;
  InitSave; (* leading options must not be saved *)
  defmod := sy = definitionsy; (* definition module *)
  IF defmod THEN
    PutGetSy; TestGet(modulesy,46);
  ELSIF sy = implementationsy THEN
    PutGetSy; TestGet(modulesy,46);
    IF sy = ident THEN GetSeparateModule END;
  ELSE (* expect modulesy *)
    TestPutGet(modulesy,46);
  END;
  Modul(startset);
  IF sy <> period THEN Error(53) END;
  TermInOut;
END MCPass1.
