IMPLEMENTATION MODULE CookieJar;


FROM SYSTEM IMPORT ADDRESS, CARDINAL32;
FROM SysVars IMPORT _p_cookies;
FROM BIOS IMPORT GetException;
IMPORT MOSGlobals;

TYPE Cookie = RECORD
  id: CARDINAL32;
  value: CARDINAL32;
END;
TYPE PtrCookie = POINTER TO Cookie;


PROCEDURE cookiePtr (): PtrCookie;
BEGIN
  RETURN GetException(_p_cookies DIV 4);
END cookiePtr;
  

(* Rueckgabe des Ptrs auf den Cookie, wenn D0 <> 0 *)
PROCEDURE findCookie (cookie: CARDINAL32): PtrCookie;
VAR ptr: PtrCookie;
BEGIN
  ptr := cookiePtr();
  IF ptr <> NIL THEN
    LOOP
      IF ptr^.id = 0 THEN EXIT END;
      IF ptr^.id = cookie THEN EXIT END;
      INC(ptr, SIZE(ptr^));
    END;
  END;
  RETURN ptr;
END findCookie;


PROCEDURE GetCookie (cookie: CARDINAL32; VAR value: CARDINAL32): [ BOOLEAN ];
VAR ptr: PtrCookie;
BEGIN
  ptr := findCookie(cookie);
  IF ptr <> NIL THEN
    value := ptr^.value;
    RETURN TRUE;
  END;
  value := 0;
  RETURN FALSE;
END GetCookie;


PROCEDURE ModifyCookie (cookie: CARDINAL32; newvalue: CARDINAL32): [ BOOLEAN ];
VAR ptr: PtrCookie;
BEGIN
  ptr := findCookie(cookie);
  IF ptr <> NIL THEN
    ptr^.value := newvalue;
    RETURN TRUE;
  END;
  RETURN FALSE;
END ModifyCookie;


PROCEDURE QueryCookies (with: CookieProc);
VAR ptr: PtrCookie;
BEGIN
  ptr := cookiePtr();
  IF ptr <> NIL THEN
    LOOP
      IF ptr^.id = 0 THEN EXIT END;
      IF with(ptr^.id, ptr^.value) = FALSE THEN EXIT END;
      INC(ptr, SIZE(ptr^));
    END;
  END;
END QueryCookies;

BEGIN
  IF MOSGlobals.TraceInit THEN MOSGlobals.traceInit(__FILE__); END;
END CookieJar.
