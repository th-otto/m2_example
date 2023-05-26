IMPLEMENTATION MODULE Characters;

PROCEDURE IsASCII7 (c: CHAR): BOOLEAN;
  BEGIN
    RETURN ORD(c) < 128
  END IsASCII7;

PROCEDURE IsHexDigit (c: CHAR): BOOLEAN;
  BEGIN
   RETURN c IN HexDigits
  END IsHexDigit;

PROCEDURE IsAlpha (c: CHAR): BOOLEAN;
  BEGIN
    RETURN c IN Alphas
  END IsAlpha;

PROCEDURE IsAlphaNum (c: CHAR): BOOLEAN;
  BEGIN
    RETURN ((c>='a') AND (c<='z')) OR ((c>='A') AND (c<='Z')) OR ((c>='0') AND (c<='9'))
  END IsAlphaNum;

END Characters.
