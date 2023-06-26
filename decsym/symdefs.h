
#define symFileKey 4

typedef enum {
    endfileSS,    /* 0 */
    unitSS,       /* 1 */
    endunitSS,    /* 2 */
    importSS,     /* 3 */
    exportSS,     /* 4 */
    constSS,      /* 5 */
    normalconstSS,/* 6 */
    shortconstSS, /* 7 */
    realconstSS,  /* 8 */
    longrealconstSS, /* 9 */
    stringconstSS,/* 10 */
    typSS,        /* 11 */
    arraytypSS,   /* 12 */
    recordtypSS,  /* 13 */
    settypSS,     /* 14 */
    pointertypSS, /* 15 */
    hiddentypSS,  /* 16 */
    varSS,        /* 17 */
    procSS,       /* 18 */
    funcSS,       /* 19 */
    identSS,      /* 20 */
    periodSS,     /* 21 */
    colonSS,      /* 22 */
    rangeSS,      /* 23 */
    lparentSS,    /* 24 */
    rparentSS,    /* 25 */
    lbracketSS,   /* 26 */
    rbracketSS,   /* 27 */
    caseSS,       /* 28 */
    ofSS,         /* 29 */
    elseSS,       /* 30 */
    endSS,        /* 31 */
    unusedSS,     /* 32 */
    codeSS,       /* 33 */
    inlineSS,     /* 34 */
    commaSS       /* 35 */
} SymFileSymbols;
