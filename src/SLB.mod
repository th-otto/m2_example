IMPLEMENTATION MODULE SLB;

TYPE SHARED_LIB_impl = RECORD dummy: INTEGER32; END;
     SHARED_LIB = POINTER TO SHARED_LIB_impl;

END SLB.
