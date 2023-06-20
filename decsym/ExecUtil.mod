IMPLEMENTATION MODULE ExecUtil;
(*$S-*) (* no stack check *)
(*$T-*) (* no range check *)
(*$A+*)

IMPORT Buffers;


PROCEDURE test();
(*$A+*)
  PROCEDURE FreeBuffers();
  BEGIN
    Buffers.FreeAll();
  END FreeBuffers;
(*$A-*)

BEGIN
  FreeBuffers();
  Buffers.FreeAll();
END test;

BEGIN
  test();
END ExecUtil.
