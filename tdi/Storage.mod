IMPLEMENTATION MODULE Storage;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$A+*) (* short calls *)

FROM SYSTEM IMPORT ADR, ADDRESS, BYTE, CODE;
IMPORT GEMDOS;

TYPE BYTEPTR = POINTER TO BYTE;
CONST NULL = BYTEPTR(0);

TYPE BlockPtr = POINTER TO Block;
TYPE Block = RECORD
  nextBlock: BlockPtr;
  freeSize: LONGCARD;
END;

TYPE HeapPtr = POINTER TO HEAP;
TYPE HEAP = RECORD
  end: ADDRESS;
  firstBlock: BlockPtr;
  o8: ADDRESS;
  freeList: BlockPtr;
  blocks: BlockPtr;
  sharedFlag: BOOLEAN;
END;
VAR heap: HeapPtr;
CONST HEAPSIZE = 16384;


PROCEDURE ALLOCATE(VAR addr: ADDRESS; amount: LONGCARD);
VAR endPtr: BlockPtr;
VAR nextPtr: BlockPtr;
BEGIN
  IF heap = NIL THEN
    IF NOT CreateHeap(HEAPSIZE, FALSE) THEN
      HALT;
    END;
  END;
  WITH heap^ DO
    IF ODD(amount) THEN
      INC(amount);
    END;
    nextPtr := freeList;
    endPtr := nextPtr^.nextBlock;
    WHILE endPtr <> freeList DO
      WITH endPtr^ DO
        IF freeSize = amount THEN
          addr := endPtr;
          nextPtr^.nextBlock := nextBlock;
          freeList := nextPtr;
          RETURN;
        END;
        nextPtr := endPtr;
        endPtr := nextBlock;
      END;
    END;
    IF ADDRESS(LONGCARD(end) - amount) > o8 THEN
      addr := o8;
      INC(o8, amount);
      RETURN;
    END;
    REPEAT
      WITH endPtr^ DO
        IF freeSize > amount THEN
          freeSize := freeSize - amount;
          addr := ADDRESS(LONGCARD(endPtr) + freeSize);
          IF freeSize < SIZE(endPtr^) THEN
            nextPtr^.nextBlock := nextBlock;
            freeList := nextBlock;
          ELSE
            freeList := endPtr;
          END;
          RETURN;
        END;
        nextPtr := endPtr;
        endPtr := nextBlock;
      END;
    UNTIL endPtr = freeList;
    IF sharedFlag THEN
      addr := NIL;
    ELSE
      HALT;
    END;
  END;
END ALLOCATE;


PROCEDURE DEALLOCATE(VAR addr: ADDRESS; amount: LONGCARD);
VAR ptr: BlockPtr;
BEGIN
  WITH heap^ DO
    IF ODD(amount) THEN
      INC(amount);
    END;
    ptr := addr;
    IF amount >= SIZE(ptr^) THEN
      WITH ptr^ DO
        nextBlock := blocks^.nextBlock;
        freeSize := amount;
      END;
      blocks^.nextBlock := ptr;
    END;
    addr := NIL;
  END;
END DEALLOCATE;


(*$A-*)

PROCEDURE CreateHeap(amount: LONGCARD; shared: BOOLEAN): BOOLEAN;
VAR adr: ADDRESS;
    unused: LONGCARD;
BEGIN
  IF heap <> NIL THEN
    IF GEMDOS.Free(heap) THEN END;
  END;
  GEMDOS.Alloc(amount, adr);
  IF adr = NULL THEN
    RETURN FALSE;
  END;
  heap := adr;
  WITH heap^ DO
    firstBlock := ADDRESS(LONGCARD(adr) + SIZE(heap^));
    end := ADDRESS(LONGCARD(adr) + amount);
    blocks := firstBlock;
    freeList := blocks;
    o8 := ADDRESS(LONGCARD(firstBlock) + SIZE(blocks^));
    sharedFlag := shared;
    WITH blocks^ DO
      nextBlock := freeList;
      freeSize := 0;
    END;
  END;
  RETURN TRUE;
END CreateHeap;


BEGIN
  heap := NIL;
END Storage.
