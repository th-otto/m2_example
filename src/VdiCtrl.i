PROCEDURE VDI_CTRL_CODE(op, subcmd, nptsin, nintin: CARDINAL): CARDINAL32;
BEGIN
  RETURN CARDINAL32(SHIFT(BITSET(op), 24) + SHIFT(BITSET(subcmd), 16) + SHIFT(BITSET(nptsin), 8) + SHIFT(BITSET(nintin), 0));
END VDI_CTRL_CODE;
