MODULE ICE;

FROM Storage IMPORT ALLOCATE, DEALLOCATE;

TYPE    logInpDev       = (noDev, location, value, choice, str);
        inputMode       = (noMode, request, sample);

TYPE    DeviceHandle    = POINTER TO device;
        device          = RECORD
                            curInpMode   : ARRAY logInpDev OF inputMode;
                            noHdCurs     : CARDINAL;
                            next         : DeviceHandle;
                          END;

PROCEDURE OpenDevice (VAR hdl: DeviceHandle);
VAR current: DeviceHandle;

  PROCEDURE newDevice (): DeviceHandle;

  VAR   d       : logInpDev;
        newdev: DeviceHandle;
  
  BEGIN
    ALLOCATE (newdev, SIZE (newdev^));
    IF newdev <> NIL THEN
      newdev^.noHdCurs := 0;
      newdev^.next := NIL;
      d := noDev;
      FOR d := MIN (logInpDev) TO MAX (logInpDev) DO
        newdev^.curInpMode[d] := noMode;
      END;
    END;
    RETURN newdev;
  END newDevice;

BEGIN
  current := newDevice ();
  hdl := current;
END OpenDevice;


BEGIN
END ICE.
