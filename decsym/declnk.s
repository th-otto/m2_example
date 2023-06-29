s; ph_branch = 0x601a
; ph_tlen = 0x00007dc0
; ph_dlen = 0x00000000
; ph_blen = 0x000011aa
; ph_slen = 0x00000000
; ph_res1 = 0x00000000
; ph_prgflags = 0x00000000
; ph_absflag = 0x0000
; first relocation = 0x00000002
; relocation bytes = 0x00000673

; 0x00000001 bytes of junk at end of file

[00010000] 4ef9 0001 7964            jmp        DecLnk.init
[00010006] 0000 2000                 ori.b      #$00,d0

***
* MODULE util
***

CASEX:
[0001000a] 205f                      movea.l    (a7)+,a0
[0001000c] 9090                      sub.l      (a0),d0
[0001000e] b0a8 0004                 cmp.l      4(a0),d0
[00010012] 620c                      bhi.s      $00010020
[00010014] e380                      asl.l      #1,d0
[00010016] d0a8 0008                 add.l      8(a0),d0
[0001001a] d0f0 0800                 adda.w     0(a0,d0.l),a0
[0001001e] 4ed0                      jmp        (a0)
[00010020] d1e8 0008                 adda.l     8(a0),a0
[00010024] 5988                      subq.l     #4,a0
[00010026] 4ed0                      jmp        (a0)

HALTX:
[00010028] 2200                      move.l     d0,d1
[0001002a] 7006                      moveq.l    #6,d0
[0001002c] 4e47                      trap       #7
[0001002e] 4e75                      rts

errorProc:
[00010030] 4e56 ffe8                 link       a6,#-24
[00010034] 2a00                      move.l     d0,d5
[00010036] 7809                      moveq.l    #9,d4
[00010038] da84                      add.l      d4,d5
[0001003a] 3d45 fffe                 move.w     d5,-2(a6)
[0001003e] 2a0e                      move.l     a6,d5
[00010040] 5085                      addq.l     #8,d5
[00010042] 2d45 ffe8                 move.l     d5,-24(a6)
[00010046] 40ee fff8                 move.w     sr,-8(a6)
[0001004a] 2d4d fff4                 move.l     a5,-12(a6)
[0001004e] 2d56 fff0                 move.l     (a6),-16(a6)
[00010052] 4e68                      move.l     usp,a0
[00010054] 2d48 ffec                 move.l     a0,-20(a6)
[00010058] 0c6e 0007 fffe            cmpi.w     #$0007,-2(a6)
[0001005e] 6708                      beq.s      $00010068
[00010060] 0c6e 0008 fffe            cmpi.w     #$0008,-2(a6)
[00010066] 6614                      bne.s      $0001007C
[00010068] 2d6e 0012 fffa            move.l     18(a6),-6(a6)
[0001006e] 2a2e ffe8                 move.l     -24(a6),d5
[00010072] 5085                      addq.l     #8,d5
[00010074] 2d45 ffe8                 move.l     d5,-24(a6)
[00010078] 4efa 0042                 jmp        $000100BC(pc)
[0001007c] 0c6e 000f fffe            cmpi.w     #$000F,-2(a6)
[00010082] 660c                      bne.s      $00010090
[00010084] 4e68                      move.l     usp,a0
[00010086] 2d68 0008 fffa            move.l     8(a0),-6(a6)
[0001008c] 4efa 002e                 jmp        $000100BC(pc)
[00010090] 0c6e 0010 fffe            cmpi.w     #$0010,-2(a6)
[00010096] 660c                      bne.s      $000100A4
[00010098] 42ae fffa                 clr.l      -6(a6)
[0001009c] 42ae fff0                 clr.l      -16(a6)
[000100a0] 4efa 001a                 jmp        $000100BC(pc)
[000100a4] 0c6e 0009 fffe            cmpi.w     #$0009,-2(a6)
[000100aa] 650a                      bcs.s      $000100B6
[000100ac] 4e68                      move.l     usp,a0
[000100ae] 2d50 fffa                 move.l     (a0),-6(a6)
[000100b2] 4efa 0008                 jmp        $000100BC(pc)
[000100b6] 2d6e 000a fffa            move.l     10(a6),-6(a6)
[000100bc] 49f9 0001 7dc8            lea.l      ErrorContext,a4
[000100c2] 38ae fffe                 move.w     -2(a6),(a4)
[000100c6] 422c 0002                 clr.b      2(a4)
[000100ca] 296e fffa 0004            move.l     -6(a6),4(a4)
[000100d0] 396e fff8 0008            move.w     -8(a6),8(a4)
[000100d6] 296e fff4 000a            move.l     -12(a6),10(a4)
[000100dc] 296e fff0 000e            move.l     -16(a6),14(a4)
[000100e2] 296e ffec 0012            move.l     -20(a6),18(a4)
[000100e8] 296e fff0 0016            move.l     -16(a6),22(a4)
[000100ee] 197c 0001 001a            move.b     #$01,26(a4)
[000100f4] 2e6e ffe8                 movea.l    -24(a6),a7
[000100f8] 2039 0001 7dc4            move.l     ErrorProcessor,d0
[000100fe] 2f40 0002                 move.l     d0,2(a7)
[00010102] 3ebc 0000                 move.w     #$0000,(a7)
[00010106] 2c56                      movea.l    (a6),a6
[00010108] 4e68                      move.l     usp,a0
[0001010a] 5988                      subq.l     #4,a0
[0001010c] 4e60                      move.l     a0,usp
[0001010e] 4e73                      rte
[00010110] 4e5e                      unlk       a6
[00010112] 4e75                      rts

gemError:
[00010114] 4e56 ffb6                 link       a6,#-74
[00010118] 426e ffb6                 clr.w      -74(a6)
[0001011c] 3a2e ffb6                 move.w     -74(a6),d5
[00010120] da45                      add.w      d5,d5
[00010122] 49ee ffe2                 lea.l      -30(a6),a4
[00010126] 4274 5000                 clr.w      0(a4,d5.w)
[0001012a] 526e ffb6                 addq.w     #1,-74(a6)
[0001012e] 0c6e 000f ffb6            cmpi.w     #$000F,-74(a6)
[00010134] 66e6                      bne.s      $0001011C
[00010136] 49ee ffc0                 lea.l      -64(a6),a4
[0001013a] 2a0c                      move.l     a4,d5
[0001013c] 2d45 ffca                 move.l     d5,-54(a6)
[00010140] 49ee ffe2                 lea.l      -30(a6),a4
[00010144] 2a0c                      move.l     a4,d5
[00010146] 2d45 ffce                 move.l     d5,-50(a6)
[0001014a] 49ee ffbe                 lea.l      -66(a6),a4
[0001014e] 2a0c                      move.l     a4,d5
[00010150] 2d45 ffd2                 move.l     d5,-46(a6)
[00010154] 49ee ffbc                 lea.l      -68(a6),a4
[00010158] 2a0c                      move.l     a4,d5
[0001015a] 2d45 ffd6                 move.l     d5,-42(a6)
[0001015e] 49ee ffb8                 lea.l      -72(a6),a4
[00010162] 2a0c                      move.l     a4,d5
[00010164] 2d45 ffda                 move.l     d5,-38(a6)
[00010168] 7aff                      moveq.l    #-1,d5
[0001016a] 2d45 ffde                 move.l     d5,-34(a6)
[0001016e] 3d7c 000a ffc0            move.w     #$000A,-64(a6)
[00010174] 426e ffc2                 clr.w      -62(a6)
[00010178] 3d7c 0001 ffc4            move.w     #$0001,-60(a6)
[0001017e] 426e ffc6                 clr.w      -58(a6)
[00010182] 426e ffc8                 clr.w      -56(a6)
[00010186] 203c 0000 00c8            move.l     #$000000C8,d0
[0001018c] 49ee ffca                 lea.l      -54(a6),a4
[00010190] 2a0c                      move.l     a4,d5
[00010192] 2205                      move.l     d5,d1
[00010194] 4e42                      trap       #2
[00010196] 3d7c 004e ffc0            move.w     #$004E,-64(a6)
[0001019c] 3d7c 0001 ffc2            move.w     #$0001,-62(a6)
[000101a2] 3d7c 0001 ffc4            move.w     #$0001,-60(a6)
[000101a8] 3d7c 0001 ffc6            move.w     #$0001,-58(a6)
[000101ae] 426e ffc8                 clr.w      -56(a6)
[000101b2] 3d7c 0101 ffbe            move.w     #$0101,-66(a6)
[000101b8] 7aff                      moveq.l    #-1,d5
[000101ba] 2d45 ffb8                 move.l     d5,-72(a6)
[000101be] 203c 0000 00c8            move.l     #$000000C8,d0
[000101c4] 49ee ffca                 lea.l      -54(a6),a4
[000101c8] 2a0c                      move.l     a4,d5
[000101ca] 2205                      move.l     d5,d1
[000101cc] 4e42                      trap       #2
[000101ce] 3d7c 0034 ffc0            move.w     #$0034,-64(a6)
[000101d4] 3d7c 0001 ffc2            move.w     #$0001,-62(a6)
[000101da] 3d7c 0001 ffc4            move.w     #$0001,-60(a6)
[000101e0] 3d7c 0001 ffc6            move.w     #$0001,-58(a6)
[000101e6] 426e ffc8                 clr.w      -56(a6)
[000101ea] 3d7c 0001 ffbe            move.w     #$0001,-66(a6)
[000101f0] 286d fffc                 movea.l    -4(a5),a4
[000101f4] 49ec ff9a                 lea.l      -102(a4),a4
[000101f8] 2a0c                      move.l     a4,d5
[000101fa] 2d45 ffb8                 move.l     d5,-72(a6)
[000101fe] 203c 0000 00c8            move.l     #$000000C8,d0
[00010204] 49ee ffca                 lea.l      -54(a6),a4
[00010208] 2a0c                      move.l     a4,d5
[0001020a] 2205                      move.l     d5,d1
[0001020c] 4e42                      trap       #2
[0001020e] 3d7c 0013 ffc0            move.w     #$0013,-64(a6)
[00010214] 426e ffc2                 clr.w      -62(a6)
[00010218] 3d7c 0001 ffc4            move.w     #$0001,-60(a6)
[0001021e] 426e ffc6                 clr.w      -58(a6)
[00010222] 426e ffc8                 clr.w      -56(a6)
[00010226] 203c 0000 00c8            move.l     #$000000C8,d0
[0001022c] 49ee ffca                 lea.l      -54(a6),a4
[00010230] 2a0c                      move.l     a4,d5
[00010232] 2205                      move.l     d5,d1
[00010234] 4e42                      trap       #2
[00010236] 4eb9 0001 0578            jsr        RestoreExceptions
[0001023c] 704c                      moveq.l    #76,d0
[0001023e] 3f00                      move.w     d0,-(a7)
[00010240] 3039 0001 7dc8            move.w     ErrorContext,d0
[00010246] 4e41                      trap       #1
[00010248] 4e5e                      unlk       a6
[0001024a] 4e75                      rts

defaultErrorProcessor:
[0001024c] 4e56 ff88                 link       a6,#-120
[00010250] 2f2d fffc                 move.l     -4(a5),-(a7)
[00010254] 2b4e fffc                 move.l     a6,-4(a5)
[00010258] 49f9 0001 07f8            lea.l      $000107F8,a4
[0001025e] 47ee ff9a                 lea.l      -102(a6),a3
[00010262] 7a2b                      moveq.l    #43,d5
[00010264] 16dc                      move.b     (a4)+,(a3)+
[00010266] 57cd fffc                 dbeq       d5,$00010264
[0001026a] 426e ff8c                 clr.w      -116(a6)
[0001026e] 3a2e ff8c                 move.w     -116(a6),d5
[00010272] 49ee ff9a                 lea.l      -102(a6),a4
[00010276] 4a34 5000                 tst.b      0(a4,d5.w)
[0001027a] 6706                      beq.s      $00010282
[0001027c] 526e ff8c                 addq.w     #1,-116(a6)
[00010280] 60ec                      bra.s      $0001026E
[00010282] 3d79 0001 7dc8 ff88       move.w     ErrorContext,-120(a6)
[0001028a] 0c6e 000a ff88            cmpi.w     #$000A,-120(a6)
[00010290] 6412                      bcc.s      $000102A4
[00010292] 3a2e ff8c                 move.w     -116(a6),d5
[00010296] 49ee ff9a                 lea.l      -102(a6),a4
[0001029a] 19bc 0030 5000            move.b     #$30,0(a4,d5.w)
[000102a0] 4efa 0028                 jmp        $000102CA(pc)
[000102a4] 7a00                      moveq.l    #0,d5
[000102a6] 3a2e ff88                 move.w     -120(a6),d5
[000102aa] 8afc 000a                 divu.w     #$000A,d5
[000102ae] 4845                      swap       d5
[000102b0] 4245                      clr.w      d5
[000102b2] 4845                      swap       d5
[000102b4] 8afc 000a                 divu.w     #$000A,d5
[000102b8] 4845                      swap       d5
[000102ba] 7830                      moveq.l    #48,d4
[000102bc] da44                      add.w      d4,d5
[000102be] 382e ff8c                 move.w     -116(a6),d4
[000102c2] 49ee ff9a                 lea.l      -102(a6),a4
[000102c6] 1985 4000                 move.b     d5,0(a4,d4.w)
[000102ca] 526e ff8c                 addq.w     #1,-116(a6)
[000102ce] 7a00                      moveq.l    #0,d5
[000102d0] 3a2e ff88                 move.w     -120(a6),d5
[000102d4] 8afc 000a                 divu.w     #$000A,d5
[000102d8] 4845                      swap       d5
[000102da] 7830                      moveq.l    #48,d4
[000102dc] da44                      add.w      d4,d5
[000102de] 382e ff8c                 move.w     -116(a6),d4
[000102e2] 49ee ff9a                 lea.l      -102(a6),a4
[000102e6] 1985 4000                 move.b     d5,0(a4,d4.w)
[000102ea] 526e ff8c                 addq.w     #1,-116(a6)
[000102ee] 49f9 0001 0824            lea.l      $00010824,a4
[000102f4] 47ee ff8e                 lea.l      -114(a6),a3
[000102f8] 7a05                      moveq.l    #5,d5
[000102fa] 16dc                      move.b     (a4)+,(a3)+
[000102fc] 57cd fffc                 dbeq       d5,$000102FA
[00010300] 426e ff8a                 clr.w      -118(a6)
[00010304] 3a2e ff8a                 move.w     -118(a6),d5
[00010308] 49ee ff8e                 lea.l      -114(a6),a4
[0001030c] 382e ff8c                 move.w     -116(a6),d4
[00010310] d86e ff8a                 add.w      -118(a6),d4
[00010314] 47ee ff9a                 lea.l      -102(a6),a3
[00010318] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[0001031e] 526e ff8a                 addq.w     #1,-118(a6)
[00010322] 3a2e ff8a                 move.w     -118(a6),d5
[00010326] 49ee ff8e                 lea.l      -114(a6),a4
[0001032a] 4a34 5000                 tst.b      0(a4,d5.w)
[0001032e] 6702                      beq.s      $00010332
[00010330] 60d2                      bra.s      $00010304
[00010332] 4eb9 0001 0114            jsr        gemError
[00010338] 2b5f fffc                 move.l     (a7)+,-4(a5)
[0001033c] 4e5e                      unlk       a6
[0001033e] 4e75                      rts

trap6:
[00010340] 46fc 2700                 move.w     #$2700,sr
[00010344] 2f4e fffc                 move.l     a6,-4(a7)
[00010348] 4e6e                      move.l     usp,a6
[0001034a] 2d2f 0002                 move.l     2(a7),-(a6)
[0001034e] 3d17                      move.w     (a7),-(a6)
[00010350] 2d2f fffc                 move.l     -4(a7),-(a6)
[00010354] 48e6 fffc                 movem.l    d0-d7/a0-a5,-(a6)
[00010358] 2251                      movea.l    (a1),a1
[0001035a] 208e                      move.l     a6,(a0)
[0001035c] 2c49                      movea.l    a1,a6
[0001035e] 4cde 3fff                 movem.l    (a6)+,d0-d7/a0-a5
[00010362] 2f5e fffc                 move.l     (a6)+,-4(a7)
[00010366] 3e9e                      move.w     (a6)+,(a7)
[00010368] 2f5e 0002                 move.l     (a6)+,2(a7)
[0001036c] 4e66                      move.l     a6,usp
[0001036e] 2c6f fffc                 movea.l    -4(a7),a6
[00010372] 4e73                      rte

trap5:
[00010374] 46fc 2700                 move.w     #$2700,sr
[00010378] 2f4e fffc                 move.l     a6,-4(a7)
[0001037c] 4e6e                      move.l     usp,a6
[0001037e] 2d2f 0002                 move.l     2(a7),-(a6)
[00010382] 3d17                      move.w     (a7),-(a6)
[00010384] 2d2f fffc                 move.l     -4(a7),-(a6)
[00010388] 48e6 fffc                 movem.l    d0-d7/a0-a5,-(a6)
[0001038c] 2251                      movea.l    (a1),a1
[0001038e] 208e                      move.l     a6,(a0)
[00010390] 47fa 002a                 lea.l      $000103BC(pc),a3
[00010394] 2d0b                      move.l     a3,-(a6)
[00010396] 3d3c 4eb9                 move.w     #$4EB9,-(a6)
[0001039a] 3d3c 2700                 move.w     #$2700,-(a6)
[0001039e] 3d3c 46fc                 move.w     #$46FC,-(a6)
[000103a2] 248e                      move.l     a6,(a2)
[000103a4] 2c49                      movea.l    a1,a6
[000103a6] 4cde 3fff                 movem.l    (a6)+,d0-d7/a0-a5
[000103aa] 2f5e fffc                 move.l     (a6)+,-4(a7)
[000103ae] 3e9e                      move.w     (a6)+,(a7)
[000103b0] 2f5e 0002                 move.l     (a6)+,2(a7)
[000103b4] 4e66                      move.l     a6,usp
[000103b6] 2c6f fffc                 movea.l    -4(a7),a6
[000103ba] 4e73                      rte
[000103bc] 2f4e fffc                 move.l     a6,-4(a7)
[000103c0] 4e6e                      move.l     usp,a6
[000103c2] 2d2f 0006                 move.l     6(a7),-(a6)
[000103c6] 3d2f 0004                 move.w     4(a7),-(a6)
[000103ca] 2d2f fffc                 move.l     -4(a7),-(a6)
[000103ce] 48e6 fffc                 movem.l    d0-d7/a0-a5,-(a6)
[000103d2] 205f                      movea.l    (a7)+,a0
[000103d4] 2268 0024                 movea.l    36(a0),a1
[000103d8] 228e                      move.l     a6,(a1)
[000103da] 2c48                      movea.l    a0,a6
[000103dc] 4cde 3fff                 movem.l    (a6)+,d0-d7/a0-a5
[000103e0] 2f5e fffc                 move.l     (a6)+,-4(a7)
[000103e4] 3e9e                      move.w     (a6)+,(a7)
[000103e6] 2f5e 0002                 move.l     (a6)+,2(a7)
[000103ea] 4e66                      move.l     a6,usp
[000103ec] 2c6f fffc                 movea.l    -4(a7),a6
[000103f0] 4e73                      rte

trap7:
[000103f2] 46fc 2700                 move.w     #$2700,sr
[000103f6] 5300                      subq.b     #1,d0
[000103f8] 5300                      subq.b     #1,d0
[000103fa] 6608                      bne.s      $00010404
[000103fc] 0257 f8ff                 andi.w     #$F8FF,(a7)
[00010400] 8357                      or.w       d1,(a7)
[00010402] 4e73                      rte
[00010404] 5300                      subq.b     #1,d0
[00010406] 6604                      bne.s      $0001040C
[00010408] 3e81                      move.w     d1,(a7)
[0001040a] 4e73                      rte
[0001040c] 5300                      subq.b     #1,d0
[0001040e] 6606                      bne.s      $00010416
[00010410] 46fc 2000                 move.w     #$2000,sr
[00010414] 4e73                      rte
[00010416] 5300                      subq.b     #1,d0
[00010418] 6604                      bne.s      $0001041E
[0001041a] 4e71                      nop
[0001041c] 4e73                      rte
[0001041e] 5300                      subq.b     #1,d0
[00010420] 660a                      bne.s      $0001042C
[00010422] 2001                      move.l     d1,d0
[00010424] 4eb9 0001 0030            jsr        errorProc
[0001042a] 4e73                      rte
[0001042c] 4e68                      move.l     usp,a0
[0001042e] 42a0                      clr.l      -(a0)
[00010430] 42a0                      clr.l      -(a0)
[00010432] 42a0                      clr.l      -(a0)
[00010434] 2039 0001 7e00            move.l     PgmSize,d0
[0001043a] 2100                      move.l     d0,-(a0)
[0001043c] 42a0                      clr.l      -(a0)
[0001043e] 2a48                      movea.l    a0,a5
[00010440] 90fc 0024                 suba.w     #$0024,a0
[00010444] 43fa 0006                 lea.l      $0001044C(pc),a1
[00010448] 2109                      move.l     a1,-(a0)
[0001044a] 6016                      bra.s      $00010462
[0001044c] 4eb9 0001 0578            jsr        RestoreExceptions
[00010452] 203c 0000 004c            move.l     #$0000004C,d0
[00010458] 3f00                      move.w     d0,-(a7)
[0001045a] 203c 0000 0000            move.l     #$00000000,d0
[00010460] 4e41                      trap       #1
[00010462] 4e60                      move.l     a0,usp
[00010464] 9dce                      suba.l     a6,a6
[00010466] 0257 d8ff                 andi.w     #$D8FF,(a7)
[0001046a] 4e73                      rte

DIVU32:
[0001046c] 4e56 0000                 link       a6,#0
[00010470] 48e7 7800                 movem.l    d1-d4,-(a7)
[00010474] 222e 000c                 move.l     12(a6),d1
[00010478] 242e 0008                 move.l     8(a6),d2
[0001047c] b4bc 0000 ffff            cmp.l      #$0000FFFF,d2
[00010482] 621e                      bhi.s      $000104A2
[00010484] 4243                      clr.w      d3
[00010486] 82c2                      divu.w     d2,d1
[00010488] 680e                      bvc.s      $00010498
[0001048a] 3801                      move.w     d1,d4
[0001048c] 4241                      clr.w      d1
[0001048e] 4841                      swap       d1
[00010490] 82c2                      divu.w     d2,d1
[00010492] 3601                      move.w     d1,d3
[00010494] 3204                      move.w     d4,d1
[00010496] 82c2                      divu.w     d2,d1
[00010498] 4843                      swap       d3
[0001049a] 3601                      move.w     d1,d3
[0001049c] 4241                      clr.w      d1
[0001049e] 4841                      swap       d1
[000104a0] 601e                      bra.s      $000104C0
[000104a2] 4283                      clr.l      d3
[000104a4] 3601                      move.w     d1,d3
[000104a6] 4843                      swap       d3
[000104a8] 4241                      clr.w      d1
[000104aa] 4841                      swap       d1
[000104ac] 383c 000f                 move.w     #$000F,d4
[000104b0] e38b                      lsl.l      #1,d3
[000104b2] e391                      roxl.l     #1,d1
[000104b4] b282                      cmp.l      d2,d1
[000104b6] 6504                      bcs.s      $000104BC
[000104b8] 9282                      sub.l      d2,d1
[000104ba] 5243                      addq.w     #1,d3
[000104bc] 51cc fff2                 dbf        d4,$000104B0
[000104c0] 2d43 000c                 move.l     d3,12(a6)
[000104c4] 2d41 0008                 move.l     d1,8(a6)
[000104c8] 4cdf 001e                 movem.l    (a7)+,d1-d4
[000104cc] 4e5e                      unlk       a6
[000104ce] 4e75                      rts

bus_err:
[000104d0] 46fc 2700                 move.w     #$2700,sr
[000104d4] 70ff                      moveq.l    #-1,d0
[000104d6] 4eb9 0001 0030            jsr        errorProc
[000104dc] 4e73                      rte

address_err:
[000104de] 46fc 2700                 move.w     #$2700,sr
[000104e2] 70fe                      moveq.l    #-2,d0
[000104e4] 4eb9 0001 0030            jsr        errorProc
[000104ea] 4e73                      rte

division_zero:
[000104ec] 46fc 2700                 move.w     #$2700,sr
[000104f0] 70fc                      moveq.l    #-4,d0
[000104f2] 4eb9 0001 0030            jsr        errorProc
[000104f8] 4e73                      rte

rangechk:
[000104fa] 46fc 2700                 move.w     #$2700,sr
[000104fe] 70fb                      moveq.l    #-5,d0
[00010500] 4eb9 0001 0030            jsr        errorProc
[00010506] 4e73                      rte

trapv:
[00010508] 46fc 2700                 move.w     #$2700,sr
[0001050c] 70fa                      moveq.l    #-6,d0
[0001050e] 4eb9 0001 0030            jsr        errorProc
[00010514] 4e73                      rte

privilege:
[00010516] 46fc 2700                 move.w     #$2700,sr
[0001051a] 70f9                      moveq.l    #-7,d0
[0001051c] 4eb9 0001 0030            jsr        errorProc
[00010522] 4e73                      rte

SetException:
[00010524] 4e56 fffc                 link       a6,#-4
[00010528] 202e 000a                 move.l     10(a6),d0
[0001052c] 2f00                      move.l     d0,-(a7)
[0001052e] 322e 0008                 move.w     8(a6),d1
[00010532] 3f01                      move.w     d1,-(a7)
[00010534] 3f3c 0005                 move.w     #$0005,-(a7) ; Setexc
[00010538] 4e4d                      trap       #13
[0001053a] 2a00                      move.l     d0,d5
[0001053c] 2d45 fffc                 move.l     d5,-4(a6)
[00010540] 0c6e 000b 0008            cmpi.w     #$000B,8(a6)
[00010546] 6216                      bhi.s      $0001055E
[00010548] 3a2e 0008                 move.w     8(a6),d5
[0001054c] e545                      asl.w      #2,d5
[0001054e] 49f9 0001 7e04            lea.l      ExceptionVecs1,a4
[00010554] 29ae fffc 5000            move.l     -4(a6),0(a4,d5.w)
[0001055a] 4efa 0018                 jmp        $00010574(pc)
[0001055e] 3a2e 0008                 move.w     8(a6),d5
[00010562] 0445 0020                 subi.w     #$0020,d5
[00010566] e545                      asl.w      #2,d5
[00010568] 49f9 0001 7e34            lea.l      ExceptionVecs2,a4
[0001056e] 29ae fffc 5000            move.l     -4(a6),0(a4,d5.w)
[00010574] 4e5e                      unlk       a6
[00010576] 4e75                      rts

RestoreExceptions:
[00010578] 4e56 0000                 link       a6,#0
[0001057c] 2f39 0001 7e10            move.l     $00017E10,-(a7)
[00010582] 3f3c 0003                 move.w     #$0003,-(a7)
[00010586] 4eb9 0001 0524            jsr        SetException
[0001058c] 5c8f                      addq.l     #6,a7
[0001058e] 2f39 0001 7e0c            move.l     $00017E0C,-(a7)
[00010594] 3f3c 0002                 move.w     #$0002,-(a7)
[00010598] 4eb9 0001 0524            jsr        SetException
[0001059e] 5c8f                      addq.l     #6,a7
[000105a0] 2f39 0001 7e18            move.l     $00017E18,-(a7)
[000105a6] 3f3c 0005                 move.w     #$0005,-(a7)
[000105aa] 4eb9 0001 0524            jsr        SetException
[000105b0] 5c8f                      addq.l     #6,a7
[000105b2] 2f39 0001 7e1c            move.l     $00017E1C,-(a7)
[000105b8] 3f3c 0006                 move.w     #$0006,-(a7)
[000105bc] 4eb9 0001 0524            jsr        SetException
[000105c2] 5c8f                      addq.l     #6,a7
[000105c4] 2f39 0001 7e20            move.l     $00017E20,-(a7)
[000105ca] 3f3c 0007                 move.w     #$0007,-(a7)
[000105ce] 4eb9 0001 0524            jsr        SetException
[000105d4] 5c8f                      addq.l     #6,a7
[000105d6] 2f39 0001 7e24            move.l     $00017E24,-(a7)
[000105dc] 3f3c 0008                 move.w     #$0008,-(a7)
[000105e0] 4eb9 0001 0524            jsr        SetException
[000105e6] 5c8f                      addq.l     #6,a7
[000105e8] 2f39 0001 7e50            move.l     $00017E50,-(a7)
[000105ee] 3f3c 0027                 move.w     #$0027,-(a7)
[000105f2] 4eb9 0001 0524            jsr        SetException
[000105f8] 5c8f                      addq.l     #6,a7
[000105fa] 2f39 0001 7e4c            move.l     $00017E4C,-(a7)
[00010600] 3f3c 0026                 move.w     #$0026,-(a7)
[00010604] 4eb9 0001 0524            jsr        SetException
[0001060a] 5c8f                      addq.l     #6,a7
[0001060c] 2f39 0001 7e48            move.l     $00017E48,-(a7)
[00010612] 3f3c 0025                 move.w     #$0025,-(a7)
[00010616] 4eb9 0001 0524            jsr        SetException
[0001061c] 5c8f                      addq.l     #6,a7
[0001061e] 4e5e                      unlk       a6
[00010620] 4e75                      rts

entry:
[00010622] 4e71                      nop
[00010624] 4e71                      nop
[00010626] 4e71                      nop

[00010628] 204f                      movea.l    a7,a0
[0001062a] 2068 0004                 movea.l    4(a0),a0
[0001062e] 2a08                      move.l     a0,d5
[00010630] 23c5 0001 7dc0            move.l     d5,BasePageAddress
[00010636] 2879 0001 7dc0            movea.l    BasePageAddress,a4
[0001063c] 23ec 0008 0001 7dfc       move.l     8(a4),CodeBase
[00010644] 2028 000c                 move.l     12(a0),d0
[00010648] d0a8 0014                 add.l      20(a0),d0
[0001064c] d0a8 001c                 add.l      28(a0),d0
[00010650] 2879 0001 7dfc            movea.l    CodeBase,a4
[00010656] 2a2c 0006                 move.l     6(a4),d5
[0001065a] d085                      add.l      d5,d0
[0001065c] 0680 0000 0100            addi.l     #$00000100,d0
[00010662] 2e40                      movea.l    d0,a7
[00010664] dfc8                      adda.l     a0,a7
[00010666] 2f00                      move.l     d0,-(a7)
[00010668] 2f08                      move.l     a0,-(a7)
[0001066a] 3f00                      move.w     d0,-(a7)
[0001066c] 3f3c 004a                 move.w     #$004A,-(a7) ; Mshrink
[00010670] 4e41                      trap       #1
[00010672] dffc 0000 000c            adda.l     #$0000000C,a7
[00010678] 2879 0001 7dc0            movea.l    BasePageAddress,a4
[0001067e] 2a2c 0008                 move.l     8(a4),d5
[00010682] daac 000c                 add.l      12(a4),d5
[00010686] daac 0014                 add.l      20(a4),d5
[0001068a] daac 001c                 add.l      28(a4),d5
[0001068e] 23c5 0001 7e00            move.l     d5,PgmSize
[00010694] 2f3c 0001 04de            move.l     #address_err,-(a7)
[0001069a] 3f3c 0003                 move.w     #$0003,-(a7)
[0001069e] 4eb9 0001 0524            jsr        SetException
[000106a4] 5c8f                      addq.l     #6,a7
[000106a6] 2f3c 0001 04d0            move.l     #bus_err,-(a7)
[000106ac] 3f3c 0002                 move.w     #$0002,-(a7)
[000106b0] 4eb9 0001 0524            jsr        SetException
[000106b6] 5c8f                      addq.l     #6,a7
[000106b8] 2f3c 0001 04ec            move.l     #division_zero,-(a7)
[000106be] 3f3c 0005                 move.w     #$0005,-(a7)
[000106c2] 4eb9 0001 0524            jsr        SetException
[000106c8] 5c8f                      addq.l     #6,a7
[000106ca] 2f3c 0001 04fa            move.l     #rangechk,-(a7)
[000106d0] 3f3c 0006                 move.w     #$0006,-(a7)
[000106d4] 4eb9 0001 0524            jsr        SetException
[000106da] 5c8f                      addq.l     #6,a7
[000106dc] 2f3c 0001 0508            move.l     #trapv,-(a7)
[000106e2] 3f3c 0007                 move.w     #$0007,-(a7)
[000106e6] 4eb9 0001 0524            jsr        SetException
[000106ec] 5c8f                      addq.l     #6,a7
[000106ee] 2f3c 0001 0516            move.l     #privilege,-(a7)
[000106f4] 3f3c 0008                 move.w     #$0008,-(a7)
[000106f8] 4eb9 0001 0524            jsr        SetException
[000106fe] 5c8f                      addq.l     #6,a7
[00010700] 2f3c 0001 03f2            move.l     #trap7,-(a7)
[00010706] 3f3c 0027                 move.w     #$0027,-(a7)
[0001070a] 4eb9 0001 0524            jsr        SetException
[00010710] 5c8f                      addq.l     #6,a7
[00010712] 2f3c 0001 0340            move.l     #trap6,-(a7)
[00010718] 3f3c 0026                 move.w     #$0026,-(a7)
[0001071c] 4eb9 0001 0524            jsr        SetException
[00010722] 5c8f                      addq.l     #6,a7
[00010724] 2f3c 0001 0374            move.l     #trap5,-(a7)
[0001072a] 3f3c 0025                 move.w     #$0025,-(a7)
[0001072e] 4eb9 0001 0524            jsr        SetException
[00010734] 5c8f                      addq.l     #6,a7
[00010736] 23fc 0001 024c 0001 7dc4  move.l     #defaultErrorProcessor,ErrorProcessor
[00010740] 7007                      moveq.l    #7,d0
[00010742] 4e47                      trap       #7
[00010744] 4ef9 0001 0b48            jmp        GEMAESbase.init+6

[0001074a] 4745 4d58                 .asciiz   "GEMX"
[00010750] 4d6f                      .asciiz 'Modula-2/ST (c) Copyright Modula 2 Software Ltd. 1985,1986,1987. '
[00010792] 2863                      .asciiz '(c) Copyright TDI Software Inc. 1985,1986,1987. '
[000107c4] 5468                      .asciiz 'The team : Chris Hall, Paul Curtis, and Phil Camp .'

[000107f8] 5b33 5d5b 4d6f 6475       .asciiz "[3][Modula-2 Run Time Error : | |         #"
[00010824] 5d5b                      .asciiz "][OK]"

***
* MODULE GEMDOS
***

[0001082a] 4e56 0000                 link       a6,#0
[0001082e] 3f2e 0008                 move.w     8(a6),-(a7)
[00010832] 4e41                      trap       #1
[00010834] 2a00                      move.l     d0,d5
[00010836] 2d45 000a                 move.l     d5,10(a6)
[0001083a] 4e5e                      unlk       a6
[0001083c] 4e75                      rts
[0001083e] 4e56 0000                 link       a6,#0
[00010842] 3f2e 0008                 move.w     8(a6),-(a7)
[00010846] 3f2e 000a                 move.w     10(a6),-(a7)
[0001084a] 4e41                      trap       #1
[0001084c] 2a00                      move.l     d0,d5
[0001084e] 2d45 000c                 move.l     d5,12(a6)
[00010852] 4e5e                      unlk       a6
[00010854] 4e75                      rts
[00010856] 4e56 0000                 link       a6,#0
[0001085a] 2f2e 0008                 move.l     8(a6),-(a7)
[0001085e] 2f2e 000c                 move.l     12(a6),-(a7)
[00010862] 3f2e 0010                 move.w     16(a6),-(a7)
[00010866] 3f2e 0012                 move.w     18(a6),-(a7)
[0001086a] 4e41                      trap       #1
[0001086c] 2a00                      move.l     d0,d5
[0001086e] 2d45 0014                 move.l     d5,20(a6)
[00010872] 4e5e                      unlk       a6
[00010874] 4e75                      rts
[00010876] 4e56 0000                 link       a6,#0
[0001087a] 2f2e 0008                 move.l     8(a6),-(a7)
[0001087e] 3f2e 000c                 move.w     12(a6),-(a7)
[00010882] 4e41                      trap       #1
[00010884] 2a00                      move.l     d0,d5
[00010886] 2d45 000e                 move.l     d5,14(a6)
[0001088a] 4e5e                      unlk       a6
[0001088c] 4e75                      rts
[0001088e] 4e56 0000                 link       a6,#0
[00010892] 3f2e 0008                 move.w     8(a6),-(a7)
[00010896] 2f2e 000a                 move.l     10(a6),-(a7)
[0001089a] 3f2e 000e                 move.w     14(a6),-(a7)
[0001089e] 4e41                      trap       #1
[000108a0] 2a00                      move.l     d0,d5
[000108a2] 2d45 0010                 move.l     d5,16(a6)
[000108a6] 4e5e                      unlk       a6
[000108a8] 4e75                      rts
[000108aa] 4e56 0000                 link       a6,#0
[000108ae] 3f2e 0008                 move.w     8(a6),-(a7)
[000108b2] 3f2e 000a                 move.w     10(a6),-(a7)
[000108b6] 2f2e 000c                 move.l     12(a6),-(a7)
[000108ba] 3f2e 0010                 move.w     16(a6),-(a7)
[000108be] 4e41                      trap       #1
[000108c0] 2a00                      move.l     d0,d5
[000108c2] 2d45 0012                 move.l     d5,18(a6)
[000108c6] 4e5e                      unlk       a6
[000108c8] 4e75                      rts

GEMDOS.GetDrv:
[000108ca] 4e56 0000                 link       a6,#0
[000108ce] 598f                      subq.l     #4,a7
[000108d0] 3f3c 0019                 move.w     #$0019,-(a7)
[000108d4] 6100 ff54                 bsr        $0001082A
[000108d8] 548f                      addq.l     #2,a7
[000108da] 2a1f                      move.l     (a7)+,d5
[000108dc] 286e 0008                 movea.l    8(a6),a4
[000108e0] 3885                      move.w     d5,(a4)
[000108e2] 4e5e                      unlk       a6
[000108e4] 4e75                      rts

GEMDOS.Create:
[000108e6] 4e56 0000                 link       a6,#0
[000108ea] 598f                      subq.l     #4,a7
[000108ec] 3f3c 003c                 move.w     #$003C,-(a7)
[000108f0] 286e 000e                 movea.l    14(a6),a4
[000108f4] 2a0c                      move.l     a4,d5
[000108f6] 2f05                      move.l     d5,-(a7)
[000108f8] 3f2e 000c                 move.w     12(a6),-(a7)
[000108fc] 6100 ff90                 bsr.w      $0001088E
[00010900] 508f                      addq.l     #8,a7
[00010902] 2a1f                      move.l     (a7)+,d5
[00010904] 286e 0008                 movea.l    8(a6),a4
[00010908] 3885                      move.w     d5,(a4)
[0001090a] 4e5e                      unlk       a6
[0001090c] 4e75                      rts

GEMDOS.Open:
[0001090e] 4e56 0000                 link       a6,#0
[00010912] 598f                      subq.l     #4,a7
[00010914] 3f3c 003d                 move.w     #$003D,-(a7)
[00010918] 286e 000e                 movea.l    14(a6),a4
[0001091c] 2a0c                      move.l     a4,d5
[0001091e] 2f05                      move.l     d5,-(a7)
[00010920] 3f2e 000c                 move.w     12(a6),-(a7)
[00010924] 6100 ff68                 bsr        $0001088E
[00010928] 508f                      addq.l     #8,a7
[0001092a] 2a1f                      move.l     (a7)+,d5
[0001092c] 286e 0008                 movea.l    8(a6),a4
[00010930] 3885                      move.w     d5,(a4)
[00010932] 4e5e                      unlk       a6
[00010934] 4e75                      rts

GEMDOS.Close:
[00010936] 4e56 0000                 link       a6,#0
[0001093a] 598f                      subq.l     #4,a7
[0001093c] 3f3c 003e                 move.w     #$003E,-(a7)
[00010940] 3f2e 0008                 move.w     8(a6),-(a7)
[00010944] 6100 fef8                 bsr        $0001083E
[00010948] 588f                      addq.l     #4,a7
[0001094a] 4a9f                      tst.l      (a7)+
[0001094c] 57c5                      seq        d5
[0001094e] 4405                      neg.b      d5
[00010950] 1d45 000a                 move.b     d5,10(a6)
[00010954] 4e5e                      unlk       a6
[00010956] 4e75                      rts

GEMDOS.Read:
[00010958] 4e56 0000                 link       a6,#0
[0001095c] 598f                      subq.l     #4,a7
[0001095e] 3f3c 003f                 move.w     #$003F,-(a7)
[00010962] 3f2e 0010                 move.w     16(a6),-(a7)
[00010966] 286e 000c                 movea.l    12(a6),a4
[0001096a] 2f14                      move.l     (a4),-(a7)
[0001096c] 2f2e 0008                 move.l     8(a6),-(a7)
[00010970] 6100 fee4                 bsr        $00010856
[00010974] 4fef 000c                 lea.l      12(a7),a7
[00010978] 286e 000c                 movea.l    12(a6),a4
[0001097c] 289f                      move.l     (a7)+,(a4)
[0001097e] 4e5e                      unlk       a6
[00010980] 4e75                      rts

GEMDOS.Write:
[00010982] 4e56 0000                 link       a6,#0
[00010986] 598f                      subq.l     #4,a7
[00010988] 3f3c 0040                 move.w     #$0040,-(a7)
[0001098c] 3f2e 0010                 move.w     16(a6),-(a7)
[00010990] 286e 000c                 movea.l    12(a6),a4
[00010994] 2f14                      move.l     (a4),-(a7)
[00010996] 2f2e 0008                 move.l     8(a6),-(a7)
[0001099a] 6100 feba                 bsr        $00010856
[0001099e] 4fef 000c                 lea.l      12(a7),a7
[000109a2] 286e 000c                 movea.l    12(a6),a4
[000109a6] 289f                      move.l     (a7)+,(a4)
[000109a8] 4e5e                      unlk       a6
[000109aa] 4e75                      rts

GEMDOS.Seek:
[000109ac] 4e56 0000                 link       a6,#0
[000109b0] 598f                      subq.l     #4,a7
[000109b2] 3f3c 0042                 move.w     #$0042,-(a7)
[000109b6] 2f2e 0010                 move.l     16(a6),-(a7)
[000109ba] 3f2e 000e                 move.w     14(a6),-(a7)
[000109be] 7a00                      moveq.l    #0,d5
[000109c0] 1a2e 000c                 move.b     12(a6),d5
[000109c4] 3f05                      move.w     d5,-(a7)
[000109c6] 6100 fee2                 bsr        $000108AA
[000109ca] 4fef 000a                 lea.l      10(a7),a7
[000109ce] 286e 0008                 movea.l    8(a6),a4
[000109d2] 289f                      move.l     (a7)+,(a4)
[000109d4] 4e5e                      unlk       a6
[000109d6] 4e75                      rts

GEMDOS.GetPath:
[000109d8] 4e56 fffc                 link       a6,#-4
[000109dc] 598f                      subq.l     #4,a7
[000109de] 3f3c 0047                 move.w     #$0047,-(a7)
[000109e2] 286e 000a                 movea.l    10(a6),a4
[000109e6] 2a0c                      move.l     a4,d5
[000109e8] 2f05                      move.l     d5,-(a7)
[000109ea] 3f2e 0008                 move.w     8(a6),-(a7)
[000109ee] 6100 fe9e                 bsr        $0001088E
[000109f2] 508f                      addq.l     #8,a7
[000109f4] 2d5f fffc                 move.l     (a7)+,-4(a6)
[000109f8] 4e5e                      unlk       a6
[000109fa] 4e75                      rts

GEMDOS.Alloc:
[000109fc] 4e56 0000                 link       a6,#0
[00010a00] 598f                      subq.l     #4,a7
[00010a02] 3f3c 0048                 move.w     #$0048,-(a7)
[00010a06] 2f2e 000c                 move.l     12(a6),-(a7)
[00010a0a] 6100 fe6a                 bsr        $00010876
[00010a0e] 5c8f                      addq.l     #6,a7
[00010a10] 286e 0008                 movea.l    8(a6),a4
[00010a14] 289f                      move.l     (a7)+,(a4)
[00010a16] 4e5e                      unlk       a6
[00010a18] 4e75                      rts

GEMDOS.Free:
[00010a1a] 4e56 0000                 link       a6,#0
[00010a1e] 598f                      subq.l     #4,a7
[00010a20] 3f3c 0049                 move.w     #$0049,-(a7)
[00010a24] 2f2e 0008                 move.l     8(a6),-(a7)
[00010a28] 6100 fe4c                 bsr        $00010876
[00010a2c] 5c8f                      addq.l     #6,a7
[00010a2e] 4a9f                      tst.l      (a7)+
[00010a30] 57c5                      seq        d5
[00010a32] 4405                      neg.b      d5
[00010a34] 1d45 000c                 move.b     d5,12(a6)
[00010a38] 4e5e                      unlk       a6
[00010a3a] 4e75                      rts

***
* MODULE GEMAESbase
***

GEMAESbase.GemCall:
[00010a3c] 4e56 0000                 link       a6,#0
[00010a40] 49f9 0001 7eb6            lea.l      AESControl,a4
[00010a46] 38ae 0010                 move.w     16(a6),(a4)
[00010a4a] 396e 000e 0002            move.w     14(a6),2(a4)
[00010a50] 396e 000c 0004            move.w     12(a6),4(a4)
[00010a56] 396e 000a 0006            move.w     10(a6),6(a4)
[00010a5c] 396e 0008 0008            move.w     8(a6),8(a4)
[00010a62] 203c 0000 00c8            move.l     #$000000C8,d0
[00010a68] 49f9 0001 7e80            lea.l      AESParameters,a4
[00010a6e] 2a0c                      move.l     a4,d5
[00010a70] 2205                      move.l     d5,d1
[00010a72] 4e42                      trap       #2
[00010a74] 33f9 0001 7ee2 0001 7f06  move.w     AESIntOut,AESCallResult
[00010a7e] 3d79 0001 7f06 0012       move.w     AESCallResult,18(a6)
[00010a86] 4e5e                      unlk       a6
[00010a88] 4e75                      rts

GEMAESbase.IntIn2:
[00010a8a] 4e56 0000                 link       a6,#0
[00010a8e] 33ee 000a 0001 7ec0       move.w     10(a6),AESIntIn
[00010a96] 33ee 0008 0001 7ec2       move.w     8(a6),$00017EC2
[00010a9e] 4e5e                      unlk       a6
[00010aa0] 4e75                      rts

GEMAESbase.IntIn4:
[00010aa2] 4e56 0000                 link       a6,#0
[00010aa6] 33ee 000e 0001 7ec0       move.w     14(a6),AESIntIn
[00010aae] 33ee 000c 0001 7ec2       move.w     12(a6),$00017EC2
[00010ab6] 33ee 000a 0001 7ec4       move.w     10(a6),$00017EC4
[00010abe] 33ee 0008 0001 7ec6       move.w     8(a6),$00017EC6
[00010ac6] 4e5e                      unlk       a6
[00010ac8] 4e75                      rts

GEMAESbase.IntIn8:
[00010aca] 4e56 0000                 link       a6,#0
[00010ace] 33ee 0016 0001 7ec0       move.w     22(a6),AESIntIn
[00010ad6] 33ee 0014 0001 7ec2       move.w     20(a6),$00017EC2
[00010ade] 33ee 0012 0001 7ec4       move.w     18(a6),$00017EC4
[00010ae6] 33ee 0010 0001 7ec6       move.w     16(a6),$00017EC6
[00010aee] 33ee 000e 0001 7ec8       move.w     14(a6),$00017EC8
[00010af6] 33ee 000c 0001 7eca       move.w     12(a6),$00017ECA
[00010afe] 33ee 000a 0001 7ecc       move.w     10(a6),$00017ECC
[00010b06] 33ee 0008 0001 7ece       move.w     8(a6),$00017ECE
[00010b0e] 4e5e                      unlk       a6
[00010b10] 4e75                      rts

GEMAESbase.IntOut4:
[00010b12] 4e56 0000                 link       a6,#0
[00010b16] 286e 0014                 movea.l    20(a6),a4
[00010b1a] 38b9 0001 7ee4            move.w     AESIntOut+2,(a4)
[00010b20] 286e 0010                 movea.l    16(a6),a4
[00010b24] 38b9 0001 7ee6            move.w     $00017EE6,(a4)
[00010b2a] 286e 000c                 movea.l    12(a6),a4
[00010b2e] 38b9 0001 7ee8            move.w     $00017EE8,(a4)
[00010b34] 286e 0008                 movea.l    8(a6),a4
[00010b38] 38b9 0001 7eea            move.w     $00017EEA,(a4)
[00010b3e] 4e5e                      unlk       a6
[00010b40] 4e75                      rts


GEMAESbase.init:
[00010b42] 4ef9 0001 0622            jmp        entry

[00010b48] 4e56 0000                 link       a6,#0
[00010b4c] 49f9 0001 7e98            lea.l      AESGlobal,a4
[00010b52] 42ac 000a                 clr.l      10(a4)
[00010b56] 42ac 000e                 clr.l      14(a4)
[00010b5a] 42ac 0012                 clr.l      18(a4)
[00010b5e] 42ac 0016                 clr.l      22(a4)
[00010b62] 42ac 001a                 clr.l      26(a4)
[00010b66] 49f9 0001 7e80            lea.l      AESParameters,a4
[00010b6c] 47f9 0001 7eb6            lea.l      AESControl,a3
[00010b72] 2a0b                      move.l     a3,d5
[00010b74] 2885                      move.l     d5,(a4)
[00010b76] 47f9 0001 7e98            lea.l      AESGlobal,a3
[00010b7c] 2a0b                      move.l     a3,d5
[00010b7e] 2945 0004                 move.l     d5,4(a4)
[00010b82] 47f9 0001 7ec0            lea.l      AESIntIn,a3
[00010b88] 2a0b                      move.l     a3,d5
[00010b8a] 2945 0008                 move.l     d5,8(a4)
[00010b8e] 47f9 0001 7ee2            lea.l      AESIntOut,a3
[00010b94] 2a0b                      move.l     a3,d5
[00010b96] 2945 000c                 move.l     d5,12(a4)
[00010b9a] 47f9 0001 7ef2            lea.l      AESAddrIn,a3
[00010ba0] 2a0b                      move.l     a3,d5
[00010ba2] 2945 0010                 move.l     d5,16(a4)
[00010ba6] 47f9 0001 7efe            lea.l      AESAddrOut,a3
[00010bac] 2a0b                      move.l     a3,d5
[00010bae] 2945 0014                 move.l     d5,20(a4)
[00010bb2] 4e5e                      unlk       a6
[00010bb4] 4ef9 0001 0f0a            jmp        GEMVDIbase.init+6

***
* MODULE AESGraphics
***

AESGraphics.GrafGrowBox:
[00010bba] 4e56 0000                 link       a6,#0
[00010bbe] 3f2e 0016                 move.w     22(a6),-(a7)
[00010bc2] 3f2e 0014                 move.w     20(a6),-(a7)
[00010bc6] 3f2e 0012                 move.w     18(a6),-(a7)
[00010bca] 3f2e 0010                 move.w     16(a6),-(a7)
[00010bce] 3f2e 000e                 move.w     14(a6),-(a7)
[00010bd2] 3f2e 000c                 move.w     12(a6),-(a7)
[00010bd6] 3f2e 000a                 move.w     10(a6),-(a7)
[00010bda] 3f2e 0008                 move.w     8(a6),-(a7)
[00010bde] 4eb9 0001 0aca            jsr        $00010ACA
[00010be4] 4fef 0010                 lea.l      16(a7),a7
[00010be8] 558f                      subq.l     #2,a7
[00010bea] 3f3c 0049                 move.w     #$0049,-(a7)
[00010bee] 3f3c 0008                 move.w     #$0008,-(a7)
[00010bf2] 3f3c 0001                 move.w     #$0001,-(a7)
[00010bf6] 4267                      clr.w      -(a7)
[00010bf8] 4267                      clr.w      -(a7)
[00010bfa] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00010c00] 4fef 000a                 lea.l      10(a7),a7
[00010c04] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00010c0a] 4e5e                      unlk       a6
[00010c0c] 4e75                      rts

AESGraphics.GrafShrinkBox:
[00010c0e] 4e56 0000                 link       a6,#0
[00010c12] 3f2e 0016                 move.w     22(a6),-(a7)
[00010c16] 3f2e 0014                 move.w     20(a6),-(a7)
[00010c1a] 3f2e 0012                 move.w     18(a6),-(a7)
[00010c1e] 3f2e 0010                 move.w     16(a6),-(a7)
[00010c22] 3f2e 000e                 move.w     14(a6),-(a7)
[00010c26] 3f2e 000c                 move.w     12(a6),-(a7)
[00010c2a] 3f2e 000a                 move.w     10(a6),-(a7)
[00010c2e] 3f2e 0008                 move.w     8(a6),-(a7)
[00010c32] 4eb9 0001 0aca            jsr        $00010ACA
[00010c38] 4fef 0010                 lea.l      16(a7),a7
[00010c3c] 558f                      subq.l     #2,a7
[00010c3e] 3f3c 004a                 move.w     #$004A,-(a7)
[00010c42] 3f3c 0008                 move.w     #$0008,-(a7)
[00010c46] 3f3c 0001                 move.w     #$0001,-(a7)
[00010c4a] 4267                      clr.w      -(a7)
[00010c4c] 4267                      clr.w      -(a7)
[00010c4e] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00010c54] 4fef 000a                 lea.l      10(a7),a7
[00010c58] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00010c5e] 4e5e                      unlk       a6
[00010c60] 4e75                      rts

AESGraphics.GrafHandle:
[00010c62] 4e56 fffe                 link       a6,#-2
[00010c66] 558f                      subq.l     #2,a7
[00010c68] 3f3c 004d                 move.w     #$004D,-(a7)
[00010c6c] 4267                      clr.w      -(a7)
[00010c6e] 3f3c 0005                 move.w     #$0005,-(a7)
[00010c72] 4267                      clr.w      -(a7)
[00010c74] 4267                      clr.w      -(a7)
[00010c76] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00010c7c] 4fef 000a                 lea.l      10(a7),a7
[00010c80] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00010c84] 286e 0014                 movea.l    20(a6),a4
[00010c88] 4854                      pea.l      (a4)
[00010c8a] 286e 0010                 movea.l    16(a6),a4
[00010c8e] 4854                      pea.l      (a4)
[00010c90] 286e 000c                 movea.l    12(a6),a4
[00010c94] 4854                      pea.l      (a4)
[00010c96] 286e 0008                 movea.l    8(a6),a4
[00010c9a] 4854                      pea.l      (a4)
[00010c9c] 4eb9 0001 0b12            jsr        $00010B12
[00010ca2] 4fef 0010                 lea.l      16(a7),a7
[00010ca6] 3d6e fffe 0018            move.w     -2(a6),24(a6)
[00010cac] 4e5e                      unlk       a6
[00010cae] 4e75                      rts

AESGraphics.GrafMouse:
[00010cb0] 4e56 0000                 link       a6,#0
[00010cb4] 33ee 000c 0001 7ec0       move.w     12(a6),AESIntIn
[00010cbc] 23ee 0008 0001 7ef2       move.l     8(a6),AESAddrIn
[00010cc4] 558f                      subq.l     #2,a7
[00010cc6] 3f3c 004e                 move.w     #$004E,-(a7)
[00010cca] 3f3c 0001                 move.w     #$0001,-(a7)
[00010cce] 3f3c 0001                 move.w     #$0001,-(a7)
[00010cd2] 3f3c 0001                 move.w     #$0001,-(a7)
[00010cd6] 4267                      clr.w      -(a7)
[00010cd8] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00010cde] 4fef 000a                 lea.l      10(a7),a7
[00010ce2] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00010ce8] 4e5e                      unlk       a6
[00010cea] 4e75                      rts

***
* MODULE AESWindows
***

AESWindows.WindowCreate:
[00010cec] 4e56 0000                 link       a6,#0
[00010cf0] 3f2e 0010                 move.w     16(a6),-(a7)
[00010cf4] 3f2e 000e                 move.w     14(a6),-(a7)
[00010cf8] 3f2e 000c                 move.w     12(a6),-(a7)
[00010cfc] 3f2e 000a                 move.w     10(a6),-(a7)
[00010d00] 4eb9 0001 0aa2            jsr        $00010AA2
[00010d06] 508f                      addq.l     #8,a7
[00010d08] 33ee 0008 0001 7ec8       move.w     8(a6),$00017EC8
[00010d10] 558f                      subq.l     #2,a7
[00010d12] 3f3c 0064                 move.w     #$0064,-(a7)
[00010d16] 3f3c 0005                 move.w     #$0005,-(a7)
[00010d1a] 3f3c 0001                 move.w     #$0001,-(a7)
[00010d1e] 4267                      clr.w      -(a7)
[00010d20] 4267                      clr.w      -(a7)
[00010d22] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00010d28] 4fef 000a                 lea.l      10(a7),a7
[00010d2c] 3d5f 0012                 move.w     (a7)+,18(a6)
[00010d30] 4e5e                      unlk       a6
[00010d32] 4e75                      rts

AESWindows.WindowOpen:
[00010d34] 4e56 0000                 link       a6,#0
[00010d38] 3f2e 0010                 move.w     16(a6),-(a7)
[00010d3c] 3f2e 000e                 move.w     14(a6),-(a7)
[00010d40] 3f2e 000c                 move.w     12(a6),-(a7)
[00010d44] 3f2e 000a                 move.w     10(a6),-(a7)
[00010d48] 4eb9 0001 0aa2            jsr        $00010AA2
[00010d4e] 508f                      addq.l     #8,a7
[00010d50] 33ee 0008 0001 7ec8       move.w     8(a6),$00017EC8
[00010d58] 558f                      subq.l     #2,a7
[00010d5a] 3f3c 0065                 move.w     #$0065,-(a7)
[00010d5e] 3f3c 0005                 move.w     #$0005,-(a7)
[00010d62] 3f3c 0001                 move.w     #$0001,-(a7)
[00010d66] 4267                      clr.w      -(a7)
[00010d68] 4267                      clr.w      -(a7)
[00010d6a] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00010d70] 4fef 000a                 lea.l      10(a7),a7
[00010d74] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00010d7a] 4e5e                      unlk       a6
[00010d7c] 4e75                      rts

AESWindows.WindowClose:
[00010d7e] 4e56 0000                 link       a6,#0
[00010d82] 33ee 0008 0001 7ec0       move.w     8(a6),AESIntIn
[00010d8a] 558f                      subq.l     #2,a7
[00010d8c] 3f3c 0066                 move.w     #$0066,-(a7)
[00010d90] 3f3c 0001                 move.w     #$0001,-(a7)
[00010d94] 3f3c 0001                 move.w     #$0001,-(a7)
[00010d98] 4267                      clr.w      -(a7)
[00010d9a] 4267                      clr.w      -(a7)
[00010d9c] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00010da2] 4fef 000a                 lea.l      10(a7),a7
[00010da6] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00010dac] 4e5e                      unlk       a6
[00010dae] 4e75                      rts

AESWindows.WindowDelete:
[00010db0] 4e56 0000                 link       a6,#0
[00010db4] 33ee 0008 0001 7ec0       move.w     8(a6),AESIntIn
[00010dbc] 558f                      subq.l     #2,a7
[00010dbe] 3f3c 0067                 move.w     #$0067,-(a7)
[00010dc2] 3f3c 0001                 move.w     #$0001,-(a7)
[00010dc6] 3f3c 0001                 move.w     #$0001,-(a7)
[00010dca] 4267                      clr.w      -(a7)
[00010dcc] 4267                      clr.w      -(a7)
[00010dce] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00010dd4] 4fef 000a                 lea.l      10(a7),a7
[00010dd8] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00010dde] 4e5e                      unlk       a6
[00010de0] 4e75                      rts

AESWindows.WindowGet:
[00010de2] 4e56 0000                 link       a6,#0
[00010de6] 3f2e 001a                 move.w     26(a6),-(a7)
[00010dea] 3f2e 0018                 move.w     24(a6),-(a7)
[00010dee] 4eb9 0001 0a8a            jsr        $00010A8A
[00010df4] 588f                      addq.l     #4,a7
[00010df6] 558f                      subq.l     #2,a7
[00010df8] 3f3c 0068                 move.w     #$0068,-(a7)
[00010dfc] 3f3c 0002                 move.w     #$0002,-(a7)
[00010e00] 3f3c 0005                 move.w     #$0005,-(a7)
[00010e04] 4267                      clr.w      -(a7)
[00010e06] 4267                      clr.w      -(a7)
[00010e08] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00010e0e] 4fef 000a                 lea.l      10(a7),a7
[00010e12] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00010e18] 286e 0014                 movea.l    20(a6),a4
[00010e1c] 4854                      pea.l      (a4)
[00010e1e] 286e 0010                 movea.l    16(a6),a4
[00010e22] 4854                      pea.l      (a4)
[00010e24] 286e 000c                 movea.l    12(a6),a4
[00010e28] 4854                      pea.l      (a4)
[00010e2a] 286e 0008                 movea.l    8(a6),a4
[00010e2e] 4854                      pea.l      (a4)
[00010e30] 4eb9 0001 0b12            jsr        $00010B12
[00010e36] 4fef 0010                 lea.l      16(a7),a7
[00010e3a] 4e5e                      unlk       a6
[00010e3c] 4e75                      rts

AESWindows.WindowSet:
[00010e3e] 4e56 0000                 link       a6,#0
[00010e42] 3f2e 0012                 move.w     18(a6),-(a7)
[00010e46] 3f2e 0010                 move.w     16(a6),-(a7)
[00010e4a] 3f2e 000e                 move.w     14(a6),-(a7)
[00010e4e] 3f2e 000c                 move.w     12(a6),-(a7)
[00010e52] 4eb9 0001 0aa2            jsr        $00010AA2
[00010e58] 508f                      addq.l     #8,a7
[00010e5a] 33ee 000a 0001 7ec8       move.w     10(a6),$00017EC8
[00010e62] 33ee 0008 0001 7eca       move.w     8(a6),$00017ECA
[00010e6a] 558f                      subq.l     #2,a7
[00010e6c] 3f3c 0069                 move.w     #$0069,-(a7)
[00010e70] 3f3c 0006                 move.w     #$0006,-(a7)
[00010e74] 3f3c 0001                 move.w     #$0001,-(a7)
[00010e78] 4267                      clr.w      -(a7)
[00010e7a] 4267                      clr.w      -(a7)
[00010e7c] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00010e82] 4fef 000a                 lea.l      10(a7),a7
[00010e86] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00010e8c] 4e5e                      unlk       a6
[00010e8e] 4e75                      rts

AESWindows.WindowUpdate:
[00010e90] 4e56 0000                 link       a6,#0
[00010e94] 33ee 0008 0001 7ec0       move.w     8(a6),AESIntIn
[00010e9c] 558f                      subq.l     #2,a7
[00010e9e] 3f3c 006b                 move.w     #$006B,-(a7)
[00010ea2] 3f3c 0001                 move.w     #$0001,-(a7)
[00010ea6] 3f3c 0001                 move.w     #$0001,-(a7)
[00010eaa] 4267                      clr.w      -(a7)
[00010eac] 4267                      clr.w      -(a7)
[00010eae] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00010eb4] 4fef 000a                 lea.l      10(a7),a7
[00010eb8] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00010ebe] 4e5e                      unlk       a6
[00010ec0] 4e75                      rts

***
* MODULE GEMVDIbase
***

GEMVDIbase.CallVDI:
[00010ec2] 4e56 0000                 link       a6,#0
[00010ec6] 7073                      moveq.l    #115,d0
[00010ec8] 2239 0001 8334            move.l     GEMVDIbase.ADRparams,d1
[00010ece] 4e42                      trap       #2
[00010ed0] 4e5e                      unlk       a6
[00010ed2] 4e75                      rts

GEMVDIbase.SetContrl:
[00010ed4] 4e56 0000                 link       a6,#0
[00010ed8] 33ee 0010 0001 7f08       move.w     16(a6),GEMVDIbase.contrl
[00010ee0] 33ee 000e 0001 7f0a       move.w     14(a6),$00017F0A
[00010ee8] 33ee 000c 0001 7f0e       move.w     12(a6),$00017F0E
[00010ef0] 33ee 000a 0001 7f12       move.w     10(a6),$00017F12
[00010ef8] 33ee 0008 0001 7f14       move.w     8(a6),$00017F14
[00010f00] 4e5e                      unlk       a6
[00010f02] 4e75                      rts

GEMVDIbase.init:
[00010f04] 4ef9 0001 0b42            jmp        GEMAESbase.init
[00010f0a] 4e56 0000                 link       a6,#0
[00010f0e] 49f9 0001 7f20            lea.l      $00017F20,a4
[00010f14] 2a0c                      move.l     a4,d5
[00010f16] 23c5 0001 8324            move.l     d5,$00018324
[00010f1c] 49f9 0001 8020            lea.l      $00018020,a4
[00010f22] 2a0c                      move.l     a4,d5
[00010f24] 23c5 0001 8328            move.l     d5,$00018328
[00010f2a] 49f9 0001 8120            lea.l      $00018120,a4
[00010f30] 2a0c                      move.l     a4,d5
[00010f32] 23c5 0001 832c            move.l     d5,$0001832C
[00010f38] 49f9 0001 8220            lea.l      $00018220,a4
[00010f3e] 2a0c                      move.l     a4,d5
[00010f40] 23c5 0001 8330            move.l     d5,GEMVDIbase.ADRptsout
[00010f46] 49f9 0001 7f08            lea.l      GEMVDIbase.contrl,a4
[00010f4c] 2a0c                      move.l     a4,d5
[00010f4e] 23c5 0001 8338            move.l     d5,GEMVDIbase.parameterBlock
[00010f54] 23f9 0001 8324 0001 833c  move.l     $00018324,$0001833C
[00010f5e] 23f9 0001 8328 0001 8340  move.l     $00018328,$00018340
[00010f68] 23f9 0001 832c 0001 8344  move.l     $0001832C,$00018344
[00010f72] 23f9 0001 8330 0001 8348  move.l     GEMVDIbase.ADRptsout,$00018348
[00010f7c] 49f9 0001 8338            lea.l      GEMVDIbase.parameterBlock,a4
[00010f82] 2a0c                      move.l     a4,d5
[00010f84] 23c5 0001 8334            move.l     d5,$00018334
[00010f8a] 4e5e                      unlk       a6
[00010f8c] 4ef9 0001 12a4            jmp        AppBase.init+6

***
* MODULE VDIAttribs
***

VDIAttribs.SetGraphicTextAlignment:
[00010f92] 4e56 0000                 link       a6,#0
[00010f96] 33ee 0012 0001 7f20       move.w     18(a6),$00017F20
[00010f9e] 33ee 0010 0001 7f22       move.w     16(a6),$00017F22
[00010fa6] 3f3c 0027                 move.w     #$0027,-(a7)
[00010faa] 4267                      clr.w      -(a7)
[00010fac] 3f3c 0002                 move.w     #$0002,-(a7)
[00010fb0] 4267                      clr.w      -(a7)
[00010fb2] 3f2e 0014                 move.w     20(a6),-(a7)
[00010fb6] 4eb9 0001 0ed4            jsr        GEMVDIbase.SetContrl
[00010fbc] 4fef 000a                 lea.l      10(a7),a7
[00010fc0] 4eb9 0001 0ec2            jsr        GEMVDIbase.CallVDI
[00010fc6] 286e 000c                 movea.l    12(a6),a4
[00010fca] 38b9 0001 8120            move.w     GEMVDIbase.intout,(a4)
[00010fd0] 286e 0008                 movea.l    8(a6),a4
[00010fd4] 38b9 0001 8122            move.w     $00018122,(a4)
[00010fda] 4e5e                      unlk       a6
[00010fdc] 4e75                      rts

VDIAttribs.SetFillInteriorStyle:
[00010fde] 4e56 0000                 link       a6,#0
[00010fe2] 33ee 0008 0001 7f20       move.w     8(a6),$00017F20
[00010fea] 3f3c 0017                 move.w     #$0017,-(a7)
[00010fee] 4267                      clr.w      -(a7)
[00010ff0] 3f3c 0001                 move.w     #$0001,-(a7)
[00010ff4] 4267                      clr.w      -(a7)
[00010ff6] 3f2e 000a                 move.w     10(a6),-(a7)
[00010ffa] 4eb9 0001 0ed4            jsr        GEMVDIbase.SetContrl
[00011000] 4fef 000a                 lea.l      10(a7),a7
[00011004] 4eb9 0001 0ec2            jsr        GEMVDIbase.CallVDI
[0001100a] 3d79 0001 8120 000c       move.w     GEMVDIbase.intout,12(a6)
[00011012] 4e5e                      unlk       a6
[00011014] 4e75                      rts

VDIAttribs.SetFillColour:
[00011016] 4e56 0000                 link       a6,#0
[0001101a] 33ee 0008 0001 7f20       move.w     8(a6),$00017F20
[00011022] 3f3c 0019                 move.w     #$0019,-(a7)
[00011026] 4267                      clr.w      -(a7)
[00011028] 3f3c 0001                 move.w     #$0001,-(a7)
[0001102c] 4267                      clr.w      -(a7)
[0001102e] 3f2e 000a                 move.w     10(a6),-(a7)
[00011032] 4eb9 0001 0ed4            jsr        GEMVDIbase.SetContrl
[00011038] 4fef 000a                 lea.l      10(a7),a7
[0001103c] 4eb9 0001 0ec2            jsr        GEMVDIbase.CallVDI
[00011042] 3d79 0001 8120 000c       move.w     GEMVDIbase.intout,12(a6)
[0001104a] 4e5e                      unlk       a6
[0001104c] 4e75                      rts

***
* MODULE VDIOutputs
***

VDIOutputs.GraphicText:
[0001104e] 4e56 0000                 link       a6,#0
[00011052] 4279 0001 8350            clr.w      $00018350
[00011058] 33ee 000c 0001 8352       move.w     12(a6),$00018352
[00011060] 3a39 0001 8350            move.w     $00018350,d5
[00011066] ba79 0001 8352            cmp.w      $00018352,d5
[0001106c] 6e10                      bgt.s      $0001107E
[0001106e] 3a39 0001 8350            move.w     $00018350,d5
[00011074] 286e 0008                 movea.l    8(a6),a4
[00011078] 4a34 5000                 tst.b      0(a4,d5.w)
[0001107c] 6604                      bne.s      $00011082
[0001107e] 4efa 002c                 jmp        $000110AC(pc)
[00011082] 3a39 0001 8350            move.w     $00018350,d5
[00011088] 286e 0008                 movea.l    8(a6),a4
[0001108c] 7800                      moveq.l    #0,d4
[0001108e] 1834 5000                 move.b     0(a4,d5.w),d4
[00011092] 3a39 0001 8350            move.w     $00018350,d5
[00011098] da45                      add.w      d5,d5
[0001109a] 49f9 0001 7f20            lea.l      $00017F20,a4
[000110a0] 3984 5000                 move.w     d4,0(a4,d5.w)
[000110a4] 5279 0001 8350            addq.w     #1,$00018350
[000110aa] 60b4                      bra.s      $00011060
[000110ac] 3f3c 0008                 move.w     #$0008,-(a7)
[000110b0] 3f3c 0001                 move.w     #$0001,-(a7)
[000110b4] 3f39 0001 8350            move.w     $00018350,-(a7)
[000110ba] 4267                      clr.w      -(a7)
[000110bc] 3f2e 0012                 move.w     18(a6),-(a7)
[000110c0] 4eb9 0001 0ed4            jsr        GEMVDIbase.SetContrl
[000110c6] 4fef 000a                 lea.l      10(a7),a7
[000110ca] 33ee 0010 0001 8020       move.w     16(a6),$00018020
[000110d2] 33ee 000e 0001 8022       move.w     14(a6),$00018022
[000110da] 4eb9 0001 0ec2            jsr        GEMVDIbase.CallVDI
[000110e0] 4e5e                      unlk       a6
[000110e2] 4e75                      rts

VDIOutputs.FillRectangle:
[000110e4] 4e56 0000                 link       a6,#0
[000110e8] 3f3c 0072                 move.w     #$0072,-(a7)
[000110ec] 3f3c 0002                 move.w     #$0002,-(a7)
[000110f0] 4267                      clr.w      -(a7)
[000110f2] 4267                      clr.w      -(a7)
[000110f4] 3f2e 000c                 move.w     12(a6),-(a7)
[000110f8] 4eb9 0001 0ed4            jsr        GEMVDIbase.SetContrl
[000110fe] 4fef 000a                 lea.l      10(a7),a7
[00011102] 286e 0008                 movea.l    8(a6),a4
[00011106] 2a0c                      move.l     a4,d5
[00011108] 23c5 0001 8340            move.l     d5,$00018340
[0001110e] 4eb9 0001 0ec2            jsr        GEMVDIbase.CallVDI
[00011114] 23f9 0001 8328 0001 8340  move.l     $00018328,$00018340
[0001111e] 4e5e                      unlk       a6
[00011120] 4e75                      rts


***
* MODULE VDIControls
***

VDIControls.OpenVirtualWorkstation:
[00011122] 4e56 0000                 link       a6,#0
[00011126] 3f3c 0064                 move.w     #$0064,-(a7)
[0001112a] 4267                      clr.w      -(a7)
[0001112c] 3f3c 000b                 move.w     #$000B,-(a7)
[00011130] 4267                      clr.w      -(a7)
[00011132] 286e 000c                 movea.l    12(a6),a4
[00011136] 3f14                      move.w     (a4),-(a7)
[00011138] 4eb9 0001 0ed4            jsr        GEMVDIbase.SetContrl
[0001113e] 4fef 000a                 lea.l      10(a7),a7
[00011142] 4279 0001 8354            clr.w      $00018354
[00011148] 3a39 0001 8354            move.w     $00018354,d5
[0001114e] 286e 0010                 movea.l    16(a6),a4
[00011152] da45                      add.w      d5,d5
[00011154] 3839 0001 8354            move.w     $00018354,d4
[0001115a] d844                      add.w      d4,d4
[0001115c] 47f9 0001 7f20            lea.l      $00017F20,a3
[00011162] 37b4 5000 4000            move.w     0(a4,d5.w),0(a3,d4.w)
[00011168] 5279 0001 8354            addq.w     #1,$00018354
[0001116e] 0c79 000b 0001 8354       cmpi.w     #$000B,$00018354
[00011176] 66d0                      bne.s      $00011148
[00011178] 4eb9 0001 0ec2            jsr        GEMVDIbase.CallVDI
[0001117e] 4279 0001 8354            clr.w      $00018354
[00011184] 3a39 0001 8354            move.w     $00018354,d5
[0001118a] da45                      add.w      d5,d5
[0001118c] 49f9 0001 8120            lea.l      GEMVDIbase.intout,a4
[00011192] 3839 0001 8354            move.w     $00018354,d4
[00011198] 266e 0008                 movea.l    8(a6),a3
[0001119c] d844                      add.w      d4,d4
[0001119e] 37b4 5000 4000            move.w     0(a4,d5.w),0(a3,d4.w)
[000111a4] 5279 0001 8354            addq.w     #1,$00018354
[000111aa] 0c79 002d 0001 8354       cmpi.w     #$002D,$00018354
[000111b2] 66d0                      bne.s      $00011184
[000111b4] 33fc 002d 0001 8354       move.w     #$002D,$00018354
[000111bc] 3a39 0001 8354            move.w     $00018354,d5
[000111c2] 0445 002d                 subi.w     #$002D,d5
[000111c6] da45                      add.w      d5,d5
[000111c8] 49f9 0001 8220            lea.l      $00018220,a4
[000111ce] 3839 0001 8354            move.w     $00018354,d4
[000111d4] 266e 0008                 movea.l    8(a6),a3
[000111d8] d844                      add.w      d4,d4
[000111da] 37b4 5000 4000            move.w     0(a4,d5.w),0(a3,d4.w)
[000111e0] 5279 0001 8354            addq.w     #1,$00018354
[000111e6] 0c79 0039 0001 8354       cmpi.w     #$0039,$00018354
[000111ee] 66cc                      bne.s      $000111BC
[000111f0] 286e 000c                 movea.l    12(a6),a4
[000111f4] 38b9 0001 7f14            move.w     $00017F14,(a4)
[000111fa] 4e5e                      unlk       a6
[000111fc] 4e75                      rts

VDIControls.CloseVirtualWorkstation:
[000111fe] 4e56 0000                 link       a6,#0
[00011202] 3f3c 0065                 move.w     #$0065,-(a7)
[00011206] 4267                      clr.w      -(a7)
[00011208] 4267                      clr.w      -(a7)
[0001120a] 4267                      clr.w      -(a7)
[0001120c] 3f2e 0008                 move.w     8(a6),-(a7)
[00011210] 4eb9 0001 0ed4            jsr        GEMVDIbase.SetContrl
[00011216] 4fef 000a                 lea.l      10(a7),a7
[0001121a] 4eb9 0001 0ec2            jsr        GEMVDIbase.CallVDI
[00011220] 4e5e                      unlk       a6
[00011222] 4e75                      rts

***
* MODULE VDIRasters
***

VDIRasters.CopyRasterOpaque:
[00011224] 4e56 0000                 link       a6,#0
[00011228] 33ee 0014 0001 7f20       move.w     20(a6),$00017F20
[00011230] 286e 0010                 movea.l    16(a6),a4
[00011234] 2a0c                      move.l     a4,d5
[00011236] 23c5 0001 8340            move.l     d5,$00018340
[0001123c] 3f3c 006d                 move.w     #$006D,-(a7)
[00011240] 3f3c 0004                 move.w     #$0004,-(a7)
[00011244] 3f3c 0001                 move.w     #$0001,-(a7)
[00011248] 4267                      clr.w      -(a7)
[0001124a] 3f2e 0016                 move.w     22(a6),-(a7)
[0001124e] 4eb9 0001 0ed4            jsr        GEMVDIbase.SetContrl
[00011254] 4fef 000a                 lea.l      10(a7),a7
[00011258] 49f9 0001 835c            lea.l      $0001835C,a4
[0001125e] 28ae 000c                 move.l     12(a6),(a4)
[00011262] 33d4 0001 7f16            move.w     (a4),$00017F16
[00011268] 33ec 0002 0001 7f18       move.w     2(a4),$00017F18
[00011270] 28ae 0008                 move.l     8(a6),(a4)
[00011274] 33d4 0001 7f1a            move.w     (a4),$00017F1A
[0001127a] 33ec 0002 0001 7f1c       move.w     2(a4),$00017F1C
[00011282] 4eb9 0001 0ec2            jsr        GEMVDIbase.CallVDI
[00011288] 23f9 0001 8328 0001 8340  move.l     $00018328,$00018340
[00011292] 4e5e                      unlk       a6
[00011294] 4e75                      rts

***
* MODULE AppBase
***

[00011296] 4e56 0000                 link       a6,#0
[0001129a] 4e5e                      unlk       a6
[0001129c] 4e75                      rts

AppBase.init
[0001129e] 4ef9 0001 0f04            jmp        GEMVDIbase.init
[000112a4] 4e56 0000                 link       a6,#0
[000112a8] 23fc 0001 1296 0001 8366  move.l     #$00011296,AppBase.doUpdateWindow
[000112b2] 33fc ffff 0001 8360       move.w     #$FFFF,AppBase.apId
[000112ba] 33fc ffff 0001 8364       move.w     #$FFFF,AppBase.vdiHandle
[000112c2] 33fc ffff 0001 8362       move.w     #$FFFF,AppBase.wdwHandle
[000112ca] 42b9 0001 836a            clr.l      AppBase.openFiles
[000112d0] 42b9 0001 836e            clr.l      AppBase.openStreams
[000112d6] 4239 0001 8372            clr.b      AppBase.shellTail
[000112dc] 4e5e                      unlk       a6
[000112de] 4ef9 0001 19e8            jmp        AppWindow.init+6

***
* MODULE AppWindow
***

PROCEDURE mouseOn(on: BOOLEAN);
[000112e4] 4e56 0000                 link       a6,#0
[000112e8] 4a2e 0008                 tst.b      8(a6)
[000112ec] 6714                      beq.s      $00011302
[000112ee] 3f3c 0101                 move.w     #$0101,-(a7)
[000112f2] 7aff                      moveq.l    #-1,d5
[000112f4] 2f05                      move.l     d5,-(a7)
[000112f6] 4eb9 0001 0cb0            jsr        AESGraphics.GrafMouse
[000112fc] 5c8f                      addq.l     #6,a7
[000112fe] 4efa 0012                 jmp        $00011312(pc)
[00011302] 3f3c 0100                 move.w     #$0100,-(a7)
[00011306] 7aff                      moveq.l    #-1,d5
[00011308] 2f05                      move.l     d5,-(a7)
[0001130a] 4eb9 0001 0cb0            jsr        AESGraphics.GrafMouse
[00011310] 5c8f                      addq.l     #6,a7
[00011312] 4e5e                      unlk       a6
[00011314] 4e75                      rts

AppWindow.WriteString:
[00011316] 4e56 fffc                 link       a6,#-4
[0001131a] 4227                      clr.b      -(a7)
[0001131c] 4eb9 0001 12e4            jsr        mouseOn
[00011322] 548f                      addq.l     #2,a7
[00011324] 3f39 0001 8364            move.w     AppBase.vdiHandle,-(a7)
[0001132a] 3a39 0001 83d4            move.w     AppWindow.CursorX,d5
[00011330] cbf9 0001 83c4            muls.w     AppWindow.wchar,d5
[00011336] da79 0001 83cc            add.w      AppWindow.workx,d5
[0001133c] 3f05                      move.w     d5,-(a7)
[0001133e] 3a39 0001 83d6            move.w     AppWindow.CursorY,d5
[00011344] cbf9 0001 83c6            muls.w     AppWindow.hchar,d5
[0001134a] da79 0001 83ce            add.w      AppWindow.worky,d5
[00011350] 3f05                      move.w     d5,-(a7)
[00011352] 3a2e 000c                 move.w     12(a6),d5
[00011356] 3f05                      move.w     d5,-(a7)
[00011358] 286e 0008                 movea.l    8(a6),a4
[0001135c] 4854                      pea.l      (a4)
[0001135e] 4eb9 0001 104e            jsr        VDIOutputs.GraphicText
[00011364] 4fef 000c                 lea.l      12(a7),a7
[00011368] 426e fffc                 clr.w      -4(a6)
[0001136c] 3a2e fffc                 move.w     -4(a6),d5
[00011370] ba6e 000c                 cmp.w      12(a6),d5
[00011374] 6250                      bhi.s      $000113C6
[00011376] 3a2e fffc                 move.w     -4(a6),d5
[0001137a] 286e 0008                 movea.l    8(a6),a4
[0001137e] 4a34 5000                 tst.b      0(a4,d5.w)
[00011382] 6742                      beq.s      $000113C6
[00011384] 3a39 0001 83d4            move.w     AppWindow.CursorX,d5
[0001138a] da6e fffc                 add.w      -4(a6),d5
[0001138e] 0c45 0010                 cmpi.w     #$0010,d5
[00011392] 652c                      bcs.s      $000113C0
[00011394] 3a2e fffc                 move.w     -4(a6),d5
[00011398] 286e 0008                 movea.l    8(a6),a4
[0001139c] 3839 0001 83d6            move.w     AppWindow.CursorY,d4
[000113a2] c8fc 0032                 mulu.w     #$0032,d4
[000113a6] 47f9 0001 83a8            lea.l      $000183A8,a3
[000113ac] 3639 0001 83d4            move.w     AppWindow.CursorX,d3
[000113b2] d66e fffc                 add.w      -4(a6),d3
[000113b6] 47f3 40f0                 lea.l      -16(a3,d4.w),a3
[000113ba] 17b4 5000 3000            move.b     0(a4,d5.w),0(a3,d3.w)
[000113c0] 526e fffc                 addq.w     #1,-4(a6)
[000113c4] 60a6                      bra.s      $0001136C
[000113c6] 3a2e fffc                 move.w     -4(a6),d5
[000113ca] db79 0001 83d4            add.w      d5,AppWindow.CursorX
[000113d0] 1f3c 0001                 move.b     #$01,-(a7)
[000113d4] 4eb9 0001 12e4            jsr        mouseOn
[000113da] 548f                      addq.l     #2,a7
[000113dc] 4e5e                      unlk       a6
[000113de] 4e75                      rts

AppWindow.WriteLn:
[000113e0] 4e56 ffdc                 link       a6,#-36
[000113e4] 3a39 0001 83d4            move.w     AppWindow.CursorX,d5
[000113ea] 5345                      subq.w     #1,d5
[000113ec] 3839 0001 83d6            move.w     AppWindow.CursorY,d4
[000113f2] d844                      add.w      d4,d4
[000113f4] 49f9 0001 8888            lea.l      $00018888,a4
[000113fa] 3985 4000                 move.w     d5,0(a4,d4.w)
[000113fe] 3a39 0001 83d6            move.w     AppWindow.CursorY,d5
[00011404] ba79 0001 83d8            cmp.w      AppWindow.winrows,d5
[0001140a] 6d02                      blt.s      $0001140E
[0001140c] 6004                      bra.s      $00011412
[0001140e] 4efa 0218                 jmp        $00011628(pc)
[00011412] 3d79 0001 888a ffdc       move.w     AppWindow.lineLength,-36(a6)
[0001141a] 3d7c 0002 ffde            move.w     #$0002,-34(a6)
[00011420] 3a39 0001 83d8            move.w     AppWindow.winrows,d5
[00011426] 3f05                      move.w     d5,-(a7)
[00011428] 302e ffde                 move.w     -34(a6),d0
[0001142c] b057                      cmp.w      (a7),d0
[0001142e] 6304                      bls.s      $00011434
[00011430] 4efa 0088                 jmp        $000114BA(pc)
[00011434] 3a2e ffde                 move.w     -34(a6),d5
[00011438] da45                      add.w      d5,d5
[0001143a] 49f9 0001 8888            lea.l      $00018888,a4
[00011440] 3834 5000                 move.w     0(a4,d5.w),d4
[00011444] b86e ffdc                 cmp.w      -36(a6),d4
[00011448] 6312                      bls.s      $0001145C
[0001144a] 3a2e ffde                 move.w     -34(a6),d5
[0001144e] da45                      add.w      d5,d5
[00011450] 49f9 0001 8888            lea.l      $00018888,a4
[00011456] 3d74 5000 ffdc            move.w     0(a4,d5.w),-36(a6)
[0001145c] 3a2e ffde                 move.w     -34(a6),d5
[00011460] da45                      add.w      d5,d5
[00011462] 49f9 0001 8888            lea.l      $00018888,a4
[00011468] 382e ffde                 move.w     -34(a6),d4
[0001146c] 5344                      subq.w     #1,d4
[0001146e] d844                      add.w      d4,d4
[00011470] 47f9 0001 8888            lea.l      $00018888,a3
[00011476] 37b4 5000 4000            move.w     0(a4,d5.w),0(a3,d4.w)
[0001147c] 3a2e ffde                 move.w     -34(a6),d5
[00011480] cafc 0032                 mulu.w     #$0032,d5
[00011484] 49f9 0001 83a8            lea.l      $000183A8,a4
[0001148a] 382e ffde                 move.w     -34(a6),d4
[0001148e] 5344                      subq.w     #1,d4
[00011490] c8fc 0032                 mulu.w     #$0032,d4
[00011494] 47f9 0001 83a8            lea.l      $000183A8,a3
[0001149a] 49f4 5000                 lea.l      0(a4,d5.w),a4
[0001149e] 47f3 4000                 lea.l      0(a3,d4.w),a3
[000114a2] 7a18                      moveq.l    #24,d5
[000114a4] 36dc                      move.w     (a4)+,(a3)+
[000114a6] 51cd fffc                 dbf        d5,$000114A4
[000114aa] 302e ffde                 move.w     -34(a6),d0
[000114ae] b057                      cmp.w      (a7),d0
[000114b0] 6408                      bcc.s      $000114BA
[000114b2] 526e ffde                 addq.w     #1,-34(a6)
[000114b6] 6000 ff7c                 bra        $00011434
[000114ba] 548f                      addq.l     #2,a7
[000114bc] 42ae fffc                 clr.l      -4(a6)
[000114c0] 42ae fff8                 clr.l      -8(a6)
[000114c4] 3a39 0001 83cc            move.w     AppWindow.workx,d5
[000114ca] da79 0001 83c4            add.w      AppWindow.wchar,d5
[000114d0] 3d45 ffe8                 move.w     d5,-24(a6)
[000114d4] 3a39 0001 83ce            move.w     AppWindow.worky,d5
[000114da] da79 0001 83c6            add.w      AppWindow.hchar,d5
[000114e0] 3d45 ffea                 move.w     d5,-22(a6)
[000114e4] 3a2e ffdc                 move.w     -36(a6),d5
[000114e8] 5245                      addq.w     #1,d5
[000114ea] cbf9 0001 83c4            muls.w     AppWindow.wchar,d5
[000114f0] da79 0001 83cc            add.w      AppWindow.workx,d5
[000114f6] 3d45 ffec                 move.w     d5,-20(a6)
[000114fa] 3a39 0001 83ce            move.w     AppWindow.worky,d5
[00011500] da79 0001 83d2            add.w      AppWindow.workh,d5
[00011506] 3d45 ffee                 move.w     d5,-18(a6)
[0001150a] 3a39 0001 83cc            move.w     AppWindow.workx,d5
[00011510] da79 0001 83c4            add.w      AppWindow.wchar,d5
[00011516] 3d45 fff0                 move.w     d5,-16(a6)
[0001151a] 3d79 0001 83ce fff2       move.w     AppWindow.worky,-14(a6)
[00011522] 3d6e ffec fff4            move.w     -20(a6),-12(a6)
[00011528] 3a2e ffee                 move.w     -18(a6),d5
[0001152c] 9a79 0001 83c6            sub.w      AppWindow.hchar,d5
[00011532] 3d45 fff6                 move.w     d5,-10(a6)
[00011536] 4227                      clr.b      -(a7)
[00011538] 4eb9 0001 12e4            jsr        mouseOn
[0001153e] 548f                      addq.l     #2,a7
[00011540] 3f39 0001 8364            move.w     AppBase.vdiHandle,-(a7)
[00011546] 3f3c 0003                 move.w     #$0003,-(a7)
[0001154a] 486e ffe8                 pea.l      -24(a6)
[0001154e] 49ee fffc                 lea.l      -4(a6),a4
[00011552] 2a0c                      move.l     a4,d5
[00011554] 2f05                      move.l     d5,-(a7)
[00011556] 49ee fff8                 lea.l      -8(a6),a4
[0001155a] 2a0c                      move.l     a4,d5
[0001155c] 2f05                      move.l     d5,-(a7)
[0001155e] 4eb9 0001 1224            jsr        VDIRasters.CopyRasterOpaque
[00011564] 4fef 0010                 lea.l      16(a7),a7
[00011568] 3a39 0001 83cc            move.w     AppWindow.workx,d5
[0001156e] da79 0001 83c4            add.w      AppWindow.wchar,d5
[00011574] 3d45 ffe0                 move.w     d5,-32(a6)
[00011578] 3a39 0001 83d8            move.w     AppWindow.winrows,d5
[0001157e] 5345                      subq.w     #1,d5
[00011580] cbf9 0001 83c6            muls.w     AppWindow.hchar,d5
[00011586] da79 0001 83ce            add.w      AppWindow.worky,d5
[0001158c] 5245                      addq.w     #1,d5
[0001158e] 3d45 ffe2                 move.w     d5,-30(a6)
[00011592] 3a39 0001 83d8            move.w     AppWindow.winrows,d5
[00011598] da45                      add.w      d5,d5
[0001159a] 49f9 0001 8888            lea.l      $00018888,a4
[000115a0] 3834 5000                 move.w     0(a4,d5.w),d4
[000115a4] 5244                      addq.w     #1,d4
[000115a6] c9f9 0001 83c4            muls.w     AppWindow.wchar,d4
[000115ac] d879 0001 83cc            add.w      AppWindow.workx,d4
[000115b2] 3d44 ffe4                 move.w     d4,-28(a6)
[000115b6] 3a2e ffe2                 move.w     -30(a6),d5
[000115ba] da79 0001 83c6            add.w      AppWindow.hchar,d5
[000115c0] 5345                      subq.w     #1,d5
[000115c2] 3d45 ffe6                 move.w     d5,-26(a6)
[000115c6] 3f39 0001 8364            move.w     AppBase.vdiHandle,-(a7)
[000115cc] 486e ffe0                 pea.l      -32(a6)
[000115d0] 4eb9 0001 10e4            jsr        VDIOutputs.FillRectangle
[000115d6] 5c8f                      addq.l     #6,a7
[000115d8] 1f3c 0001                 move.b     #$01,-(a7)
[000115dc] 4eb9 0001 12e4            jsr        mouseOn
[000115e2] 548f                      addq.l     #2,a7
[000115e4] 3d7c 0010 ffde            move.w     #$0010,-34(a6)
[000115ea] 3a39 0001 83d8            move.w     AppWindow.winrows,d5
[000115f0] cafc 0032                 mulu.w     #$0032,d5
[000115f4] 49f9 0001 83a8            lea.l      $000183A8,a4
[000115fa] 382e ffde                 move.w     -34(a6),d4
[000115fe] 49f4 50f0                 lea.l      -16(a4,d5.w),a4
[00011602] 4234 4000                 clr.b      0(a4,d4.w)
[00011606] 526e ffde                 addq.w     #1,-34(a6)
[0001160a] 0c6e 0042 ffde            cmpi.w     #$0042,-34(a6)
[00011610] 66d8                      bne.s      $000115EA
[00011612] 3a39 0001 83d8            move.w     AppWindow.winrows,d5
[00011618] da45                      add.w      d5,d5
[0001161a] 49f9 0001 8888            lea.l      $00018888,a4
[00011620] 4274 5000                 clr.w      0(a4,d5.w)
[00011624] 4efa 0008                 jmp        $0001162E(pc)
[00011628] 5279 0001 83d6            addq.w     #1,AppWindow.CursorY
[0001162e] 33fc 0001 0001 83d4       move.w     #$0001,AppWindow.CursorX
[00011636] 4e5e                      unlk       a6
[00011638] 4e75                      rts

AppWindow.initWin:
[0001163a] 4e56 ff70                 link       a6,#-144
[0001163e] 558f                      subq.l     #2,a7
[00011640] 4879 0001 83c4            pea.l      AppWindow.wchar
[00011646] 4879 0001 83c6            pea.l      AppWindow.hchar
[0001164c] 4879 0001 83c8            pea.l      $000183C8
[00011652] 4879 0001 83ca            pea.l      $000183CA
[00011658] 4eb9 0001 0c62            jsr        AESGraphics.GrafHandle
[0001165e] 4fef 0010                 lea.l      16(a7),a7
[00011662] 33df 0001 8364            move.w     (a7)+,AppBase.vdiHandle
[00011668] 426e fffe                 clr.w      -2(a6)
[0001166c] 3a2e fffe                 move.w     -2(a6),d5
[00011670] da45                      add.w      d5,d5
[00011672] 49ee ffe8                 lea.l      -24(a6),a4
[00011676] 39bc 0001 5000            move.w     #$0001,0(a4,d5.w)
[0001167c] 526e fffe                 addq.w     #1,-2(a6)
[00011680] 0c6e 000a fffe            cmpi.w     #$000A,-2(a6)
[00011686] 66e4                      bne.s      $0001166C
[00011688] 3d7c 0002 fffc            move.w     #$0002,-4(a6)
[0001168e] 486e ffe8                 pea.l      -24(a6)
[00011692] 4879 0001 8364            pea.l      AppBase.vdiHandle
[00011698] 486e ff74                 pea.l      -140(a6)
[0001169c] 4eb9 0001 1122            jsr        VDIControls.OpenVirtualWorkstation
[000116a2] 4fef 000c                 lea.l      12(a7),a7
[000116a6] 4227                      clr.b      -(a7)
[000116a8] 4eb9 0001 12e4            jsr        mouseOn
[000116ae] 548f                      addq.l     #2,a7
[000116b0] 3d6e ff74 ff72            move.w     -140(a6),-142(a6)
[000116b6] 3d6e ff76 ff70            move.w     -138(a6),-144(a6)
[000116bc] 558f                      subq.l     #2,a7
[000116be] 3f3c 0001                 move.w     #$0001,-(a7)
[000116c2] 3f3c 000a                 move.w     #$000A,-(a7)
[000116c6] 3f3c 0019                 move.w     #$0019,-(a7)
[000116ca] 3a2e ff72                 move.w     -142(a6),d5
[000116ce] 0445 0014                 subi.w     #$0014,d5
[000116d2] 3f05                      move.w     d5,-(a7)
[000116d4] 3a2e ff70                 move.w     -144(a6),d5
[000116d8] 0445 0020                 subi.w     #$0020,d5
[000116dc] 3f05                      move.w     d5,-(a7)
[000116de] 4eb9 0001 0cec            jsr        AESWindows.WindowCreate
[000116e4] 4fef 000a                 lea.l      10(a7),a7
[000116e8] 33df 0001 8362            move.w     (a7)+,AppBase.wdwHandle
[000116ee] 3f3c 000a                 move.w     #$000A,-(a7)
[000116f2] 3f3c 0019                 move.w     #$0019,-(a7)
[000116f6] 3f3c 0001                 move.w     #$0001,-(a7)
[000116fa] 3f3c 0001                 move.w     #$0001,-(a7)
[000116fe] 3f3c 000a                 move.w     #$000A,-(a7)
[00011702] 3f3c 0019                 move.w     #$0019,-(a7)
[00011706] 3a2e ff72                 move.w     -142(a6),d5
[0001170a] 0445 0014                 subi.w     #$0014,d5
[0001170e] 3f05                      move.w     d5,-(a7)
[00011710] 3a2e ff70                 move.w     -144(a6),d5
[00011714] 0445 0020                 subi.w     #$0020,d5
[00011718] 3f05                      move.w     d5,-(a7)
[0001171a] 4eb9 0001 0bba            jsr        AESGraphics.GrafGrowBox
[00011720] 4fef 0010                 lea.l      16(a7),a7
[00011724] 3f39 0001 8362            move.w     AppBase.wdwHandle,-(a7)
[0001172a] 3f3c 000a                 move.w     #$000A,-(a7)
[0001172e] 3f3c 0019                 move.w     #$0019,-(a7)
[00011732] 3a2e ff72                 move.w     -142(a6),d5
[00011736] 0445 0014                 subi.w     #$0014,d5
[0001173a] 3f05                      move.w     d5,-(a7)
[0001173c] 3a2e ff70                 move.w     -144(a6),d5
[00011740] 0445 0020                 subi.w     #$0020,d5
[00011744] 3f05                      move.w     d5,-(a7)
[00011746] 4eb9 0001 0d34            jsr        AESWindows.WindowOpen
[0001174c] 4fef 000a                 lea.l      10(a7),a7
[00011750] 3f39 0001 8362            move.w     AppBase.wdwHandle,-(a7)
[00011756] 3f3c 0004                 move.w     #$0004,-(a7)
[0001175a] 4879 0001 83cc            pea.l      AppWindow.workx
[00011760] 4879 0001 83ce            pea.l      AppWindow.worky
[00011766] 4879 0001 83d0            pea.l      AppWindow.workw
[0001176c] 4879 0001 83d2            pea.l      AppWindow.workh
[00011772] 4eb9 0001 0de2            jsr        AESWindows.WindowGet
[00011778] 4fef 0014                 lea.l      20(a7),a7
[0001177c] 3a39 0001 83d2            move.w     AppWindow.workh,d5
[00011782] 48c5                      ext.l      d5
[00011784] 8bf9 0001 83c6            divs.w     AppWindow.hchar,d5
[0001178a] 33c5 0001 83d8            move.w     d5,AppWindow.winrows
[00011790] 49f9 0001 1a14            lea.l      $00011A14,a4
[00011796] 47f9 0001 88ba            lea.l      AppWindow.windowtitle,a3
[0001179c] 7a1f                      moveq.l    #31,d5
[0001179e] 16dc                      move.b     (a4)+,(a3)+
[000117a0] 57cd fffc                 dbeq       d5,$0001179E
[000117a4] 3f39 0001 8362            move.w     AppBase.wdwHandle,-(a7)
[000117aa] 3f3c 0002                 move.w     #$0002,-(a7)
[000117ae] 49f9 0001 88ba            lea.l      AppWindow.windowtitle,a4
[000117b4] 2a0c                      move.l     a4,d5
[000117b6] 7810                      moveq.l    #16,d4
[000117b8] e8ad                      lsr.l      d4,d5
[000117ba] 3f05                      move.w     d5,-(a7)
[000117bc] 49f9 0001 88ba            lea.l      AppWindow.windowtitle,a4
[000117c2] 2a0c                      move.l     a4,d5
[000117c4] 0285 0000 ffff            andi.l     #$0000FFFF,d5
[000117ca] 3f05                      move.w     d5,-(a7)
[000117cc] 4267                      clr.w      -(a7)
[000117ce] 4267                      clr.w      -(a7)
[000117d0] 4eb9 0001 0e3e            jsr        AESWindows.WindowSet
[000117d6] 4fef 000c                 lea.l      12(a7),a7
[000117da] 558f                      subq.l     #2,a7
[000117dc] 3f39 0001 8364            move.w     AppBase.vdiHandle,-(a7)
[000117e2] 3f3c 0001                 move.w     #$0001,-(a7)
[000117e6] 4eb9 0001 0fde            jsr        VDIAttribs.SetFillInteriorStyle
[000117ec] 588f                      addq.l     #4,a7
[000117ee] 3d5f fffe                 move.w     (a7)+,-2(a6)
[000117f2] 558f                      subq.l     #2,a7
[000117f4] 3f39 0001 8364            move.w     AppBase.vdiHandle,-(a7)
[000117fa] 4267                      clr.w      -(a7)
[000117fc] 4eb9 0001 1016            jsr        VDIAttribs.SetFillColour
[00011802] 588f                      addq.l     #4,a7
[00011804] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00011808] 3f39 0001 8364            move.w     AppBase.vdiHandle,-(a7)
[0001180e] 4267                      clr.w      -(a7)
[00011810] 3f3c 0003                 move.w     #$0003,-(a7)
[00011814] 486e fffe                 pea.l      -2(a6)
[00011818] 486e fffe                 pea.l      -2(a6)
[0001181c] 4eb9 0001 0f92            jsr        VDIAttribs.SetGraphicTextAlignment
[00011822] 4fef 000e                 lea.l      14(a7),a7
[00011826] 4eb9 0001 1842            jsr        AppWindow.Clear
[0001182c] 4eb9 0001 13e0            jsr        AppWindow.WriteLn
[00011832] 1f3c 0001                 move.b     #$01,-(a7)
[00011836] 4eb9 0001 12e4            jsr        mouseOn
[0001183c] 548f                      addq.l     #2,a7
[0001183e] 4e5e                      unlk       a6
[00011840] 4e75                      rts

AppWindow.Clear:
[00011842] 4e56 fff4                 link       a6,#-12
[00011846] 3d79 0001 83cc fff8       move.w     AppWindow.workx,-8(a6)
[0001184e] 3d79 0001 83ce fffa       move.w     AppWindow.worky,-6(a6)
[00011856] 3a39 0001 83cc            move.w     AppWindow.workx,d5
[0001185c] da79 0001 83d0            add.w      AppWindow.workw,d5
[00011862] 3d45 fffc                 move.w     d5,-4(a6)
[00011866] 3a39 0001 83ce            move.w     AppWindow.worky,d5
[0001186c] da79 0001 83d2            add.w      AppWindow.workh,d5
[00011872] 3d45 fffe                 move.w     d5,-2(a6)
[00011876] 3f39 0001 8364            move.w     AppBase.vdiHandle,-(a7)
[0001187c] 486e fff8                 pea.l      -8(a6)
[00011880] 4eb9 0001 10e4            jsr        VDIOutputs.FillRectangle
[00011886] 5c8f                      addq.l     #6,a7
[00011888] 3d7c 0001 fff4            move.w     #$0001,-12(a6)
[0001188e] 3a2e fff4                 move.w     -12(a6),d5
[00011892] da45                      add.w      d5,d5
[00011894] 49f9 0001 8888            lea.l      $00018888,a4
[0001189a] 4274 5000                 clr.w      0(a4,d5.w)
[0001189e] 3d7c 0010 fff6            move.w     #$0010,-10(a6)
[000118a4] 3a2e fff4                 move.w     -12(a6),d5
[000118a8] cafc 0032                 mulu.w     #$0032,d5
[000118ac] 49f9 0001 83a8            lea.l      $000183A8,a4
[000118b2] 382e fff6                 move.w     -10(a6),d4
[000118b6] 49f4 50f0                 lea.l      -16(a4,d5.w),a4
[000118ba] 4234 4000                 clr.b      0(a4,d4.w)
[000118be] 526e fff6                 addq.w     #1,-10(a6)
[000118c2] 0c6e 0042 fff6            cmpi.w     #$0042,-10(a6)
[000118c8] 66da                      bne.s      $000118A4
[000118ca] 526e fff4                 addq.w     #1,-12(a6)
[000118ce] 0c6e 0019 fff4            cmpi.w     #$0019,-12(a6)
[000118d4] 66b8                      bne.s      $0001188E
[000118d6] 33fc 0001 0001 83d4       move.w     #$0001,AppWindow.CursorX
[000118de] 33fc 0001 0001 83d6       move.w     #$0001,AppWindow.CursorY
[000118e6] 4e5e                      unlk       a6
[000118e8] 4e75                      rts

AppWindow.updateWindow:
[000118ea] 4e56 fff4                 link       a6,#-12
[000118ee] 4227                      clr.b      -(a7)
[000118f0] 4eb9 0001 12e4            jsr        mouseOn
[000118f6] 548f                      addq.l     #2,a7
[000118f8] 3f3c 0001                 move.w     #$0001,-(a7)
[000118fc] 4eb9 0001 0e90            jsr        AESWindows.WindowUpdate
[00011902] 548f                      addq.l     #2,a7
[00011904] 7a10                      moveq.l    #16,d5
[00011906] caf9 0001 83c4            mulu.w     AppWindow.wchar,d5
[0001190c] da79 0001 83cc            add.w      AppWindow.workx,d5
[00011912] 3d45 fff4                 move.w     d5,-12(a6)
[00011916] 3d79 0001 83ce fff6       move.w     AppWindow.worky,-10(a6)
[0001191e] 3a39 0001 83cc            move.w     AppWindow.workx,d5
[00011924] da79 0001 83d0            add.w      AppWindow.workw,d5
[0001192a] 3d45 fff8                 move.w     d5,-8(a6)
[0001192e] 3a39 0001 83ce            move.w     AppWindow.worky,d5
[00011934] da79 0001 83d2            add.w      AppWindow.workh,d5
[0001193a] 3d45 fffa                 move.w     d5,-6(a6)
[0001193e] 3f39 0001 8364            move.w     AppBase.vdiHandle,-(a7)
[00011944] 486e fff4                 pea.l      -12(a6)
[00011948] 4eb9 0001 10e4            jsr        VDIOutputs.FillRectangle
[0001194e] 5c8f                      addq.l     #6,a7
[00011950] 7a10                      moveq.l    #16,d5
[00011952] caf9 0001 83c4            mulu.w     AppWindow.wchar,d5
[00011958] da79 0001 83cc            add.w      AppWindow.workx,d5
[0001195e] 3d45 fffe                 move.w     d5,-2(a6)
[00011962] 3d7c 0001 fffc            move.w     #$0001,-4(a6)
[00011968] 3a39 0001 83d8            move.w     AppWindow.winrows,d5
[0001196e] 3f05                      move.w     d5,-(a7)
[00011970] 302e fffc                 move.w     -4(a6),d0
[00011974] b057                      cmp.w      (a7),d0
[00011976] 6f04                      ble.s      $0001197C
[00011978] 4efa 004c                 jmp        $000119C6(pc)
[0001197c] 3f39 0001 8364            move.w     AppBase.vdiHandle,-(a7)
[00011982] 3f2e fffe                 move.w     -2(a6),-(a7)
[00011986] 3a2e fffc                 move.w     -4(a6),d5
[0001198a] cbf9 0001 83c6            muls.w     AppWindow.hchar,d5
[00011990] da79 0001 83ce            add.w      AppWindow.worky,d5
[00011996] 3f05                      move.w     d5,-(a7)
[00011998] 3a2e fffc                 move.w     -4(a6),d5
[0001199c] cafc 0032                 mulu.w     #$0032,d5
[000119a0] 49f9 0001 83a8            lea.l      $000183A8,a4
[000119a6] 3f3c 0031                 move.w     #$0031,-(a7)
[000119aa] 4874 5000                 pea.l      0(a4,d5.w)
[000119ae] 4eb9 0001 104e            jsr        VDIOutputs.GraphicText
[000119b4] 4fef 000c                 lea.l      12(a7),a7
[000119b8] 302e fffc                 move.w     -4(a6),d0
[000119bc] b057                      cmp.w      (a7),d0
[000119be] 6c06                      bge.s      $000119C6
[000119c0] 526e fffc                 addq.w     #1,-4(a6)
[000119c4] 60b6                      bra.s      $0001197C
[000119c6] 548f                      addq.l     #2,a7
[000119c8] 4267                      clr.w      -(a7)
[000119ca] 4eb9 0001 0e90            jsr        AESWindows.WindowUpdate
[000119d0] 548f                      addq.l     #2,a7
[000119d2] 1f3c 0001                 move.b     #$01,-(a7)
[000119d6] 4eb9 0001 12e4            jsr        mouseOn
[000119dc] 548f                      addq.l     #2,a7
[000119de] 4e5e                      unlk       a6
[000119e0] 4e75                      rts

AppWindow.init
[000119e2] 4ef9 0001 129e            jmp        AppBase.init
[000119e8] 4e56 0000                 link       a6,#0
[000119ec] 3f3c 0002                 move.w     #$0002,-(a7)
[000119f0] 7aff                      moveq.l    #-1,d5
[000119f2] 2f05                      move.l     d5,-(a7)
[000119f4] 4eb9 0001 0cb0            jsr        AESGraphics.GrafMouse
[000119fa] 5c8f                      addq.l     #6,a7
[000119fc] 4eb9 0001 163a            jsr        AppWindow.initWin
[00011a02] 23fc 0001 18ea 0001 8366  move.l     #AppWindow.updateWindow,AppBase.doUpdateWindow
[00011a0c] 4e5e                      unlk       a6
[00011a0e] 4ef9 0001 1fce            jmp        Strings.init+6

[00011a14] 204d                      .asciiz ' Modula-2/ST     Release 3.00a '

***
* MODULE AESApplications
***

AESApplications.ApplInitialise:
[00011a34] 4e56 0000                 link       a6,#0
[00011a38] 558f                      subq.l     #2,a7
[00011a3a] 3f3c 000a                 move.w     #$000A,-(a7)
[00011a3e] 4267                      clr.w      -(a7)
[00011a40] 3f3c 0001                 move.w     #$0001,-(a7)
[00011a44] 4267                      clr.w      -(a7)
[00011a46] 4267                      clr.w      -(a7)
[00011a48] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00011a4e] 4fef 000a                 lea.l      10(a7),a7
[00011a52] 3d5f 0008                 move.w     (a7)+,8(a6)
[00011a56] 4e5e                      unlk       a6
[00011a58] 4e75                      rts

AESApplications.ApplWrite:
[00011a5a] 4e56 0000                 link       a6,#0
[00011a5e] 3f2e 000e                 move.w     14(a6),-(a7)
[00011a62] 3f2e 000c                 move.w     12(a6),-(a7)
[00011a66] 4eb9 0001 0a8a            jsr        $00010A8A
[00011a6c] 588f                      addq.l     #4,a7
[00011a6e] 23ee 0008 0001 7ef2       move.l     8(a6),AESAddrIn
[00011a76] 558f                      subq.l     #2,a7
[00011a78] 3f3c 000c                 move.w     #$000C,-(a7)
[00011a7c] 3f3c 0002                 move.w     #$0002,-(a7)
[00011a80] 3f3c 0001                 move.w     #$0001,-(a7)
[00011a84] 3f3c 0001                 move.w     #$0001,-(a7)
[00011a88] 4267                      clr.w      -(a7)
[00011a8a] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00011a90] 4fef 000a                 lea.l      10(a7),a7
[00011a94] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00011a9a] 4e5e                      unlk       a6
[00011a9c] 4e75                      rts

AESApplications.ApplFind:
[00011a9e] 4e56 0000                 link       a6,#0
[00011aa2] 286e 0008                 movea.l    8(a6),a4
[00011aa6] 2a0c                      move.l     a4,d5
[00011aa8] 23c5 0001 7ef2            move.l     d5,AESAddrIn
[00011aae] 558f                      subq.l     #2,a7
[00011ab0] 3f3c 000d                 move.w     #$000D,-(a7)
[00011ab4] 4267                      clr.w      -(a7)
[00011ab6] 3f3c 0001                 move.w     #$0001,-(a7)
[00011aba] 3f3c 0001                 move.w     #$0001,-(a7)
[00011abe] 4267                      clr.w      -(a7)
[00011ac0] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00011ac6] 4fef 000a                 lea.l      10(a7),a7
[00011aca] 3d5f 000e                 move.w     (a7)+,14(a6)
[00011ace] 4e5e                      unlk       a6
[00011ad0] 4e75                      rts

AESApplications.ApplExit:
[00011ad2] 4e56 0000                 link       a6,#0
[00011ad6] 558f                      subq.l     #2,a7
[00011ad8] 3f3c 0013                 move.w     #$0013,-(a7)
[00011adc] 4267                      clr.w      -(a7)
[00011ade] 3f3c 0001                 move.w     #$0001,-(a7)
[00011ae2] 4267                      clr.w      -(a7)
[00011ae4] 4267                      clr.w      -(a7)
[00011ae6] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00011aec] 4fef 000a                 lea.l      10(a7),a7
[00011af0] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00011af6] 4e5e                      unlk       a6
[00011af8] 4e75                      rts

***
* MODULE AESForms
***

AESForms.FormAlert:
[00011afa] 4e56 0000                 link       a6,#0
[00011afe] 33ee 000e 0001 7ec0       move.w     14(a6),AESIntIn
[00011b06] 286e 0008                 movea.l    8(a6),a4
[00011b0a] 2a0c                      move.l     a4,d5
[00011b0c] 23c5 0001 7ef2            move.l     d5,AESAddrIn
[00011b12] 558f                      subq.l     #2,a7
[00011b14] 3f3c 0034                 move.w     #$0034,-(a7)
[00011b18] 3f3c 0001                 move.w     #$0001,-(a7)
[00011b1c] 3f3c 0001                 move.w     #$0001,-(a7)
[00011b20] 3f3c 0001                 move.w     #$0001,-(a7)
[00011b24] 4267                      clr.w      -(a7)
[00011b26] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00011b2c] 4fef 000a                 lea.l      10(a7),a7
[00011b30] 3d5f 0010                 move.w     (a7)+,16(a6)
[00011b34] 4e5e                      unlk       a6
[00011b36] 4e75                      rts

AESForms.FormError:
[00011b38] 4e56 0000                 link       a6,#0
[00011b3c] 33ee 0008 0001 7ec2       move.w     8(a6),$00017EC2
[00011b44] 558f                      subq.l     #2,a7
[00011b46] 3f3c 0035                 move.w     #$0035,-(a7)
[00011b4a] 3f3c 0001                 move.w     #$0001,-(a7)
[00011b4e] 3f3c 0001                 move.w     #$0001,-(a7)
[00011b52] 4267                      clr.w      -(a7)
[00011b54] 4267                      clr.w      -(a7)
[00011b56] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00011b5c] 4fef 000a                 lea.l      10(a7),a7
[00011b60] 3d5f 000a                 move.w     (a7)+,10(a6)
[00011b64] 4e5e                      unlk       a6
[00011b66] 4e75                      rts

AESForms.FileSelectorInput:
[00011b68] 4e56 0000                 link       a6,#0
[00011b6c] 23ee 0010 0001 7ef2       move.l     16(a6),AESAddrIn
[00011b74] 23ee 000c 0001 7ef6       move.l     12(a6),$00017EF6
[00011b7c] 558f                      subq.l     #2,a7
[00011b7e] 3f3c 005a                 move.w     #$005A,-(a7)
[00011b82] 4267                      clr.w      -(a7)
[00011b84] 3f3c 0002                 move.w     #$0002,-(a7)
[00011b88] 3f3c 0002                 move.w     #$0002,-(a7)
[00011b8c] 4267                      clr.w      -(a7)
[00011b8e] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00011b94] 4fef 000a                 lea.l      10(a7),a7
[00011b98] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00011b9e] 286e 0008                 movea.l    8(a6),a4
[00011ba2] 38b9 0001 7ee4            move.w     AESIntOut+2,(a4)
[00011ba8] 4e5e                      unlk       a6
[00011baa] 4e75                      rts

***
* MODULE AESShells
***

AESShells.ShellRead:
[00011bac] 4e56 0000                 link       a6,#0
[00011bb0] 23ee 000c 0001 7ef2       move.l     12(a6),AESAddrIn
[00011bb8] 23ee 0008 0001 7ef6       move.l     8(a6),$00017EF6
[00011bc0] 558f                      subq.l     #2,a7
[00011bc2] 3f3c 0078                 move.w     #$0078,-(a7)
[00011bc6] 4267                      clr.w      -(a7)
[00011bc8] 3f3c 0001                 move.w     #$0001,-(a7)
[00011bcc] 3f3c 0002                 move.w     #$0002,-(a7)
[00011bd0] 4267                      clr.w      -(a7)
[00011bd2] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00011bd8] 4fef 000a                 lea.l      10(a7),a7
[00011bdc] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00011be2] 4e5e                      unlk       a6
[00011be4] 4e75                      rts

AESShells.ShellWrite:
[00011be6] 4e56 0000                 link       a6,#0
[00011bea] 3f2e 0014                 move.w     20(a6),-(a7)
[00011bee] 3f2e 0012                 move.w     18(a6),-(a7)
[00011bf2] 4eb9 0001 0a8a            jsr        $00010A8A
[00011bf8] 588f                      addq.l     #4,a7
[00011bfa] 33ee 0010 0001 7ec4       move.w     16(a6),$00017EC4
[00011c02] 23ee 000c 0001 7ef2       move.l     12(a6),AESAddrIn
[00011c0a] 23ee 0008 0001 7ef6       move.l     8(a6),$00017EF6
[00011c12] 558f                      subq.l     #2,a7
[00011c14] 3f3c 0079                 move.w     #$0079,-(a7)
[00011c18] 3f3c 0003                 move.w     #$0003,-(a7)
[00011c1c] 3f3c 0001                 move.w     #$0001,-(a7)
[00011c20] 3f3c 0002                 move.w     #$0002,-(a7)
[00011c24] 4267                      clr.w      -(a7)
[00011c26] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[00011c2c] 4fef 000a                 lea.l      10(a7),a7
[00011c30] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00011c36] 4e5e                      unlk       a6
[00011c38] 4e75                      rts

***
* MODULE Strings
***

Strings.InitStringModule:
[00011c3a] 4e56 0000                 link       a6,#0
[00011c3e] 4239 0001 88e2            clr.b      Strings.terminator
[00011c44] 4e5e                      unlk       a6
[00011c46] 4e75                      rts

Strings.Assign:
[00011c48] 4e56 fffc                 link       a6,#-4
[00011c4c] 558f                      subq.l     #2,a7
[00011c4e] 3a2e 000c                 move.w     12(a6),d5
[00011c52] 3f05                      move.w     d5,-(a7)
[00011c54] 286e 0008                 movea.l    8(a6),a4
[00011c58] 4854                      pea.l      (a4)
[00011c5a] 6100 0244                 bsr        Strings.Length
[00011c5e] 5c8f                      addq.l     #6,a7
[00011c60] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00011c64] 3a2e 0012                 move.w     18(a6),d5
[00011c68] 5245                      addq.w     #1,d5
[00011c6a] ba6e fffe                 cmp.w      -2(a6),d5
[00011c6e] 640a                      bcc.s      $00011C7A
[00011c70] 3a2e 0012                 move.w     18(a6),d5
[00011c74] 5245                      addq.w     #1,d5
[00011c76] 3d45 fffe                 move.w     d5,-2(a6)
[00011c7a] 426e fffc                 clr.w      -4(a6)
[00011c7e] 3a2e fffe                 move.w     -2(a6),d5
[00011c82] 5345                      subq.w     #1,d5
[00011c84] 3f05                      move.w     d5,-(a7)
[00011c86] 302e fffc                 move.w     -4(a6),d0
[00011c8a] b057                      cmp.w      (a7),d0
[00011c8c] 6f04                      ble.s      $00011C92
[00011c8e] 4efa 0026                 jmp        $00011CB6(pc)
[00011c92] 3a2e fffc                 move.w     -4(a6),d5
[00011c96] 286e 0008                 movea.l    8(a6),a4
[00011c9a] 382e fffc                 move.w     -4(a6),d4
[00011c9e] 266e 000e                 movea.l    14(a6),a3
[00011ca2] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[00011ca8] 302e fffc                 move.w     -4(a6),d0
[00011cac] b057                      cmp.w      (a7),d0
[00011cae] 6c06                      bge.s      $00011CB6
[00011cb0] 526e fffc                 addq.w     #1,-4(a6)
[00011cb4] 60dc                      bra.s      $00011C92
[00011cb6] 548f                      addq.l     #2,a7
[00011cb8] 3a2e fffe                 move.w     -2(a6),d5
[00011cbc] ba6e 0012                 cmp.w      18(a6),d5
[00011cc0] 6210                      bhi.s      $00011CD2
[00011cc2] 3a2e fffe                 move.w     -2(a6),d5
[00011cc6] 286e 000e                 movea.l    14(a6),a4
[00011cca] 19b9 0001 88e2 5000       move.b     Strings.terminator,0(a4,d5.w)
[00011cd2] 4e5e                      unlk       a6
[00011cd4] 4e75                      rts

Strings.Insert:
[00011cd6] 4e56 fffa                 link       a6,#-6
[00011cda] 558f                      subq.l     #2,a7
[00011cdc] 3a2e 0014                 move.w     20(a6),d5
[00011ce0] 3f05                      move.w     d5,-(a7)
[00011ce2] 286e 0010                 movea.l    16(a6),a4
[00011ce6] 4854                      pea.l      (a4)
[00011ce8] 6100 01b6                 bsr        Strings.Length
[00011cec] 5c8f                      addq.l     #6,a7
[00011cee] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00011cf2] 558f                      subq.l     #2,a7
[00011cf4] 3a2e 000e                 move.w     14(a6),d5
[00011cf8] 3f05                      move.w     d5,-(a7)
[00011cfa] 286e 000a                 movea.l    10(a6),a4
[00011cfe] 4854                      pea.l      (a4)
[00011d00] 6100 019e                 bsr        Strings.Length
[00011d04] 5c8f                      addq.l     #6,a7
[00011d06] 3d5f fffc                 move.w     (a7)+,-4(a6)
[00011d0a] 3a2e fffc                 move.w     -4(a6),d5
[00011d0e] da6e fffe                 add.w      -2(a6),d5
[00011d12] ba6e 000e                 cmp.w      14(a6),d5
[00011d16] 640c                      bcc.s      $00011D24
[00011d18] 3a2e 0008                 move.w     8(a6),d5
[00011d1c] ba6e fffc                 cmp.w      -4(a6),d5
[00011d20] 6402                      bcc.s      $00011D24
[00011d22] 6004                      bra.s      $00011D28
[00011d24] 4efa 0090                 jmp        $00011DB6(pc)
[00011d28] 3a2e fffc                 move.w     -4(a6),d5
[00011d2c] da6e fffe                 add.w      -2(a6),d5
[00011d30] 3d45 fffa                 move.w     d5,-6(a6)
[00011d34] 3a2e 0008                 move.w     8(a6),d5
[00011d38] da6e fffe                 add.w      -2(a6),d5
[00011d3c] 3f05                      move.w     d5,-(a7)
[00011d3e] 3017                      move.w     (a7),d0
[00011d40] b06e fffa                 cmp.w      -6(a6),d0
[00011d44] 6304                      bls.s      $00011D4A
[00011d46] 4efa 002a                 jmp        $00011D72(pc)
[00011d4a] 3a2e fffa                 move.w     -6(a6),d5
[00011d4e] 9a6e fffe                 sub.w      -2(a6),d5
[00011d52] 286e 000a                 movea.l    10(a6),a4
[00011d56] 382e fffa                 move.w     -6(a6),d4
[00011d5a] 266e 000a                 movea.l    10(a6),a3
[00011d5e] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[00011d64] 3017                      move.w     (a7),d0
[00011d66] b06e fffa                 cmp.w      -6(a6),d0
[00011d6a] 6406                      bcc.s      $00011D72
[00011d6c] 536e fffa                 subq.w     #1,-6(a6)
[00011d70] 60d8                      bra.s      $00011D4A
[00011d72] 548f                      addq.l     #2,a7
[00011d74] 426e fffa                 clr.w      -6(a6)
[00011d78] 3a2e fffe                 move.w     -2(a6),d5
[00011d7c] 5345                      subq.w     #1,d5
[00011d7e] 3f05                      move.w     d5,-(a7)
[00011d80] 302e fffa                 move.w     -6(a6),d0
[00011d84] b057                      cmp.w      (a7),d0
[00011d86] 6304                      bls.s      $00011D8C
[00011d88] 4efa 002a                 jmp        $00011DB4(pc)
[00011d8c] 3a2e fffa                 move.w     -6(a6),d5
[00011d90] 286e 0010                 movea.l    16(a6),a4
[00011d94] 382e fffa                 move.w     -6(a6),d4
[00011d98] d86e 0008                 add.w      8(a6),d4
[00011d9c] 266e 000a                 movea.l    10(a6),a3
[00011da0] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[00011da6] 302e fffa                 move.w     -6(a6),d0
[00011daa] b057                      cmp.w      (a7),d0
[00011dac] 6406                      bcc.s      $00011DB4
[00011dae] 526e fffa                 addq.w     #1,-6(a6)
[00011db2] 60d8                      bra.s      $00011D8C
[00011db4] 548f                      addq.l     #2,a7
[00011db6] 4e5e                      unlk       a6
[00011db8] 4e75                      rts

Strings.Concat:
[00011dba] 4e56 fffa                 link       a6,#-6
[00011dbe] 558f                      subq.l     #2,a7
[00011dc0] 3a2e 0018                 move.w     24(a6),d5
[00011dc4] 3f05                      move.w     d5,-(a7)
[00011dc6] 286e 0014                 movea.l    20(a6),a4
[00011dca] 4854                      pea.l      (a4)
[00011dcc] 6100 00d2                 bsr        Strings.Length
[00011dd0] 5c8f                      addq.l     #6,a7
[00011dd2] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00011dd6] 558f                      subq.l     #2,a7
[00011dd8] 3a2e 0012                 move.w     18(a6),d5
[00011ddc] 3f05                      move.w     d5,-(a7)
[00011dde] 286e 000e                 movea.l    14(a6),a4
[00011de2] 4854                      pea.l      (a4)
[00011de4] 6100 00ba                 bsr        Strings.Length
[00011de8] 5c8f                      addq.l     #6,a7
[00011dea] 3d5f fffc                 move.w     (a7)+,-4(a6)
[00011dee] 3a2e fffe                 move.w     -2(a6),d5
[00011df2] da6e fffc                 add.w      -4(a6),d5
[00011df6] 4a45                      tst.w      d5
[00011df8] 660e                      bne.s      $00011E08
[00011dfa] 286e 0008                 movea.l    8(a6),a4
[00011dfe] 18b9 0001 88e2            move.b     Strings.terminator,(a4)
[00011e04] 4efa 0096                 jmp        $00011E9C(pc)
[00011e08] 3a2e fffe                 move.w     -2(a6),d5
[00011e0c] da6e fffc                 add.w      -4(a6),d5
[00011e10] 382e 000c                 move.w     12(a6),d4
[00011e14] 5444                      addq.w     #2,d4
[00011e16] b845                      cmp.w      d5,d4
[00011e18] 6302                      bls.s      $00011E1C
[00011e1a] 6004                      bra.s      $00011E20
[00011e1c] 4efa 007e                 jmp        $00011E9C(pc)
[00011e20] 3a2e 000c                 move.w     12(a6),d5
[00011e24] 3f05                      move.w     d5,-(a7)
[00011e26] 286e 0008                 movea.l    8(a6),a4
[00011e2a] 4854                      pea.l      (a4)
[00011e2c] 3a2e 0018                 move.w     24(a6),d5
[00011e30] 3f05                      move.w     d5,-(a7)
[00011e32] 286e 0014                 movea.l    20(a6),a4
[00011e36] 4854                      pea.l      (a4)
[00011e38] 6100 fe0e                 bsr        Strings.Assign
[00011e3c] 4fef 000c                 lea.l      12(a7),a7
[00011e40] 3d6e fffe fffa            move.w     -2(a6),-6(a6)
[00011e46] 3a2e fffe                 move.w     -2(a6),d5
[00011e4a] da6e fffc                 add.w      -4(a6),d5
[00011e4e] 5345                      subq.w     #1,d5
[00011e50] 3f05                      move.w     d5,-(a7)
[00011e52] 302e fffa                 move.w     -6(a6),d0
[00011e56] b057                      cmp.w      (a7),d0
[00011e58] 6304                      bls.s      $00011E5E
[00011e5a] 4efa 002a                 jmp        $00011E86(pc)
[00011e5e] 3a2e fffa                 move.w     -6(a6),d5
[00011e62] 9a6e fffe                 sub.w      -2(a6),d5
[00011e66] 286e 000e                 movea.l    14(a6),a4
[00011e6a] 382e fffa                 move.w     -6(a6),d4
[00011e6e] 266e 0008                 movea.l    8(a6),a3
[00011e72] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[00011e78] 302e fffa                 move.w     -6(a6),d0
[00011e7c] b057                      cmp.w      (a7),d0
[00011e7e] 6406                      bcc.s      $00011E86
[00011e80] 526e fffa                 addq.w     #1,-6(a6)
[00011e84] 60d8                      bra.s      $00011E5E
[00011e86] 548f                      addq.l     #2,a7
[00011e88] 3a2e fffe                 move.w     -2(a6),d5
[00011e8c] da6e fffc                 add.w      -4(a6),d5
[00011e90] 286e 0008                 movea.l    8(a6),a4
[00011e94] 19b9 0001 88e2 5000       move.b     Strings.terminator,0(a4,d5.w)
[00011e9c] 4e5e                      unlk       a6
[00011e9e] 4e75                      rts

Strings.Length:
[00011ea0] 4e56 fffe                 link       a6,#-2
[00011ea4] 426e fffe                 clr.w      -2(a6)
[00011ea8] 3a2e 000c                 move.w     12(a6),d5
[00011eac] 3f05                      move.w     d5,-(a7)
[00011eae] 302e fffe                 move.w     -2(a6),d0
[00011eb2] b057                      cmp.w      (a7),d0
[00011eb4] 6304                      bls.s      $00011EBA
[00011eb6] 4efa 002e                 jmp        $00011EE6(pc)
[00011eba] 3a2e fffe                 move.w     -2(a6),d5
[00011ebe] 286e 0008                 movea.l    8(a6),a4
[00011ec2] 1834 5000                 move.b     0(a4,d5.w),d4
[00011ec6] b839 0001 88e2            cmp.b      Strings.terminator,d4
[00011ecc] 660a                      bne.s      $00011ED8
[00011ece] 3d6e fffe 000e            move.w     -2(a6),14(a6)
[00011ed4] 4e5e                      unlk       a6
[00011ed6] 4e75                      rts
[00011ed8] 302e fffe                 move.w     -2(a6),d0
[00011edc] b057                      cmp.w      (a7),d0
[00011ede] 6406                      bcc.s      $00011EE6
[00011ee0] 526e fffe                 addq.w     #1,-2(a6)
[00011ee4] 60d4                      bra.s      $00011EBA
[00011ee6] 548f                      addq.l     #2,a7
[00011ee8] 3a2e 000c                 move.w     12(a6),d5
[00011eec] 5245                      addq.w     #1,d5
[00011eee] 3d45 000e                 move.w     d5,14(a6)
[00011ef2] 4e5e                      unlk       a6
[00011ef4] 4e75                      rts

Strings.Pos:
[00011ef6] 4e56 fff8                 link       a6,#-8
[00011efa] 558f                      subq.l     #2,a7
[00011efc] 3a2e 0018                 move.w     24(a6),d5
[00011f00] 3f05                      move.w     d5,-(a7)
[00011f02] 286e 0014                 movea.l    20(a6),a4
[00011f06] 4854                      pea.l      (a4)
[00011f08] 6100 ff96                 bsr.w      Strings.Length
[00011f0c] 5c8f                      addq.l     #6,a7
[00011f0e] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00011f12] 558f                      subq.l     #2,a7
[00011f14] 3a2e 0012                 move.w     18(a6),d5
[00011f18] 3f05                      move.w     d5,-(a7)
[00011f1a] 286e 000e                 movea.l    14(a6),a4
[00011f1e] 4854                      pea.l      (a4)
[00011f20] 6100 ff7e                 bsr        Strings.Length
[00011f24] 5c8f                      addq.l     #6,a7
[00011f26] 3d5f fffc                 move.w     (a7)+,-4(a6)
[00011f2a] 4a6e fffe                 tst.w      -2(a6)
[00011f2e] 6714                      beq.s      $00011F44
[00011f30] 4a6e fffc                 tst.w      -4(a6)
[00011f34] 670e                      beq.s      $00011F44
[00011f36] 3a2e 000c                 move.w     12(a6),d5
[00011f3a] da6e fffc                 add.w      -4(a6),d5
[00011f3e] ba6e fffe                 cmp.w      -2(a6),d5
[00011f42] 6310                      bls.s      $00011F54
[00011f44] 286e 0008                 movea.l    8(a6),a4
[00011f48] 38ae fffe                 move.w     -2(a6),(a4)
[00011f4c] 422e 001a                 clr.b      26(a6)
[00011f50] 4e5e                      unlk       a6
[00011f52] 4e75                      rts
[00011f54] 3a2e fffe                 move.w     -2(a6),d5
[00011f58] 9a6e fffc                 sub.w      -4(a6),d5
[00011f5c] 3d45 fff8                 move.w     d5,-8(a6)
[00011f60] 426e fffa                 clr.w      -6(a6)
[00011f64] 3a2e fffa                 move.w     -6(a6),d5
[00011f68] 286e 000e                 movea.l    14(a6),a4
[00011f6c] 382e 000c                 move.w     12(a6),d4
[00011f70] d86e fffa                 add.w      -6(a6),d4
[00011f74] 266e 0014                 movea.l    20(a6),a3
[00011f78] 1634 5000                 move.b     0(a4,d5.w),d3
[00011f7c] b633 4000                 cmp.b      0(a3,d4.w),d3
[00011f80] 6704                      beq.s      $00011F86
[00011f82] 4efa 0024                 jmp        $00011FA8(pc)
[00011f86] 526e fffa                 addq.w     #1,-6(a6)
[00011f8a] 3a2e fffa                 move.w     -6(a6),d5
[00011f8e] ba6e fffc                 cmp.w      -4(a6),d5
[00011f92] 6612                      bne.s      $00011FA6
[00011f94] 286e 0008                 movea.l    8(a6),a4
[00011f98] 38ae 000c                 move.w     12(a6),(a4)
[00011f9c] 1d7c 0001 001a            move.b     #$01,26(a6)
[00011fa2] 4e5e                      unlk       a6
[00011fa4] 4e75                      rts
[00011fa6] 60bc                      bra.s      $00011F64
[00011fa8] 526e 000c                 addq.w     #1,12(a6)
[00011fac] 3a2e 000c                 move.w     12(a6),d5
[00011fb0] ba6e fff8                 cmp.w      -8(a6),d5
[00011fb4] 6310                      bls.s      $00011FC6
[00011fb6] 286e 0008                 movea.l    8(a6),a4
[00011fba] 38ae fffe                 move.w     -2(a6),(a4)
[00011fbe] 422e 001a                 clr.b      26(a6)
[00011fc2] 4e5e                      unlk       a6
[00011fc4] 4e75                      rts
[00011fc6] 6098                      bra.s      $00011F60

Strings.init:
[00011fc8] 4ef9 0001 19e2            jmp        AppWindow.init
[00011fce] 4e56 0000                 link       a6,#0
[00011fd2] 6100 fc66                 bsr        Strings.InitStringModule
[00011fd6] 4e5e                      unlk       a6
[00011fd8] 4ef9 0001 204e            jmp        Buffers.init+6

***
* MODULE Buffers
***

Buffers.FreeAll:
[00011fde] 4e56 0000                 link       a6,#0
[00011fe2] 4a79 0001 88e8            tst.w      Buffers.count
[00011fe8] 6d52                      blt.s      $0001203C
[00011fea] 3a39 0001 88e8            move.w     Buffers.count,d5
[00011ff0] e545                      asl.w      #2,d5
[00011ff2] 49f9 0001 88ea            lea.l      Buffers.buffers,a4
[00011ff8] 78ff                      moveq.l    #-1,d4
[00011ffa] b8b4 5000                 cmp.l      0(a4,d5.w),d4
[00011ffe] 6734                      beq.s      $00012034
[00012000] 558f                      subq.l     #2,a7
[00012002] 3a39 0001 88e8            move.w     Buffers.count,d5
[00012008] e545                      asl.w      #2,d5
[0001200a] 49f9 0001 88ea            lea.l      Buffers.buffers,a4
[00012010] 2f34 5000                 move.l     0(a4,d5.w),-(a7)
[00012014] 4eb9 0001 0a1a            jsr        GEMDOS.Free
[0001201a] 588f                      addq.l     #4,a7
[0001201c] 4a1f                      tst.b      (a7)+
[0001201e] 6714                      beq.s      $00012034
[00012020] 3a39 0001 88e8            move.w     Buffers.count,d5
[00012026] e545                      asl.w      #2,d5
[00012028] 49f9 0001 88ea            lea.l      Buffers.buffers,a4
[0001202e] 78ff                      moveq.l    #-1,d4
[00012030] 2984 5000                 move.l     d4,0(a4,d5.w)
[00012034] 5379 0001 88e8            subq.w     #1,Buffers.count
[0001203a] 60a6                      bra.s      $00011FE2
[0001203c] 7aff                      moveq.l    #-1,d5
[0001203e] 23c5 0001 88e4            move.l     d5,Buffers.bufptr
[00012044] 4e5e                      unlk       a6
[00012046] 4e75                      rts

Buffers.init:
[00012048] 4ef9 0001 1fc8            jmp        Strings.init
[0001204e] 4e56 0000                 link       a6,#0
[00012052] 33fc ffff 0001 88e8       move.w     #$FFFF,Buffers.count
[0001205a] 4e5e                      unlk       a6
[0001205c] 4ef9 0001 262a            jmp        ExecUtil.init+6


***
* MODULE ExecUtil
***

ExecUtil.FreeBuffers:
[00012062] 4e56 0000                 link       a6,#0
[00012066] 4eb9 0001 1fde            jsr        Buffers.FreeAll
[0001206c] 4e5e                      unlk       a6
[0001206e] 4e75                      rts

ExecUtil.Terminate:
[00012070] 4e56 fff8                 link       a6,#-8
[00012074] 4a39 0001 891c            tst.b      ExecUtil.terminated
[0001207a] 6602                      bne.s      $0001207E
[0001207c] 6004                      bra.s      $00012082
[0001207e] 4efa 00b8                 jmp        $00012138(pc)
[00012082] 3f3c 0100                 move.w     #$0100,-(a7)
[00012086] 7aff                      moveq.l    #-1,d5
[00012088] 2f05                      move.l     d5,-(a7)
[0001208a] 4eb9 0001 0cb0            jsr        AESGraphics.GrafMouse
[00012090] 5c8f                      addq.l     #6,a7
[00012092] 4a79 0001 8362            tst.w      AppBase.wdwHandle
[00012098] 6d6a                      blt.s      $00012104
[0001209a] 3f39 0001 8362            move.w     AppBase.wdwHandle,-(a7)
[000120a0] 3f3c 0005                 move.w     #$0005,-(a7)
[000120a4] 486e fffe                 pea.l      -2(a6)
[000120a8] 486e fffc                 pea.l      -4(a6)
[000120ac] 486e fffa                 pea.l      -6(a6)
[000120b0] 486e fff8                 pea.l      -8(a6)
[000120b4] 4eb9 0001 0de2            jsr        AESWindows.WindowGet
[000120ba] 4fef 0014                 lea.l      20(a7),a7
[000120be] 3f3c 000a                 move.w     #$000A,-(a7)
[000120c2] 3f3c 0019                 move.w     #$0019,-(a7)
[000120c6] 3f3c 0001                 move.w     #$0001,-(a7)
[000120ca] 3f3c 0001                 move.w     #$0001,-(a7)
[000120ce] 3f2e fffe                 move.w     -2(a6),-(a7)
[000120d2] 3f2e fffc                 move.w     -4(a6),-(a7)
[000120d6] 3f2e fffa                 move.w     -6(a6),-(a7)
[000120da] 3f2e fff8                 move.w     -8(a6),-(a7)
[000120de] 4eb9 0001 0c0e            jsr        AESGraphics.GrafShrinkBox
[000120e4] 4fef 0010                 lea.l      16(a7),a7
[000120e8] 3f39 0001 8362            move.w     AppBase.wdwHandle,-(a7)
[000120ee] 4eb9 0001 0d7e            jsr        AESWindows.WindowClose
[000120f4] 548f                      addq.l     #2,a7
[000120f6] 3f39 0001 8362            move.w     AppBase.wdwHandle,-(a7)
[000120fc] 4eb9 0001 0db0            jsr        AESWindows.WindowDelete
[00012102] 548f                      addq.l     #2,a7
[00012104] 4a79 0001 8364            tst.w      AppBase.vdiHandle
[0001210a] 6d0e                      blt.s      $0001211A
[0001210c] 3f39 0001 8364            move.w     AppBase.vdiHandle,-(a7)
[00012112] 4eb9 0001 11fe            jsr        VDIControls.CloseVirtualWorkstation
[00012118] 548f                      addq.l     #2,a7
[0001211a] 3f3c 0101                 move.w     #$0101,-(a7)
[0001211e] 7aff                      moveq.l    #-1,d5
[00012120] 2f05                      move.l     d5,-(a7)
[00012122] 4eb9 0001 0cb0            jsr        AESGraphics.GrafMouse
[00012128] 5c8f                      addq.l     #6,a7
[0001212a] 4eb9 0001 1ad2            jsr        AESApplications.ApplExit
[00012130] 13fc 0001 0001 891c       move.b     #$01,ExecUtil.terminated
[00012138] 4e5e                      unlk       a6
[0001213a] 4e75                      rts

ExecUtil.ReplaceExtension:
[0001213c] 4e56 fffc                 link       a6,#-4
[00012140] 426e fffe                 clr.w      -2(a6)
[00012144] 426e fffc                 clr.w      -4(a6)
[00012148] 3a2e fffe                 move.w     -2(a6),d5
[0001214c] ba6e 0012                 cmp.w      18(a6),d5
[00012150] 622e                      bhi.s      $00012180
[00012152] 3a2e fffe                 move.w     -2(a6),d5
[00012156] 286e 000e                 movea.l    14(a6),a4
[0001215a] 4a34 5000                 tst.b      0(a4,d5.w)
[0001215e] 6720                      beq.s      $00012180
[00012160] 3a2e fffe                 move.w     -2(a6),d5
[00012164] 286e 000e                 movea.l    14(a6),a4
[00012168] 0c34 005c 5000            cmpi.b     #$5C,0(a4,d5.w)
[0001216e] 660a                      bne.s      $0001217A
[00012170] 3a2e fffe                 move.w     -2(a6),d5
[00012174] 5245                      addq.w     #1,d5
[00012176] 3d45 fffc                 move.w     d5,-4(a6)
[0001217a] 526e fffe                 addq.w     #1,-2(a6)
[0001217e] 60c8                      bra.s      $00012148
[00012180] 3d6e fffc fffe            move.w     -4(a6),-2(a6)
[00012186] 3a2e fffe                 move.w     -2(a6),d5
[0001218a] ba6e 0012                 cmp.w      18(a6),d5
[0001218e] 6232                      bhi.s      $000121C2
[00012190] 3a2e fffe                 move.w     -2(a6),d5
[00012194] 286e 000e                 movea.l    14(a6),a4
[00012198] 4a34 5000                 tst.b      0(a4,d5.w)
[0001219c] 6724                      beq.s      $000121C2
[0001219e] 3a2e fffe                 move.w     -2(a6),d5
[000121a2] 286e 000e                 movea.l    14(a6),a4
[000121a6] 0c34 002e 5000            cmpi.b     #$2E,0(a4,d5.w)
[000121ac] 6714                      beq.s      $000121C2
[000121ae] 3a2e fffe                 move.w     -2(a6),d5
[000121b2] 9a6e fffc                 sub.w      -4(a6),d5
[000121b6] 0c45 0008                 cmpi.w     #$0008,d5
[000121ba] 6406                      bcc.s      $000121C2
[000121bc] 526e fffe                 addq.w     #1,-2(a6)
[000121c0] 60c4                      bra.s      $00012186
[000121c2] 3a2e 0012                 move.w     18(a6),d5
[000121c6] 9a6e 000c                 sub.w      12(a6),d5
[000121ca] 5545                      subq.w     #2,d5
[000121cc] ba6e fffe                 cmp.w      -2(a6),d5
[000121d0] 6404                      bcc.s      $000121D6
[000121d2] 4e5e                      unlk       a6
[000121d4] 4e75                      rts
[000121d6] 3a2e fffe                 move.w     -2(a6),d5
[000121da] 286e 000e                 movea.l    14(a6),a4
[000121de] 0c34 002e 5000            cmpi.b     #$2E,0(a4,d5.w)
[000121e4] 670e                      beq.s      $000121F4
[000121e6] 3a2e fffe                 move.w     -2(a6),d5
[000121ea] 286e 000e                 movea.l    14(a6),a4
[000121ee] 19bc 002e 5000            move.b     #$2E,0(a4,d5.w)
[000121f4] 426e fffc                 clr.w      -4(a6)
[000121f8] 3a2e 000c                 move.w     12(a6),d5
[000121fc] 3f05                      move.w     d5,-(a7)
[000121fe] 302e fffc                 move.w     -4(a6),d0
[00012202] b057                      cmp.w      (a7),d0
[00012204] 6304                      bls.s      $0001220A
[00012206] 4efa 002a                 jmp        $00012232(pc)
[0001220a] 526e fffe                 addq.w     #1,-2(a6)
[0001220e] 3a2e fffc                 move.w     -4(a6),d5
[00012212] 286e 0008                 movea.l    8(a6),a4
[00012216] 382e fffe                 move.w     -2(a6),d4
[0001221a] 266e 000e                 movea.l    14(a6),a3
[0001221e] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[00012224] 302e fffc                 move.w     -4(a6),d0
[00012228] b057                      cmp.w      (a7),d0
[0001222a] 6406                      bcc.s      $00012232
[0001222c] 526e fffc                 addq.w     #1,-4(a6)
[00012230] 60d8                      bra.s      $0001220A
[00012232] 548f                      addq.l     #2,a7
[00012234] 3a2e fffe                 move.w     -2(a6),d5
[00012238] ba6e 0012                 cmp.w      18(a6),d5
[0001223c] 640e                      bcc.s      $0001224C
[0001223e] 3a2e fffe                 move.w     -2(a6),d5
[00012242] 5245                      addq.w     #1,d5
[00012244] 286e 000e                 movea.l    14(a6),a4
[00012248] 4234 5000                 clr.b      0(a4,d5.w)
[0001224c] 4e5e                      unlk       a6
[0001224e] 4e75                      rts

ExecUtil.RunCmd(VAR cmd: ARRAY OF CHAR; VAR tail: ARRAY OF CHAR);
[00012250] 4e56 0000                 link       a6,#0
[00012254] 3f3c 0001                 move.w     #$0001,-(a7)
[00012258] 3f3c 0001                 move.w     #$0001,-(a7)
[0001225c] 3f3c 0001                 move.w     #$0001,-(a7)
[00012260] 286e 000e                 movea.l    14(a6),a4
[00012264] 2a0c                      move.l     a4,d5
[00012266] 2f05                      move.l     d5,-(a7)
[00012268] 286e 0008                 movea.l    8(a6),a4
[0001226c] 2a0c                      move.l     a4,d5
[0001226e] 2f05                      move.l     d5,-(a7)
[00012270] 4eb9 0001 1be6            jsr        AESShells.ShellWrite
[00012276] 4fef 000e                 lea.l      14(a7),a7
[0001227a] 4e5e                      unlk       a6
[0001227c] 4e75                      rts

ExecUtil.OpenStream:
[0001227e] 4e56 fffc                 link       a6,#-4
[00012282] 2a39 0001 836e            move.l     AppBase.openStreams,d5
[00012288] 0805 000c                 btst       #12,d5
[0001228c] 660c                      bne.s      $0001229A
[0001228e] 2a39 0001 836e            move.l     AppBase.openStreams,d5
[00012294] 0805 000b                 btst       #11,d5
[00012298] 6720                      beq.s      $000122BA
[0001229a] 3f3c 0009                 move.w     #$0009,-(a7)
[0001229e] 4879 0001 265e            pea.l      $0001265E
[000122a4] 3f3c 004f                 move.w     #$004F,-(a7)
[000122a8] 4879 0001 8372            pea.l      AppBase.shellTail
[000122ae] 6100 ffa0                 bsr.w      ExecUtil.RunCmd
[000122b2] 4fef 000c                 lea.l      12(a7),a7
[000122b6] 4efa 0112                 jmp        $000123CA(pc)
[000122ba] 558f                      subq.l     #2,a7
[000122bc] 3f3c 004f                 move.w     #$004F,-(a7)
[000122c0] 4879 0001 8372            pea.l      AppBase.shellTail
[000122c6] 3f3c 0003                 move.w     #$0003,-(a7)
[000122ca] 4879 0001 266a            pea.l      $0001266A
[000122d0] 4267                      clr.w      -(a7)
[000122d2] 486e fffe                 pea.l      -2(a6)
[000122d6] 4eb9 0001 1ef6            jsr        Strings.Pos
[000122dc] 4fef 0012                 lea.l      18(a7),a7
[000122e0] 4a1f                      tst.b      (a7)+
[000122e2] 6702                      beq.s      $000122E6
[000122e4] 6004                      bra.s      $000122EA
[000122e6] 4efa 00aa                 jmp        $00012392(pc)
[000122ea] 3f3c 004f                 move.w     #$004F,-(a7)
[000122ee] 4879 0001 8372            pea.l      AppBase.shellTail
[000122f4] 3f3c 0002                 move.w     #$0002,-(a7)
[000122f8] 4879 0001 2670            pea.l      $00012670
[000122fe] 6100 fe3c                 bsr        ExecUtil.ReplaceExtension
[00012302] 4fef 000c                 lea.l      12(a7),a7
[00012306] 3f3c 004f                 move.w     #$004F,-(a7)
[0001230a] 4879 0001 8372            pea.l      AppBase.shellTail
[00012310] 4267                      clr.w      -(a7)
[00012312] 486e fffc                 pea.l      -4(a6)
[00012316] 4eb9 0001 090e            jsr        GEMDOS.Open
[0001231c] 4fef 000c                 lea.l      12(a7),a7
[00012320] 4a6e fffc                 tst.w      -4(a6)
[00012324] 6c3c                      bge.s      $00012362
[00012326] 3f3c 004f                 move.w     #$004F,-(a7)
[0001232a] 4879 0001 8372            pea.l      AppBase.shellTail
[00012330] 3f3c 0002                 move.w     #$0002,-(a7)
[00012334] 4879 0001 2674            pea.l      $00012674
[0001233a] 6100 fe00                 bsr        ExecUtil.ReplaceExtension
[0001233e] 4fef 000c                 lea.l      12(a7),a7
[00012342] 3f3c 0009                 move.w     #$0009,-(a7)
[00012346] 4879 0001 2678            pea.l      $00012678
[0001234c] 3f3c 004f                 move.w     #$004F,-(a7)
[00012350] 4879 0001 8372            pea.l      AppBase.shellTail
[00012356] 6100 fef8                 bsr        ExecUtil.RunCmd
[0001235a] 4fef 000c                 lea.l      12(a7),a7
[0001235e] 4efa 002e                 jmp        $0001238E(pc)
[00012362] 558f                      subq.l     #2,a7
[00012364] 3f2e fffc                 move.w     -4(a6),-(a7)
[00012368] 4eb9 0001 0936            jsr        GEMDOS.Close
[0001236e] 548f                      addq.l     #2,a7
[00012370] 4a1f                      tst.b      (a7)+
[00012372] 4e71                      nop
[00012374] 3f3c 0009                 move.w     #$0009,-(a7)
[00012378] 4879 0001 2684            pea.l      $00012684
[0001237e] 4267                      clr.w      -(a7)
[00012380] 4879 0001 2690            pea.l      $00012690
[00012386] 6100 fec8                 bsr        ExecUtil.RunCmd
[0001238a] 4fef 000c                 lea.l      12(a7),a7
[0001238e] 4efa 003a                 jmp        $000123CA(pc)
[00012392] 3f3c 004f                 move.w     #$004F,-(a7)
[00012396] 4879 0001 8372            pea.l      AppBase.shellTail
[0001239c] 3f3c 0002                 move.w     #$0002,-(a7)
[000123a0] 4879 0001 2692            pea.l      $00012692
[000123a6] 6100 fd94                 bsr        ExecUtil.ReplaceExtension
[000123aa] 4fef 000c                 lea.l      12(a7),a7
[000123ae] 3f3c 0009                 move.w     #$0009,-(a7)
[000123b2] 4879 0001 2696            pea.l      $00012696
[000123b8] 3f3c 004f                 move.w     #$004F,-(a7)
[000123bc] 4879 0001 8372            pea.l      AppBase.shellTail
[000123c2] 6100 fe8c                 bsr        ExecUtil.RunCmd
[000123c6] 4fef 000c                 lea.l      12(a7),a7
[000123ca] 4e5e                      unlk       a6
[000123cc] 4e75                      rts

ExecUtil.IOError.RunProgram:
[000123ce] 4e56 0000                 link       a6,#0
[000123d2] 2a39 0001 836e            move.l     AppBase.openStreams,d5
[000123d8] 0805 0007                 btst       #7,d5
[000123dc] 6746                      beq.s      $00012424
[000123de] 286d fffc                 movea.l    -4(a5),a4
[000123e2] 4a2c 0008                 tst.b      8(a4)
[000123e6] 663c                      bne.s      $00012424
[000123e8] 3f3c 004f                 move.w     #$004F,-(a7)
[000123ec] 4879 0001 8372            pea.l      AppBase.shellTail
[000123f2] 3f3c 0002                 move.w     #$0002,-(a7)
[000123f6] 4879 0001 26a2            pea.l      $000126A2
[000123fc] 6100 fd3e                 bsr        ExecUtil.ReplaceExtension
[00012400] 4fef 000c                 lea.l      12(a7),a7
[00012404] 3f3c 0007                 move.w     #$0007,-(a7)
[00012408] 4879 0001 26a6            pea.l      $000126A6
[0001240e] 3f3c 004f                 move.w     #$004F,-(a7)
[00012412] 4879 0001 8372            pea.l      AppBase.shellTail
[00012418] 6100 fe36                 bsr        ExecUtil.RunCmd
[0001241c] 4fef 000c                 lea.l      12(a7),a7
[00012420] 4efa 0008                 jmp        $0001242A(pc)
[00012424] 4239 0001 83c2            clr.b      AppBase.xfer
[0001242a] 4e5e                      unlk       a6
[0001242c] 4e75                      rts

ExecUtil.IOError.RunCompiler:
[0001242e] 4e56 0000                 link       a6,#0
[00012432] 286d fffc                 movea.l    -4(a5),a4
[00012436] 4a2c 0008                 tst.b      8(a4)
[0001243a] 6620                      bne.s      $0001245C
[0001243c] 3f3c 0009                 move.w     #$0009,-(a7)
[00012440] 4879 0001 26b0            pea.l      $000126B0
[00012446] 3f3c 004f                 move.w     #$004F,-(a7)
[0001244a] 4879 0001 8372            pea.l      AppBase.shellTail
[00012450] 6100 fdfe                 bsr        ExecUtil.RunCmd
[00012454] 4fef 000c                 lea.l      12(a7),a7
[00012458] 4efa 0008                 jmp        $00012462(pc)
[0001245c] 4239 0001 83c2            clr.b      AppBase.xfer
[00012462] 4e5e                      unlk       a6
[00012464] 4e75                      rts

ExecUtil.IOError:
[00012466] 4e56 ff5a                 link       a6,#-166
[0001246a] 2f2d fffc                 move.l     -4(a5),-(a7)
[0001246e] 2b4e fffc                 move.l     a6,-4(a5)
[00012472] 6100 fbee                 bsr        ExecUtil.FreeBuffers
[00012476] 4267                      clr.w      -(a7)
[00012478] 7aff                      moveq.l    #-1,d5
[0001247a] 2f05                      move.l     d5,-(a7)
[0001247c] 4eb9 0001 0cb0            jsr        AESGraphics.GrafMouse
[00012482] 5c8f                      addq.l     #6,a7
[00012484] 4a39 0001 83c2            tst.b      AppBase.xfer
[0001248a] 6758                      beq.s      $000124E4
[0001248c] 7a00                      moveq.l    #0,d5
[0001248e] 3a2e 000a                 move.w     10(a6),d5
[00012492] 2005                      move.l     d5,d0
[00012494] 4eb9 0001 000a            jsr        CASEX
[0001249a] 0000 0000
[0001249e] 0000 0003
[000124a2] 0000 0028
[000124a6] 6100 fdd6                 bsr        ExecUtil.OpenStream:
[000124aa] 4efa 0038                 jmp        $000124E4(pc)
[000124ae] 6100 ff1e                 bsr        ExecUtil.IOError.RunProgram
[000124b2] 4efa 0030                 jmp        $000124E4(pc)
[000124b6] 6100 ff76                 bsr        ExecUtil.IOError.RunCompiler
[000124ba] 4efa 0028                 jmp        $000124E4(pc)
[000124be] 4efa 000a                 jmp        $000124CA(pc)
[000124c2] 000c 0014                 ori.b      #$14,a4 ; apollo only
[000124c6] 0024 001c                 ori.b      #$1C,-(a4)
[000124ca] 3f3c 0009                 move.w     #$0009,-(a7)
[000124ce] 4879 0001 26bc            pea.l      $000126BC
[000124d4] 4267                      clr.w      -(a7)
[000124d6] 4879 0001 26c8            pea.l      $000126C8
[000124dc] 6100 fd72                 bsr        ExecUtil.RunCmd
[000124e0] 4fef 000c                 lea.l      12(a7),a7
[000124e4] 4a2e 0008                 tst.b      8(a6)
[000124e8] 670a                      beq.s      $000124F4
[000124ea] 4a39 0001 83c2            tst.b      AppBase.xfer
[000124f0] 6602                      bne.s      $000124F4
[000124f2] 6004                      bra.s      $000124F8
[000124f4] 4efa 010c                 jmp        $00012602(pc)
[000124f8] 7a00                      moveq.l    #0,d5
[000124fa] 3a2e 000a                 move.w     10(a6),d5
[000124fe] 2005                      move.l     d5,d0
[00012500] 4eb9 0001 000a            jsr        CASEX
[00012506] 0000 0000
[0001250a] 0000 0004
[0001250e] 0000 007e
[00012512] 49f9 0001 26ca            lea.l      $000126CA,a4
[00012518] 47ee ffae                 lea.l      -82(a6),a3
[0001251c] 7a0b                      moveq.l    #11,d5
[0001251e] 16dc                      move.b     (a4)+,(a3)+
[00012520] 57cd fffc                 dbeq       d5,$0001251E
[00012524] 4efa 007a                 jmp        $000125A0(pc)
[00012528] 49f9 0001 26d6            lea.l      $000126D6,a4
[0001252e] 47ee ffae                 lea.l      -82(a6),a3
[00012532] 7a07                      moveq.l    #7,d5
[00012534] 16dc                      move.b     (a4)+,(a3)+
[00012536] 57cd fffc                 dbeq       d5,$00012534
[0001253a] 4efa 0064                 jmp        $000125A0(pc)
[0001253e] 49f9 0001 26de            lea.l      $000126DE,a4
[00012544] 47ee ffae                 lea.l      -82(a6),a3
[00012548] 7a09                      moveq.l    #9,d5
[0001254a] 16dc                      move.b     (a4)+,(a3)+
[0001254c] 57cd fffc                 dbeq       d5,$0001254A
[00012550] 4efa 004e                 jmp        $000125A0(pc)
[00012554] 49f9 0001 26e8            lea.l      $000126E8,a4
[0001255a] 47ee ffae                 lea.l      -82(a6),a3
[0001255e] 7a07                      moveq.l    #7,d5
[00012560] 16dc                      move.b     (a4)+,(a3)+
[00012562] 57cd fffc                 dbeq       d5,$00012560
[00012566] 4efa 0038                 jmp        $000125A0(pc)
[0001256a] 49f9 0001 26f0            lea.l      $000126F0,a4
[00012570] 47ee ffae                 lea.l      -82(a6),a3
[00012574] 7a0f                      moveq.l    #15,d5
[00012576] 16dc                      move.b     (a4)+,(a3)+
[00012578] 57cd fffc                 dbeq       d5,$00012576
[0001257c] 4efa 0022                 jmp        $000125A0(pc)
[00012580] 4efa 000c                 jmp        $0001258E(pc)
[00012584] 000c 0022                 ori.b      #$22,a4 ; apollo only
[00012588] 0038 004e 0064            ori.b      #$4E,($00000064).w
[0001258e] 49f9 0001 2700            lea.l      $00012700,a4
[00012594] 47ee ffae                 lea.l      -82(a6),a3
[00012598] 7a0e                      moveq.l    #14,d5
[0001259a] 16dc                      move.b     (a4)+,(a3)+
[0001259c] 57cd fffc                 dbeq       d5,$0001259A
[000125a0] 3f3c 001b                 move.w     #$001B,-(a7)
[000125a4] 4879 0001 2710            pea.l      $00012710
[000125aa] 3f3c 004f                 move.w     #$004F,-(a7)
[000125ae] 486e ffae                 pea.l      -82(a6)
[000125b2] 3f3c 004f                 move.w     #$004F,-(a7)
[000125b6] 486e ff5e                 pea.l      -162(a6)
[000125ba] 4eb9 0001 1dba            jsr        Strings.Concat
[000125c0] 4fef 0012                 lea.l      18(a7),a7
[000125c4] 3f3c 004f                 move.w     #$004F,-(a7)
[000125c8] 486e ff5e                 pea.l      -162(a6)
[000125cc] 3f3c 0008                 move.w     #$0008,-(a7)
[000125d0] 4879 0001 272e            pea.l      $0001272E
[000125d6] 3f3c 004f                 move.w     #$004F,-(a7)
[000125da] 486e ffae                 pea.l      -82(a6)
[000125de] 4eb9 0001 1dba            jsr        Strings.Concat
[000125e4] 4fef 0012                 lea.l      18(a7),a7
[000125e8] 558f                      subq.l     #2,a7
[000125ea] 3f3c 0001                 move.w     #$0001,-(a7)
[000125ee] 3f3c 004f                 move.w     #$004F,-(a7)
[000125f2] 486e ffae                 pea.l      -82(a6)
[000125f6] 4eb9 0001 1afa            jsr        AESForms.FormAlert
[000125fc] 508f                      addq.l     #8,a7
[000125fe] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00012602] 6100 fa6c                 bsr        ExecUtil.Terminate
[00012606] 2a0d                      move.l     a5,d5
[00012608] 7828                      moveq.l    #40,d4
[0001260a] 9a84                      sub.l      d4,d5
[0001260c] 2d45 ff5a                 move.l     d5,-166(a6)
[00012610] 286e ff5a                 movea.l    -166(a6),a4
[00012614] 2f0c                      move.l     a4,-(a7)
[00012616] 2854                      movea.l    (a4),a4
[00012618] 4e94                      jsr        (a4)
[0001261a] 285f                      movea.l    (a7)+,a4
[0001261c] 2b5f fffc                 move.l     (a7)+,-4(a5)
[00012620] 4e5e                      unlk       a6
[00012622] 4e75                      rts

ExecUtil.init:
[00012624] 4ef9 0001 2048            jmp        Buffers.init
[0001262a] 4e56 0000                 link       a6,#0
[0001262e] 4279 0001 891a            clr.w      $0001891A
[00012634] 42b9 0001 8912            clr.l      $00018912
[0001263a] 7aff                      moveq.l    #-1,d5
[0001263c] 23c5 0001 8916            move.l     d5,$00018916
[00012642] 558f                      subq.l     #2,a7
[00012644] 4eb9 0001 1a34            jsr        AESApplications.ApplInitialise
[0001264a] 33df 0001 8360            move.w     (a7)+,AppBase.apId
[00012650] 4239 0001 891c            clr.b      ExecUtil.terminated
[00012656] 4e5e                      unlk       a6
[00012658] 4ef9 0001 2b4a            jmp        M2Option.init+6

[0001265e] 4544                      lea.l      d4,b2 ; apollo only
[00012660] 4954                      lea.l      (a4),b4 ; apollo only
[00012662] 4f52                      lea.l      (a2),b7 ; apollo only
[00012664] 2e50                      movea.l    (a0),a7
[00012666] 5247                      addq.w     #1,d7
[00012668] 0000 2e4d                 ori.b      #$4D,d0
[0001266c] 4f44                      lea.l      d4,b7 ; apollo only
[0001266e] 0000 4445                 ori.b      #$45,d0
[00012672] 4600                      not.b      d0
[00012674] 4c4e 4b00                 divsl.l    a6,d0:d4 ; rems.l for ColdFire
[00012678] 4c49 4e4b                 divs.l     a1,a3:d4 ; apollo only
[0001267c] 4552                      lea.l      (a2),b2 ; apollo only
[0001267e] 2e50                      movea.l    (a0),a7
[00012680] 5247                      addq.w     #1,d7
[00012682] 0000 4544                 ori.b      #$44,d0
[00012686] 4954                      lea.l      (a4),b4 ; apollo only
[00012688] 4f52                      lea.l      (a2),b7 ; apollo only
[0001268a] 2e50                      movea.l    (a0),a7
[0001268c] 5247                      addq.w     #1,d7
[0001268e] 0000                      dc.w       $0000
[00012690] 0000 4d4f                 ori.b      #$4F,d0
[00012694] 4400                      neg.b      d0
[00012696] 4544                      lea.l      d4,b2 ; apollo only
[00012698] 4954                      lea.l      (a4),b4 ; apollo only
[0001269a] 4f52                      lea.l      (a2),b7 ; apollo only
[0001269c] 2e50                      movea.l    (a0),a7
[0001269e] 5247                      addq.w     #1,d7
[000126a0] 0000 5052                 ori.b      #$52,d0
[000126a4] 4700                      chk.l      d0,d3 ; 68020+ only
[000126a6] 4558                      lea.l      (a0)+,b2 ; apollo only
[000126a8] 4543                      lea.l      d3,b2 ; apollo only
[000126aa] 2e50                      movea.l    (a0),a7
[000126ac] 5247                      addq.w     #1,d7
[000126ae] 0000 4d4f                 ori.b      #$4F,d0
[000126b2] 4455                      neg.w      (a5)
[000126b4] 4c41 2e50                 divs.l     d1,d0:d2 ; 68020+ only
[000126b8] 5247                      addq.w     #1,d7
[000126ba] 0000 4544                 ori.b      #$44,d0
[000126be] 4954                      lea.l      (a4),b4 ; apollo only
[000126c0] 4f52                      lea.l      (a2),b7 ; apollo only
[000126c2] 2e50                      movea.l    (a0),a7
[000126c4] 5247                      addq.w     #1,d7
[000126c6] 0000                      dc.w       $0000
[000126c8] 0000 636f                 ori.b      #$6F,d0
[000126cc] 6d70                      blt.s      $0001273E
[000126ce] 696c                      bvs.s      $0001273C
[000126d0] 6174                      bsr.s      $00012746
[000126d2] 696f                      bvs.s      $00012743
[000126d4] 6e00 6c69                 bgt        $0001933F
[000126d8] 6e6b                      bgt.s      $00012745
[000126da] 696e                      bvs.s      $0001274A
[000126dc] 6700 6465                 beq        $00018B43
[000126e0] 6275                      bhi.s      $00012757
[000126e2] 6767                      beq.s      $0001274B
[000126e4] 696e                      bvs.s      $00012754
[000126e6] 6700 6564                 beq        $00018C4C
[000126ea] 6974                      bvs.s      $00012760
[000126ec] 696e                      bvs.s      $0001275C
[000126ee] 6700 7574                 beq        $00019C64
[000126f2] 696c                      bvs.s      $00012760
[000126f4] 6974                      bvs.s      $0001276A
[000126f6] 7920                      ???
[000126f8] 7072                      moveq.l    #114,d0
[000126fa] 6f67                      ble.s      $00012763
[000126fc] 7261                      moveq.l    #97,d1
[000126fe] 6d00 4d6f                 blt        $0001746F
[00012702] 6475                      bcc.s      $00012779
[00012704] 6c61                      bge.s      $00012767
[00012706] 2050                      movea.l    (a0),a0
[00012708] 726f                      moveq.l    #111,d1
[0001270a] 6475                      bcc.s      $00012781
[0001270c] 6374                      bls.s      $00012782
[0001270e] 0000 5b31                 ori.b      #$31,d0
[00012712] 5d5b                      subq.w     #6,(a3)+
[00012714] 4572 726f                 lea.l      111(a2,d7.w*2),b2 ; 68020+ only
[00012718] 7228                      moveq.l    #40,d1
[0001271a] 7329                      ???
[0001271c] 206f 6363                 movea.l    25443(a7),a0
[00012720] 7572                      ???
[00012722] 6564                      bcs.s      $00012788
[00012724] 2064                      movea.l    -(a4),a0
[00012726] 7572                      ???
[00012728] 696e                      bvs.s      $00012798
[0001272a] 677c                      beq.s      $000127A8
[0001272c] 0000 5d5b                 ori.b      #$5B,d0
[00012730] 2020                      move.l     -(a0),d0
[00012732] 4f4b                      lea.l      (b3),b7 ; apollo only
[00012734] 2020                      move.l     -(a0),d0
[00012736] 5d00                      subq.b     #6,d0

***
* MODULE AESEvents
***

AESEvents.EventMessage:
[00012738] 4e56 0000                 link       a6,#0
[0001273c] 23ee 0008 0001 7ef2       move.l     8(a6),AESAddrIn
[00012744] 558f                      subq.l     #2,a7
[00012746] 3f3c 0017                 move.w     #$0017,-(a7)
[0001274a] 4267                      clr.w      -(a7)
[0001274c] 3f3c 0001                 move.w     #$0001,-(a7)
[00012750] 3f3c 0001                 move.w     #$0001,-(a7)
[00012754] 4267                      clr.w      -(a7)
[00012756] 4eb9 0001 0a3c            jsr        GEMAESbase.GemCall
[0001275c] 4fef 000a                 lea.l      10(a7),a7
[00012760] 33df 0001 7f06            move.w     (a7)+,AESCallResult
[00012766] 4e5e                      unlk       a6
[00012768] 4e75                      rts

***
* MODULE M2Option
***

M2Option.SendMsg:
[0001276a] 4e56 0000                 link       a6,#0
[0001276e] 33fc 0046 0001 8920       move.w     #$0046,M2Option.msgbuf
[00012776] 33f9 0001 8360 0001 8922  move.w     AppBase.apId,$00018922
[00012780] 4279 0001 8924            clr.w      $00018924
[00012786] 33ee 0008 0001 8926       move.w     8(a6),$00018926
[0001278e] 3f39 0001 891e            move.w     M2Option.accId,-(a7)
[00012794] 3f3c 0010                 move.w     #$0010,-(a7)
[00012798] 49f9 0001 8920            lea.l      M2Option.msgbuf,a4
[0001279e] 2a0c                      move.l     a4,d5
[000127a0] 2f05                      move.l     d5,-(a7)
[000127a2] 4eb9 0001 1a5a            jsr        AESApplications.ApplWrite
[000127a8] 508f                      addq.l     #8,a7
[000127aa] 49f9 0001 8940            lea.l      $00018940,a4
[000127b0] 2a0c                      move.l     a4,d5
[000127b2] 2f05                      move.l     d5,-(a7)
[000127b4] 4eb9 0001 2738            jsr        AESEvents.EventMessage
[000127ba] 588f                      addq.l     #4,a7
[000127bc] 0c79 0047 0001 8940       cmpi.w     #$0047,$00018940
[000127c4] 6702                      beq.s      $000127C8
[000127c6] 60e2                      bra.s      $000127AA
[000127c8] 4e5e                      unlk       a6
[000127ca] 4e75                      rts

M2Option.GetSystemOptions:
[000127cc] 4e56 fff8                 link       a6,#-8
[000127d0] 4a79 0001 891e            tst.w      M2Option.accId
[000127d6] 6d02                      blt.s      $000127DA
[000127d8] 6004                      bra.s      $000127DE
[000127da] 4efa 00a8                 jmp        $00012884(pc)
[000127de] 49f9 0001 8960            lea.l      M2Option.options,a4
[000127e4] 2a0c                      move.l     a4,d5
[000127e6] 7810                      moveq.l    #16,d4
[000127e8] e8ad                      lsr.l      d4,d5
[000127ea] 33c5 0001 8928            move.w     d5,$00018928
[000127f0] 49f9 0001 8960            lea.l      M2Option.options,a4
[000127f6] 2a0c                      move.l     a4,d5
[000127f8] 33c5 0001 892a            move.w     d5,$0001892A
[000127fe] 3f3c 0005                 move.w     #$0005,-(a7)
[00012802] 4eb9 0001 276a            jsr        M2Option.SendMsg
[00012808] 548f                      addq.l     #2,a7
[0001280a] 3a39 0001 8946            move.w     $00018946,d5
[00012810] 48c5                      ext.l      d5
[00012812] 286e 0014                 movea.l    20(a6),a4
[00012816] 1885                      move.b     d5,(a4)
[00012818] 3a39 0001 8948            move.w     $00018948,d5
[0001281e] 48c5                      ext.l      d5
[00012820] 286e 0010                 movea.l    16(a6),a4
[00012824] 1885                      move.b     d5,(a4)
[00012826] 3a39 0001 894a            move.w     M2Option.replybuf,d5
[0001282c] 48c5                      ext.l      d5
[0001282e] 286e 000c                 movea.l    12(a6),a4
[00012832] 1885                      move.b     d5,(a4)
[00012834] 426e fffe                 clr.w      -2(a6)
[00012838] 426e fffc                 clr.w      -4(a6)
[0001283c] 3a2e fffe                 move.w     -2(a6),d5
[00012840] cafc 0026                 mulu.w     #$0026,d5
[00012844] da6e fffc                 add.w      -4(a6),d5
[00012848] 49f9 0001 8960            lea.l      M2Option.options,a4
[0001284e] 382e fffe                 move.w     -2(a6),d4
[00012852] 266e 0008                 movea.l    8(a6),a3
[00012856] c8fc 0032                 mulu.w     #$0032,d4
[0001285a] 362e fffc                 move.w     -4(a6),d3
[0001285e] 47f3 4000                 lea.l      0(a3,d4.w),a3
[00012862] 17b4 5000 3000            move.b     0(a4,d5.w),0(a3,d3.w)
[00012868] 526e fffc                 addq.w     #1,-4(a6)
[0001286c] 0c6e 0026 fffc            cmpi.w     #$0026,-4(a6)
[00012872] 66c8                      bne.s      $0001283C
[00012874] 526e fffe                 addq.w     #1,-2(a6)
[00012878] 0c6e 0007 fffe            cmpi.w     #$0007,-2(a6)
[0001287e] 66b8                      bne.s      $00012838
[00012880] 4efa 0030                 jmp        $000128B2(pc)
[00012884] 286e 0014                 movea.l    20(a6),a4
[00012888] 18bc 0001                 move.b     #$01,(a4)
[0001288c] 286e 0010                 movea.l    16(a6),a4
[00012890] 4214                      clr.b      (a4)
[00012892] 426e fffe                 clr.w      -2(a6)
[00012896] 3a2e fffe                 move.w     -2(a6),d5
[0001289a] 286e 0008                 movea.l    8(a6),a4
[0001289e] cafc 0032                 mulu.w     #$0032,d5
[000128a2] 4234 5000                 clr.b      0(a4,d5.w)
[000128a6] 526e fffe                 addq.w     #1,-2(a6)
[000128aa] 0c6e 0007 fffe            cmpi.w     #$0007,-2(a6)
[000128b0] 66e4                      bne.s      $00012896
[000128b2] 1d7c 005c fff9            move.b     #$5C,-7(a6)
[000128b8] 426e fffe                 clr.w      -2(a6)
[000128bc] 3a2e fffe                 move.w     -2(a6),d5
[000128c0] 286e 0008                 movea.l    8(a6),a4
[000128c4] cafc 0032                 mulu.w     #$0032,d5
[000128c8] 4a34 5000                 tst.b      0(a4,d5.w)
[000128cc] 6602                      bne.s      $000128D0
[000128ce] 6004                      bra.s      $000128D4
[000128d0] 4efa 0072                 jmp        $00012944(pc)
[000128d4] 3a2e fffe                 move.w     -2(a6),d5
[000128d8] 286e 0008                 movea.l    8(a6),a4
[000128dc] cafc 0032                 mulu.w     #$0032,d5
[000128e0] 3f3c 0031                 move.w     #$0031,-(a7)
[000128e4] 4874 5000                 pea.l      0(a4,d5.w)
[000128e8] 4267                      clr.w      -(a7)
[000128ea] 4eb9 0001 09d8            jsr        GEMDOS.GetPath
[000128f0] 508f                      addq.l     #8,a7
[000128f2] 3a2e fffe                 move.w     -2(a6),d5
[000128f6] 286e 0008                 movea.l    8(a6),a4
[000128fa] cafc 0032                 mulu.w     #$0032,d5
[000128fe] 4a34 5000                 tst.b      0(a4,d5.w)
[00012902] 6640                      bne.s      $00012944
[00012904] 3a2e fffe                 move.w     -2(a6),d5
[00012908] 286e 0008                 movea.l    8(a6),a4
[0001290c] cafc 0032                 mulu.w     #$0032,d5
[00012910] 47f9 0001 2b70            lea.l      $00012B70,a3
[00012916] 49f4 5000                 lea.l      0(a4,d5.w),a4
[0001291a] 7a03                      moveq.l    #3,d5
[0001291c] 18db                      move.b     (a3)+,(a4)+
[0001291e] 57cd fffc                 dbeq       d5,$0001291C
[00012922] 486e fffa                 pea.l      -6(a6)
[00012926] 4eb9 0001 08ca            jsr        GEMDOS.GetDrv
[0001292c] 588f                      addq.l     #4,a7
[0001292e] 7a41                      moveq.l    #65,d5
[00012930] da6e fffa                 add.w      -6(a6),d5
[00012934] 382e fffe                 move.w     -2(a6),d4
[00012938] 286e 0008                 movea.l    8(a6),a4
[0001293c] c8fc 0032                 mulu.w     #$0032,d4
[00012940] 1985 4000                 move.b     d5,0(a4,d4.w)
[00012944] 3a2e fffe                 move.w     -2(a6),d5
[00012948] 286e 0008                 movea.l    8(a6),a4
[0001294c] cafc 0032                 mulu.w     #$0032,d5
[00012950] 0c34 003a 5001            cmpi.b     #$3A,1(a4,d5.w)
[00012956] 674c                      beq.s      $000129A4
[00012958] 3f3c 0001                 move.w     #$0001,-(a7)
[0001295c] 4879 0001 2b74            pea.l      $00012B74
[00012962] 3a2e fffe                 move.w     -2(a6),d5
[00012966] 286e 0008                 movea.l    8(a6),a4
[0001296a] cafc 0032                 mulu.w     #$0032,d5
[0001296e] 3f3c 0031                 move.w     #$0031,-(a7)
[00012972] 4874 5000                 pea.l      0(a4,d5.w)
[00012976] 4267                      clr.w      -(a7)
[00012978] 4eb9 0001 1cd6            jsr        Strings.Insert
[0001297e] 4fef 000e                 lea.l      14(a7),a7
[00012982] 486e fffa                 pea.l      -6(a6)
[00012986] 4eb9 0001 08ca            jsr        GEMDOS.GetDrv
[0001298c] 588f                      addq.l     #4,a7
[0001298e] 7a41                      moveq.l    #65,d5
[00012990] da6e fffa                 add.w      -6(a6),d5
[00012994] 382e fffe                 move.w     -2(a6),d4
[00012998] 286e 0008                 movea.l    8(a6),a4
[0001299c] c8fc 0032                 mulu.w     #$0032,d4
[000129a0] 1985 4000                 move.b     d5,0(a4,d4.w)
[000129a4] 558f                      subq.l     #2,a7
[000129a6] 3a2e fffe                 move.w     -2(a6),d5
[000129aa] 286e 0008                 movea.l    8(a6),a4
[000129ae] cafc 0032                 mulu.w     #$0032,d5
[000129b2] 3f3c 0031                 move.w     #$0031,-(a7)
[000129b6] 4874 5000                 pea.l      0(a4,d5.w)
[000129ba] 4eb9 0001 1ea0            jsr        Strings.Length
[000129c0] 5c8f                      addq.l     #6,a7
[000129c2] 3d5f fffc                 move.w     (a7)+,-4(a6)
[000129c6] 0c6e 0002 fffc            cmpi.w     #$0002,-4(a6)
[000129cc] 631e                      bls.s      $000129EC
[000129ce] 3a2e fffe                 move.w     -2(a6),d5
[000129d2] 286e 0008                 movea.l    8(a6),a4
[000129d6] cafc 0032                 mulu.w     #$0032,d5
[000129da] 382e fffc                 move.w     -4(a6),d4
[000129de] 5344                      subq.w     #1,d4
[000129e0] 49f4 5000                 lea.l      0(a4,d5.w),a4
[000129e4] 0c34 005c 4000            cmpi.b     #$5C,0(a4,d4.w)
[000129ea] 6734                      beq.s      $00012A20
[000129ec] 3a2e fffe                 move.w     -2(a6),d5
[000129f0] 286e 0008                 movea.l    8(a6),a4
[000129f4] cafc 0032                 mulu.w     #$0032,d5
[000129f8] 382e fffc                 move.w     -4(a6),d4
[000129fc] 49f4 5000                 lea.l      0(a4,d5.w),a4
[00012a00] 19bc 005c 4000            move.b     #$5C,0(a4,d4.w)
[00012a06] 3a2e fffe                 move.w     -2(a6),d5
[00012a0a] 286e 0008                 movea.l    8(a6),a4
[00012a0e] cafc 0032                 mulu.w     #$0032,d5
[00012a12] 382e fffc                 move.w     -4(a6),d4
[00012a16] 5244                      addq.w     #1,d4
[00012a18] 49f4 5000                 lea.l      0(a4,d5.w),a4
[00012a1c] 4234 4000                 clr.b      0(a4,d4.w)
[00012a20] 3a2e fffe                 move.w     -2(a6),d5
[00012a24] 286e 0008                 movea.l    8(a6),a4
[00012a28] cafc 0032                 mulu.w     #$0032,d5
[00012a2c] 0c34 005c 5002            cmpi.b     #$5C,2(a4,d5.w)
[00012a32] 6728                      beq.s      $00012A5C
[00012a34] 4267                      clr.w      -(a7)
[00012a36] 486e fff9                 pea.l      -7(a6)
[00012a3a] 3a2e fffe                 move.w     -2(a6),d5
[00012a3e] 286e 0008                 movea.l    8(a6),a4
[00012a42] cafc 0032                 mulu.w     #$0032,d5
[00012a46] 3f3c 0031                 move.w     #$0031,-(a7)
[00012a4a] 4874 5000                 pea.l      0(a4,d5.w)
[00012a4e] 3f3c 0002                 move.w     #$0002,-(a7)
[00012a52] 4eb9 0001 1cd6            jsr        Strings.Insert
[00012a58] 4fef 000e                 lea.l      14(a7),a7
[00012a5c] 526e fffe                 addq.w     #1,-2(a6)
[00012a60] 0c6e 0007 fffe            cmpi.w     #$0007,-2(a6)
[00012a66] 6600 fe54                 bne        $000128BC
[00012a6a] 4e5e                      unlk       a6
[00012a6c] 4e75                      rts

M2Option.GetCompilerOptions:
[00012a6e] 4e56 0000                 link       a6,#0
[00012a72] 4a79 0001 891e            tst.w      M2Option.accId
[00012a78] 6d36                      blt.s      $00012AB0
[00012a7a] 3f3c 0003                 move.w     #$0003,-(a7)
[00012a7e] 4eb9 0001 276a            jsr        M2Option.SendMsg
[00012a84] 548f                      addq.l     #2,a7
[00012a86] 3a39 0001 8946            move.w     $00018946,d5
[00012a8c] 48c5                      ext.l      d5
[00012a8e] 286e 0010                 movea.l    16(a6),a4
[00012a92] 1885                      move.b     d5,(a4)
[00012a94] 3a39 0001 8948            move.w     $00018948,d5
[00012a9a] 48c5                      ext.l      d5
[00012a9c] 286e 000c                 movea.l    12(a6),a4
[00012aa0] 1885                      move.b     d5,(a4)
[00012aa2] 286e 0008                 movea.l    8(a6),a4
[00012aa6] 38b9 0001 894a            move.w     M2Option.replybuf,(a4)
[00012aac] 4efa 0014                 jmp        $00012AC2(pc)
[00012ab0] 286e 0010                 movea.l    16(a6),a4
[00012ab4] 4214                      clr.b      (a4)
[00012ab6] 286e 000c                 movea.l    12(a6),a4
[00012aba] 4214                      clr.b      (a4)
[00012abc] 286e 0008                 movea.l    8(a6),a4
[00012ac0] 4254                      clr.w      (a4)
[00012ac2] 4e5e                      unlk       a6
[00012ac4] 4e75                      rts

M2Option.GetLinkerOptions:
[00012ac6] 4e56 0000                 link       a6,#0
[00012aca] 4a79 0001 891e            tst.w      M2Option.accId
[00012ad0] 6d56                      blt.s      $00012B28
[00012ad2] 3f3c 0002                 move.w     #$0002,-(a7)
[00012ad6] 4eb9 0001 276a            jsr        M2Option.SendMsg
[00012adc] 548f                      addq.l     #2,a7
[00012ade] 3a39 0001 8946            move.w     $00018946,d5
[00012ae4] 48c5                      ext.l      d5
[00012ae6] 286e 000c                 movea.l    12(a6),a4
[00012aea] 1885                      move.b     d5,(a4)
[00012aec] 3a39 0001 8948            move.w     $00018948,d5
[00012af2] 48c5                      ext.l      d5
[00012af4] 286e 0010                 movea.l    16(a6),a4
[00012af8] 1885                      move.b     d5,(a4)
[00012afa] 3a39 0001 894a            move.w     M2Option.replybuf,d5
[00012b00] 48c5                      ext.l      d5
[00012b02] 286e 0014                 movea.l    20(a6),a4
[00012b06] 1885                      move.b     d5,(a4)
[00012b08] 7a00                      moveq.l    #0,d5
[00012b0a] 3a39 0001 894c            move.w     $0001894C,d5
[00012b10] 7010                      moveq.l    #16,d0
[00012b12] e1a5                      asl.l      d0,d5
[00012b14] 7800                      moveq.l    #0,d4
[00012b16] 3839 0001 894e            move.w     $0001894E,d4
[00012b1c] da84                      add.l      d4,d5
[00012b1e] 286e 0008                 movea.l    8(a6),a4
[00012b22] 2885                      move.l     d5,(a4)
[00012b24] 4efa 001a                 jmp        $00012B40(pc)
[00012b28] 286e 000c                 movea.l    12(a6),a4
[00012b2c] 4214                      clr.b      (a4)
[00012b2e] 286e 0014                 movea.l    20(a6),a4
[00012b32] 4214                      clr.b      (a4)
[00012b34] 286e 0010                 movea.l    16(a6),a4
[00012b38] 4214                      clr.b      (a4)
[00012b3a] 286e 0008                 movea.l    8(a6),a4
[00012b3e] 4294                      clr.l      (a4)
[00012b40] 4e5e                      unlk       a6
[00012b42] 4e75                      rts

M2Option.init:
[00012b44] 4ef9 0001 2624            jmp        ExecUtil.init
[00012b4a] 4e56 0000                 link       a6,#0
[00012b4e] 558f                      subq.l     #2,a7
[00012b50] 3f3c 0007                 move.w     #$0007,-(a7)
[00012b54] 4879 0001 2b78            pea.l      $00012B78
[00012b5a] 4eb9 0001 1a9e            jsr        AESApplications.ApplFind
[00012b60] 5c8f                      addq.l     #6,a7
[00012b62] 33df 0001 891e            move.w     (a7)+,M2Option.accId
[00012b68] 4e5e                      unlk       a6
[00012b6a] 4ef9 0001 3ef2            jmp        NewStreams.init+6

[00012b70] 413a 5c00                 chk.l      $00018772(pc),d0 ; 68020+ only
[00012b74] 413a 0000                 chk.l      $00012B76(pc),d0 ; 68020+ only
[00012b78] 4d32 4f50                 chk.l      (a2,zd4.l*8),d6 ; 68020+ only
[00012b7c] 5449                      addq.w     #2,a1
[00012b7e] 4f4e                      lea.l      (b6),b7 ; apollo only
[00012b80] 0000

***
* MODULE NewStreams
***

NewStreams.FileError:
[00012b82] 4e56                      link       a6,#-402
[00012b84] 4267                      clr.w      -(a7)
           7aff                      moveq.l    #-1,d5
[00012b8a] 2f05                      move.l     d5,-(a7)
[00012b8c] 4eb9 0001 0cb0            jsr        AESGraphics.GrafMouse
[00012b92] 5c8f                      addq.l     #6,a7
[00012b94] 0c6e ffdf 0008            cmpi.w     #$FFDF,8(a6)
[00012b9a] 6602                      bne.s      $00012B9E
[00012b9c] 6004                      bra.s      $00012BA2
[00012b9e] 4efa 008e                 jmp        $00012C2E(pc)
[00012ba2] 49f9 0001 3faa            lea.l      $00013FAA,a4
[00012ba8] 47ee ff36                 lea.l      -202(a6),a3
[00012bac] 7a2b                      moveq.l    #43,d5
[00012bae] 16dc                      move.b     (a4)+,(a3)+
[00012bb0] 57cd fffc                 dbeq       d5,$00012BAE
[00012bb4] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012bb8] 486e ff36                 pea.l      -202(a6)
[00012bbc] 3a2e 000e                 move.w     14(a6),d5
[00012bc0] 3f05                      move.w     d5,-(a7)
[00012bc2] 286e 000a                 movea.l    10(a6),a4
[00012bc6] 4854                      pea.l      (a4)
[00012bc8] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012bcc] 486e fe6e                 pea.l      -402(a6)
[00012bd0] 4eb9 0001 1dba            jsr        Strings.Concat
[00012bd6] 4fef 0012                 lea.l      18(a7),a7
[00012bda] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012bde] 486e fe6e                 pea.l      -402(a6)
[00012be2] 3f3c 0015                 move.w     #$0015,-(a7)
[00012be6] 4879 0001 3fd6            pea.l      $00013FD6
[00012bec] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012bf0] 486e ff36                 pea.l      -202(a6)
[00012bf4] 4eb9 0001 1dba            jsr        Strings.Concat
[00012bfa] 4fef 0012                 lea.l      18(a7),a7
[00012bfe] 558f                      subq.l     #2,a7
[00012c00] 3f3c 0001                 move.w     #$0001,-(a7)
[00012c04] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012c08] 486e ff36                 pea.l      -202(a6)
[00012c0c] 4eb9 0001 1afa            jsr        AESForms.FormAlert
[00012c12] 508f                      addq.l     #8,a7
[00012c14] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00012c18] 0c6e 0001 fffe            cmpi.w     #$0001,-2(a6)
[00012c1e] 56c5                      sne        d5
[00012c20] 4405                      neg.b      d5
[00012c22] 1d45 0010                 move.b     d5,16(a6)
[00012c26] 4e5e                      unlk       a6
[00012c28] 4e75                      rts
[00012c2a] 4efa 001e                 jmp        $00012C4A(pc)
[00012c2e] 558f                      subq.l     #2,a7
[00012c30] 3f2e 0008                 move.w     8(a6),-(a7)
[00012c34] 4eb9 0001 1b38            jsr        AESForms.FormError
[00012c3a] 548f                      addq.l     #2,a7
[00012c3c] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00012c40] 1d7c 0001 0010            move.b     #$01,16(a6)
[00012c46] 4e5e                      unlk       a6
[00012c48] 4e75                      rts

NewStreams.Error:
[00012c4a] 4e56 fe6e                 link       a6,#-402
[00012c4e] 4267                      clr.w      -(a7)
[00012c50] 7aff                      moveq.l    #-1,d5
[00012c52] 2f05                      move.l     d5,-(a7)
[00012c54] 4eb9 0001 0cb0            jsr        AESGraphics.GrafMouse
[00012c5a] 5c8f                      addq.l     #6,a7
[00012c5c] 49f9 0001 3fee            lea.l      $00013FEE,a4
[00012c62] 47ee ff36                 lea.l      -202(a6),a3
[00012c66] 7a23                      moveq.l    #35,d5
[00012c68] 16dc                      move.b     (a4)+,(a3)+
[00012c6a] 57cd fffc                 dbeq       d5,$00012C68
[00012c6e] 4a2e 0008                 tst.b      8(a6)
[00012c72] 6728                      beq.s      $00012C9C
[00012c74] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012c78] 486e ff36                 pea.l      -202(a6)
[00012c7c] 3f3c 0006                 move.w     #$0006,-(a7)
[00012c80] 4879 0001 4012            pea.l      $00014012
[00012c86] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012c8a] 486e fe6e                 pea.l      -402(a6)
[00012c8e] 4eb9 0001 1dba            jsr        Strings.Concat
[00012c94] 4fef 0012                 lea.l      18(a7),a7
[00012c98] 4efa 0026                 jmp        $00012CC0(pc)
[00012c9c] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012ca0] 486e ff36                 pea.l      -202(a6)
[00012ca4] 3f3c 0006                 move.w     #$0006,-(a7)
[00012ca8] 4879 0001 401a            pea.l      $0001401A
[00012cae] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012cb2] 486e fe6e                 pea.l      -402(a6)
[00012cb6] 4eb9 0001 1dba            jsr        Strings.Concat
[00012cbc] 4fef 0012                 lea.l      18(a7),a7
[00012cc0] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012cc4] 486e fe6e                 pea.l      -402(a6)
[00012cc8] 3f3c 000e                 move.w     #$000E,-(a7)
[00012ccc] 4879 0001 4022            pea.l      $00014022
[00012cd2] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012cd6] 486e ff36                 pea.l      -202(a6)
[00012cda] 4eb9 0001 1dba            jsr        Strings.Concat
[00012ce0] 4fef 0012                 lea.l      18(a7),a7
[00012ce4] 558f                      subq.l     #2,a7
[00012ce6] 3f3c 0001                 move.w     #$0001,-(a7)
[00012cea] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012cee] 486e ff36                 pea.l      -202(a6)
[00012cf2] 4eb9 0001 1afa            jsr        AESForms.FormAlert
[00012cf8] 508f                      addq.l     #8,a7
[00012cfa] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00012cfe] 3f3c 0063                 move.w     #$0063,-(a7)
[00012d02] 1f3c 0001                 move.b     #$01,-(a7)
[00012d06] 4eb9 0001 2466            jsr        ExecUtil.IOError
[00012d0c] 588f                      addq.l     #4,a7
[00012d0e] 4e5e                      unlk       a6
[00012d10] 4e75                      rts

NewStreams.Enospace:
[00012d12] 4e56 ffae                 link       a6,#-82
[00012d16] 4267                      clr.w      -(a7)
[00012d18] 7aff                      moveq.l    #-1,d5
[00012d1a] 2f05                      move.l     d5,-(a7)
[00012d1c] 4eb9 0001 0cb0            jsr        AESGraphics.GrafMouse
[00012d22] 5c8f                      addq.l     #6,a7
[00012d24] 49f9 0001 4032            lea.l      $00014032,a4
[00012d2a] 47ee ffae                 lea.l      -82(a6),a3
[00012d2e] 7a4b                      moveq.l    #75,d5
[00012d30] 16dc                      move.b     (a4)+,(a3)+
[00012d32] 57cd fffc                 dbeq       d5,$00012D30
[00012d36] 558f                      subq.l     #2,a7
[00012d38] 3f3c 0001                 move.w     #$0001,-(a7)
[00012d3c] 3f3c 004f                 move.w     #$004F,-(a7)
[00012d40] 486e ffae                 pea.l      -82(a6)
[00012d44] 4eb9 0001 1afa            jsr        AESForms.FormAlert
[00012d4a] 508f                      addq.l     #8,a7
[00012d4c] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00012d50] 3f3c 0063                 move.w     #$0063,-(a7)
[00012d54] 1f3c 0001                 move.b     #$01,-(a7)
[00012d58] 4eb9 0001 2466            jsr        ExecUtil.IOError
[00012d5e] 588f                      addq.l     #4,a7
[00012d60] 4e5e                      unlk       a6
[00012d62] 4e75                      rts

NewStreams.Enomem:
[00012d64] 4e56 ffae                 link       a6,#-82
[00012d68] 4267                      clr.w      -(a7)
[00012d6a] 7aff                      moveq.l    #-1,d5
[00012d6c] 2f05                      move.l     d5,-(a7)
[00012d6e] 4eb9 0001 0cb0            jsr        AESGraphics.GrafMouse
[00012d74] 5c8f                      addq.l     #6,a7
[00012d76] 49f9 0001 407e            lea.l      $0001407E,a4
[00012d7c] 47ee ffae                 lea.l      -82(a6),a3
[00012d80] 7a2e                      moveq.l    #46,d5
[00012d82] 16dc                      move.b     (a4)+,(a3)+
[00012d84] 57cd fffc                 dbeq       d5,$00012D82
[00012d88] 558f                      subq.l     #2,a7
[00012d8a] 3f3c 0001                 move.w     #$0001,-(a7)
[00012d8e] 3f3c 004f                 move.w     #$004F,-(a7)
[00012d92] 486e ffae                 pea.l      -82(a6)
[00012d96] 4eb9 0001 1afa            jsr        AESForms.FormAlert
[00012d9c] 508f                      addq.l     #8,a7
[00012d9e] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00012da2] 3f3c 0063                 move.w     #$0063,-(a7)
[00012da6] 1f3c 0001                 move.b     #$01,-(a7)
[00012daa] 4eb9 0001 2466            jsr        ExecUtil.IOError
[00012db0] 588f                      addq.l     #4,a7
[00012db2] 4e5e                      unlk       a6
[00012db4] 4e75                      rts

NewStreams.setExtension:
[00012db6] 4e56 fff8                 link       a6,#-8
[00012dba] 286e 0008                 movea.l    8(a6),a4
[00012dbe] 2d54 fffc                 move.l     (a4),-4(a6)
[00012dc2] 426e fffa                 clr.w      -6(a6)
[00012dc6] 426e fff8                 clr.w      -8(a6)
[00012dca] 286d fffc                 movea.l    -4(a5),a4
[00012dce] 3a2e fffa                 move.w     -6(a6),d5
[00012dd2] ba6c 000e                 cmp.w      14(a4),d5
[00012dd6] 6236                      bhi.s      $00012E0E
[00012dd8] 286d fffc                 movea.l    -4(a5),a4
[00012ddc] 3a2e fffa                 move.w     -6(a6),d5
[00012de0] 286c 000a                 movea.l    10(a4),a4
[00012de4] 4a34 5000                 tst.b      0(a4,d5.w)
[00012de8] 6724                      beq.s      $00012E0E
[00012dea] 286d fffc                 movea.l    -4(a5),a4
[00012dee] 3a2e fffa                 move.w     -6(a6),d5
[00012df2] 286c 000a                 movea.l    10(a4),a4
[00012df6] 0c34 005c 5000            cmpi.b     #$5C,0(a4,d5.w)
[00012dfc] 660a                      bne.s      $00012E08
[00012dfe] 3a2e fffa                 move.w     -6(a6),d5
[00012e02] 5245                      addq.w     #1,d5
[00012e04] 3d45 fff8                 move.w     d5,-8(a6)
[00012e08] 526e fffa                 addq.w     #1,-6(a6)
[00012e0c] 60bc                      bra.s      $00012DCA
[00012e0e] 3d6e fff8 fffa            move.w     -8(a6),-6(a6)
[00012e14] 286d fffc                 movea.l    -4(a5),a4
[00012e18] 3a2e fffa                 move.w     -6(a6),d5
[00012e1c] ba6c 000e                 cmp.w      14(a4),d5
[00012e20] 623a                      bhi.s      $00012E5C
[00012e22] 286d fffc                 movea.l    -4(a5),a4
[00012e26] 3a2e fffa                 move.w     -6(a6),d5
[00012e2a] 286c 000a                 movea.l    10(a4),a4
[00012e2e] 4a34 5000                 tst.b      0(a4,d5.w)
[00012e32] 6728                      beq.s      $00012E5C
[00012e34] 286d fffc                 movea.l    -4(a5),a4
[00012e38] 3a2e fffa                 move.w     -6(a6),d5
[00012e3c] 286c 000a                 movea.l    10(a4),a4
[00012e40] 0c34 002e 5000            cmpi.b     #$2E,0(a4,d5.w)
[00012e46] 6714                      beq.s      $00012E5C
[00012e48] 3a2e fffa                 move.w     -6(a6),d5
[00012e4c] 9a6e fff8                 sub.w      -8(a6),d5
[00012e50] 0c45 0008                 cmpi.w     #$0008,d5
[00012e54] 6406                      bcc.s      $00012E5C
[00012e56] 526e fffa                 addq.w     #1,-6(a6)
[00012e5a] 60b8                      bra.s      $00012E14
[00012e5c] 286d fffc                 movea.l    -4(a5),a4
[00012e60] 3a2c 000e                 move.w     14(a4),d5
[00012e64] 5545                      subq.w     #2,d5
[00012e66] 5545                      subq.w     #2,d5
[00012e68] ba6e fffa                 cmp.w      -6(a6),d5
[00012e6c] 6404                      bcc.s      $00012E72
[00012e6e] 4e5e                      unlk       a6
[00012e70] 4e75                      rts
[00012e72] 286d fffc                 movea.l    -4(a5),a4
[00012e76] 3a2e fffa                 move.w     -6(a6),d5
[00012e7a] 286c 000a                 movea.l    10(a4),a4
[00012e7e] 0c34 002e 5000            cmpi.b     #$2E,0(a4,d5.w)
[00012e84] 6712                      beq.s      $00012E98
[00012e86] 286d fffc                 movea.l    -4(a5),a4
[00012e8a] 3a2e fffa                 move.w     -6(a6),d5
[00012e8e] 286c 000a                 movea.l    10(a4),a4
[00012e92] 19bc 002e 5000            move.b     #$2E,0(a4,d5.w)
[00012e98] 426e fff8                 clr.w      -8(a6)
[00012e9c] 526e fffa                 addq.w     #1,-6(a6)
[00012ea0] 3a2e fff8                 move.w     -8(a6),d5
[00012ea4] 49ee fffc                 lea.l      -4(a6),a4
[00012ea8] 266d fffc                 movea.l    -4(a5),a3
[00012eac] 382e fffa                 move.w     -6(a6),d4
[00012eb0] 266b 000a                 movea.l    10(a3),a3
[00012eb4] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[00012eba] 526e fff8                 addq.w     #1,-8(a6)
[00012ebe] 0c6e 0003 fff8            cmpi.w     #$0003,-8(a6)
[00012ec4] 66d6                      bne.s      $00012E9C
[00012ec6] 286d fffc                 movea.l    -4(a5),a4
[00012eca] 3a2e fffa                 move.w     -6(a6),d5
[00012ece] ba6c 000e                 cmp.w      14(a4),d5
[00012ed2] 6412                      bcc.s      $00012EE6
[00012ed4] 286d fffc                 movea.l    -4(a5),a4
[00012ed8] 3a2e fffa                 move.w     -6(a6),d5
[00012edc] 5245                      addq.w     #1,d5
[00012ede] 286c 000a                 movea.l    10(a4),a4
[00012ee2] 4234 5000                 clr.b      0(a4,d5.w)
[00012ee6] 4e5e                      unlk       a6
[00012ee8] 4e75                      rts

NewStreams.SetFileExtension:
[00012eea] 4e56 0000                 link       a6,#0
[00012eee] 2f2d fffc                 move.l     -4(a5),-(a7)
[00012ef2] 2b4e fffc                 move.l     a6,-4(a5)
[00012ef6] 7a00                      moveq.l    #0,d5
[00012ef8] 3a2e 0008                 move.w     8(a6),d5
[00012efc] 2005                      move.l     d5,d0
[00012efe] 4eb9 0001 000a            jsr        CASEX
[00012f04] 0000 0000
[00012f08] 0000 0011
[00012f0c] 0000 0114
[00012f10] 4efa 0136                 jmp        $00013048(pc)
[00012f14] 4879 0001 40ae            pea.l      $000140AE
[00012f1a] 6100 fe9a                 bsr        NewStreams.setExtension
[00012f1e] 588f                      addq.l     #4,a7
[00012f20] 4efa 0126                 jmp        $00013048(pc)
[00012f24] 4879 0001 40b2            pea.l      $000140B2
[00012f2a] 6100 fe8a                 bsr        NewStreams.setExtension
[00012f2e] 588f                      addq.l     #4,a7
[00012f30] 4efa 0116                 jmp        $00013048(pc)
[00012f34] 4879 0001 40b6            pea.l      $000140B6
[00012f3a] 6100 fe7a                 bsr        NewStreams.setExtension
[00012f3e] 588f                      addq.l     #4,a7
[00012f40] 4efa 0106                 jmp        $00013048(pc)
[00012f44] 4879 0001 40ba            pea.l      $000140BA
[00012f4a] 6100 fe6a                 bsr        NewStreams.setExtension
[00012f4e] 588f                      addq.l     #4,a7
[00012f50] 4efa 00f6                 jmp        $00013048(pc)
[00012f54] 4879 0001 40be            pea.l      $000140BE
[00012f5a] 6100 fe5a                 bsr        NewStreams.setExtension
[00012f5e] 588f                      addq.l     #4,a7
[00012f60] 4efa 00e6                 jmp        $00013048(pc)
[00012f64] 4879 0001 40c2            pea.l      $000140C2
[00012f6a] 6100 fe4a                 bsr        NewStreams.setExtension
[00012f6e] 588f                      addq.l     #4,a7
[00012f70] 4efa 00d6                 jmp        $00013048(pc)
[00012f74] 4879 0001 40c6            pea.l      $000140C6
[00012f7a] 6100 fe3a                 bsr        NewStreams.setExtension
[00012f7e] 588f                      addq.l     #4,a7
[00012f80] 4efa 00c6                 jmp        $00013048(pc)
[00012f84] 4879 0001 40ca            pea.l      $000140CA
[00012f8a] 6100 fe2a                 bsr        NewStreams.setExtension
[00012f8e] 588f                      addq.l     #4,a7
[00012f90] 4efa 00b6                 jmp        $00013048(pc)
[00012f94] 4879 0001 40ce            pea.l      $000140CE
[00012f9a] 6100 fe1a                 bsr        NewStreams.setExtension
[00012f9e] 588f                      addq.l     #4,a7
[00012fa0] 4efa 00a6                 jmp        $00013048(pc)
[00012fa4] 4879 0001 40d2            pea.l      $000140D2
[00012faa] 6100 fe0a                 bsr        NewStreams.setExtension
[00012fae] 588f                      addq.l     #4,a7
[00012fb0] 4efa 0096                 jmp        $00013048(pc)
[00012fb4] 4879 0001 40d6            pea.l      $000140D6
[00012fba] 6100 fdfa                 bsr        NewStreams.setExtension
[00012fbe] 588f                      addq.l     #4,a7
[00012fc0] 4efa 0086                 jmp        $00013048(pc)
[00012fc4] 4879 0001 40da            pea.l      $000140DA
[00012fca] 6100 fdea                 bsr        NewStreams.setExtension
[00012fce] 588f                      addq.l     #4,a7
[00012fd0] 4efa 0076                 jmp        $00013048(pc)
[00012fd4] 4879 0001 40de            pea.l      $000140DE
[00012fda] 6100 fdda                 bsr        NewStreams.setExtension
[00012fde] 588f                      addq.l     #4,a7
[00012fe0] 4efa 0066                 jmp        $00013048(pc)
[00012fe4] 4879 0001 40e2            pea.l      $000140E2
[00012fea] 6100 fdca                 bsr        NewStreams.setExtension
[00012fee] 588f                      addq.l     #4,a7
[00012ff0] 4efa 0056                 jmp        $00013048(pc)
[00012ff4] 4879 0001 40e6            pea.l      $000140E6
[00012ffa] 6100 fdba                 bsr        NewStreams.setExtension
[00012ffe] 588f                      addq.l     #4,a7
[00013000] 4efa 0046                 jmp        $00013048(pc)
[00013004] 4879 0001 40ea            pea.l      $000140EA
[0001300a] 6100 fdaa                 bsr        NewStreams.setExtension
[0001300e] 588f                      addq.l     #4,a7
[00013010] 4efa 0036                 jmp        $00013048(pc)
[00013014] 4efa 0026                 jmp        $0001303C(pc)
[00013018] 000c 0010                 ori.b      #$10,a4 ; apollo only
[0001301c] 0020 0030                 ori.b      #$30,-(a0)
[00013020] 0040 0050                 ori.w      #$0050,d0
[00013024] 0060 0070                 ori.w      #$0070,-(a0)
[00013028] 0070 0080 0090            ori.w      #$0080,-112(a0,d0.w)
[0001302e] 00a0 00b0 00c0            ori.l      #$00B000C0,-(a0)
[00013034] 00d0 00e0                 cmp2.b     (a0),d0 ; 68020+ only
[00013038] 00f0 0100 4879            cmp2.b     121(a0,d4.l),d0 ; 68020+ only
[0001303e] 0001 40ee                 ori.b      #$EE,d1
[00013042] 6100 fd72                 bsr        NewStreams.setExtension
[00013046] 588f                      addq.l     #4,a7
[00013048] 2b5f fffc                 move.l     (a7)+,-4(a5)
[0001304c] 4e5e                      unlk       a6
[0001304e] 4e75                      rts

NewStreams.max:
[00013050] 4e56 0000                 link       a6,#0
[00013054] 3a2e 000a                 move.w     10(a6),d5
[00013058] ba6e 0008                 cmp.w      8(a6),d5
[0001305c] 630e                      bls.s      $0001306C
[0001305e] 3d6e 000a 000c            move.w     10(a6),12(a6)
[00013064] 4e5e                      unlk       a6
[00013066] 4e75                      rts
[00013068] 4efa 000c                 jmp        $00013076(pc)
[0001306c] 3d6e 0008 000c            move.w     8(a6),12(a6)
[00013072] 4e5e                      unlk       a6
[00013074] 4e75                      rts

NewStreams.allocfile:
[00013076] 4e56 fffe                 link       a6,#-2
[0001307a] 4878 023c                 pea.l      ($0000023C).w
[0001307e] 286e 000e                 movea.l    14(a6),a4
[00013082] 4854                      pea.l      (a4)
[00013084] 4eb9 0001 09fc            jsr        GEMDOS.Alloc
[0001308a] 508f                      addq.l     #8,a7
[0001308c] 286e 000e                 movea.l    14(a6),a4
[00013090] 4a94                      tst.l      (a4)
[00013092] 6604                      bne.s      $00013098
[00013094] 6100 fcce                 bsr        NewStreams.Enomem
[00013098] 266e 000e                 movea.l    14(a6),a3
[0001309c] 2853                      movea.l    (a3),a4
[0001309e] 38bc ffff                 move.w     #$FFFF,(a4)
[000130a2] 426e fffe                 clr.w      -2(a6)
[000130a6] 0c6e 0027 fffe            cmpi.w     #$0027,-2(a6)
[000130ac] 6234                      bhi.s      $000130E2
[000130ae] 3a2e fffe                 move.w     -2(a6),d5
[000130b2] ba6e 000c                 cmp.w      12(a6),d5
[000130b6] 622a                      bhi.s      $000130E2
[000130b8] 3a2e fffe                 move.w     -2(a6),d5
[000130bc] 266e 0008                 movea.l    8(a6),a3
[000130c0] 4a33 5000                 tst.b      0(a3,d5.w)
[000130c4] 671c                      beq.s      $000130E2
[000130c6] 3a2e fffe                 move.w     -2(a6),d5
[000130ca] 266e 0008                 movea.l    8(a6),a3
[000130ce] 382e fffe                 move.w     -2(a6),d4
[000130d2] 45ec 0002                 lea.l      2(a4),a2
[000130d6] 15b3 5000 4000            move.b     0(a3,d5.w),0(a2,d4.w)
[000130dc] 526e fffe                 addq.w     #1,-2(a6)
[000130e0] 60c4                      bra.s      $000130A6
[000130e2] 0c6e 0027 fffe            cmpi.w     #$0027,-2(a6)
[000130e8] 6210                      bhi.s      $000130FA
[000130ea] 3a2e fffe                 move.w     -2(a6),d5
[000130ee] 47ec 0002                 lea.l      2(a4),a3
[000130f2] 4233 5000                 clr.b      0(a3,d5.w)
[000130f6] 4efa 0006                 jmp        $000130FE(pc)
[000130fa] 422c 0029                 clr.b      41(a4)
[000130fe] 42ac 002a                 clr.l      42(a4)
[00013102] 7aff                      moveq.l    #-1,d5
[00013104] 2945 002e                 move.l     d5,46(a4)
[00013108] 426c 0032                 clr.w      50(a4)
[0001310c] 42ac 0034                 clr.l      52(a4)
[00013110] 422c 0038                 clr.b      56(a4)
[00013114] 4e5e                      unlk       a6
[00013116] 4e75                      rts

NewStreams.flush:
[00013118] 4e56 fffc                 link       a6,#-4
[0001311c] 266e 0008                 movea.l    8(a6),a3
[00013120] 2853                      movea.l    (a3),a4
[00013122] 4a2c 0038                 tst.b      56(a4)
[00013126] 6768                      beq.s      $00013190
[00013128] 7a00                      moveq.l    #0,d5
[0001312a] 3a2c 0032                 move.w     50(a4),d5
[0001312e] 2d45 fffc                 move.l     d5,-4(a6)
[00013132] 4aae fffc                 tst.l      -4(a6)
[00013136] 6758                      beq.s      $00013190
[00013138] 2f0c                      move.l     a4,-(a7)
[0001313a] 3f14                      move.w     (a4),-(a7)
[0001313c] 486e fffc                 pea.l      -4(a6)
[00013140] 47ec 003a                 lea.l      58(a4),a3
[00013144] 2a0b                      move.l     a3,d5
[00013146] 2f05                      move.l     d5,-(a7)
[00013148] 4eb9 0001 0982            jsr        GEMDOS.Write
[0001314e] 4fef 000a                 lea.l      10(a7),a7
[00013152] 285f                      movea.l    (a7)+,a4
[00013154] 4aae fffc                 tst.l      -4(a6)
[00013158] 6412                      bcc.s      $0001316C
[0001315a] 2f0c                      move.l     a4,-(a7)
[0001315c] 1f3c 0001                 move.b     #$01,-(a7)
[00013160] 6100 fae8                 bsr        NewStreams.Error
[00013164] 548f                      addq.l     #2,a7
[00013166] 285f                      movea.l    (a7)+,a4
[00013168] 4efa 0016                 jmp        $00013180(pc)
[0001316c] 7a00                      moveq.l    #0,d5
[0001316e] 3a2c 0032                 move.w     50(a4),d5
[00013172] baae fffc                 cmp.l      -4(a6),d5
[00013176] 6708                      beq.s      $00013180
[00013178] 2f0c                      move.l     a4,-(a7)
[0001317a] 6100 fb96                 bsr        NewStreams.Enospace
[0001317e] 285f                      movea.l    (a7)+,a4
[00013180] 2a2c 0034                 move.l     52(a4),d5
[00013184] baac 002a                 cmp.l      42(a4),d5
[00013188] 6306                      bls.s      $00013190
[0001318a] 296c 0034 002a            move.l     52(a4),42(a4)
[00013190] 7aff                      moveq.l    #-1,d5
[00013192] 2945 002e                 move.l     d5,46(a4)
[00013196] 426c 0032                 clr.w      50(a4)
[0001319a] 422c 0038                 clr.b      56(a4)
[0001319e] 4e5e                      unlk       a6
[000131a0] 4e75                      rts

NewStreams.readbyte:
[000131a2] 4e56 fff8                 link       a6,#-8
[000131a6] 286e 000c                 movea.l    12(a6),a4
[000131aa] 2a2c 0034                 move.l     52(a4),d5
[000131ae] e28d                      lsr.l      #1,d5
[000131b0] e08d                      lsr.l      #8,d5
[000131b2] 7009                      moveq.l    #9,d0
[000131b4] e1a5                      asl.l      d0,d5
[000131b6] baac 002e                 cmp.l      46(a4),d5
[000131ba] 6702                      beq.s      $000131BE
[000131bc] 6004                      bra.s      $000131C2
[000131be] 4efa 007e                 jmp        $0001323E(pc)
[000131c2] 2f0c                      move.l     a4,-(a7)
[000131c4] 486e 000c                 pea.l      12(a6)
[000131c8] 6100 ff4e                 bsr        NewStreams.flush
[000131cc] 588f                      addq.l     #4,a7
[000131ce] 285f                      movea.l    (a7)+,a4
[000131d0] 2a2c 0034                 move.l     52(a4),d5
[000131d4] e28d                      lsr.l      #1,d5
[000131d6] e08d                      lsr.l      #8,d5
[000131d8] 7009                      moveq.l    #9,d0
[000131da] e1a5                      asl.l      d0,d5
[000131dc] 2945 002e                 move.l     d5,46(a4)
[000131e0] 2d6c 002e fffc            move.l     46(a4),-4(a6)
[000131e6] 2f0c                      move.l     a4,-(a7)
[000131e8] 2f2e fffc                 move.l     -4(a6),-(a7)
[000131ec] 266e 000c                 movea.l    12(a6),a3
[000131f0] 3f13                      move.w     (a3),-(a7)
[000131f2] 4227                      clr.b      -(a7)
[000131f4] 486e fffc                 pea.l      -4(a6)
[000131f8] 4eb9 0001 09ac            jsr        GEMDOS.Seek
[000131fe] 4fef 000c                 lea.l      12(a7),a7
[00013202] 285f                      movea.l    (a7)+,a4
[00013204] 2d7c 0000 0200 fff8       move.l     #$00000200,-8(a6)
[0001320c] 2f0c                      move.l     a4,-(a7)
[0001320e] 266e 000c                 movea.l    12(a6),a3
[00013212] 3f13                      move.w     (a3),-(a7)
[00013214] 486e fff8                 pea.l      -8(a6)
[00013218] 47ec 003a                 lea.l      58(a4),a3
[0001321c] 2a0b                      move.l     a3,d5
[0001321e] 2f05                      move.l     d5,-(a7)
[00013220] 4eb9 0001 0958            jsr        GEMDOS.Read
[00013226] 4fef 000a                 lea.l      10(a7),a7
[0001322a] 285f                      movea.l    (a7)+,a4
[0001322c] 4aae fff8                 tst.l      -8(a6)
[00013230] 640c                      bcc.s      $0001323E
[00013232] 2f0c                      move.l     a4,-(a7)
[00013234] 4227                      clr.b      -(a7)
[00013236] 6100 fa12                 bsr        NewStreams.Error
[0001323a] 548f                      addq.l     #2,a7
[0001323c] 285f                      movea.l    (a7)+,a4
[0001323e] 2f0c                      move.l     a4,-(a7)
[00013240] 558f                      subq.l     #2,a7
[00013242] 2a2c 0034                 move.l     52(a4),d5
[00013246] 0285 0000 01ff            andi.l     #$000001FF,d5
[0001324c] 5245                      addq.w     #1,d5
[0001324e] 3f05                      move.w     d5,-(a7)
[00013250] 3f2c 0032                 move.w     50(a4),-(a7)
[00013254] 6100 fdfa                 bsr        NewStreams.max
[00013258] 588f                      addq.l     #4,a7
[0001325a] 3a1f                      move.w     (a7)+,d5
[0001325c] 285f                      movea.l    (a7)+,a4
[0001325e] 3945 0032                 move.w     d5,50(a4)
[00013262] 2a2c 0034                 move.l     52(a4),d5
[00013266] 0285 0000 01ff            andi.l     #$000001FF,d5
[0001326c] 47ec 003a                 lea.l      58(a4),a3
[00013270] 246e 0008                 movea.l    8(a6),a2
[00013274] 14b3 5000                 move.b     0(a3,d5.w),(a2)
[00013278] 52ac 0034                 addq.l     #1,52(a4)
[0001327c] 4e5e                      unlk       a6
[0001327e] 4e75                      rts

NewStreams.read16bit:
[00013280] 4e56 fffe                 link       a6,#-2
[00013284] 2f2e 000c                 move.l     12(a6),-(a7)
[00013288] 486e ffff                 pea.l      -1(a6)
[0001328c] 6100 ff14                 bsr        NewStreams.readbyte
[00013290] 508f                      addq.l     #8,a7
[00013292] 2f2e 000c                 move.l     12(a6),-(a7)
[00013296] 486e fffe                 pea.l      -2(a6)
[0001329a] 6100 ff06                 bsr        NewStreams.readbyte
[0001329e] 508f                      addq.l     #8,a7
[000132a0] 7a00                      moveq.l    #0,d5
[000132a2] 1a2e ffff                 move.b     -1(a6),d5
[000132a6] e145                      asl.w      #8,d5
[000132a8] 7800                      moveq.l    #0,d4
[000132aa] 182e fffe                 move.b     -2(a6),d4
[000132ae] da44                      add.w      d4,d5
[000132b0] 286e 0008                 movea.l    8(a6),a4
[000132b4] 3885                      move.w     d5,(a4)
[000132b6] 4e5e                      unlk       a6
[000132b8] 4e75                      rts

NewStreams.writebyte:
[000132ba] 4e56 fff8                 link       a6,#-8
[000132be] 286e 000c                 movea.l    12(a6),a4
[000132c2] 2a2c 0034                 move.l     52(a4),d5
[000132c6] e28d                      lsr.l      #1,d5
[000132c8] e08d                      lsr.l      #8,d5
[000132ca] 7009                      moveq.l    #9,d0
[000132cc] e1a5                      asl.l      d0,d5
[000132ce] baac 002e                 cmp.l      46(a4),d5
[000132d2] 6702                      beq.s      $000132D6
[000132d4] 6004                      bra.s      $000132DA
[000132d6] 4efa 0090                 jmp        $00013368(pc)
[000132da] 2f0c                      move.l     a4,-(a7)
[000132dc] 486e 000c                 pea.l      12(a6)
[000132e0] 6100 fe36                 bsr        NewStreams.flush
[000132e4] 588f                      addq.l     #4,a7
[000132e6] 285f                      movea.l    (a7)+,a4
[000132e8] 2a2c 0034                 move.l     52(a4),d5
[000132ec] e28d                      lsr.l      #1,d5
[000132ee] e08d                      lsr.l      #8,d5
[000132f0] 7009                      moveq.l    #9,d0
[000132f2] e1a5                      asl.l      d0,d5
[000132f4] 2945 002e                 move.l     d5,46(a4)
[000132f8] 2d6c 002e fffc            move.l     46(a4),-4(a6)
[000132fe] 2f0c                      move.l     a4,-(a7)
[00013300] 2f2e fffc                 move.l     -4(a6),-(a7)
[00013304] 266e 000c                 movea.l    12(a6),a3
[00013308] 3f13                      move.w     (a3),-(a7)
[0001330a] 4227                      clr.b      -(a7)
[0001330c] 486e fffc                 pea.l      -4(a6)
[00013310] 4eb9 0001 09ac            jsr        GEMDOS.Seek
[00013316] 4fef 000c                 lea.l      12(a7),a7
[0001331a] 285f                      movea.l    (a7)+,a4
[0001331c] 2d7c 0000 0200 fff8       move.l     #$00000200,-8(a6)
[00013324] 2f0c                      move.l     a4,-(a7)
[00013326] 266e 000c                 movea.l    12(a6),a3
[0001332a] 3f13                      move.w     (a3),-(a7)
[0001332c] 486e fff8                 pea.l      -8(a6)
[00013330] 47ec 003a                 lea.l      58(a4),a3
[00013334] 2a0b                      move.l     a3,d5
[00013336] 2f05                      move.l     d5,-(a7)
[00013338] 4eb9 0001 0958            jsr        GEMDOS.Read
[0001333e] 4fef 000a                 lea.l      10(a7),a7
[00013342] 285f                      movea.l    (a7)+,a4
[00013344] 2d6c 002e fffc            move.l     46(a4),-4(a6)
[0001334a] 2f0c                      move.l     a4,-(a7)
[0001334c] 2f2e fffc                 move.l     -4(a6),-(a7)
[00013350] 266e 000c                 movea.l    12(a6),a3
[00013354] 3f13                      move.w     (a3),-(a7)
[00013356] 4227                      clr.b      -(a7)
[00013358] 486e fffc                 pea.l      -4(a6)
[0001335c] 4eb9 0001 09ac            jsr        GEMDOS.Seek
[00013362] 4fef 000c                 lea.l      12(a7),a7
[00013366] 285f                      movea.l    (a7)+,a4
[00013368] 2f0c                      move.l     a4,-(a7)
[0001336a] 558f                      subq.l     #2,a7
[0001336c] 2a2c 0034                 move.l     52(a4),d5
[00013370] 0285 0000 01ff            andi.l     #$000001FF,d5
[00013376] 5245                      addq.w     #1,d5
[00013378] 3f05                      move.w     d5,-(a7)
[0001337a] 3f2c 0032                 move.w     50(a4),-(a7)
[0001337e] 6100 fcd0                 bsr        NewStreams.max
[00013382] 588f                      addq.l     #4,a7
[00013384] 3a1f                      move.w     (a7)+,d5
[00013386] 285f                      movea.l    (a7)+,a4
[00013388] 3945 0032                 move.w     d5,50(a4)
[0001338c] 2a2c 0034                 move.l     52(a4),d5
[00013390] 0285 0000 01ff            andi.l     #$000001FF,d5
[00013396] 47ec 003a                 lea.l      58(a4),a3
[0001339a] 17ae 000a 5000            move.b     10(a6),0(a3,d5.w)
[000133a0] 197c 0001 0038            move.b     #$01,56(a4)
[000133a6] 52ac 0034                 addq.l     #1,52(a4)
[000133aa] 4a2e 0008                 tst.b      8(a6)
[000133ae] 6606                      bne.s      $000133B6
[000133b0] 296c 0034 002a            move.l     52(a4),42(a4)
[000133b6] 2a2c 0034                 move.l     52(a4),d5
[000133ba] 0285 0000 01ff            andi.l     #$000001FF,d5
[000133c0] 4a85                      tst.l      d5
[000133c2] 6614                      bne.s      $000133D8
[000133c4] 2f0c                      move.l     a4,-(a7)
[000133c6] 486e 000c                 pea.l      12(a6)
[000133ca] 6100 fd4c                 bsr        NewStreams.flush
[000133ce] 588f                      addq.l     #4,a7
[000133d0] 285f                      movea.l    (a7)+,a4
[000133d2] 296c 0034 002e            move.l     52(a4),46(a4)
[000133d8] 4e5e                      unlk       a6
[000133da] 4e75                      rts

NewStreams.strupr:
[000133dc] 4e56 fffe                 link       a6,#-2
[000133e0] 426e fffe                 clr.w      -2(a6)
[000133e4] 3a2e fffe                 move.w     -2(a6),d5
[000133e8] ba6e 000c                 cmp.w      12(a6),d5
[000133ec] 623c                      bhi.s      $0001342A
[000133ee] 3a2e fffe                 move.w     -2(a6),d5
[000133f2] 286e 0008                 movea.l    8(a6),a4
[000133f6] 4a34 5000                 tst.b      0(a4,d5.w)
[000133fa] 672e                      beq.s      $0001342A
[000133fc] 3a2e fffe                 move.w     -2(a6),d5
[00013400] 286e 0008                 movea.l    8(a6),a4
[00013404] 1834 5000                 move.b     0(a4,d5.w),d4
[00013408] 0c04 0061                 cmpi.b     #$61,d4
[0001340c] 650a                      bcs.s      $00013418
[0001340e] 0c04 007a                 cmpi.b     #$7A,d4
[00013412] 6204                      bhi.s      $00013418
[00013414] 0204 005f                 andi.b     #$5F,d4
[00013418] 3a2e fffe                 move.w     -2(a6),d5
[0001341c] 286e 0008                 movea.l    8(a6),a4
[00013420] 1984 5000                 move.b     d4,0(a4,d5.w)
[00013424] 526e fffe                 addq.w     #1,-2(a6)
[00013428] 60ba                      bra.s      $000133E4
[0001342a] 4e5e                      unlk       a6
[0001342c] 4e75                      rts

NewStreams.FileLookup:
[0001342e] 4e56 ff0e                 link       a6,#-242
[00013432] 422e ff33                 clr.b      -205(a6)
[00013436] 4a39 0001 8bca            tst.b      NewStreams.needfile
[0001343c] 6702                      beq.s      $00013440
[0001343e] 6004                      bra.s      $00013444
[00013440] 4efa 00ae                 jmp        $000134F0(pc)
[00013444] 4a39 0001 8bcc            tst.b      NewStreams.mainfilename
[0001344a] 6602                      bne.s      $0001344E
[0001344c] 6004                      bra.s      $00013452
[0001344e] 4efa 007e                 jmp        $000134CE(pc)
[00013452] 4a39 0001 8bf4            tst.b      NewStreams.outfilename
[00013458] 56c5                      sne        d5
[0001345a] 4405                      neg.b      d5
[0001345c] 1d45 ff33                 move.b     d5,-205(a6)
[00013460] 4a2e ff33                 tst.b      -205(a6)
[00013464] 6764                      beq.s      $000134CA
[00013466] 3d7c 0001 ff40            move.w     #$0001,-192(a6)
[0001346c] 0c6e 0027 ff40            cmpi.w     #$0027,-192(a6)
[00013472] 6242                      bhi.s      $000134B6
[00013474] 3a2e ff40                 move.w     -192(a6),d5
[00013478] 49f9 0001 8bf4            lea.l      NewStreams.outfilename,a4
[0001347e] 0c34 000d 5000            cmpi.b     #$0D,0(a4,d5.w)
[00013484] 6730                      beq.s      $000134B6
[00013486] 3a2e ff40                 move.w     -192(a6),d5
[0001348a] 49f9 0001 8bf4            lea.l      NewStreams.outfilename,a4
[00013490] 4a34 5000                 tst.b      0(a4,d5.w)
[00013494] 6720                      beq.s      $000134B6
[00013496] 3a2e ff40                 move.w     -192(a6),d5
[0001349a] 49f9 0001 8bf4            lea.l      NewStreams.outfilename,a4
[000134a0] 382e ff40                 move.w     -192(a6),d4
[000134a4] 5344                      subq.w     #1,d4
[000134a6] 47ee ff42                 lea.l      -190(a6),a3
[000134aa] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[000134b0] 526e ff40                 addq.w     #1,-192(a6)
[000134b4] 60b6                      bra.s      $0001346C
[000134b6] 3a2e ff40                 move.w     -192(a6),d5
[000134ba] 5345                      subq.w     #1,d5
[000134bc] 49ee ff42                 lea.l      -190(a6),a4
[000134c0] 4234 5000                 clr.b      0(a4,d5.w)
[000134c4] 4239 0001 83c2            clr.b      AppBase.xfer
[000134ca] 4efa 0024                 jmp        $000134F0(pc)
[000134ce] 3f3c 003c                 move.w     #$003C,-(a7)
[000134d2] 486e ff42                 pea.l      -190(a6)
[000134d6] 3f3c 0027                 move.w     #$0027,-(a7)
[000134da] 4879 0001 8bcc            pea.l      NewStreams.mainfilename
[000134e0] 4eb9 0001 1c48            jsr        Strings.Assign
[000134e6] 4fef 000c                 lea.l      12(a7),a7
[000134ea] 1d7c 0001 ff33            move.b     #$01,-205(a6)
[000134f0] 286e 0022                 movea.l    34(a6),a4
[000134f4] 4a14                      tst.b      (a4)
[000134f6] 6718                      beq.s      $00013510
[000134f8] 4a2e 0014                 tst.b      20(a6)
[000134fc] 660e                      bne.s      $0001350C
[000134fe] 0c6e 0001 001a            cmpi.w     #$0001,26(a6)
[00013504] 670a                      beq.s      $00013510
[00013506] 4a6e 001a                 tst.w      26(a6)
[0001350a] 6704                      beq.s      $00013510
[0001350c] 7a01                      moveq.l    #1,d5
[0001350e] 6002                      bra.s      $00013512
[00013510] 7a00                      moveq.l    #0,d5
[00013512] 1d45 ff37                 move.b     d5,-201(a6)
[00013516] 4a2e ff37                 tst.b      -201(a6)
[0001351a] 6726                      beq.s      $00013542
[0001351c] 3a2e 0026                 move.w     38(a6),d5
[00013520] 3f05                      move.w     d5,-(a7)
[00013522] 286e 0022                 movea.l    34(a6),a4
[00013526] 4854                      pea.l      (a4)
[00013528] 4eb9 0001 1316            jsr        AppWindow.WriteString
[0001352e] 5c8f                      addq.l     #6,a7
[00013530] 3f3c 0002                 move.w     #$0002,-(a7)
[00013534] 4879 0001 40f2            pea.l      $000140F2
[0001353a] 4eb9 0001 1316            jsr        AppWindow.WriteString
[00013540] 5c8f                      addq.l     #6,a7
[00013542] 426e ff34                 clr.w      -204(a6)
[00013546] 4a2e ff33                 tst.b      -205(a6)
[0001354a] 6608                      bne.s      $00013554
[0001354c] 4a2e 0014                 tst.b      20(a6)
[00013550] 6702                      beq.s      $00013554
[00013552] 6004                      bra.s      $00013558
[00013554] 4efa 0188                 jmp        $000136DE(pc)
[00013558] 4267                      clr.w      -(a7)
[0001355a] 7aff                      moveq.l    #-1,d5
[0001355c] 2f05                      move.l     d5,-(a7)
[0001355e] 4eb9 0001 0cb0            jsr        AESGraphics.GrafMouse
[00013564] 5c8f                      addq.l     #6,a7
[00013566] 3f3c 003c                 move.w     #$003C,-(a7)
[0001356a] 486e ffbe                 pea.l      -66(a6)
[0001356e] 3f3c 0031                 move.w     #$0031,-(a7)
[00013572] 4879 0001 8a6c            pea.l      NewStreams.searchpaths
[00013578] 4eb9 0001 1c48            jsr        Strings.Assign
[0001357e] 4fef 000c                 lea.l      12(a7),a7
[00013582] 558f                      subq.l     #2,a7
[00013584] 3f3c 003c                 move.w     #$003C,-(a7)
[00013588] 486e ffbe                 pea.l      -66(a6)
[0001358c] 4eb9 0001 1ea0            jsr        Strings.Length
[00013592] 5c8f                      addq.l     #6,a7
[00013594] 3d5f ff3c                 move.w     (a7)+,-196(a6)
[00013598] 3a2e ff3c                 move.w     -196(a6),d5
[0001359c] 49ee ffbe                 lea.l      -66(a6),a4
[000135a0] 19bc 002a 5000            move.b     #$2A,0(a4,d5.w)
[000135a6] 3a2e ff3c                 move.w     -196(a6),d5
[000135aa] 5245                      addq.w     #1,d5
[000135ac] 49ee ffbe                 lea.l      -66(a6),a4
[000135b0] 4234 5000                 clr.b      0(a4,d5.w)
[000135b4] 3f3c 003c                 move.w     #$003C,-(a7)
[000135b8] 486e ffbe                 pea.l      -66(a6)
[000135bc] 3f2e 001a                 move.w     26(a6),-(a7)
[000135c0] 6100 f928                 bsr        NewStreams.SetFileExtension
[000135c4] 508f                      addq.l     #8,a7
[000135c6] 3f3c 003c                 move.w     #$003C,-(a7)
[000135ca] 486e ff80                 pea.l      -128(a6)
[000135ce] 3a2e 0020                 move.w     32(a6),d5
[000135d2] 3f05                      move.w     d5,-(a7)
[000135d4] 286e 001c                 movea.l    28(a6),a4
[000135d8] 4854                      pea.l      (a4)
[000135da] 4eb9 0001 1c48            jsr        Strings.Assign
[000135e0] 4fef 000c                 lea.l      12(a7),a7
[000135e4] 4a2e ff80                 tst.b      -128(a6)
[000135e8] 6712                      beq.s      $000135FC
[000135ea] 3f3c 003c                 move.w     #$003C,-(a7)
[000135ee] 486e ff80                 pea.l      -128(a6)
[000135f2] 3f2e 001a                 move.w     26(a6),-(a7)
[000135f6] 6100 f8f2                 bsr        NewStreams.SetFileExtension
[000135fa] 508f                      addq.l     #8,a7
[000135fc] 3f3c 003c                 move.w     #$003C,-(a7)
[00013600] 486e ff80                 pea.l      -128(a6)
[00013604] 6100 fdd6                 bsr        NewStreams.strupr
[00013608] 5c8f                      addq.l     #6,a7
[0001360a] 49ee ffbe                 lea.l      -66(a6),a4
[0001360e] 2a0c                      move.l     a4,d5
[00013610] 2f05                      move.l     d5,-(a7)
[00013612] 49ee ff80                 lea.l      -128(a6),a4
[00013616] 2a0c                      move.l     a4,d5
[00013618] 2f05                      move.l     d5,-(a7)
[0001361a] 486e fffc                 pea.l      -4(a6)
[0001361e] 4eb9 0001 1b68            jsr        AESForms.FileSelectorInput
[00013624] 4fef 000c                 lea.l      12(a7),a7
[00013628] 3f3c 0002                 move.w     #$0002,-(a7)
[0001362c] 7aff                      moveq.l    #-1,d5
[0001362e] 2f05                      move.l     d5,-(a7)
[00013630] 4eb9 0001 0cb0            jsr        AESGraphics.GrafMouse
[00013636] 5c8f                      addq.l     #6,a7
[00013638] 3d79 0001 7f06 fffe       move.w     AESCallResult,-2(a6)
[00013640] 2879 0001 8366            movea.l    AppBase.doUpdateWindow,a4
[00013646] 4e94                      jsr        (a4)
[00013648] 4a6e fffe                 tst.w      -2(a6)
[0001364c] 6706                      beq.s      $00013654
[0001364e] 4a6e fffc                 tst.w      -4(a6)
[00013652] 6616                      bne.s      $0001366A
[00013654] 4a2e ff37                 tst.b      -201(a6)
[00013658] 6706                      beq.s      $00013660
[0001365a] 4eb9 0001 13e0            jsr        AppWindow.WriteLn
[00013660] 286e 0008                 movea.l    8(a6),a4
[00013664] 4214                      clr.b      (a4)
[00013666] 4e5e                      unlk       a6
[00013668] 4e75                      rts
[0001366a] 426e ff40                 clr.w      -192(a6)
[0001366e] 0c6e 003c ff40            cmpi.w     #$003C,-192(a6)
[00013674] 622a                      bhi.s      $000136A0
[00013676] 3a2e ff40                 move.w     -192(a6),d5
[0001367a] 49ee ffbe                 lea.l      -66(a6),a4
[0001367e] 4a34 5000                 tst.b      0(a4,d5.w)
[00013682] 671c                      beq.s      $000136A0
[00013684] 3a2e ff40                 move.w     -192(a6),d5
[00013688] 49ee ffbe                 lea.l      -66(a6),a4
[0001368c] 0c34 005c 5000            cmpi.b     #$5C,0(a4,d5.w)
[00013692] 6606                      bne.s      $0001369A
[00013694] 3d6e ff40 ff3e            move.w     -192(a6),-194(a6)
[0001369a] 526e ff40                 addq.w     #1,-192(a6)
[0001369e] 60ce                      bra.s      $0001366E
[000136a0] 526e ff3e                 addq.w     #1,-194(a6)
[000136a4] 0c6e 003c ff3e            cmpi.w     #$003C,-194(a6)
[000136aa] 620c                      bhi.s      $000136B8
[000136ac] 3a2e ff3e                 move.w     -194(a6),d5
[000136b0] 49ee ffbe                 lea.l      -66(a6),a4
[000136b4] 4234 5000                 clr.b      0(a4,d5.w)
[000136b8] 3f3c 003c                 move.w     #$003C,-(a7)
[000136bc] 486e ffbe                 pea.l      -66(a6)
[000136c0] 3f3c 003c                 move.w     #$003C,-(a7)
[000136c4] 486e ff80                 pea.l      -128(a6)
[000136c8] 3f3c 003c                 move.w     #$003C,-(a7)
[000136cc] 486e ff42                 pea.l      -190(a6)
[000136d0] 4eb9 0001 1dba            jsr        Strings.Concat
[000136d6] 4fef 0012                 lea.l      18(a7),a7
[000136da] 4efa 00a2                 jmp        $0001377E(pc)
[000136de] 4a2e ff33                 tst.b      -205(a6)
[000136e2] 6602                      bne.s      $000136E6
[000136e4] 6004                      bra.s      $000136EA
[000136e6] 4efa 0096                 jmp        $0001377E(pc)
[000136ea] 4a6e 001a                 tst.w      26(a6)
[000136ee] 6770                      beq.s      $00013760
[000136f0] 3a2e ff34                 move.w     -204(a6),d5
[000136f4] cafc 0032                 mulu.w     #$0032,d5
[000136f8] 49f9 0001 8a6c            lea.l      NewStreams.searchpaths,a4
[000136fe] 3f3c 0031                 move.w     #$0031,-(a7)
[00013702] 4874 5000                 pea.l      0(a4,d5.w)
[00013706] 3a2e 0020                 move.w     32(a6),d5
[0001370a] 3f05                      move.w     d5,-(a7)
[0001370c] 286e 001c                 movea.l    28(a6),a4
[00013710] 4854                      pea.l      (a4)
[00013712] 3f3c 003c                 move.w     #$003C,-(a7)
[00013716] 486e ff42                 pea.l      -190(a6)
[0001371a] 4eb9 0001 1dba            jsr        Strings.Concat
[00013720] 4fef 0012                 lea.l      18(a7),a7
[00013724] 558f                      subq.l     #2,a7
[00013726] 3f3c 003c                 move.w     #$003C,-(a7)
[0001372a] 486e ff42                 pea.l      -190(a6)
[0001372e] 4267                      clr.w      -(a7)
[00013730] 4879 0001 40f6            pea.l      $000140F6
[00013736] 4267                      clr.w      -(a7)
[00013738] 486e ff40                 pea.l      -192(a6)
[0001373c] 4eb9 0001 1ef6            jsr        Strings.Pos
[00013742] 4fef 0012                 lea.l      18(a7),a7
[00013746] 4a1f                      tst.b      (a7)+
[00013748] 6612                      bne.s      $0001375C
[0001374a] 3f3c 003c                 move.w     #$003C,-(a7)
[0001374e] 486e ff42                 pea.l      -190(a6)
[00013752] 3f2e 001a                 move.w     26(a6),-(a7)
[00013756] 6100 f792                 bsr        NewStreams.SetFileExtension
[0001375a] 508f                      addq.l     #8,a7
[0001375c] 4efa 0020                 jmp        $0001377E(pc)
[00013760] 3f3c 003c                 move.w     #$003C,-(a7)
[00013764] 486e ff42                 pea.l      -190(a6)
[00013768] 3a2e 0020                 move.w     32(a6),d5
[0001376c] 3f05                      move.w     d5,-(a7)
[0001376e] 286e 001c                 movea.l    28(a6),a4
[00013772] 4854                      pea.l      (a4)
[00013774] 4eb9 0001 1c48            jsr        Strings.Assign
[0001377a] 4fef 000c                 lea.l      12(a7),a7
[0001377e] 3f3c 003c                 move.w     #$003C,-(a7)
[00013782] 486e ff42                 pea.l      -190(a6)
[00013786] 6100 fc54                 bsr        NewStreams.strupr
[0001378a] 5c8f                      addq.l     #6,a7
[0001378c] 3a2e 0010                 move.w     16(a6),d5
[00013790] 3f05                      move.w     d5,-(a7)
[00013792] 286e 000c                 movea.l    12(a6),a4
[00013796] 4854                      pea.l      (a4)
[00013798] 3f3c 003c                 move.w     #$003C,-(a7)
[0001379c] 486e ff42                 pea.l      -190(a6)
[000137a0] 4eb9 0001 1c48            jsr        Strings.Assign
[000137a6] 4fef 000c                 lea.l      12(a7),a7
[000137aa] 286e 0016                 movea.l    22(a6),a4
[000137ae] 4854                      pea.l      (a4)
[000137b0] 3f3c 003c                 move.w     #$003C,-(a7)
[000137b4] 486e ff42                 pea.l      -190(a6)
[000137b8] 6100 f8bc                 bsr        NewStreams.allocfile
[000137bc] 4fef 000a                 lea.l      10(a7),a7
[000137c0] 3f3c 003c                 move.w     #$003C,-(a7)
[000137c4] 486e ff42                 pea.l      -190(a6)
[000137c8] 4267                      clr.w      -(a7)
[000137ca] 266e 0016                 movea.l    22(a6),a3
[000137ce] 2853                      movea.l    (a3),a4
[000137d0] 4854                      pea.l      (a4)
[000137d2] 4eb9 0001 090e            jsr        GEMDOS.Open
[000137d8] 4fef 000c                 lea.l      12(a7),a7
[000137dc] 266e 0016                 movea.l    22(a6),a3
[000137e0] 2853                      movea.l    (a3),a4
[000137e2] 4a54                      tst.w      (a4)
[000137e4] 6c02                      bge.s      $000137E8
[000137e6] 6004                      bra.s      $000137EC
[000137e8] 4efa 0086                 jmp        $00013870(pc)
[000137ec] 558f                      subq.l     #2,a7
[000137ee] 286e 0016                 movea.l    22(a6),a4
[000137f2] 2f14                      move.l     (a4),-(a7)
[000137f4] 4eb9 0001 0a1a            jsr        GEMDOS.Free
[000137fa] 588f                      addq.l     #4,a7
[000137fc] 4a1f                      tst.b      (a7)+
[000137fe] 6708                      beq.s      $00013808
[00013800] 7aff                      moveq.l    #-1,d5
[00013802] 286e 0016                 movea.l    22(a6),a4
[00013806] 2885                      move.l     d5,(a4)
[00013808] 4a2e 0014                 tst.b      20(a6)
[0001380c] 6610                      bne.s      $0001381E
[0001380e] 0c6e 0006 ff34            cmpi.w     #$0006,-204(a6)
[00013814] 6408                      bcc.s      $0001381E
[00013816] 526e ff34                 addq.w     #1,-204(a6)
[0001381a] 4efa 0050                 jmp        $0001386C(pc)
[0001381e] 286e 0008                 movea.l    8(a6),a4
[00013822] 4214                      clr.b      (a4)
[00013824] 4a6e 001a                 tst.w      26(a6)
[00013828] 6728                      beq.s      $00013852
[0001382a] 0c6e 000c 001a            cmpi.w     #$000C,26(a6)
[00013830] 6720                      beq.s      $00013852
[00013832] 0c6e 000b 001a            cmpi.w     #$000B,26(a6)
[00013838] 6718                      beq.s      $00013852
[0001383a] 558f                      subq.l     #2,a7
[0001383c] 3f3c 003c                 move.w     #$003C,-(a7)
[00013840] 486e ff42                 pea.l      -190(a6)
[00013844] 3f3c ffdf                 move.w     #$FFDF,-(a7)
[00013848] 6100 f338                 bsr        NewStreams.FileError
[0001384c] 508f                      addq.l     #8,a7
[0001384e] 4a1f                      tst.b      (a7)+
[00013850] 6710                      beq.s      $00013862
[00013852] 4a2e ff37                 tst.b      -201(a6)
[00013856] 6706                      beq.s      $0001385E
[00013858] 4eb9 0001 13e0            jsr        AppWindow.WriteLn
[0001385e] 4efa 0078                 jmp        $000138D8(pc)
[00013862] 1d7c 0001 0014            move.b     #$01,20(a6)
[00013868] 422e ff33                 clr.b      -205(a6)
[0001386c] 4efa 0066                 jmp        $000138D4(pc)
[00013870] 286e 0008                 movea.l    8(a6),a4
[00013874] 18bc 0001                 move.b     #$01,(a4)
[00013878] 266e 0016                 movea.l    22(a6),a3
[0001387c] 2853                      movea.l    (a3),a4
[0001387e] 2f0c                      move.l     a4,-(a7)
[00013880] 2f2c 002a                 move.l     42(a4),-(a7)
[00013884] 3f14                      move.w     (a4),-(a7)
[00013886] 1f3c 0002                 move.b     #$02,-(a7)
[0001388a] 486c 002a                 pea.l      42(a4)
[0001388e] 4eb9 0001 09ac            jsr        GEMDOS.Seek
[00013894] 4fef 000c                 lea.l      12(a7),a7
[00013898] 285f                      movea.l    (a7)+,a4
[0001389a] 2f0c                      move.l     a4,-(a7)
[0001389c] 2f2c 0034                 move.l     52(a4),-(a7)
[000138a0] 3f14                      move.w     (a4),-(a7)
[000138a2] 4227                      clr.b      -(a7)
[000138a4] 486c 0034                 pea.l      52(a4)
[000138a8] 4eb9 0001 09ac            jsr        GEMDOS.Seek
[000138ae] 4fef 000c                 lea.l      12(a7),a7
[000138b2] 285f                      movea.l    (a7)+,a4
[000138b4] 4a2e ff37                 tst.b      -201(a6)
[000138b8] 6716                      beq.s      $000138D0
[000138ba] 3f3c 003c                 move.w     #$003C,-(a7)
[000138be] 486e ff42                 pea.l      -190(a6)
[000138c2] 4eb9 0001 1316            jsr        AppWindow.WriteString
[000138c8] 5c8f                      addq.l     #6,a7
[000138ca] 4eb9 0001 13e0            jsr        AppWindow.WriteLn
[000138d0] 4efa 0006                 jmp        $000138D8(pc)
[000138d4] 6000 fc70                 bra        $00013546
[000138d8] 4a39 0001 8bca            tst.b      NewStreams.needfile
[000138de] 671c                      beq.s      $000138FC
[000138e0] 3f3c 004f                 move.w     #$004F,-(a7)
[000138e4] 4879 0001 8372            pea.l      AppBase.shellTail
[000138ea] 3f3c 003c                 move.w     #$003C,-(a7)
[000138ee] 486e ff42                 pea.l      -190(a6)
[000138f2] 4eb9 0001 1c48            jsr        Strings.Assign
[000138f8] 4fef 000c                 lea.l      12(a7),a7
[000138fc] 4239 0001 8bca            clr.b      NewStreams.needfile
[00013902] 3a2e 001a                 move.w     26(a6),d5
[00013906] 7000                      moveq.l    #0,d0
[00013908] 0bc0                      bset       d5,d0
[0001390a] 81b9 0001 836a            or.l       d0,AppBase.openFiles
[00013910] 4e5e                      unlk       a6
[00013912] 4e75                      rts

NewStreams.FileLookupOutput:
[00013914] 4e56 ff3e                 link       a6,#-194
[00013918] 3f3c 003c                 move.w     #$003C,-(a7)
[0001391c] 486e ffba                 pea.l      -70(a6)
[00013920] 3a2e 0020                 move.w     32(a6),d5
[00013924] 3f05                      move.w     d5,-(a7)
[00013926] 286e 001c                 movea.l    28(a6),a4
[0001392a] 4854                      pea.l      (a4)
[0001392c] 4eb9 0001 1c48            jsr        Strings.Assign
[00013932] 4fef 000c                 lea.l      12(a7),a7
[00013936] 3f3c 003c                 move.w     #$003C,-(a7)
[0001393a] 486e ffba                 pea.l      -70(a6)
[0001393e] 3f2e 001a                 move.w     26(a6),-(a7)
[00013942] 6100 f5a6                 bsr        NewStreams.SetFileExtension
[00013946] 508f                      addq.l     #8,a7
[00013948] 3f3c 003c                 move.w     #$003C,-(a7)
[0001394c] 486e ffba                 pea.l      -70(a6)
[00013950] 6100 fa8a                 bsr        NewStreams.strupr
[00013954] 5c8f                      addq.l     #6,a7
[00013956] 4a2e 0014                 tst.b      20(a6)
[0001395a] 6702                      beq.s      $0001395E
[0001395c] 6004                      bra.s      $00013962
[0001395e] 4efa 011c                 jmp        $00013A7C(pc)
[00013962] 4267                      clr.w      -(a7)
[00013964] 7aff                      moveq.l    #-1,d5
[00013966] 2f05                      move.l     d5,-(a7)
[00013968] 4eb9 0001 0cb0            jsr        AESGraphics.GrafMouse
[0001396e] 5c8f                      addq.l     #6,a7
[00013970] 3f3c 003c                 move.w     #$003C,-(a7)
[00013974] 486e ff3e                 pea.l      -194(a6)
[00013978] 3f3c 0031                 move.w     #$0031,-(a7)
[0001397c] 4879 0001 8a6c            pea.l      NewStreams.searchpaths
[00013982] 4eb9 0001 1c48            jsr        Strings.Assign
[00013988] 4fef 000c                 lea.l      12(a7),a7
[0001398c] 3f3c 003c                 move.w     #$003C,-(a7)
[00013990] 486e ff3e                 pea.l      -194(a6)
[00013994] 3f2e 001a                 move.w     26(a6),-(a7)
[00013998] 6100 f550                 bsr        NewStreams.SetFileExtension
[0001399c] 508f                      addq.l     #8,a7
[0001399e] 3f3c 003c                 move.w     #$003C,-(a7)
[000139a2] 486e ff7c                 pea.l      -132(a6)
[000139a6] 3f3c 003c                 move.w     #$003C,-(a7)
[000139aa] 486e ffba                 pea.l      -70(a6)
[000139ae] 4eb9 0001 1c48            jsr        Strings.Assign
[000139b4] 4fef 000c                 lea.l      12(a7),a7
[000139b8] 49ee ff3e                 lea.l      -194(a6),a4
[000139bc] 2a0c                      move.l     a4,d5
[000139be] 2f05                      move.l     d5,-(a7)
[000139c0] 49ee ff7c                 lea.l      -132(a6),a4
[000139c4] 2a0c                      move.l     a4,d5
[000139c6] 2f05                      move.l     d5,-(a7)
[000139c8] 486e fffc                 pea.l      -4(a6)
[000139cc] 4eb9 0001 1b68            jsr        AESForms.FileSelectorInput
[000139d2] 4fef 000c                 lea.l      12(a7),a7
[000139d6] 3f3c 0002                 move.w     #$0002,-(a7)
[000139da] 7aff                      moveq.l    #-1,d5
[000139dc] 2f05                      move.l     d5,-(a7)
[000139de] 4eb9 0001 0cb0            jsr        AESGraphics.GrafMouse
[000139e4] 5c8f                      addq.l     #6,a7
[000139e6] 3d79 0001 7f06 fffe       move.w     AESCallResult,-2(a6)
[000139ee] 2879 0001 8366            movea.l    AppBase.doUpdateWindow,a4
[000139f4] 4e94                      jsr        (a4)
[000139f6] 4a6e fffe                 tst.w      -2(a6)
[000139fa] 6706                      beq.s      $00013A02
[000139fc] 4a6e fffc                 tst.w      -4(a6)
[00013a00] 660a                      bne.s      $00013A0C
[00013a02] 286e 0008                 movea.l    8(a6),a4
[00013a06] 4214                      clr.b      (a4)
[00013a08] 4e5e                      unlk       a6
[00013a0a] 4e75                      rts
[00013a0c] 426e fffa                 clr.w      -6(a6)
[00013a10] 0c6e 003c fffa            cmpi.w     #$003C,-6(a6)
[00013a16] 622a                      bhi.s      $00013A42
[00013a18] 3a2e fffa                 move.w     -6(a6),d5
[00013a1c] 49ee ff3e                 lea.l      -194(a6),a4
[00013a20] 4a34 5000                 tst.b      0(a4,d5.w)
[00013a24] 671c                      beq.s      $00013A42
[00013a26] 3a2e fffa                 move.w     -6(a6),d5
[00013a2a] 49ee ff3e                 lea.l      -194(a6),a4
[00013a2e] 0c34 005c 5000            cmpi.b     #$5C,0(a4,d5.w)
[00013a34] 6606                      bne.s      $00013A3C
[00013a36] 3d6e fffa fff8            move.w     -6(a6),-8(a6)
[00013a3c] 526e fffa                 addq.w     #1,-6(a6)
[00013a40] 60ce                      bra.s      $00013A10
[00013a42] 526e fff8                 addq.w     #1,-8(a6)
[00013a46] 0c6e 003c fff8            cmpi.w     #$003C,-8(a6)
[00013a4c] 620c                      bhi.s      $00013A5A
[00013a4e] 3a2e fff8                 move.w     -8(a6),d5
[00013a52] 49ee ff3e                 lea.l      -194(a6),a4
[00013a56] 4234 5000                 clr.b      0(a4,d5.w)
[00013a5a] 3f3c 003c                 move.w     #$003C,-(a7)
[00013a5e] 486e ff3e                 pea.l      -194(a6)
[00013a62] 3f3c 003c                 move.w     #$003C,-(a7)
[00013a66] 486e ff7c                 pea.l      -132(a6)
[00013a6a] 3f3c 003c                 move.w     #$003C,-(a7)
[00013a6e] 486e ffba                 pea.l      -70(a6)
[00013a72] 4eb9 0001 1dba            jsr        Strings.Concat
[00013a78] 4fef 0012                 lea.l      18(a7),a7
[00013a7c] 426e fffa                 clr.w      -6(a6)
[00013a80] 3a2e 0010                 move.w     16(a6),d5
[00013a84] 3f05                      move.w     d5,-(a7)
[00013a86] 286e 000c                 movea.l    12(a6),a4
[00013a8a] 4854                      pea.l      (a4)
[00013a8c] 3f3c 003c                 move.w     #$003C,-(a7)
[00013a90] 486e ffba                 pea.l      -70(a6)
[00013a94] 4eb9 0001 1c48            jsr        Strings.Assign
[00013a9a] 4fef 000c                 lea.l      12(a7),a7
[00013a9e] 286e 0016                 movea.l    22(a6),a4
[00013aa2] 4854                      pea.l      (a4)
[00013aa4] 3f3c 003c                 move.w     #$003C,-(a7)
[00013aa8] 486e ffba                 pea.l      -70(a6)
[00013aac] 6100 f5c8                 bsr        NewStreams.allocfile
[00013ab0] 4fef 000a                 lea.l      10(a7),a7
[00013ab4] 3f3c 003c                 move.w     #$003C,-(a7)
[00013ab8] 486e ffba                 pea.l      -70(a6)
[00013abc] 4267                      clr.w      -(a7)
[00013abe] 266e 0016                 movea.l    22(a6),a3
[00013ac2] 2853                      movea.l    (a3),a4
[00013ac4] 4854                      pea.l      (a4)
[00013ac6] 4eb9 0001 08e6            jsr        GEMDOS.Create
[00013acc] 4fef 000c                 lea.l      12(a7),a7
[00013ad0] 266e 0016                 movea.l    22(a6),a3
[00013ad4] 2853                      movea.l    (a3),a4
[00013ad6] 4a54                      tst.w      (a4)
[00013ad8] 6c26                      bge.s      $00013B00
[00013ada] 558f                      subq.l     #2,a7
[00013adc] 286e 0016                 movea.l    22(a6),a4
[00013ae0] 2f14                      move.l     (a4),-(a7)
[00013ae2] 4eb9 0001 0a1a            jsr        GEMDOS.Free
[00013ae8] 588f                      addq.l     #4,a7
[00013aea] 4a1f                      tst.b      (a7)+
[00013aec] 6708                      beq.s      $00013AF6
[00013aee] 7aff                      moveq.l    #-1,d5
[00013af0] 286e 0016                 movea.l    22(a6),a4
[00013af4] 2885                      move.l     d5,(a4)
[00013af6] 286e 0008                 movea.l    8(a6),a4
[00013afa] 4214                      clr.b      (a4)
[00013afc] 4efa 0070                 jmp        $00013B6E(pc)
[00013b00] 286e 0022                 movea.l    34(a6),a4
[00013b04] 4a14                      tst.b      (a4)
[00013b06] 6750                      beq.s      $00013B58
[00013b08] 4a2e 0014                 tst.b      20(a6)
[00013b0c] 660e                      bne.s      $00013B1C
[00013b0e] 0c6e 0001 001a            cmpi.w     #$0001,26(a6)
[00013b14] 6742                      beq.s      $00013B58
[00013b16] 4a6e 001a                 tst.w      26(a6)
[00013b1a] 673c                      beq.s      $00013B58
[00013b1c] 3a2e 0026                 move.w     38(a6),d5
[00013b20] 3f05                      move.w     d5,-(a7)
[00013b22] 286e 0022                 movea.l    34(a6),a4
[00013b26] 4854                      pea.l      (a4)
[00013b28] 4eb9 0001 1316            jsr        AppWindow.WriteString
[00013b2e] 5c8f                      addq.l     #6,a7
[00013b30] 3f3c 0002                 move.w     #$0002,-(a7)
[00013b34] 4879 0001 40f8            pea.l      $000140F8
[00013b3a] 4eb9 0001 1316            jsr        AppWindow.WriteString
[00013b40] 5c8f                      addq.l     #6,a7
[00013b42] 3f3c 003c                 move.w     #$003C,-(a7)
[00013b46] 486e ffba                 pea.l      -70(a6)
[00013b4a] 4eb9 0001 1316            jsr        AppWindow.WriteString
[00013b50] 5c8f                      addq.l     #6,a7
[00013b52] 4eb9 0001 13e0            jsr        AppWindow.WriteLn
[00013b58] 286e 0008                 movea.l    8(a6),a4
[00013b5c] 18bc 0001                 move.b     #$01,(a4)
[00013b60] 3a2e 001a                 move.w     26(a6),d5
[00013b64] 7000                      moveq.l    #0,d0
[00013b66] 0bc0                      bset       d5,d0
[00013b68] 81b9 0001 836e            or.l       d0,AppBase.openStreams
[00013b6e] 4e5e                      unlk       a6
[00013b70] 4e75                      rts

NewStreams.formatLong:
[00013b72] 4e56 fff8                 link       a6,#-8
[00013b76] 2d7c 1000 0000 fffc       move.l     #$10000000,-4(a6)
[00013b7e] 426e fff8                 clr.w      -8(a6)
[00013b82] 4aae fffc                 tst.l      -4(a6)
[00013b86] 6302                      bls.s      $00013B8A
[00013b88] 6004                      bra.s      $00013B8E
[00013b8a] 4efa 0084                 jmp        $00013C10(pc)
[00013b8e] 2f2e 0008                 move.l     8(a6),-(a7)
[00013b92] 2f2e fffc                 move.l     -4(a6),-(a7)
[00013b96] 4eb9 0001 046c            jsr        DIVU32
[00013b9c] 588f                      addq.l     #4,a7
[00013b9e] 2a1f                      move.l     (a7)+,d5
[00013ba0] 3d45 fffa                 move.w     d5,-6(a6)
[00013ba4] 0c6e 000a fffa            cmpi.w     #$000A,-6(a6)
[00013baa] 641e                      bcc.s      $00013BCA
[00013bac] 7a30                      moveq.l    #48,d5
[00013bae] da6e fffa                 add.w      -6(a6),d5
[00013bb2] 286d fffc                 movea.l    -4(a5),a4
[00013bb6] 286c 000c                 movea.l    12(a4),a4
[00013bba] 382e fff8                 move.w     -8(a6),d4
[00013bbe] 49ec 0050                 lea.l      80(a4),a4
[00013bc2] 1985 4000                 move.b     d5,0(a4,d4.w)
[00013bc6] 4efa 0022                 jmp        $00013BEA(pc)
[00013bca] 3a2e fffa                 move.w     -6(a6),d5
[00013bce] 0445 000a                 subi.w     #$000A,d5
[00013bd2] 7841                      moveq.l    #65,d4
[00013bd4] da44                      add.w      d4,d5
[00013bd6] 286d fffc                 movea.l    -4(a5),a4
[00013bda] 286c 000c                 movea.l    12(a4),a4
[00013bde] 382e fff8                 move.w     -8(a6),d4
[00013be2] 49ec 0050                 lea.l      80(a4),a4
[00013be6] 1985 4000                 move.b     d5,0(a4,d4.w)
[00013bea] 2f2e 0008                 move.l     8(a6),-(a7)
[00013bee] 2f2e fffc                 move.l     -4(a6),-(a7)
[00013bf2] 4eb9 0001 046c            jsr        DIVU32
[00013bf8] 2e9f                      move.l     (a7)+,(a7)
[00013bfa] 2d5f 0008                 move.l     (a7)+,8(a6)
[00013bfe] 2a2e fffc                 move.l     -4(a6),d5
[00013c02] e88d                      lsr.l      #4,d5
[00013c04] 2d45 fffc                 move.l     d5,-4(a6)
[00013c08] 526e fff8                 addq.w     #1,-8(a6)
[00013c0c] 6000 ff74                 bra        $00013B82
[00013c10] 286d fffc                 movea.l    -4(a5),a4
[00013c14] 286c 000c                 movea.l    12(a4),a4
[00013c18] 3a2e fff8                 move.w     -8(a6),d5
[00013c1c] 49ec 0050                 lea.l      80(a4),a4
[00013c20] 19bc 0048 5000            move.b     #$48,0(a4,d5.w)
[00013c26] 286d fffc                 movea.l    -4(a5),a4
[00013c2a] 286c 000c                 movea.l    12(a4),a4
[00013c2e] 3a2e fff8                 move.w     -8(a6),d5
[00013c32] 5245                      addq.w     #1,d5
[00013c34] 49ec 0050                 lea.l      80(a4),a4
[00013c38] 4234 5000                 clr.b      0(a4,d5.w)
[00013c3c] 4e5e                      unlk       a6
[00013c3e] 4e75                      rts

NewStreams.GetOptionInfo:
[00013c40] 4e56 0000                 link       a6,#0
[00013c44] 2f2d fffc                 move.l     -4(a5),-(a7)
[00013c48] 2b4e fffc                 move.l     a6,-4(a5)
[00013c4c] 286e 000c                 movea.l    12(a6),a4
[00013c50] 266e 0008                 movea.l    8(a6),a3
[00013c54] 16bc 0001                 move.b     #$01,(a3)
[00013c58] 47f9 0001 40fc            lea.l      $000140FC,a3
[00013c5e] 45ec 0050                 lea.l      80(a4),a2
[00013c62] 7a00                      moveq.l    #0,d5
[00013c64] 14db                      move.b     (a3)+,(a2)+
[00013c66] 57cd fffc                 dbeq       d5,$00013C64
[00013c6a] 7a00                      moveq.l    #0,d5
[00013c6c] 1a39 0001 8c1c            move.b     NewStreams.currInfoType,d5
[00013c72] 2005                      move.l     d5,d0
[00013c74] 4eb9 0001 000a            jsr        CASEX
[00013c7a] 0000 0000
[00013c7e] 0000 0008
[00013c82] 0000 0146
[00013c86] 4a79 0001 8c28            tst.w      NewStreams.heapsize
[00013c8c] 6728                      beq.s      $00013CB6
[00013c8e] 47f9 0001 40fe            lea.l      $000140FE,a3
[00013c94] 45d4                      lea.l      (a4),a2
[00013c96] 7a04                      moveq.l    #4,d5
[00013c98] 14db                      move.b     (a3)+,(a2)+
[00013c9a] 57cd fffc                 dbeq       d5,$00013C98
[00013c9e] 2f0c                      move.l     a4,-(a7)
[00013ca0] 7a00                      moveq.l    #0,d5
[00013ca2] 3a39 0001 8c28            move.w     NewStreams.heapsize,d5
[00013ca8] 2f05                      move.l     d5,-(a7)
[00013caa] 6100 fec6                 bsr        NewStreams.formatLong
[00013cae] 588f                      addq.l     #4,a7
[00013cb0] 285f                      movea.l    (a7)+,a4
[00013cb2] 4efa 0128                 jmp        $00013DDC(pc)
[00013cb6] 4efa 011a                 jmp        $00013DD2(pc)
[00013cba] 4a39 0001 8c1e            tst.b      NewStreams.queryfiles
[00013cc0] 6714                      beq.s      $00013CD6
[00013cc2] 47f9 0001 4104            lea.l      $00014104,a3
[00013cc8] 45d4                      lea.l      (a4),a2
[00013cca] 7a05                      moveq.l    #5,d5
[00013ccc] 14db                      move.b     (a3)+,(a2)+
[00013cce] 57cd fffc                 dbeq       d5,$00013CCC
[00013cd2] 4efa 0108                 jmp        $00013DDC(pc)
[00013cd6] 4efa 00fa                 jmp        $00013DD2(pc)
[00013cda] 4a39 0001 8c1f            tst.b      NewStreams.reffiles
[00013ce0] 6714                      beq.s      $00013CF6
[00013ce2] 47f9 0001 410a            lea.l      $0001410A,a3
[00013ce8] 45d4                      lea.l      (a4),a2
[00013cea] 7a03                      moveq.l    #3,d5
[00013cec] 14db                      move.b     (a3)+,(a2)+
[00013cee] 57cd fffc                 dbeq       d5,$00013CEC
[00013cf2] 4efa 00e8                 jmp        $00013DDC(pc)
[00013cf6] 4efa 00da                 jmp        $00013DD2(pc)
[00013cfa] 4a39 0001 8c20            tst.b      NewStreams.listing
[00013d00] 6714                      beq.s      $00013D16
[00013d02] 47f9 0001 410e            lea.l      $0001410E,a3
[00013d08] 45d4                      lea.l      (a4),a2
[00013d0a] 7a04                      moveq.l    #4,d5
[00013d0c] 14db                      move.b     (a3)+,(a2)+
[00013d0e] 57cd fffc                 dbeq       d5,$00013D0C
[00013d12] 4efa 00c8                 jmp        $00013DDC(pc)
[00013d16] 4efa 00ba                 jmp        $00013DD2(pc)
[00013d1a] 4ab9 0001 8c24            tst.l      NewStreams.stacksize
[00013d20] 6724                      beq.s      $00013D46
[00013d22] 47f9 0001 4114            lea.l      $00014114,a3
[00013d28] 45d4                      lea.l      (a4),a2
[00013d2a] 7a05                      moveq.l    #5,d5
[00013d2c] 14db                      move.b     (a3)+,(a2)+
[00013d2e] 57cd fffc                 dbeq       d5,$00013D2C
[00013d32] 2f0c                      move.l     a4,-(a7)
[00013d34] 2f39 0001 8c24            move.l     NewStreams.stacksize,-(a7)
[00013d3a] 6100 fe36                 bsr        NewStreams.formatLong
[00013d3e] 588f                      addq.l     #4,a7
[00013d40] 285f                      movea.l    (a7)+,a4
[00013d42] 4efa 0098                 jmp        $00013DDC(pc)
[00013d46] 4efa 008a                 jmp        $00013DD2(pc)
[00013d4a] 4a39 0001 8c21            tst.b      NewStreams.linkmap
[00013d50] 6714                      beq.s      $00013D66
[00013d52] 47f9 0001 411a            lea.l      $0001411A,a3
[00013d58] 45d4                      lea.l      (a4),a2
[00013d5a] 7a03                      moveq.l    #3,d5
[00013d5c] 14db                      move.b     (a3)+,(a2)+
[00013d5e] 57cd fffc                 dbeq       d5,$00013D5C
[00013d62] 4efa 0078                 jmp        $00013DDC(pc)
[00013d66] 4efa 006a                 jmp        $00013DD2(pc)
[00013d6a] 4a39 0001 8c23            tst.b      NewStreams.debugtable
[00013d70] 6714                      beq.s      $00013D86
[00013d72] 47f9 0001 411e            lea.l      $0001411E,a3
[00013d78] 45d4                      lea.l      (a4),a2
[00013d7a] 7a06                      moveq.l    #6,d5
[00013d7c] 14db                      move.b     (a3)+,(a2)+
[00013d7e] 57cd fffc                 dbeq       d5,$00013D7C
[00013d82] 4efa 0058                 jmp        $00013DDC(pc)
[00013d86] 4efa 004a                 jmp        $00013DD2(pc)
[00013d8a] 4a39 0001 8c22            tst.b      NewStreams.linkopt
[00013d90] 6714                      beq.s      $00013DA6
[00013d92] 47f9 0001 4126            lea.l      $00014126,a3
[00013d98] 45d4                      lea.l      (a4),a2
[00013d9a] 7a08                      moveq.l    #8,d5
[00013d9c] 14db                      move.b     (a3)+,(a2)+
[00013d9e] 57cd fffc                 dbeq       d5,$00013D9C
[00013da2] 4efa 0038                 jmp        $00013DDC(pc)
[00013da6] 4efa 002a                 jmp        $00013DD2(pc)
[00013daa] 266e 0008                 movea.l    8(a6),a3
[00013dae] 4213                      clr.b      (a3)
[00013db0] 2b5f fffc                 move.l     (a7)+,-4(a5)
[00013db4] 4e5e                      unlk       a6
[00013db6] 4e75                      rts
[00013db8] 4efa 0018                 jmp        $00013DD2(pc)
[00013dbc] 4efa 0014                 jmp        $00013DD2(pc)
[00013dc0] 000c 0040                 ori.b      #$40,a4 ; apollo only
[00013dc4] 0060 0080                 ori.w      #$0080,-(a0)
[00013dc8] 00a0 00d0 00f0            ori.l      #$00D000F0,-(a0)
[00013dce] 0110                      btst       d0,(a0)
[00013dd0] 0130 5239                 btst       d0,57(a0,d5.w*2) ; 68020+ only
[00013dd4] 0001 8c1c                 ori.b      #$1C,d1
[00013dd8] 6000 fe90                 bra        $00013C6A
[00013ddc] 5239 0001 8c1c            addq.b     #1,NewStreams.currInfoType
[00013de2] 2b5f fffc                 move.l     (a7)+,-4(a5)
[00013de6] 4e5e                      unlk       a6
[00013de8] 4e75                      rts

NewStreams.Close:
[00013dea] 4e56 fffe                 link       a6,#-2
[00013dee] 7aff                      moveq.l    #-1,d5
[00013df0] 286e 000c                 movea.l    12(a6),a4
[00013df4] ba94                      cmp.l      (a4),d5
[00013df6] 6744                      beq.s      $00013E3C
[00013df8] 286e 000c                 movea.l    12(a6),a4
[00013dfc] 4854                      pea.l      (a4)
[00013dfe] 6100 f318                 bsr        NewStreams.flush
[00013e02] 588f                      addq.l     #4,a7
[00013e04] 558f                      subq.l     #2,a7
[00013e06] 266e 000c                 movea.l    12(a6),a3
[00013e0a] 2853                      movea.l    (a3),a4
[00013e0c] 3f14                      move.w     (a4),-(a7)
[00013e0e] 4eb9 0001 0936            jsr        GEMDOS.Close
[00013e14] 548f                      addq.l     #2,a7
[00013e16] 286e 0008                 movea.l    8(a6),a4
[00013e1a] 189f                      move.b     (a7)+,(a4)
[00013e1c] 558f                      subq.l     #2,a7
[00013e1e] 286e 000c                 movea.l    12(a6),a4
[00013e22] 2f14                      move.l     (a4),-(a7)
[00013e24] 4eb9 0001 0a1a            jsr        GEMDOS.Free
[00013e2a] 588f                      addq.l     #4,a7
[00013e2c] 4a1f                      tst.b      (a7)+
[00013e2e] 6708                      beq.s      $00013E38
[00013e30] 7aff                      moveq.l    #-1,d5
[00013e32] 286e 000c                 movea.l    12(a6),a4
[00013e36] 2885                      move.l     d5,(a4)
[00013e38] 4efa 000a                 jmp        $00013E44(pc)
[00013e3c] 286e 0008                 movea.l    8(a6),a4
[00013e40] 18bc 0001                 move.b     #$01,(a4)
[00013e44] 4e5e                      unlk       a6
[00013e46] 4e75                      rts

NewStreams.WriteChar:
[00013e48] 4e56 0000                 link       a6,#0
[00013e4c] 0c2e 000d 0008            cmpi.b     #$0D,8(a6)
[00013e52] 661e                      bne.s      $00013E72
[00013e54] 1d7c 000d 0008            move.b     #$0D,8(a6)
[00013e5a] 286e 000a                 movea.l    10(a6),a4
[00013e5e] 2f14                      move.l     (a4),-(a7)
[00013e60] 1f2e 0008                 move.b     8(a6),-(a7)
[00013e64] 4227                      clr.b      -(a7)
[00013e66] 6100 f452                 bsr        NewStreams.writebyte
[00013e6a] 508f                      addq.l     #8,a7
[00013e6c] 1d7c 000a 0008            move.b     #$0A,8(a6)
[00013e72] 286e 000a                 movea.l    10(a6),a4
[00013e76] 2f14                      move.l     (a4),-(a7)
[00013e78] 1f2e 0008                 move.b     8(a6),-(a7)
[00013e7c] 4227                      clr.b      -(a7)
[00013e7e] 6100 f43a                 bsr        NewStreams.writebyte
[00013e82] 508f                      addq.l     #8,a7
[00013e84] 4e5e                      unlk       a6
[00013e86] 4e75                      rts

NewStreams.Read16Bit:
[00013e88] 4e56 0000                 link       a6,#0
[00013e8c] 286e 000c                 movea.l    12(a6),a4
[00013e90] 2f14                      move.l     (a4),-(a7)
[00013e92] 286e 0008                 movea.l    8(a6),a4
[00013e96] 4854                      pea.l      (a4)
[00013e98] 6100 f3e6                 bsr        NewStreams.read16bit
[00013e9c] 508f                      addq.l     #8,a7
[00013e9e] 4e5e                      unlk       a6
[00013ea0] 4e75                      rts

NewStreams.initfilenames:
[00013ea2] 4e56 ff00                 link       a6,#-256
[00013ea6] 4239 0001 8bcc            clr.b      NewStreams.mainfilename
[00013eac] 422e ff80                 clr.b      -128(a6)
[00013eb0] 422e ff00                 clr.b      -256(a6)
[00013eb4] 49ee ff80                 lea.l      -128(a6),a4
[00013eb8] 2a0c                      move.l     a4,d5
[00013eba] 2f05                      move.l     d5,-(a7)
[00013ebc] 49ee ff00                 lea.l      -256(a6),a4
[00013ec0] 2a0c                      move.l     a4,d5
[00013ec2] 2f05                      move.l     d5,-(a7)
[00013ec4] 4eb9 0001 1bac            jsr        AESShells.ShellRead
[00013eca] 508f                      addq.l     #8,a7
[00013ecc] 3f3c 0027                 move.w     #$0027,-(a7)
[00013ed0] 4879 0001 8bcc            pea.l      NewStreams.mainfilename
[00013ed6] 3f3c 007f                 move.w     #$007F,-(a7)
[00013eda] 486e ff00                 pea.l      -256(a6)
[00013ede] 4eb9 0001 1c48            jsr        Strings.Assign
[00013ee4] 4fef 000c                 lea.l      12(a7),a7
[00013ee8] 4e5e                      unlk       a6
[00013eea] 4e75                      rts

NewStreams.init:
[00013eec] 4ef9 0001 2b44            jmp        M2Option.init
[00013ef2] 4e56 0000                 link       a6,#0
[00013ef6] 42b9 0001 836e            clr.l      AppBase.openStreams
[00013efc] 42b9 0001 836a            clr.l      AppBase.openFiles
[00013f02] 4879 0001 8c1d            pea.l      NewStreams.dump
[00013f08] 4879 0001 8c1e            pea.l      NewStreams.queryfiles
[00013f0e] 4879 0001 83c2            pea.l      AppBase.xfer
[00013f14] 4879 0001 8a6c            pea.l      NewStreams.searchpaths
[00013f1a] 4eb9 0001 27cc            jsr        M2Option.GetSystemOptions
[00013f20] 4fef 0010                 lea.l      16(a7),a7
[00013f24] 4879 0001 8c1f            pea.l      NewStreams.reffiles
[00013f2a] 4879 0001 8c20            pea.l      NewStreams.listing
[00013f30] 4879 0001 8c28            pea.l      NewStreams.heapsize
[00013f36] 4eb9 0001 2a6e            jsr        M2Option.GetCompilerOptions
[00013f3c] 4fef 000c                 lea.l      12(a7),a7
[00013f40] 4879 0001 8c21            pea.l      NewStreams.linkmap
[00013f46] 4879 0001 8c22            pea.l      NewStreams.linkopt
[00013f4c] 4879 0001 8c23            pea.l      NewStreams.debugtable
[00013f52] 4879 0001 8c24            pea.l      NewStreams.stacksize
[00013f58] 4eb9 0001 2ac6            jsr        M2Option.GetLinkerOptions
[00013f5e] 4fef 0010                 lea.l      16(a7),a7
[00013f62] 13fc 0001 0001 8bca       move.b     #$01,NewStreams.needfile
[00013f6a] 4239 0001 8c1c            clr.b      NewStreams.currInfoType
[00013f70] 6100 ff30                 bsr        NewStreams.initfilenames
[00013f74] 2879 0001 7dc0            movea.l    BasePageAddress,a4
[00013f7a] 23ec 0020 0001 8c2a       move.l     32(a4),NewStreams.DtaPtr
[00013f82] 3f3c 0027                 move.w     #$0027,-(a7)
[00013f86] 4879 0001 8bf4            pea.l      NewStreams.outfilename
[00013f8c] 2879 0001 8c2a            movea.l    NewStreams.DtaPtr,a4
[00013f92] 3f3c 0027                 move.w     #$0027,-(a7)
[00013f96] 4854                      pea.l      (a4)
[00013f98] 4eb9 0001 1c48            jsr        Strings.Assign
[00013f9e] 4fef 000c                 lea.l      12(a7),a7
[00013fa2] 4e5e                      unlk       a6
[00013fa4] 4ef9 0001 6b66            jmp        Filepool.init+6

[00013faa] 5b31 5d5b 5468 6520       subq.b     #5,([a1,zd5.l*4],$54686520) ; 68020+ only
[00013fb2] 666f                      bne.s      $00014023
[00013fb4] 6c6c                      bge.s      $00014022
[00013fb6] 6f77                      ble.s      $0001402F
[00013fb8] 696e                      bvs.s      $00014028
[00013fba] 6720                      beq.s      $00013FDC
[00013fbc] 6669                      bne.s      $00014027
[00013fbe] 6c65                      bge.s      $00014025
[00013fc0] 2063                      movea.l    -(a3),a0
[00013fc2] 6f75                      ble.s      $00014039
[00013fc4] 6c64                      bge.s      $0001402A
[00013fc6] 7c6e                      moveq.l    #110,d6
[00013fc8] 6f74                      ble.s      $0001403E
[00013fca] 2062                      movea.l    -(a2),a0
[00013fcc] 6520                      bcs.s      $00013FEE
[00013fce] 666f                      bne.s      $0001403F
[00013fd0] 756e                      ???
[00013fd2] 643a                      bcc.s      $0001400E
[00013fd4] 7c00                      moveq.l    #0,d6
[00013fd6] 5d5b                      subq.w     #6,(a3)+
[00013fd8] 454e                      lea.l      (b6),b2 ; apollo only
[00013fda] 5445                      addq.w     #2,d5
[00013fdc] 5220                      addq.b     #1,-(a0)
[00013fde] 4e41                      trap       #1
[00013fe0] 4d45                      lea.l      d5,b6 ; apollo only
[00013fe2] 7c43                      moveq.l    #67,d6
[00013fe4] 4f4e                      lea.l      (b6),b7 ; apollo only
[00013fe6] 5449                      addq.w     #2,a1
[00013fe8] 4e55 455d                 link       a5,#17757
[00013fec] 0000 5b33                 ori.b      #$33,d0
[00013ff0] 5d5b                      subq.w     #6,(a3)+
[00013ff2] 416e 2049                 lea.l      8265(a6),b0 ; apollo only
[00013ff6] 4f20                      chk.l      -(a0),d7 ; 68020+ only
[00013ff8] 6572                      bcs.s      $0001406C
[00013ffa] 726f                      moveq.l    #111,d1
[00013ffc] 7220                      moveq.l    #32,d1
[00013ffe] 6861                      bvc.s      $00014061
[00014000] 7320                      ???
[00014002] 6f63                      ble.s      $00014067
[00014004] 6375                      bls.s      $0001407B
[00014006] 7265                      moveq.l    #101,d1
[00014008] 647c                      bcc.s      $00014086
[0001400a] 7768                      ???
[0001400c] 696c                      bvs.s      $0001407A
[0001400e] 7374                      ???
[00014010] 2000                      move.l     d0,d0
[00014012] 7772                      ???
[00014014] 6974                      bvs.s      $0001408A
[00014016] 696e                      bvs.s      $00014086
[00014018] 6700 7265                 beq        $0001B27F
[0001401c] 6164                      bsr.s      $00014082
[0001401e] 696e                      bvs.s      $0001408E
[00014020] 6700 2074                 beq        $00016096
[00014024] 6865                      bvc.s      $0001408B
[00014026] 2064                      movea.l    -(a4),a0
[00014028] 6973                      bvs.s      $0001409D
[0001402a] 6b2e                      bmi.s      $0001405A
[0001402c] 5d5b                      subq.w     #6,(a3)+
[0001402e] 4f4b                      lea.l      (b3),b7 ; apollo only
[00014030] 5d00                      subq.b     #6,d0
[00014032] 5b33 5d5b 5468 6520       subq.b     #5,([a3,zd5.l*4],$54686520) ; 68020+ only
[0001403a] 6469                      bcc.s      $000140A5
[0001403c] 736b                      ???
[0001403e] 2064                      movea.l    -(a4),a0
[00014040] 6f65                      ble.s      $000140A7
[00014042] 7320                      ???
[00014044] 6e6f                      bgt.s      $000140B5
[00014046] 7420                      moveq.l    #32,d2
[00014048] 6861                      bvc.s      $000140AB
[0001404a] 7665                      moveq.l    #101,d3
[0001404c] 7c65                      moveq.l    #101,d6
[0001404e] 6e6f                      bgt.s      $000140BF
[00014050] 7567                      ???
[00014052] 6820                      bvc.s      $00014074
[00014054] 726f                      moveq.l    #111,d1
[00014056] 6f6d                      ble.s      $000140C5
[00014058] 2074 6f20 7772            movea.l    ($7772,a4,d6.l*8),a0 ; 68020+ only
[0001405e] 6974                      bvs.s      $000140D4
[00014060] 657c                      bcs.s      $000140DE
[00014062] 616e                      bsr.s      $000140D2
[00014064] 7920                      ???
[00014066] 6d6f                      blt.s      $000140D7
[00014068] 7265                      moveq.l    #101,d1
[0001406a] 2069 6e66                 movea.l    28262(a1),a0
[0001406e] 6f72                      ble.s      $000140E2
[00014070] 6d61                      blt.s      $000140D3
[00014072] 7469                      moveq.l    #105,d2
[00014074] 6f6e                      ble.s      $000140E4
[00014076] 2e5d                      movea.l    (a5)+,a7
[00014078] 5b4f                      subq.w     #5,a7
[0001407a] 4b5d                      lea.l      (a5)+,b5 ; apollo only
[0001407c] 2000                      move.l     d0,d0
[0001407e] 5b33 5d5b 4865 6170       subq.b     #5,([a3,zd5.l*4],$48656170) ; 68020+ only
[00014086] 206f 7665                 movea.l    30309(a7),a0
[0001408a] 7266                      moveq.l    #102,d1
[0001408c] 6c6f                      bge.s      $000140FD
[0001408e] 7721                      ???
[00014090] 7c4e                      moveq.l    #78,d6
[00014092] 6f20                      ble.s      $000140B4
[00014094] 6d65                      blt.s      $000140FB
[00014096] 6d6f                      blt.s      $00014107
[00014098] 7279                      moveq.l    #121,d1
[0001409a] 2074 6f20 6f70            movea.l    ($6F70,a4,d6.l*8),a0 ; 68020+ only
[000140a0] 656e                      bcs.s      $00014110
[000140a2] 2066                      movea.l    -(a6),a0
[000140a4] 696c                      bvs.s      $00014112
[000140a6] 655d                      bcs.s      $00014105
[000140a8] 5b4f                      subq.w     #5,a7
[000140aa] 4b5d                      lea.l      (a5)+,b5 ; apollo only
[000140ac] 0000 544d                 ori.b      #$4D,d0
[000140b0] 5000                      addq.b     #8,d0
[000140b2] 4d4f                      lea.l      (b7),b6 ; apollo only
[000140b4] 4400                      neg.b      d0
[000140b6] 5245                      addq.w     #1,d5
[000140b8] 4600                      not.b      d0
[000140ba] 5359                      subq.w     #1,(a1)+
[000140bc] 4d00                      chk.l      d0,d6 ; 68020+ only
[000140be] 4c4e 4b00                 divsl.l    a6,d0:d4 ; rems.l for ColdFire
[000140c2] 4c53 5400                 divu.l     (a3),d0:d5 ; 68020+ only
[000140c6] 5052                      addq.w     #8,(a2)
[000140c8] 4700                      chk.l      d0,d3 ; 68020+ only
[000140ca] 4d41                      lea.l      d1,b6 ; apollo only
[000140cc] 5000                      addq.b     #8,d0
[000140ce] 434f                      lea.l      (b7),b1 ; apollo only
[000140d0] 5200                      addq.b     #1,d0
[000140d2] 4552                      lea.l      (a2),b2 ; apollo only
[000140d4] 4400                      neg.b      d0
[000140d6] 4552                      lea.l      (a2),b2 ; apollo only
[000140d8] 4d00                      chk.l      d0,d6 ; 68020+ only
[000140da] 5852                      addq.w     #4,(a2)
[000140dc] 4600                      not.b      d0
[000140de] 4445                      neg.w      d5
[000140e0] 4300                      chk.l      d0,d1 ; 68020+ only
[000140e2] 5052                      addq.w     #8,(a2)
[000140e4] 5400                      addq.b     #2,d0
[000140e6] 494e                      lea.l      (b6),b4 ; apollo only
[000140e8] 4400                      neg.b      d0
[000140ea] 5253                      addq.w     #1,(a3)
[000140ec] 4300                      chk.l      d0,d1 ; 68020+ only
[000140ee] 2020                      move.l     -(a0),d0
[000140f0] 2000                      move.l     d0,d0
[000140f2] 203a 2000                 move.l     $000160F4(pc),d0
[000140f6] 2e00                      move.l     d0,d7
[000140f8] 203a 2000                 move.l     $000160FA(pc),d0
[000140fc] 0000 4845                 ori.b      #$45,d0
[00014100] 4150                      lea.l      (a0),b0 ; apollo only
[00014102] 0000 5155                 ori.b      #$55,d0
[00014106] 4552                      lea.l      (a2),b2 ; apollo only
[00014108] 5900                      subq.b     #4,d0
[0001410a] 5245                      addq.w     #1,d5
[0001410c] 4600                      not.b      d0
[0001410e] 4c49 5354                 divul.l    a1,d4:d5 ; remu.l for ColdFire
[00014112] 0000 5354                 ori.b      #$54,d0
[00014116] 4143                      lea.l      d3,b0 ; apollo only
[00014118] 4b00                      chk.l      d0,d5 ; 68020+ only
[0001411a] 4d41                      lea.l      d1,b6 ; apollo only
[0001411c] 5000                      addq.b     #8,d0
[0001411e] 4454                      neg.w      (a4)
[00014120] 4142                      lea.l      d2,b0 ; apollo only
[00014122] 4c45 0000                 divul.l    d5,d0:d0 ; 68020+ only
[00014126] 4f50                      lea.l      (a0),b7 ; apollo only
[00014128] 5449                      addq.w     #2,a1
[0001412a] 4d49                      lea.l      (b1),b6 ; apollo only
[0001412c] 5345                      subq.w     #1,d5
[0001412e] 0000

***
* MODULE StrUtil
***

StrUtil.FormatCard:
[00014130] 4e56                      link       a6,#0
[00014132] 4279 0001 8c2e            clr.w      StrUtil.conv
[0001413a] 33ee 0010 0001 8c30       move.w     16(a6),StrUtil.conv+2
[00014142] 2f39 0001 8c2e            move.l     $00018C2E,-(a7)
[00014148] 3f2e 000e                 move.w     14(a6),-(a7)
[0001414c] 1f3c 0001                 move.b     #$01,-(a7)
[00014150] 1f3c 0020                 move.b     #$20,-(a7)
[00014154] 4227                      clr.b      -(a7)
[00014156] 3a2e 000c                 move.w     12(a6),d5
[0001415a] 3f05                      move.w     d5,-(a7)
[0001415c] 286e 0008                 movea.l    8(a6),a4
[00014160] 4854                      pea.l      (a4)
[00014162] 6100 0076                 bsr.w      StrUtil.FormatVal
[00014166] 4fef 0012                 lea.l      18(a7),a7
[0001416a] 4e5e                      unlk       a6
[0001416c] 4e75                      rts

StrUtil.FormatHexCard:
[0001416e] 4e56 0000                 link       a6,#0
[00014172] 4279 0001 8c2e            clr.w      $00018C2E
[00014178] 33ee 0010 0001 8c30       move.w     16(a6),StrUtil.conv+2
[00014180] 2f39 0001 8c2e            move.l     $00018C2E,-(a7)
[00014186] 3f2e 000e                 move.w     14(a6),-(a7)
[0001418a] 1f3c 0002                 move.b     #$02,-(a7)
[0001418e] 1f3c 0020                 move.b     #$20,-(a7)
[00014192] 4227                      clr.b      -(a7)
[00014194] 3a2e 000c                 move.w     12(a6),d5
[00014198] 3f05                      move.w     d5,-(a7)
[0001419a] 286e 0008                 movea.l    8(a6),a4
[0001419e] 4854                      pea.l      (a4)
[000141a0] 6100 0038                 bsr.w      StrUtil.FormatVal
[000141a4] 4fef 0012                 lea.l      18(a7),a7
[000141a8] 4e5e                      unlk       a6
[000141aa] 4e75                      rts

StrUtil.FormatLong:
[000141ac] 4e56 0000                 link       a6,#0
[000141b0] 2f2e 0010                 move.l     16(a6),-(a7)
[000141b4] 3f2e 000e                 move.w     14(a6),-(a7)
[000141b8] 1f3c 0001                 move.b     #$01,-(a7)
[000141bc] 1f3c 0020                 move.b     #$20,-(a7)
[000141c0] 4227                      clr.b      -(a7)
[000141c2] 3a2e 000c                 move.w     12(a6),d5
[000141c6] 3f05                      move.w     d5,-(a7)
[000141c8] 286e 0008                 movea.l    8(a6),a4
[000141cc] 4854                      pea.l      (a4)
[000141ce] 6100 000a                 bsr.w      StrUtil.FormatVal
[000141d2] 4fef 0012                 lea.l      18(a7),a7
[000141d6] 4e5e                      unlk       a6
[000141d8] 4e75                      rts

StrUtil.FormatVal:
[000141da] 4e56 ffe6                 link       a6,#-26
[000141de] 426e fff2                 clr.w      -14(a6)
[000141e2] 7a00                      moveq.l    #0,d5
[000141e4] 1a2e 0012                 move.b     18(a6),d5
[000141e8] 2005                      move.l     d5,d0
[000141ea] 4eb9 0001 000a            jsr        CASEX
[000141f0] 0000 0000
[000141f4] 0000 0002
[000141f8] 0000 0052
[000141fc] 7a08                      moveq.l    #8,d5
[000141fe] 2d45 ffea                 move.l     d5,-22(a6)
[00014202] 526e fff2                 addq.w     #1,-14(a6)
[00014206] 3a2e fff2                 move.w     -14(a6),d5
[0001420a] 49ee fff3                 lea.l      -13(a6),a4
[0001420e] 19bc 0042 5000            move.b     #$42,0(a4,d5.w)
[00014214] 4efa 0032                 jmp        $00014248(pc)
[00014218] 7a10                      moveq.l    #16,d5
[0001421a] 2d45 ffea                 move.l     d5,-22(a6)
[0001421e] 526e fff2                 addq.w     #1,-14(a6)
[00014222] 3a2e fff2                 move.w     -14(a6),d5
[00014226] 49ee fff3                 lea.l      -13(a6),a4
[0001422a] 19bc 0048 5000            move.b     #$48,0(a4,d5.w)
[00014230] 4efa 0016                 jmp        $00014248(pc)
[00014234] 7a0a                      moveq.l    #10,d5
[00014236] 2d45 ffea                 move.l     d5,-22(a6)
[0001423a] 4efa 000c                 jmp        $00014248(pc)
[0001423e] 4efa 0008                 jmp        $00014248(pc)
[00014242] 000c 0044                 ori.b      #$44,a4 ; apollo only
[00014246] 0028 526e fff2            ori.b      #$6E,-14(a0)
[0001424c] 2f2e 0016                 move.l     22(a6),-(a7)
[00014250] 2f2e ffea                 move.l     -22(a6),-(a7)
[00014254] 4eb9 0001 046c            jsr        DIVU32
[0001425a] 2e9f                      move.l     (a7)+,(a7)
[0001425c] 2d5f ffe6                 move.l     (a7)+,-26(a6)
[00014260] 7a0a                      moveq.l    #10,d5
[00014262] baae ffe6                 cmp.l      -26(a6),d5
[00014266] 6316                      bls.s      $0001427E
[00014268] 7a30                      moveq.l    #48,d5
[0001426a] daae ffe6                 add.l      -26(a6),d5
[0001426e] 382e fff2                 move.w     -14(a6),d4
[00014272] 49ee fff3                 lea.l      -13(a6),a4
[00014276] 1985 4000                 move.b     d5,0(a4,d4.w)
[0001427a] 4efa 0014                 jmp        $00014290(pc)
[0001427e] 7a37                      moveq.l    #55,d5
[00014280] daae ffe6                 add.l      -26(a6),d5
[00014284] 382e fff2                 move.w     -14(a6),d4
[00014288] 49ee fff3                 lea.l      -13(a6),a4
[0001428c] 1985 4000                 move.b     d5,0(a4,d4.w)
[00014290] 2f2e 0016                 move.l     22(a6),-(a7)
[00014294] 2f2e ffea                 move.l     -22(a6),-(a7)
[00014298] 4eb9 0001 046c            jsr        DIVU32
[0001429e] 588f                      addq.l     #4,a7
[000142a0] 2d5f 0016                 move.l     (a7)+,22(a6)
[000142a4] 4aae 0016                 tst.l      22(a6)
[000142a8] 6702                      beq.s      $000142AC
[000142aa] 609c                      bra.s      $00014248
[000142ac] 4a2e 000e                 tst.b      14(a6)
[000142b0] 6712                      beq.s      $000142C4
[000142b2] 526e fff2                 addq.w     #1,-14(a6)
[000142b6] 3a2e fff2                 move.w     -14(a6),d5
[000142ba] 49ee fff3                 lea.l      -13(a6),a4
[000142be] 19bc 002d 5000            move.b     #$2D,0(a4,d5.w)
[000142c4] 3a2e 0014                 move.w     20(a6),d5
[000142c8] ba6e fff2                 cmp.w      -14(a6),d5
[000142cc] 6408                      bcc.s      $000142D6
[000142ce] 426e ffee                 clr.w      -18(a6)
[000142d2] 4efa 000e                 jmp        $000142E2(pc)
[000142d6] 3a2e 0014                 move.w     20(a6),d5
[000142da] 9a6e fff2                 sub.w      -14(a6),d5
[000142de] 3d45 ffee                 move.w     d5,-18(a6)
[000142e2] 426e fff0                 clr.w      -16(a6)
[000142e6] 3a2e fff0                 move.w     -16(a6),d5
[000142ea] ba6e ffee                 cmp.w      -18(a6),d5
[000142ee] 6412                      bcc.s      $00014302
[000142f0] 3a2e fff0                 move.w     -16(a6),d5
[000142f4] 286e 0008                 movea.l    8(a6),a4
[000142f8] 19ae 0010 5000            move.b     16(a6),0(a4,d5.w)
[000142fe] 4efa 001c                 jmp        $0001431C(pc)
[00014302] 3a2e fff2                 move.w     -14(a6),d5
[00014306] 49ee fff3                 lea.l      -13(a6),a4
[0001430a] 382e fff0                 move.w     -16(a6),d4
[0001430e] 266e 0008                 movea.l    8(a6),a3
[00014312] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[00014318] 536e fff2                 subq.w     #1,-14(a6)
[0001431c] 526e fff0                 addq.w     #1,-16(a6)
[00014320] 4a6e fff2                 tst.w      -14(a6)
[00014324] 6702                      beq.s      $00014328
[00014326] 60be                      bra.s      $000142E6
[00014328] 3a2e fff0                 move.w     -16(a6),d5
[0001432c] ba6e 000c                 cmp.w      12(a6),d5
[00014330] 620c                      bhi.s      $0001433E
[00014332] 3a2e fff0                 move.w     -16(a6),d5
[00014336] 286e 0008                 movea.l    8(a6),a4
[0001433a] 4234 5000                 clr.b      0(a4,d5.w)
[0001433e] 4e5e                      unlk       a6
[00014340] 4e75                      rts

***
* MODULE disasm
***

[00014342] 4e56 0000                 link       a6,#0
[00014346] 4e5e                      unlk       a6
[00014348] 4e75                      rts

addch:
[0001434a] 4e56 0000                 link       a6,#0
[0001434e] 286d fffc                 movea.l    -4(a5),a4
[00014352] 3a39 0001 8c34            move.w     disasm.strpos,d5
[00014358] 286c 0008                 movea.l    8(a4),a4
[0001435c] 19ae 0008 5000            move.b     8(a6),0(a4,d5.w)
[00014362] 5279 0001 8c34            addq.w     #1,disasm.strpos
[00014368] 4e5e                      unlk       a6
[0001436a] 4e75                      rts

addstr:
[0001436c] 4e56 fffe                 link       a6,#-2
[00014370] 426e fffe                 clr.w      -2(a6)
[00014374] 3a2e 000c                 move.w     12(a6),d5
[00014378] 3f05                      move.w     d5,-(a7)
[0001437a] 302e fffe                 move.w     -2(a6),d0
[0001437e] b057                      cmp.w      (a7),d0
[00014380] 6304                      bls.s      $00014386
[00014382] 4efa 0024                 jmp        $000143A8(pc)
[00014386] 3a2e fffe                 move.w     -2(a6),d5
[0001438a] 286e 0008                 movea.l    8(a6),a4
[0001438e] 1f34 5000                 move.b     0(a4,d5.w),-(a7)
[00014392] 4eb9 0001 434a            jsr        addch
[00014398] 548f                      addq.l     #2,a7
[0001439a] 302e fffe                 move.w     -2(a6),d0
[0001439e] b057                      cmp.w      (a7),d0
[000143a0] 6406                      bcc.s      $000143A8
[000143a2] 526e fffe                 addq.w     #1,-2(a6)
[000143a6] 60de                      bra.s      $00014386
[000143a8] 548f                      addq.l     #2,a7
[000143aa] 4e5e                      unlk       a6
[000143ac] 4e75                      rts

addspaces:
[000143ae] 4e56 0000                 link       a6,#0
[000143b2] 3a39 0001 8c34            move.w     disasm.strpos,d5
[000143b8] 0245 0007                 andi.w     #$0007,d5
[000143bc] 4a45                      tst.w      d5
[000143be] 670e                      beq.s      $000143CE
[000143c0] 1f3c 0020                 move.b     #$20,-(a7)
[000143c4] 4eb9 0001 434a            jsr        addch
[000143ca] 548f                      addq.l     #2,a7
[000143cc] 60e4                      bra.s      $000143B2
[000143ce] 4e5e                      unlk       a6
[000143d0] 4e75                      rts

printhexchar:
[000143d2] 4e56 0000                 link       a6,#0
[000143d6] 0c6e 0009 0008            cmpi.w     #$0009,8(a6)
[000143dc] 6214                      bhi.s      $000143F2
[000143de] 7a30                      moveq.l    #48,d5
[000143e0] da6e 0008                 add.w      8(a6),d5
[000143e4] 1f05                      move.b     d5,-(a7)
[000143e6] 4eb9 0001 434a            jsr        addch
[000143ec] 548f                      addq.l     #2,a7
[000143ee] 4efa 002a                 jmp        $0001441A(pc)
[000143f2] 0c6e 000f 0008            cmpi.w     #$000F,8(a6)
[000143f8] 6218                      bhi.s      $00014412
[000143fa] 7a41                      moveq.l    #65,d5
[000143fc] da6e 0008                 add.w      8(a6),d5
[00014400] 0445 000a                 subi.w     #$000A,d5
[00014404] 1f05                      move.b     d5,-(a7)
[00014406] 4eb9 0001 434a            jsr        addch
[0001440c] 548f                      addq.l     #2,a7
[0001440e] 4efa 000a                 jmp        $0001441A(pc)
[00014412] 7000                      moveq.l    #0,d0
[00014414] 4eb9 0001 0028            jsr        HALTX
[0001441a] 4e5e                      unlk       a6
[0001441c] 4e75                      rts

printquickval:
[0001441e] 4e56 0000                 link       a6,#0
[00014422] 4a6e 0008                 tst.w      8(a6)
[00014426] 6610                      bne.s      $00014438
[00014428] 3f3c 0008                 move.w     #$0008,-(a7)
[0001442c] 4eb9 0001 43d2            jsr        printhexchar
[00014432] 548f                      addq.l     #2,a7
[00014434] 4efa 000e                 jmp        $00014444(pc)
[00014438] 3f2e 0008                 move.w     8(a6),-(a7)
[0001443c] 4eb9 0001 43d2            jsr        printhexchar
[00014442] 548f                      addq.l     #2,a7
[00014444] 4e5e                      unlk       a6
[00014446] 4e75                      rts

printsize:
[00014448] 4e56 0000                 link       a6,#0
[0001444c] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014452] ec4d                      lsr.w      #6,d5
[00014454] 0245 0003                 andi.w     #$0003,d5
[00014458] 4845                      swap       d5
[0001445a] 4245                      clr.w      d5
[0001445c] 4845                      swap       d5
[0001445e] 2005                      move.l     d5,d0
[00014460] 4eb9 0001 000a            jsr        CASEX
[00014466] 0000 0000
[0001446a] 0000 0002
[0001446e] 0000 0068
[00014472] 3f3c 0001                 move.w     #$0001,-(a7)
[00014476] 4879 0001 6848            pea.l      $00016848 '.B'
[0001447c] 4eb9 0001 436c            jsr        addstr
[00014482] 5c8f                      addq.l     #6,a7
[00014484] 4279 0001 8c36            clr.w      disasm.opsize
[0001448a] 4efa 0062                 jmp        $000144EE(pc)
[0001448e] 3f3c 0001                 move.w     #$0001,-(a7)
[00014492] 4879 0001 684c            pea.l      $0001684C '.W'
[00014498] 4eb9 0001 436c            jsr        addstr
[0001449e] 5c8f                      addq.l     #6,a7
[000144a0] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[000144a8] 4efa 0044                 jmp        $000144EE(pc)
[000144ac] 3f3c 0001                 move.w     #$0001,-(a7)
[000144b0] 4879 0001 6850            pea.l      $00016850 '.L'
[000144b6] 4eb9 0001 436c            jsr        addstr
[000144bc] 5c8f                      addq.l     #6,a7
[000144be] 33fc 0002 0001 8c36       move.w     #$0002,disasm.opsize
[000144c6] 4efa 0026                 jmp        $000144EE(pc)
[000144ca] 4efa 0008                 jmp        $000144D4(pc)
[000144ce] 000c
           0028
[000144d2] 0046
[000144d4] 3f3c                      move.w     #$0001,-(a7)
[000144d6] 4879 0001 6854            pea.l      $00016854 '.?'
[000144de] 4eb9 0001 436c            jsr        addstr
[000144e4] 5c8f                      addq.l     #6,a7
[000144e6] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[000144ee] 4e5e                      unlk       a6
[000144f0] 4e75                      rts

printhexbyte:
[000144f2] 4e56 0000                 link       a6,#0
[000144f6] 3a2e 0008                 move.w     8(a6),d5
[000144fa] e84d                      lsr.w      #4,d5
[000144fc] 0245 000f                 andi.w     #$000F,d5
[00014500] 3f05                      move.w     d5,-(a7)
[00014502] 4eb9 0001 43d2            jsr        printhexchar
[00014508] 548f                      addq.l     #2,a7
[0001450a] 3a2e 0008                 move.w     8(a6),d5
[0001450e] 0245 000f                 andi.w     #$000F,d5
[00014512] 3f05                      move.w     d5,-(a7)
[00014514] 4eb9 0001 43d2            jsr        printhexchar
[0001451a] 548f                      addq.l     #2,a7
[0001451c] 1f3c 0048                 move.b     #$48,-(a7)
[00014520] 4eb9 0001 434a            jsr        addch
[00014526] 548f                      addq.l     #2,a7
[00014528] 4e5e                      unlk       a6
[0001452a] 4e75                      rts

printhexword:
[0001452c] 4e56 0000                 link       a6,#0
[00014530] 3a2e 0008                 move.w     8(a6),d5
[00014534] e84d                      lsr.w      #4,d5
[00014536] e04d                      lsr.w      #8,d5
[00014538] 0245 000f                 andi.w     #$000F,d5
[0001453c] 3f05                      move.w     d5,-(a7)
[0001453e] 4eb9 0001 43d2            jsr        printhexchar
[00014544] 548f                      addq.l     #2,a7
[00014546] 3a2e 0008                 move.w     8(a6),d5
[0001454a] e04d                      lsr.w      #8,d5
[0001454c] 0245 000f                 andi.w     #$000F,d5
[00014550] 3f05                      move.w     d5,-(a7)
[00014552] 4eb9 0001 43d2            jsr        printhexchar
[00014558] 548f                      addq.l     #2,a7
[0001455a] 3a2e 0008                 move.w     8(a6),d5
[0001455e] e84d                      lsr.w      #4,d5
[00014560] 0245 000f                 andi.w     #$000F,d5
[00014564] 3f05                      move.w     d5,-(a7)
[00014566] 4eb9 0001 43d2            jsr        printhexchar
[0001456c] 548f                      addq.l     #2,a7
[0001456e] 3a2e 0008                 move.w     8(a6),d5
[00014572] 0245 000f                 andi.w     #$000F,d5
[00014576] 3f05                      move.w     d5,-(a7)
[00014578] 4eb9 0001 43d2            jsr        printhexchar
[0001457e] 548f                      addq.l     #2,a7
[00014580] 4e5e                      unlk       a6
[00014582] 4e75                      rts

incpc:
[00014584] 4e56 0000                 link       a6,#0
[00014588] 286d fffc                 movea.l    -4(a5),a4
[0001458c] 54ac 0012                 addq.l     #2,18(a4)
[00014590] 286d fffc                 movea.l    -4(a5),a4
[00014594] 286c 000e                 movea.l    14(a4),a4
[00014598] 5254                      addq.w     #1,(a4)
[0001459a] 4e5e                      unlk       a6
[0001459c] 4e75                      rts

fetchword:
[0001459e] 4e56 0000                 link       a6,#0
[000145a2] 286d fffc                 movea.l    -4(a5),a4
[000145a6] 286c 0012                 movea.l    18(a4),a4
[000145aa] 33d4 0001 8c3a            move.w     (a4),disp
[000145b0] 3f39 0001 8c3a            move.w     disp,-(a7)
[000145b6] 4eb9 0001 452c            jsr        printhexword
[000145bc] 548f                      addq.l     #2,a7
[000145be] 4eb9 0001 4342            jsr        x14342
[000145c4] 4eb9 0001 4584            jsr        incpc
[000145ca] 4e5e                      unlk       a6
[000145cc] 4e75                      rts

printtarget:
[000145ce] 4e56 fffc                 link       a6,#-4
[000145d2] 286d fffc                 movea.l    -4(a5),a4
[000145d6] 7a00                      moveq.l    #0,d5
[000145d8] 3a2e 0008                 move.w     8(a6),d5
[000145dc] 282c 0016                 move.l     22(a4),d4
[000145e0] 9885                      sub.l      d5,d4
[000145e2] 286d fffc                 movea.l    -4(a5),a4
[000145e6] 286c 000e                 movea.l    14(a4),a4
[000145ea] 3a14                      move.w     (a4),d5
[000145ec] da45                      add.w      d5,d5
[000145ee] 4845                      swap       d5
[000145f0] 4245                      clr.w      d5
[000145f2] 4845                      swap       d5
[000145f4] d885                      add.l      d5,d4
[000145f6] 3a39 0001 8c3a            move.w     disp,d5
[000145fc] 48c5                      ext.l      d5
[000145fe] d885                      add.l      d5,d4
[00014600] 2d44 fffc                 move.l     d4,-4(a6)
[00014604] 2a2e fffc                 move.l     -4(a6),d5
[00014608] 7810                      moveq.l    #16,d4
[0001460a] e8ad                      lsr.l      d4,d5
[0001460c] 3f05                      move.w     d5,-(a7)
[0001460e] 4eb9 0001 452c            jsr        printhexword
[00014614] 548f                      addq.l     #2,a7
[00014616] 2a2e fffc                 move.l     -4(a6),d5
[0001461a] 0285 0000 ffff            andi.l     #$0000FFFF,d5
[00014620] 3f05                      move.w     d5,-(a7)
[00014622] 4eb9 0001 452c            jsr        printhexword
[00014628] 548f                      addq.l     #2,a7
[0001462a] 1f3c 0048                 move.b     #$48,-(a7)
[0001462e] 4eb9 0001 434a            jsr        addch
[00014634] 548f                      addq.l     #2,a7
[00014636] 4e5e                      unlk       a6
[00014638] 4e75                      rts

printaddrreg:
[0001463a] 4e56 0000                 link       a6,#0
[0001463e] 1f3c 0041                 move.b     #$41,-(a7)
[00014642] 4eb9 0001 434a            jsr        addch
[00014648] 548f                      addq.l     #2,a7
[0001464a] 3f2e 0008                 move.w     8(a6),-(a7)
[0001464e] 4eb9 0001 43d2            jsr        printhexchar
[00014654] 548f                      addq.l     #2,a7
[00014656] 4e5e                      unlk       a6
[00014658] 4e75                      rts

printaddrreg
[0001465a] 4e56 0000                 link       a6,#0
[0001465e] 1f3c 0044                 move.b     #$44,-(a7)
[00014662] 4eb9 0001 434a            jsr        addch
[00014668] 548f                      addq.l     #2,a7
[0001466a] 3f2e 0008                 move.w     8(a6),-(a7)
[0001466e] 4eb9 0001 43d2            jsr        printhexchar
[00014674] 548f                      addq.l     #2,a7
[00014676] 4e5e                      unlk       a6
[00014678] 4e75                      rts

printeamode:
[0001467a] 4e56 0000                 link       a6,#0
[0001467e] 3a2e 000a                 move.w     10(a6),d5
[00014682] 0245 0007                 andi.w     #$0007,d5
[00014686] 4845                      swap       d5
[00014688] 4245                      clr.w      d5
[0001468a] 4845                      swap       d5
[0001468c] 2005                      move.l     d5,d0
[0001468e] 4eb9 0001 000a            jsr        CASEX
[00014694] 0000 0000
[00014698] 0000 0007
[0001469c] 0000 041c
case 0
[000146a0] 3f2e 0008                 move.w     8(a6),-(a7)
[000146a4] 4eb9 0001 465a            jsr        printdatareg
[000146aa] 548f                      addq.l     #2,a7
[000146ac] 4efa 0412                 jmp        $00014AC0(pc)
case 1:
[000146b0] 3f2e 0008                 move.w     8(a6),-(a7)
[000146b4] 4eb9 0001 463a            jsr        printaddrreg
[000146ba] 548f                      addq.l     #2,a7
[000146bc] 4efa 0402                 jmp        $00014AC0(pc)
case 2:
[000146c0] 1f3c 0028                 move.b     #$28,-(a7)
[000146c4] 4eb9 0001 434a            jsr        addch
[000146ca] 548f                      addq.l     #2,a7
[000146cc] 3f2e 0008                 move.w     8(a6),-(a7)
[000146d0] 4eb9 0001 463a            jsr        printaddrreg
[000146d6] 548f                      addq.l     #2,a7
[000146d8] 1f3c 0029                 move.b     #$29,-(a7)
[000146dc] 4eb9 0001 434a            jsr        addch
[000146e2] 548f                      addq.l     #2,a7
[000146e4] 4efa 03da                 jmp        $00014AC0(pc)
case 3:
[000146e8] 1f3c 0028                 move.b     #$28,-(a7)
[000146ec] 4eb9 0001 434a            jsr        addch
[000146f2] 548f                      addq.l     #2,a7
[000146f4] 3f2e 0008                 move.w     8(a6),-(a7)
[000146f8] 4eb9 0001 463a            jsr        printaddrreg
[000146fe] 548f                      addq.l     #2,a7
[00014700] 3f3c 0001                 move.w     #$0001,-(a7)
[00014704] 4879 0001 6864            pea.l      $00016864 ')+'
[0001470a] 4eb9 0001 436c            jsr        addstr
[00014710] 5c8f                      addq.l     #6,a7
[00014712] 4efa 03ac                 jmp        $00014AC0(pc)
case 4:
[00014716] 3f3c 0001                 move.w     #$0001,-(a7)
[0001471a] 4879 0001 6868            pea.l      $00016868 '-('
[00014720] 4eb9 0001 436c            jsr        addstr
[00014726] 5c8f                      addq.l     #6,a7
[00014728] 3f2e 0008                 move.w     8(a6),-(a7)
[0001472c] 4eb9 0001 463a            jsr        printaddrreg
[00014732] 548f                      addq.l     #2,a7
[00014734] 1f3c 0029                 move.b     #$29,-(a7)
[00014738] 4eb9 0001 434a            jsr        addch
[0001473e] 548f                      addq.l     #2,a7
[00014740] 4efa 037e                 jmp        $00014AC0(pc)
case 5:
[00014744] 4eb9 0001 459e            jsr        fetchword
[0001474a] 1f3c 0028                 move.b     #$28,-(a7)
[0001474e] 4eb9 0001 434a            jsr        addch
[00014754] 548f                      addq.l     #2,a7
[00014756] 3f2e 0008                 move.w     8(a6),-(a7)
[0001475a] 4eb9 0001 463a            jsr        printaddrreg
[00014760] 548f                      addq.l     #2,a7
[00014762] 1f3c 0029                 move.b     #$29,-(a7)
[00014766] 4eb9 0001 434a            jsr        addch
[0001476c] 548f                      addq.l     #2,a7
[0001476e] 4efa 0350                 jmp        $00014AC0(pc)
case 6:
[00014772] 286d fffc                 movea.l    -4(a5),a4
[00014776] 286c 0012                 movea.l    18(a4),a4
[0001477a] 3a14                      move.w     (a4),d5
[0001477c] 0245 00ff                 andi.w     #$00FF,d5
[00014780] 3f05                      move.w     d5,-(a7)
[00014782] 4eb9 0001 44f2            jsr        printhexbyte
[00014788] 548f                      addq.l     #2,a7
[0001478a] 1f3c 0028                 move.b     #$28,-(a7)
[0001478e] 4eb9 0001 434a            jsr        addch
[00014794] 548f                      addq.l     #2,a7
[00014796] 3f2e 0008                 move.w     8(a6),-(a7)
[0001479a] 4eb9 0001 463a            jsr        printaddrreg
[000147a0] 548f                      addq.l     #2,a7
[000147a2] 1f3c 002c                 move.b     #$2C,-(a7)
[000147a6] 4eb9 0001 434a            jsr        addch
[000147ac] 548f                      addq.l     #2,a7
[000147ae] 286d fffc                 movea.l    -4(a5),a4
[000147b2] 286c 0012                 movea.l    18(a4),a4
[000147b6] 4a54                      tst.w      (a4)
[000147b8] 6d10                      blt.s      $000147CA
[000147ba] 1f3c 0044                 move.b     #$44,-(a7)
[000147be] 4eb9 0001 434a            jsr        addch
[000147c4] 548f                      addq.l     #2,a7
[000147c6] 4efa 000e                 jmp        $000147D6(pc)
[000147ca] 1f3c 0041                 move.b     #$41,-(a7)
[000147ce] 4eb9 0001 434a            jsr        addch
[000147d4] 548f                      addq.l     #2,a7
[000147d6] 286d fffc                 movea.l    -4(a5),a4
[000147da] 286c 0012                 movea.l    18(a4),a4
[000147de] 3a14                      move.w     (a4),d5
[000147e0] e84d                      lsr.w      #4,d5
[000147e2] e04d                      lsr.w      #8,d5
[000147e4] 0245 0007                 andi.w     #$0007,d5
[000147e8] 3f05                      move.w     d5,-(a7)
[000147ea] 4eb9 0001 43d2            jsr        printhexchar
[000147f0] 548f                      addq.l     #2,a7
[000147f2] 1f3c 002e                 move.b     #$2E,-(a7)
[000147f6] 4eb9 0001 434a            jsr        addch
[000147fc] 548f                      addq.l     #2,a7
[000147fe] 286d fffc                 movea.l    -4(a5),a4
[00014802] 286c 0012                 movea.l    18(a4),a4
[00014806] 3a14                      move.w     (a4),d5
[00014808] e64d                      lsr.w      #3,d5
[0001480a] e04d                      lsr.w      #8,d5
[0001480c] 0245 0001                 andi.w     #$0001,d5
[00014810] 4a45                      tst.w      d5
[00014812] 6610                      bne.s      $00014824
[00014814] 1f3c 0057                 move.b     #$57,-(a7)
[00014818] 4eb9 0001 434a            jsr        addch
[0001481e] 548f                      addq.l     #2,a7
[00014820] 4efa 000e                 jmp        $00014830(pc)
[00014824] 1f3c 004c                 move.b     #$4C,-(a7)
[00014828] 4eb9 0001 434a            jsr        addch
[0001482e] 548f                      addq.l     #2,a7
[00014830] 1f3c 0029                 move.b     #$29,-(a7)
[00014834] 4eb9 0001 434a            jsr        addch
[0001483a] 548f                      addq.l     #2,a7
[0001483c] 4eb9 0001 4342            jsr        x14342
[00014842] 4eb9 0001 4584            jsr        incpc
[00014848] 4efa 0276                 jmp        $00014AC0(pc)
case 7:
[0001484c] 3a2e 0008                 move.w     8(a6),d5
[00014850] 0245 0007                 andi.w     #$0007,d5
[00014854] 4845                      swap       d5
[00014856] 4245                      clr.w      d5
[00014858] 4845                      swap       d5
[0001485a] 2005                      move.l     d5,d0
[0001485c] 4eb9 0001 000a            jsr        CASEX
[00014862] 0000 0000
[00014866] 0000 0004
[0001486a] 0000 022a
case 7.0:
[0001486e] 4eb9 0001 459e            jsr        fetchword
[00014874] 1f3c 0048                 move.b     #$48,-(a7)
[00014878] 4eb9 0001 434a            jsr        addch
[0001487e] 548f                      addq.l     #2,a7
[00014880] 4efa 0226                 jmp        $00014AA8(pc)
case 7.1:
[00014884] 4eb9 0001 459e            jsr        fetchword
[0001488a] 4eb9 0001 459e            jsr        fetchword
[00014890] 1f3c 0048                 move.b     #$48,-(a7)
[00014894] 4eb9 0001 434a            jsr        addch
[0001489a] 548f                      addq.l     #2,a7
[0001489c] 4efa 020a                 jmp        $00014AA8(pc)
case 7.2:
[000148a0] 1f3c 005b                 move.b     #$5B,-(a7)
[000148a4] 4eb9 0001 434a            jsr        addch
[000148aa] 548f                      addq.l     #2,a7
[000148ac] 4eb9 0001 459e            jsr        fetchword
[000148b2] 3f3c 0004                 move.w     #$0004,-(a7)
[000148b6] 4879 0001 686c            pea.l      $0001686C 'H] = '
[000148bc] 4eb9 0001 436c            jsr        addstr
[000148c2] 5c8f                      addq.l     #6,a7
[000148c4] 3f3c 0002                 move.w     #$0002,-(a7)
[000148c8] 4eb9 0001 45ce            jsr        printtarget
[000148ce] 548f                      addq.l     #2,a7
[000148d0] 4efa 01d6                 jmp        $00014AA8(pc)
case 7.3:
[000148d4] 1f3c 005b                 move.b     #$5B,-(a7)
[000148d8] 4eb9 0001 434a            jsr        addch
[000148de] 548f                      addq.l     #2,a7
[000148e0] 286d fffc                 movea.l    -4(a5),a4
[000148e4] 286c 0012                 movea.l    18(a4),a4
[000148e8] 3a14                      move.w     (a4),d5
[000148ea] 0245 00ff                 andi.w     #$00FF,d5
[000148ee] 3f05                      move.w     d5,-(a7)
[000148f0] 4eb9 0001 44f2            jsr        printhexbyte
[000148f6] 548f                      addq.l     #2,a7
[000148f8] 3f3c 0003                 move.w     #$0003,-(a7)
[000148fc] 4879 0001 6872            pea.l      $00016872 '] = '
[00014902] 4eb9 0001 436c            jsr        addstr
[00014908] 5c8f                      addq.l     #6,a7
[0001490a] 286d fffc                 movea.l    -4(a5),a4
[0001490e] 286c 0012                 movea.l    18(a4),a4
[00014912] 3a14                      move.w     (a4),d5
[00014914] 0245 00ff                 andi.w     #$00FF,d5
[00014918] 33c5 0001 8c3a            move.w     d5,disp
[0001491e] 0c79 0080 0001 8c3a       cmpi.w     #$0080,disp
[00014926] 6d08                      blt.s      $00014930
[00014928] 0479 0100 0001 8c3a       subi.w     #$0100,disp
[00014930] 3f3c 0002                 move.w     #$0002,-(a7)
[00014934] 4eb9 0001 45ce            jsr        printtarget
[0001493a] 548f                      addq.l     #2,a7
[0001493c] 1f3c 0028                 move.b     #$28,-(a7)
[00014940] 4eb9 0001 434a            jsr        addch
[00014946] 548f                      addq.l     #2,a7
[00014948] 286d fffc                 movea.l    -4(a5),a4
[0001494c] 286c 0012                 movea.l    18(a4),a4
[00014950] 4a54                      tst.w      (a4)
[00014952] 6d10                      blt.s      $00014964
[00014954] 1f3c 0044                 move.b     #$44,-(a7)
[00014958] 4eb9 0001 434a            jsr        addch
[0001495e] 548f                      addq.l     #2,a7
[00014960] 4efa 000e                 jmp        $00014970(pc)
[00014964] 1f3c 0041                 move.b     #$41,-(a7)
[00014968] 4eb9 0001 434a            jsr        addch
[0001496e] 548f                      addq.l     #2,a7
[00014970] 286d fffc                 movea.l    -4(a5),a4
[00014974] 286c 0012                 movea.l    18(a4),a4
[00014978] 3a14                      move.w     (a4),d5
[0001497a] e84d                      lsr.w      #4,d5
[0001497c] e04d                      lsr.w      #8,d5
[0001497e] 0245 0007                 andi.w     #$0007,d5
[00014982] 3f05                      move.w     d5,-(a7)
[00014984] 4eb9 0001 43d2            jsr        printhexchar
[0001498a] 548f                      addq.l     #2,a7
[0001498c] 1f3c 002e                 move.b     #$2E,-(a7)
[00014990] 4eb9 0001 434a            jsr        addch
[00014996] 548f                      addq.l     #2,a7
[00014998] 286d fffc                 movea.l    -4(a5),a4
[0001499c] 286c 0012                 movea.l    18(a4),a4
[000149a0] 3a14                      move.w     (a4),d5
[000149a2] e64d                      lsr.w      #3,d5
[000149a4] e04d                      lsr.w      #8,d5
[000149a6] 0245 0001                 andi.w     #$0001,d5
[000149aa] 4a45                      tst.w      d5
[000149ac] 6610                      bne.s      $000149BE
[000149ae] 1f3c 0057                 move.b     #$57,-(a7)
[000149b2] 4eb9 0001 434a            jsr        addch
[000149b8] 548f                      addq.l     #2,a7
[000149ba] 4efa 000e                 jmp        $000149CA(pc)
[000149be] 1f3c 004c                 move.b     #$4C,-(a7)
[000149c2] 4eb9 0001 434a            jsr        addch
[000149c8] 548f                      addq.l     #2,a7
[000149ca] 1f3c 0029                 move.b     #$29,-(a7)
[000149ce] 4eb9 0001 434a            jsr        addch
[000149d4] 548f                      addq.l     #2,a7
[000149d6] 4eb9 0001 4342            jsr        x14342
[000149dc] 4eb9 0001 4584            jsr        incpc
[000149e2] 4efa 00c4                 jmp        $00014AA8(pc)
case 7.4:
[000149e6] 1f3c 0023                 move.b     #$23,-(a7)
[000149ea] 4eb9 0001 434a            jsr        addch
[000149f0] 548f                      addq.l     #2,a7
[000149f2] 7a00                      moveq.l    #0,d5
[000149f4] 3a39 0001 8c36            move.w     disasm.opsize,d5
[000149fa] 2005                      move.l     d5,d0
[000149fc] 4eb9 0001 000a            jsr        CASEX
[00014a02] 0000 0000
[00014a06] 0000 0002
[00014a0a] 0000 006a
case 7.4.0:
[00014a0e] 286d fffc                 movea.l    -4(a5),a4
[00014a12] 286c 0012                 movea.l    18(a4),a4
[00014a16] 3a14                      move.w     (a4),d5
[00014a18] 0245 00ff                 andi.w     #$00FF,d5
[00014a1c] 3f05                      move.w     d5,-(a7)
[00014a1e] 4eb9 0001 44f2            jsr        printhexbyte
[00014a24] 548f                      addq.l     #2,a7
[00014a26] 4eb9 0001 4342            jsr        x14342
[00014a2c] 4eb9 0001 4584            jsr        incpc
[00014a32] 4efa 0050                 jmp        $00014A84(pc)
case 7.4.1:
[00014a36] 4eb9 0001 459e            jsr        fetchword
[00014a3c] 1f3c 0048                 move.b     #$48,-(a7)
[00014a40] 4eb9 0001 434a            jsr        addch
[00014a46] 548f                      addq.l     #2,a7
[00014a48] 4efa 003a                 jmp        $00014A84(pc)
case 7.4.2:
[00014a4c] 4eb9 0001 459e            jsr        fetchword
[00014a52] 4eb9 0001 459e            jsr        fetchword
[00014a58] 1f3c 0048                 move.b     #$48,-(a7)
[00014a5c] 4eb9 0001 434a            jsr        addch
[00014a62] 548f                      addq.l     #2,a7
[00014a64] 4efa 001e                 jmp        $00014A84(pc)
[00014a68] 4efa 0008                 jmp        $00014A72(pc)
[00014a6c] 000c
           0034
[00014a70] 004a
[00014a72] 3f3c 0002                 move.w     #$0002,-(a7)
[00014a76] 4879 0001 6878            pea.l      $00016878 '???'
[00014a7c] 4eb9 0001 436c            jsr        addstr
[00014a82] 5c8f                      addq.l     #6,a7
[00014a84] 4efa 0022                 jmp        $00014AA8(pc)
[00014a88] 4efa 000c                 jmp        $00014A96(pc)
[00014a8c] 000c
           0022
[00014a90] 003e
           0072
[00014a94] 0184
[00014a96] 3f3c 0002                 move.w     #$0002,-(a7)
[00014a9a] 4879 0001 687c            pea.l      $0001687C '???'
[00014aa0] 4eb9 0001 436c            jsr        addstr
[00014aa6] 5c8f                      addq.l     #6,a7
[00014aa8] 4efa 0016                 jmp        $00014AC0(pc)
[00014aac] 4efa 0012                 jmp        $00014AC0(pc)
[00014ab0] 000c
           001c
[00014ab4] 002c
           0054
           0082
[00014aba] 00b0
           00de
           01b8
[00014ac0]                           unlk       a6
[00014ac2] 4e75                      rts

printea:
[00014ac4] 4e56 0000                 link       a6,#0
[00014ac8] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014ace] e64d                      lsr.w      #3,d5
[00014ad0] 0245 0007                 andi.w     #$0007,d5
[00014ad4] 3f05                      move.w     d5,-(a7)
[00014ad6] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014adc] 0245 0007                 andi.w     #$0007,d5
[00014ae0] 3f05                      move.w     d5,-(a7)
[00014ae2] 4eb9 0001 467a            jsr        printeamode
[00014ae8] 588f                      addq.l     #4,a7
[00014aea] 4e5e                      unlk       a6
[00014aec] 4e75                      rts

printdataorpredec:
[00014aee] 4e56 0000                 link       a6,#0
[00014af2] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014af8] e64d                      lsr.w      #3,d5
[00014afa] 0245 0001                 andi.w     #$0001,d5
[00014afe] 4a45                      tst.w      d5
[00014b00] 663c                      bne.s      $00014B3E
[00014b02] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014b08] 0245 0007                 andi.w     #$0007,d5
[00014b0c] 3f05                      move.w     d5,-(a7)
[00014b0e] 4eb9 0001 465a            jsr        printdatareg
[00014b14] 548f                      addq.l     #2,a7
[00014b16] 1f3c 002c                 move.b     #$2C,-(a7)
[00014b1a] 4eb9 0001 434a            jsr        addch
[00014b20] 548f                      addq.l     #2,a7
[00014b22] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014b28] e24d                      lsr.w      #1,d5
[00014b2a] e04d                      lsr.w      #8,d5
[00014b2c] 0245 0007                 andi.w     #$0007,d5
[00014b30] 3f05                      move.w     d5,-(a7)
[00014b32] 4eb9 0001 465a            jsr        printdatareg
[00014b38] 548f                      addq.l     #2,a7
[00014b3a] 4efa 005e                 jmp        $00014B9A(pc)
[00014b3e] 3f3c 0001                 move.w     #$0001,-(a7)
[00014b42] 4879 0001 6880            pea.l      $00016880 '-('
[00014b48] 4eb9 0001 436c            jsr        addstr
[00014b4e] 5c8f                      addq.l     #6,a7
[00014b50] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014b56] 0245 0007                 andi.w     #$0007,d5
[00014b5a] 3f05                      move.w     d5,-(a7)
[00014b5c] 4eb9 0001 463a            jsr        printaddrreg
[00014b62] 548f                      addq.l     #2,a7
[00014b64] 3f3c 0003                 move.w     #$0003,-(a7)
[00014b68] 4879 0001 6884            pea.l      $00016884 '),-('
[00014b6e] 4eb9 0001 436c            jsr        addstr
[00014b74] 5c8f                      addq.l     #6,a7
[00014b76] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014b7c] e24d                      lsr.w      #1,d5
[00014b7e] e04d                      lsr.w      #8,d5
[00014b80] 0245 0007                 andi.w     #$0007,d5
[00014b84] 3f05                      move.w     d5,-(a7)
[00014b86] 4eb9 0001 463a            jsr        printaddrreg
[00014b8c] 548f                      addq.l     #2,a7
[00014b8e] 1f3c 0029                 move.b     #$29,-(a7)
[00014b92] 4eb9 0001 434a            jsr        addch
[00014b98] 548f                      addq.l     #2,a7
[00014b9a] 4e5e                      unlk       a6
[00014b9c] 4e75                      rts

printcc:
[00014b9e] 4e56 0000                 link       a6,#0
[00014ba2] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014ba8] e04d                      lsr.w      #8,d5
[00014baa] 0245 000f                 andi.w     #$000F,d5
[00014bae] 4845                      swap       d5
[00014bb0] 4245                      clr.w      d5
[00014bb2] 4845                      swap       d5
[00014bb4] 2005                      move.l     d5,d0
[00014bb6] 4eb9 0001 000a            jsr        CASEX
[00014bbc] 0000 0000
[00014bc0] 0000 000f
[00014bc4] 0000 0164
[00014bc8] 1f3c 0054                 move.b     #$54,-(a7)
[00014bcc] 4eb9 0001 434a            jsr        addch
[00014bd2] 548f                      addq.l     #2,a7
[00014bd4] 4efa 016a                 jmp        $00014D40(pc)
[00014bd8] 1f3c 0046                 move.b     #$46,-(a7)
[00014bdc] 4eb9 0001 434a            jsr        addch
[00014be2] 548f                      addq.l     #2,a7
[00014be4] 4efa 015a                 jmp        $00014D40(pc)
[00014be8] 3f3c 0001                 move.w     #$0001,-(a7)
[00014bec] 4879 0001 688a            pea.l      $0001688A 'HI'
[00014bf2] 4eb9 0001 436c            jsr        addstr
[00014bf8] 5c8f                      addq.l     #6,a7
[00014bfa] 4efa 0144                 jmp        $00014D40(pc)
[00014bfe] 3f3c 0001                 move.w     #$0001,-(a7)
[00014c02] 4879 0001 688e            pea.l      $0001688E 'LS'
[00014c08] 4eb9 0001 436c            jsr        addstr
[00014c0e] 5c8f                      addq.l     #6,a7
[00014c10] 4efa 012e                 jmp        $00014D40(pc)
[00014c14] 3f3c 0001                 move.w     #$0001,-(a7)
[00014c18] 4879 0001 6892            pea.l      $00016892 'CC'
[00014c1e] 4eb9 0001 436c            jsr        addstr
[00014c24] 5c8f                      addq.l     #6,a7
[00014c26] 4efa 0118                 jmp        $00014D40(pc)
[00014c2a] 3f3c 0001                 move.w     #$0001,-(a7)
[00014c2e] 4879 0001 6896            pea.l      $00016896 'CS'
[00014c34] 4eb9 0001 436c            jsr        addstr
[00014c3a] 5c8f                      addq.l     #6,a7
[00014c3c] 4efa 0102                 jmp        $00014D40(pc)
[00014c40] 3f3c 0001                 move.w     #$0001,-(a7)
[00014c44] 4879 0001 689a            pea.l      $0001689A 'NE'
[00014c4a] 4eb9 0001 436c            jsr        addstr
[00014c50] 5c8f                      addq.l     #6,a7
[00014c52] 4efa 00ec                 jmp        $00014D40(pc)
[00014c56] 3f3c 0001                 move.w     #$0001,-(a7)
[00014c5a] 4879 0001 689e            pea.l      $0001689E 'EQ'
[00014c60] 4eb9 0001 436c            jsr        addstr
[00014c66] 5c8f                      addq.l     #6,a7
[00014c68] 4efa 00d6                 jmp        $00014D40(pc)
[00014c6c] 3f3c 0001                 move.w     #$0001,-(a7)
[00014c70] 4879 0001 68a2            pea.l      $000168A2 'VC'
[00014c76] 4eb9 0001 436c            jsr        addstr
[00014c7c] 5c8f                      addq.l     #6,a7
[00014c7e] 4efa 00c0                 jmp        $00014D40(pc)
[00014c82] 3f3c 0001                 move.w     #$0001,-(a7)
[00014c86] 4879 0001 68a6            pea.l      $000168A6 'VS'
[00014c8c] 4eb9 0001 436c            jsr        addstr
[00014c92] 5c8f                      addq.l     #6,a7
[00014c94] 4efa 00aa                 jmp        $00014D40(pc)
[00014c98] 3f3c 0001                 move.w     #$0001,-(a7)
[00014c9c] 4879 0001 68aa            pea.l      $000168AA 'PL'
[00014ca2] 4eb9 0001 436c            jsr        addstr
[00014ca8] 5c8f                      addq.l     #6,a7
[00014caa] 4efa 0094                 jmp        $00014D40(pc)
[00014cae] 3f3c 0001                 move.w     #$0001,-(a7)
[00014cb2] 4879 0001 68ae            pea.l      $000168AE 'MI'
[00014cb8] 4eb9 0001 436c            jsr        addstr
[00014cbe] 5c8f                      addq.l     #6,a7
[00014cc0] 4efa 007e                 jmp        $00014D40(pc)
[00014cc4] 3f3c 0001                 move.w     #$0001,-(a7)
[00014cc8] 4879 0001 68b2            pea.l      $000168B2 'GE'
[00014cce] 4eb9 0001 436c            jsr        addstr
[00014cd4] 5c8f                      addq.l     #6,a7
[00014cd6] 4efa 0068                 jmp        $00014D40(pc)
[00014cda] 3f3c 0001                 move.w     #$0001,-(a7)
[00014cde] 4879 0001 68b6            pea.l      $000168B6 'LT'
[00014ce4] 4eb9 0001 436c            jsr        addstr
[00014cea] 5c8f                      addq.l     #6,a7
[00014cec] 4efa 0052                 jmp        $00014D40(pc)
[00014cf0] 3f3c 0001                 move.w     #$0001,-(a7)
[00014cf4] 4879 0001 68ba            pea.l      $000168BA 'GT'
[00014cfa] 4eb9 0001 436c            jsr        addstr
[00014d00] 5c8f                      addq.l     #6,a7
[00014d02] 4efa 003c                 jmp        $00014D40(pc)
[00014d06] 3f3c 0001                 move.w     #$0001,-(a7)
[00014d0a] 4879 0001 68be            pea.l      $000168BE 'LE'
[00014d10] 4eb9 0001 436c            jsr        addstr
[00014d16] 5c8f                      addq.l     #6,a7
[00014d18] 4efa 0026                 jmp        $00014D40(pc)
[00014d1c] 4efa 0022                 jmp        $00014D40(pc)
[00014d20] 000c 001c                 ori.b      #$1C,a4 ; apollo only
[00014d24] 002c 0042 0058            ori.b      #$42,88(a4)
[00014d2a] 006e 0084 009a            ori.w      #$0084,154(a6)
[00014d30] 00b0 00c6 00dc 00f2       ori.l      #$00C600DC,-14(a0,d0.w)
[00014d38] 0108 011e                 movep.w    286(a0),d0
[00014d3c] 0134 014a 4e5e            btst       d0,([a4],$4E5E) ; 68020+ only; reserved BD=0
[00014d42] 4e75                      rts

printshiftinst:
[00014d44] 4e56 0000                 link       a6,#0
[00014d48] 3a2e 0008                 move.w     8(a6),d5
[00014d4c] 0245 0003                 andi.w     #$0003,d5
[00014d50] 4845                      swap       d5
[00014d52] 4245                      clr.w      d5
[00014d54] 4845                      swap       d5
[00014d56] 2005                      move.l     d5,d0
[00014d58] 4eb9 0001 000a            jsr        CASEX
[00014d5e] 0000 0000
[00014d62] 0000 0003
[00014d66] 0000 0068
[00014d6a] 3f3c 0001                 move.w     #$0001,-(a7)
[00014d6e] 4879 0001 68c2            pea.l      $000168C2 'AS'
[00014d74] 4eb9 0001 436c            jsr        addstr
[00014d7a] 5c8f                      addq.l     #6,a7
[00014d7c] 4efa 0050                 jmp        $00014DCE(pc)
[00014d80] 3f3c 0001                 move.w     #$0001,-(a7)
[00014d84] 4879 0001 68c6            pea.l      $000168C6 'LS'
[00014d8a] 4eb9 0001 436c            jsr        addstr
[00014d90] 5c8f                      addq.l     #6,a7
[00014d92] 4efa 003a                 jmp        $00014DCE(pc)
[00014d96] 3f3c 0002                 move.w     #$0002,-(a7)
[00014d9a] 4879 0001 68ca            pea.l      $000168CA 'ROX'
[00014da0] 4eb9 0001 436c            jsr        addstr
[00014da6] 5c8f                      addq.l     #6,a7
[00014da8] 4efa 0024                 jmp        $00014DCE(pc)
[00014dac] 3f3c 0001                 move.w     #$0001,-(a7)
[00014db0] 4879 0001 68ce            pea.l      $000168CE 'RO'
[00014db6] 4eb9 0001 436c            jsr        addstr
[00014dbc] 5c8f                      addq.l     #6,a7
[00014dbe] 4efa 000e                 jmp        $00014DCE(pc)
[00014dc2] 4efa 000a                 jmp        $00014DCE(pc)
[00014dc6] 000c
           0022
[00014dca] 0038
           004e
[00014dce] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014dd4] e04d                      lsr.w      #8,d5
[00014dd6] 0245 0001                 andi.w     #$0001,d5
[00014dda] 4a45                      tst.w      d5
[00014ddc] 6610                      bne.s      $00014DEE
[00014dde] 1f3c 0052                 move.b     #$52,-(a7)
[00014de2] 4eb9 0001 434a            jsr        addch
[00014de8] 548f                      addq.l     #2,a7
[00014dea] 4efa 000e                 jmp        $00014DFA(pc)
[00014dee] 1f3c 004c                 move.b     #$4C,-(a7)
[00014df2] 4eb9 0001 434a            jsr        addch
[00014df8] 548f                      addq.l     #2,a7
[00014dfa] 4e5e                      unlk       a6
[00014dfc] 4e75                      rts

printimmedinst:
[00014dfe] 4e56 0000                 link       a6,#0
[00014e02] 3a2e 000c                 move.w     12(a6),d5
[00014e06] 3f05                      move.w     d5,-(a7)
[00014e08] 286e 0008                 movea.l    8(a6),a4
[00014e0c] 4854                      pea.l      (a4)
[00014e0e] 4eb9 0001 436c            jsr        addstr
[00014e14] 5c8f                      addq.l     #6,a7
[00014e16] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014e1c] 0245 003f                 andi.w     #$003F,d5
[00014e20] 0c45 003c                 cmpi.w     #$003C,d5
[00014e24] 6602                      bne.s      $00014E28
[00014e26] 6004                      bra.s      $00014E2C
[00014e28] 4efa 007a                 jmp        $00014EA4(pc)
[00014e2c] 4eb9 0001 43ae            jsr        addspaces
[00014e32] 1f3c 0023                 move.b     #$23,-(a7)
[00014e36] 4eb9 0001 434a            jsr        addch
[00014e3c] 548f                      addq.l     #2,a7
[00014e3e] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014e44] ec4d                      lsr.w      #6,d5
[00014e46] 0245 0001                 andi.w     #$0001,d5
[00014e4a] 4a45                      tst.w      d5
[00014e4c] 663a                      bne.s      $00014E88
[00014e4e] 286d fffc                 movea.l    -4(a5),a4
[00014e52] 286c 0012                 movea.l    18(a4),a4
[00014e56] 3a14                      move.w     (a4),d5
[00014e58] 0245 00ff                 andi.w     #$00FF,d5
[00014e5c] 3f05                      move.w     d5,-(a7)
[00014e5e] 4eb9 0001 44f2            jsr        printhexbyte
[00014e64] 548f                      addq.l     #2,a7
[00014e66] 4eb9 0001 4342            jsr        x14342
[00014e6c] 4eb9 0001 4584            jsr        incpc
[00014e72] 3f3c 0003                 move.w     #$0003,-(a7)
[00014e76] 4879 0001 68d2            pea.l      $000168D2 ',CCR'
[00014e7c] 4eb9 0001 436c            jsr        addstr
[00014e82] 5c8f                      addq.l     #6,a7
[00014e84] 4efa 001a                 jmp        $00014EA0(pc)
[00014e88] 4eb9 0001 459e            jsr        fetchword
[00014e8e] 3f3c 0003                 move.w     #$0003,-(a7)
[00014e92] 4879 0001 68d8            pea.l      $000168D8 'H,SR'
[00014e98] 4eb9 0001 436c            jsr        addstr
[00014e9e] 5c8f                      addq.l     #6,a7
[00014ea0] 4efa 00c8                 jmp        $00014F6A(pc)
[00014ea4] 4eb9 0001 4448            jsr        printsize
[00014eaa] 4eb9 0001 43ae            jsr        addspaces
[00014eb0] 1f3c 0023                 move.b     #$23,-(a7)
[00014eb4] 4eb9 0001 434a            jsr        addch
[00014eba] 548f                      addq.l     #2,a7
[00014ebc] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014ec2] ec4d                      lsr.w      #6,d5
[00014ec4] 0245 0003                 andi.w     #$0003,d5
[00014ec8] 4845                      swap       d5
[00014eca] 4245                      clr.w      d5
[00014ecc] 4845                      swap       d5
[00014ece] 2005                      move.l     d5,d0
[00014ed0] 4eb9 0001 000a            jsr        CASEX
[00014ed6] 0000 0000
[00014eda] 0000 0002
[00014ede] 0000 006a
[00014ee2] 286d fffc                 movea.l    -4(a5),a4
[00014ee6] 286c 0012                 movea.l    18(a4),a4
[00014eea] 3a14                      move.w     (a4),d5
[00014eec] 0245 00ff                 andi.w     #$00FF,d5
[00014ef0] 3f05                      move.w     d5,-(a7)
[00014ef2] 4eb9 0001 44f2            jsr        printhexbyte
[00014ef8] 548f                      addq.l     #2,a7
[00014efa] 4eb9 0001 4342            jsr        x14342
[00014f00] 4eb9 0001 4584            jsr        incpc
[00014f06] 4efa 0050                 jmp        $00014F58(pc)
[00014f0a] 4eb9 0001 459e            jsr        fetchword
[00014f10] 1f3c 0048                 move.b     #$48,-(a7)
[00014f14] 4eb9 0001 434a            jsr        addch
[00014f1a] 548f                      addq.l     #2,a7
[00014f1c] 4efa 003a                 jmp        $00014F58(pc)
[00014f20] 4eb9 0001 459e            jsr        fetchword
[00014f26] 4eb9 0001 459e            jsr        fetchword
[00014f2c] 1f3c 0048                 move.b     #$48,-(a7)
[00014f30] 4eb9 0001 434a            jsr        addch
[00014f36] 548f                      addq.l     #2,a7
[00014f38] 4efa 001e                 jmp        $00014F58(pc)
[00014f3c] 4efa 0008                 jmp        $00014F46(pc)
[00014f40] 000c
           0034
[00014f44] 004a 
[00014f46] 3f3c                      move.w     #$0002,-(a7)
[00014f4a] 4879 0001 68de            pea        $000168de '???'
[00014f50] 4eb9 0001 436c            jsr        addstr
[00014f56] 5c8f                      addq.l     #6,a7
[00014f58] 1f3c 002c                 move.b     #$2C,-(a7)
[00014f5c] 4eb9 0001 434a            jsr        addch
[00014f62] 548f                      addq.l     #2,a7
[00014f64] 4eb9 0001 4ac4            jsr        printea
[00014f6a] 4e5e                      unlk       a6
[00014f6c] 4e75                      rts

printmoveinst:
[00014f6e] 4e56 0000                 link       a6,#0
[00014f72] 3a2e 000c                 move.w     12(a6),d5
[00014f76] 3f05                      move.w     d5,-(a7)
[00014f78] 286e 0008                 movea.l    8(a6),a4
[00014f7c] 4854                      pea.l      (a4)
[00014f7e] 4eb9 0001 436c            jsr        addstr
[00014f84] 5c8f                      addq.l     #6,a7
[00014f86] 4eb9 0001 43ae            jsr        addspaces
[00014f8c] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014f92] e64d                      lsr.w      #3,d5
[00014f94] 0245 0007                 andi.w     #$0007,d5
[00014f98] 3f05                      move.w     d5,-(a7)
[00014f9a] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014fa0] 0245 0007                 andi.w     #$0007,d5
[00014fa4] 3f05                      move.w     d5,-(a7)
[00014fa6] 4eb9 0001 467a            jsr        printeamode
[00014fac] 588f                      addq.l     #4,a7
[00014fae] 1f3c 002c                 move.b     #$2C,-(a7)
[00014fb2] 4eb9 0001 434a            jsr        addch
[00014fb8] 548f                      addq.l     #2,a7
[00014fba] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014fc0] ec4d                      lsr.w      #6,d5
[00014fc2] 0245 0007                 andi.w     #$0007,d5
[00014fc6] 3f05                      move.w     d5,-(a7)
[00014fc8] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00014fce] e24d                      lsr.w      #1,d5
[00014fd0] e04d                      lsr.w      #8,d5
[00014fd2] 0245 0007                 andi.w     #$0007,d5
[00014fd6] 3f05                      move.w     d5,-(a7)
[00014fd8] 4eb9 0001 467a            jsr        printeamode
[00014fde] 588f                      addq.l     #4,a7
[00014fe0] 4e5e                      unlk       a6
[00014fe2] 4e75                      rts

printmonadicinst:
[00014fe4] 4e56 0000                 link       a6,#0
[00014fe8] 3a2e 000c                 move.w     12(a6),d5
[00014fec] 3f05                      move.w     d5,-(a7)
[00014fee] 286e 0008                 movea.l    8(a6),a4
[00014ff2] 4854                      pea.l      (a4)
[00014ff4] 4eb9 0001 436c            jsr        addstr
[00014ffa] 5c8f                      addq.l     #6,a7
[00014ffc] 4eb9 0001 4448            jsr        printsize
[00015002] 4eb9 0001 43ae            jsr        addspaces
[00015008] 4eb9 0001 4ac4            jsr        printea
[0001500e] 4e5e                      unlk       a6
[00015010] 4e75                      rts

printdyadicinst:
[00015012] 4e56 0000                 link       a6,#0
[00015016] 3a2e 000c                 move.w     12(a6),d5
[0001501a] 3f05                      move.w     d5,-(a7)
[0001501c] 286e 0008                 movea.l    8(a6),a4
[00015020] 4854                      pea.l      (a4)
[00015022] 4eb9 0001 436c            jsr        addstr
[00015028] 5c8f                      addq.l     #6,a7
[0001502a] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015030] ec4d                      lsr.w      #6,d5
[00015032] 0245 0003                 andi.w     #$0003,d5
[00015036] 0c45 0003                 cmpi.w     #$0003,d5
[0001503a] 6602                      bne.s      $0001503E
[0001503c] 6004                      bra.s      $00015042
[0001503e] 4efa 0084                 jmp        $000150C4(pc)
[00015042] 3f3c 0001                 move.w     #$0001,-(a7)
[00015046] 4879 0001 68e2            pea.l      $000168E2 'A.'
[0001504c] 4eb9 0001 436c            jsr        addstr
[00015052] 5c8f                      addq.l     #6,a7
[00015054] 3a39 0001 8c32            move.w     disasm.opcode,d5
[0001505a] e04d                      lsr.w      #8,d5
[0001505c] 0245 0001                 andi.w     #$0001,d5
[00015060] 4a45                      tst.w      d5
[00015062] 6618                      bne.s      $0001507C
[00015064] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[0001506c] 1f3c 0057                 move.b     #$57,-(a7)
[00015070] 4eb9 0001 434a            jsr        addch
[00015076] 548f                      addq.l     #2,a7
[00015078] 4efa 0016                 jmp        $00015090(pc)
[0001507c] 33fc 0002 0001 8c36       move.w     #$0002,disasm.opsize
[00015084] 1f3c 004c                 move.b     #$4C,-(a7)
[00015088] 4eb9 0001 434a            jsr        addch
[0001508e] 548f                      addq.l     #2,a7
[00015090] 4eb9 0001 43ae            jsr        addspaces
[00015096] 4eb9 0001 4ac4            jsr        printea
[0001509c] 1f3c 002c                 move.b     #$2C,-(a7)
[000150a0] 4eb9 0001 434a            jsr        addch
[000150a6] 548f                      addq.l     #2,a7
[000150a8] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000150ae] e24d                      lsr.w      #1,d5
[000150b0] e04d                      lsr.w      #8,d5
[000150b2] 0245 0007                 andi.w     #$0007,d5
[000150b6] 3f05                      move.w     d5,-(a7)
[000150b8] 4eb9 0001 463a            jsr        printaddrreg
[000150be] 548f                      addq.l     #2,a7
[000150c0] 4efa 0076                 jmp        $00015138(pc)
[000150c4] 4eb9 0001 4448            jsr        printsize
[000150ca] 4eb9 0001 43ae            jsr        addspaces
[000150d0] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000150d6] e04d                      lsr.w      #8,d5
[000150d8] 0245 0001                 andi.w     #$0001,d5
[000150dc] 4a45                      tst.w      d5
[000150de] 662e                      bne.s      $0001510E
[000150e0] 4eb9 0001 4ac4            jsr        printea
[000150e6] 1f3c 002c                 move.b     #$2C,-(a7)
[000150ea] 4eb9 0001 434a            jsr        addch
[000150f0] 548f                      addq.l     #2,a7
[000150f2] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000150f8] e24d                      lsr.w      #1,d5
[000150fa] e04d                      lsr.w      #8,d5
[000150fc] 0245 0007                 andi.w     #$0007,d5
[00015100] 3f05                      move.w     d5,-(a7)
[00015102] 4eb9 0001 465a            jsr        printdatareg
[00015108] 548f                      addq.l     #2,a7
[0001510a] 4efa 002c                 jmp        $00015138(pc)
[0001510e] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015114] e24d                      lsr.w      #1,d5
[00015116] e04d                      lsr.w      #8,d5
[00015118] 0245 0007                 andi.w     #$0007,d5
[0001511c] 3f05                      move.w     d5,-(a7)
[0001511e] 4eb9 0001 465a            jsr        printdatareg
[00015124] 548f                      addq.l     #2,a7
[00015126] 1f3c 002c                 move.b     #$2C,-(a7)
[0001512a] 4eb9 0001 434a            jsr        addch
[00015130] 548f                      addq.l     #2,a7
[00015132] 4eb9 0001 4ac4            jsr        printea
[00015138] 4e5e                      unlk       a6
[0001513a] 4e75                      rts

group0:
[0001513c] 4e56 0000                 link       a6,#0
[00015140] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015146] e64d                      lsr.w      #3,d5
[00015148] 0245 0007                 andi.w     #$0007,d5
[0001514c] 0c45 0001                 cmpi.w     #$0001,d5
[00015150] 6602                      bne.s      $00015154
[00015152] 6004                      bra.s      $00015158
[00015154] 4efa 011a                 jmp        $00015270(pc)
[00015158] 3a39 0001 8c32            move.w     disasm.opcode,d5
[0001515e] ec4d                      lsr.w      #6,d5
[00015160] 0245 0001                 andi.w     #$0001,d5
[00015164] 4a45                      tst.w      d5
[00015166] 661e                      bne.s      $00015186
[00015168] 3f3c 0006                 move.w     #$0006,-(a7)
[0001516c] 4879 0001 68e6            pea.l      $000168E6 'MOVEP.W'
[00015172] 4eb9 0001 436c            jsr        addstr
[00015178] 5c8f                      addq.l     #6,a7
[0001517a] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[00015182] 4efa 001c                 jmp        $000151A0(pc)
[00015186] 3f3c 0006                 move.w     #$0006,-(a7)
[0001518a] 4879 0001 68ee            pea.l      $000168EE 'MOVEP.L'
[00015190] 4eb9 0001 436c            jsr        addstr
[00015196] 5c8f                      addq.l     #6,a7
[00015198] 33fc 0002 0001 8c36       move.w     #$0002,disasm.opsize
[000151a0] 4eb9 0001 43ae            jsr        addspaces
[000151a6] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000151ac] ee4d                      lsr.w      #7,d5
[000151ae] 0245 0001                 andi.w     #$0001,d5
[000151b2] 4a45                      tst.w      d5
[000151b4] 665a                      bne.s      $00015210
[000151b6] 4eb9 0001 459e            jsr        fetchword
[000151bc] 3f3c 0001                 move.w     #$0001,-(a7)
[000151c0] 4879 0001 68f6            pea.l      $000168F6 'H('
[000151c6] 4eb9 0001 436c            jsr        addstr
[000151cc] 5c8f                      addq.l     #6,a7
[000151ce] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000151d4] 0245 0007                 andi.w     #$0007,d5
[000151d8] 3f05                      move.w     d5,-(a7)
[000151da] 4eb9 0001 463a            jsr        printaddrreg
[000151e0] 548f                      addq.l     #2,a7
[000151e2] 3f3c 0001                 move.w     #$0001,-(a7)
[000151e6] 4879 0001 68fa            pea.l      $000168FA '),'
[000151ec] 4eb9 0001 436c            jsr        addstr
[000151f2] 5c8f                      addq.l     #6,a7
[000151f4] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000151fa] e24d                      lsr.w      #1,d5
[000151fc] e04d                      lsr.w      #8,d5
[000151fe] 0245 0007                 andi.w     #$0007,d5
[00015202] 3f05                      move.w     d5,-(a7)
[00015204] 4eb9 0001 465a            jsr        printdatareg
[0001520a] 548f                      addq.l     #2,a7
[0001520c] 4efa 005e                 jmp        $0001526C(pc)
[00015210] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015216] e24d                      lsr.w      #1,d5
[00015218] e04d                      lsr.w      #8,d5
[0001521a] 0245 0007                 andi.w     #$0007,d5
[0001521e] 3f05                      move.w     d5,-(a7)
[00015220] 4eb9 0001 465a            jsr        printdatareg
[00015226] 548f                      addq.l     #2,a7
[00015228] 1f3c 002c                 move.b     #$2C,-(a7)
[0001522c] 4eb9 0001 434a            jsr        addch
[00015232] 548f                      addq.l     #2,a7
[00015234] 4eb9 0001 459e            jsr        fetchword
[0001523a] 3f3c 0001                 move.w     #$0001,-(a7)
[0001523e] 4879 0001 68fe            pea.l      $000168FE 'H('
[00015244] 4eb9 0001 436c            jsr        addstr
[0001524a] 5c8f                      addq.l     #6,a7
[0001524c] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015252] 0245 0007                 andi.w     #$0007,d5
[00015256] 3f05                      move.w     d5,-(a7)
[00015258] 4eb9 0001 463a            jsr        printaddrreg
[0001525e] 548f                      addq.l     #2,a7
[00015260] 1f3c 0029                 move.b     #$29,-(a7)
[00015264] 4eb9 0001 434a            jsr        addch
[0001526a] 548f                      addq.l     #2,a7
[0001526c] 4efa 029e                 jmp        $0001550C(pc)
[00015270] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015276] e04d                      lsr.w      #8,d5
[00015278] 0245 000f                 andi.w     #$000F,d5
[0001527c] 4845                      swap       d5
[0001527e] 4245                      clr.w      d5
[00015280] 4845                      swap       d5
[00015282] 2005                      move.l     d5,d0
[00015284] 4eb9 0001 000a            jsr        CASEX
[0001528a] 0000 0000
[0001528e] 0000 000c
[00015292] 0000 0174
case 0:
[00015296] 3f3c 0002                 move.w     #$0002,-(a7)
[0001529a] 4879 0001 6902            pea.l      $00016902 'ORI'
[000152a0] 4eb9 0001 4dfe            jsr        printimmedinst
[000152a6] 5c8f                      addq.l     #6,a7
[000152a8] 4efa 0262                 jmp        $0001550C(pc)
case 2:
[000152ac] 3f3c 0003                 move.w     #$0003,-(a7)
[000152b0] 4879 0001 6906            pea.l      $00016906 'ANDI'
[000152b6] 4eb9 0001 4dfe            jsr        printimmedinst
[000152bc] 5c8f                      addq.l     #6,a7
[000152be] 4efa 024c                 jmp        $0001550C(pc)
case 4:
[000152c2] 3f3c 0003                 move.w     #$0003,-(a7)
[000152c6] 4879 0001 690c            pea.l      $0001690C 'SUBI'
[000152cc] 4eb9 0001 4dfe            jsr        printimmedinst
[000152d2] 5c8f                      addq.l     #6,a7
[000152d4] 4efa 0236                 jmp        $0001550C(pc)
case 6:
[000152d8] 3f3c 0003                 move.w     #$0003,-(a7)
[000152dc] 4879 0001 6912            pea.l      $00016912 'ADDI'
[000152e2] 4eb9 0001 4dfe            jsr        printimmedinst
[000152e8] 5c8f                      addq.l     #6,a7
[000152ea] 4efa 0220                 jmp        $0001550C(pc)
case 8:
[000152ee] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000152f4] ec4d                      lsr.w      #6,d5
[000152f6] 0245 0003                 andi.w     #$0003,d5
[000152fa] 4845                      swap       d5
[000152fc] 4245                      clr.w      d5
[000152fe] 4845                      swap       d5
[00015300] 2005                      move.l     d5,d0
[00015302] 4eb9 0001 000a            jsr        CASEX
[00015308] 0000 0000
[0001530c] 0000 0003
[00015310] 0000 0068
[00015314] 3f3c 0003                 move.w     #$0003,-(a7)
[00015318] 4879 0001 6918            pea.l      $00016918 'BTST'
[0001531e] 4eb9 0001 436c            jsr        addstr
[00015324] 5c8f                      addq.l     #6,a7
[00015326] 4efa 0050                 jmp        $00015378(pc)
[0001532a] 3f3c 0003                 move.w     #$0003,-(a7)
[0001532e] 4879 0001 691e            pea.l      $0001691E 'BCHG'
[00015334] 4eb9 0001 436c            jsr        addstr
[0001533a] 5c8f                      addq.l     #6,a7
[0001533c] 4efa 003a                 jmp        $00015378(pc)
[00015340] 3f3c 0003                 move.w     #$0003,-(a7)
[00015344] 4879 0001 6924            pea.l      $00016924 'BCLR'
[0001534a] 4eb9 0001 436c            jsr        addstr
[00015350] 5c8f                      addq.l     #6,a7
[00015352] 4efa 0024                 jmp        $00015378(pc)
[00015356] 3f3c 0003                 move.w     #$0003,-(a7)
[0001535a] 4879 0001 692a            pea.l      $0001692A 'BSET'
[00015360] 4eb9 0001 436c            jsr        addstr
[00015366] 5c8f                      addq.l     #6,a7
[00015368] 4efa 000e                 jmp        $00015378(pc)
[0001536c] 4efa 000a                 jmp        $00015378(pc)
[00015370] 000c
           0022
[00015374] 0038
           004e
[00015378] 4eb9 0001 43ae            jsr        addspaces
[0001537e] 1f3c 0023                 move.b     #$23,-(a7)
[00015382] 4eb9 0001 434a            jsr        addch
[00015388] 548f                      addq.l     #2,a7
[0001538a] 4eb9 0001 459e            jsr        fetchword
[00015390] 3f3c 0001                 move.w     #$0001,-(a7)
[00015394] 4879 0001 6930            pea.l      $00016930 'H,'
[0001539a] 4eb9 0001 436c            jsr        addstr
[000153a0] 5c8f                      addq.l     #6,a7
[000153a2] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000153a8] e64d                      lsr.w      #3,d5
[000153aa] 0245 0007                 andi.w     #$0007,d5
[000153ae] 4a45                      tst.w      d5
[000153b0] 660a                      bne.s      $000153BC
[000153b2] 4279 0001 8c36            clr.w      disasm.opsize
[000153b8] 4efa 000a                 jmp        $000153C4(pc)
[000153bc] 33fc 0002 0001 8c36       move.w     #$0002,disasm.opsize
[000153c4] 4eb9 0001 4ac4            jsr        printea
[000153ca] 4efa 0140                 jmp        $0001550C(pc)
case 10:
[000153ce] 3f3c 0003                 move.w     #$0003,-(a7)
[000153d2] 4879 0001 6934            pea.l      $00016934 'EORI'
[000153d8] 4eb9 0001 4dfe            jsr        printimmedinst
[000153de] 5c8f                      addq.l     #6,a7
[000153e0] 4efa 012a                 jmp        $0001550C(pc)
case 12:
[000153e4] 3f3c 0003                 move.w     #$0003,-(a7)
[000153e8] 4879 0001 693a            pea.l      $0001693A 'CMPI'
[000153ee] 4eb9 0001 4dfe            jsr        printimmedinst
[000153f4] 5c8f                      addq.l     #6,a7
[000153f6] 4efa 0114                 jmp        $0001550C(pc)
[000153fa] 4efa 001c                 jmp        $00015418(pc)
[000153fe] 000c
           0170
[00015402] 0022
           0170
[00015406] 0038
           0170
           004e
[0001540c] 0170
           0064
[00015410] 0170
           0144
[00015414] 0170
           015a
[00015418] 3a39 0001 8c32            move.w     disasm.opcode,d5
[0001541e] e04d                      lsr.w      #8,d5
[00015420] 0245 0001                 andi.w     #$0001,d5
[00015424] 0c45 0001                 cmpi.w     #$0001,d5
[00015428] 6602                      bne.s      $0001542C
[0001542a] 6004                      bra.s      $00015430
[0001542c] 4efa 00de                 jmp        $0001550C(pc)
[00015430] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015436] ec4d                      lsr.w      #6,d5
[00015438] 0245 0003                 andi.w     #$0003,d5
[0001543c] 4845                      swap       d5
[0001543e] 4245                      clr.w      d5
[00015440] 4845                      swap       d5
[00015442] 2005                      move.l     d5,d0
[00015444] 4eb9 0001 000a            jsr        CASEX
[0001544a] 0000 0000
[0001544e] 0000 0003
[00015452] 0000 0068
[00015456] 3f3c 0003                 move.w     #$0003,-(a7)
[0001545a] 4879 0001 6940            pea.l      $00016940 'BTST'
[00015460] 4eb9 0001 436c            jsr        addstr
[00015466] 5c8f                      addq.l     #6,a7
[00015468] 4efa 0050                 jmp        $000154BA(pc)
[0001546c] 3f3c 0003                 move.w     #$0003,-(a7)
[00015470] 4879 0001 6946            pea.l      $00016946 'BCHG'
[00015476] 4eb9 0001 436c            jsr        addstr
[0001547c] 5c8f                      addq.l     #6,a7
[0001547e] 4efa 003a                 jmp        $000154BA(pc)
[00015482] 3f3c 0003                 move.w     #$0003,-(a7)
[00015486] 4879 0001 694c            pea.l      $0001694C 'BCLR'
[0001548c] 4eb9 0001 436c            jsr        addstr
[00015492] 5c8f                      addq.l     #6,a7
[00015494] 4efa 0024                 jmp        $000154BA(pc)
[00015498] 3f3c 0003                 move.w     #$0003,-(a7)
[0001549c] 4879 0001 6952            pea.l      $00016952 'BSET'
[000154a2] 4eb9 0001 436c            jsr        addstr
[000154a8] 5c8f                      addq.l     #6,a7
[000154aa] 4efa 000e                 jmp        $000154BA(pc)
[000154ae] 4efa 000a                 jmp        $000154BA(pc)
[000154b2] 000c
           0022
[000154b6] 0038
           004e
[000154ba] 4eb9 0001 43ae            jsr        addspaces
[000154c0] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000154c6] e24d                      lsr.w      #1,d5
[000154c8] e04d                      lsr.w      #8,d5
[000154ca] 0245 0007                 andi.w     #$0007,d5
[000154ce] 3f05                      move.w     d5,-(a7)
[000154d0] 4eb9 0001 465a            jsr        printdatareg
[000154d6] 548f                      addq.l     #2,a7
[000154d8] 1f3c 002c                 move.b     #$2C,-(a7)
[000154dc] 4eb9 0001 434a            jsr        addch
[000154e2] 548f                      addq.l     #2,a7
[000154e4] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000154ea] e64d                      lsr.w      #3,d5
[000154ec] 0245 0007                 andi.w     #$0007,d5
[000154f0] 4a45                      tst.w      d5
[000154f2] 660a                      bne.s      $000154FE
[000154f4] 4279 0001 8c36            clr.w      disasm.opsize
[000154fa] 4efa 000a                 jmp        $00015506(pc)
[000154fe] 33fc 0002 0001 8c36       move.w     #$0002,disasm.opsize
[00015506] 4eb9 0001 4ac4            jsr        printea
[0001550c] 4e5e                      unlk       a6
[0001550e] 4e75                      rts

group4:
[00015510] 4e56 fffe                 link       a6,#-2
[00015514] 3a39 0001 8c32            move.w     disasm.opcode,d5
[0001551a] e04d                      lsr.w      #8,d5
[0001551c] 0245 000f                 andi.w     #$000F,d5
[00015520] 4845                      swap       d5
[00015522] 4245                      clr.w      d5
[00015524] 4845                      swap       d5
[00015526] 2005                      move.l     d5,d0
[00015528] 4eb9 0001 000a            jsr        CASEX
[0001552e] 0000 0000
[00015532] 0000 000e
[00015536] 0000 07b6
case 0:
[0001553a] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015540] ec4d                      lsr.w      #6,d5
[00015542] 0245 0003                 andi.w     #$0003,d5
[00015546] 0c45 0003                 cmpi.w     #$0003,d5
[0001554a] 663c                      bne.s      $00015588
[0001554c] 3f3c 0003                 move.w     #$0003,-(a7)
[00015550] 4879 0001 6958            pea.l      $00016958 'MOVE'
[00015556] 4eb9 0001 436c            jsr        addstr
[0001555c] 5c8f                      addq.l     #6,a7
[0001555e] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[00015566] 4eb9 0001 43ae            jsr        addspaces
[0001556c] 3f3c 0002                 move.w     #$0002,-(a7)
[00015570] 4879 0001 695e            pea.l      $0001695E 'SR,'
[00015576] 4eb9 0001 436c            jsr        addstr
[0001557c] 5c8f                      addq.l     #6,a7
[0001557e] 4eb9 0001 4ac4            jsr        printea
[00015584] 4efa 0014                 jmp        $0001559A(pc)
[00015588] 3f3c 0003                 move.w     #$0003,-(a7)
[0001558c] 4879 0001 6962            pea.l      $00016962 'NEGX'
[00015592] 4eb9 0001 4fe4            jsr        printmonadicinst
[00015598] 5c8f                      addq.l     #6,a7
[0001559a] 4efa 083a                 jmp        $00015DD6(pc)
case 2:
[0001559e] 3f3c 0002                 move.w     #$0002,-(a7)
[000155a2] 4879 0001 6968            pea.l      $00016968 'CLR'
[000155a8] 4eb9 0001 4fe4            jsr        printmonadicinst
[000155ae] 5c8f                      addq.l     #6,a7
[000155b0] 4efa 0824                 jmp        $00015DD6(pc)
case 4:
[000155b4] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000155ba] ec4d                      lsr.w      #6,d5
[000155bc] 0245 0003                 andi.w     #$0003,d5
[000155c0] 0c45 0003                 cmpi.w     #$0003,d5
[000155c4] 663a                      bne.s      $00015600
[000155c6] 3f3c 0003                 move.w     #$0003,-(a7)
[000155ca] 4879 0001 696c            pea.l      $0001696C 'MOVE'
[000155d0] 4eb9 0001 436c            jsr        addstr
[000155d6] 5c8f                      addq.l     #6,a7
[000155d8] 4279 0001 8c36            clr.w      disasm.opsize
[000155de] 4eb9 0001 43ae            jsr        addspaces
[000155e4] 4eb9 0001 4ac4            jsr        printea
[000155ea] 3f3c 0003                 move.w     #$0003,-(a7)
[000155ee] 4879 0001 6972            pea.l      $00016972 ',CCR'
[000155f4] 4eb9 0001 436c            jsr        addstr
[000155fa] 5c8f                      addq.l     #6,a7
[000155fc] 4efa 0014                 jmp        $00015612(pc)
[00015600] 3f3c 0002                 move.w     #$0002,-(a7)
[00015604] 4879 0001 6978            pea.l      $00016978 'NEG'
[0001560a] 4eb9 0001 4fe4            jsr        printmonadicinst
[00015610] 5c8f                      addq.l     #6,a7
[00015612] 4efa 07c2                 jmp        $00015DD6(pc)
case 6:
[00015616] 3a39 0001 8c32            move.w     disasm.opcode,d5
[0001561c] ec4d                      lsr.w      #6,d5
[0001561e] 0245 0003                 andi.w     #$0003,d5
[00015622] 0c45 0003                 cmpi.w     #$0003,d5
[00015626] 663c                      bne.s      $00015664
[00015628] 3f3c 0003                 move.w     #$0003,-(a7)
[0001562c] 4879 0001 697c            pea.l      $0001697C 'MOVE'
[00015632] 4eb9 0001 436c            jsr        addstr
[00015638] 5c8f                      addq.l     #6,a7
[0001563a] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[00015642] 4eb9 0001 43ae            jsr        addspaces
[00015648] 4eb9 0001 4ac4            jsr        printea
[0001564e] 3f3c 0002                 move.w     #$0002,-(a7)
[00015652] 4879 0001 6982            pea.l      $00016982 ',SR'
[00015658] 4eb9 0001 436c            jsr        addstr
[0001565e] 5c8f                      addq.l     #6,a7
[00015660] 4efa 0014                 jmp        $00015676(pc)
[00015664] 3f3c 0002                 move.w     #$0002,-(a7)
[00015668] 4879 0001 6986            pea.l      $00016986 'NOT'
[0001566e] 4eb9 0001 4fe4            jsr        printmonadicinst
[00015674] 5c8f                      addq.l     #6,a7
[00015676] 4efa 075e                 jmp        $00015DD6(pc)
case 8:
[0001567a] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015680] e64d                      lsr.w      #3,d5
[00015682] 0245 001f                 andi.w     #$001F,d5
[00015686] 33c5 0001 8c38            move.w     d5,disasm.subcode
[0001568c] 0c79 0018 0001 8c38       cmpi.w     #$0018,disasm.subcode
[00015694] 6630                      bne.s      $000156C6
[00015696] 3f3c 0004                 move.w     #$0004,-(a7)
[0001569a] 4879 0001 698a            pea.l      $0001698A 'EXT.L'
[000156a0] 4eb9 0001 436c            jsr        addstr
[000156a6] 5c8f                      addq.l     #6,a7
[000156a8] 4eb9 0001 43ae            jsr        addspaces
[000156ae] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000156b4] 0245 0007                 andi.w     #$0007,d5
[000156b8] 3f05                      move.w     d5,-(a7)
[000156ba] 4eb9 0001 465a            jsr        printdatareg
[000156c0] 548f                      addq.l     #2,a7
[000156c2] 4efa 0184                 jmp        $00015848(pc)
[000156c6] 0c79 0010 0001 8c38       cmpi.w     #$0010,disasm.subcode
[000156ce] 6630                      bne.s      $00015700
[000156d0] 3f3c 0004                 move.w     #$0004,-(a7)
[000156d4] 4879 0001 6990            pea.l      $00016990 'EXT.W'
[000156da] 4eb9 0001 436c            jsr        addstr
[000156e0] 5c8f                      addq.l     #6,a7
[000156e2] 4eb9 0001 43ae            jsr        addspaces
[000156e8] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000156ee] 0245 0007                 andi.w     #$0007,d5
[000156f2] 3f05                      move.w     d5,-(a7)
[000156f4] 4eb9 0001 465a            jsr        printdatareg
[000156fa] 548f                      addq.l     #2,a7
[000156fc] 4efa 014a                 jmp        $00015848(pc)
[00015700] 0c79 0008 0001 8c38       cmpi.w     #$0008,disasm.subcode
[00015708] 6630                      bne.s      $0001573A
[0001570a] 3f3c 0003                 move.w     #$0003,-(a7)
[0001570e] 4879 0001 6996            pea.l      $00016996 'SWAP'
[00015714] 4eb9 0001 436c            jsr        addstr
[0001571a] 5c8f                      addq.l     #6,a7
[0001571c] 4eb9 0001 43ae            jsr        addspaces
[00015722] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015728] 0245 0007                 andi.w     #$0007,d5
[0001572c] 3f05                      move.w     d5,-(a7)
[0001572e] 4eb9 0001 465a            jsr        printdatareg
[00015734] 548f                      addq.l     #2,a7
[00015736] 4efa 0110                 jmp        $00015848(pc)
[0001573a] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015740] ec4d                      lsr.w      #6,d5
[00015742] 0245 0003                 andi.w     #$0003,d5
[00015746] 4845                      swap       d5
[00015748] 4245                      clr.w      d5
[0001574a] 4845                      swap       d5
[0001574c] 2005                      move.l     d5,d0
[0001574e] 4eb9 0001 000a            jsr        CASEX
[00015754] 0000 0000
[00015758] 0000 0003
[0001575c] 0000 00e6
[00015760] 3f3c 0003                 move.w     #$0003,-(a7)
[00015764] 4879 0001 699c            pea.l      $0001699C 'NBCD'
[0001576a] 4eb9 0001 436c            jsr        addstr
[00015770] 5c8f                      addq.l     #6,a7
[00015772] 4279 0001 8c36            clr.w      disasm.opsize
[00015778] 4eb9 0001 43ae            jsr        addspaces
[0001577e] 4efa 00c2                 jmp        $00015842(pc)
[00015782] 3f3c 0002                 move.w     #$0002,-(a7)
[00015786] 4879 0001 69a2            pea.l      $000169A2 'PEA'
[0001578c] 4eb9 0001 436c            jsr        addstr
[00015792] 5c8f                      addq.l     #6,a7
[00015794] 33fc 0002 0001 8c36       move.w     #$0002,disasm.opsize
[0001579c] 4eb9 0001 43ae            jsr        addspaces
[000157a2] 4efa 009e                 jmp        $00015842(pc)
[000157a6] 3f3c 0006                 move.w     #$0006,-(a7)
[000157aa] 4879 0001 69a6            pea.l      $000169A6 'MOVEM.W'
[000157b0] 4eb9 0001 436c            jsr        addstr
[000157b6] 5c8f                      addq.l     #6,a7
[000157b8] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[000157c0] 4eb9 0001 43ae            jsr        addspaces
[000157c6] 1f3c 0023                 move.b     #$23,-(a7)
[000157ca] 4eb9 0001 434a            jsr        addch
[000157d0] 548f                      addq.l     #2,a7
[000157d2] 4eb9 0001 459e            jsr        fetchword
[000157d8] 3f3c 0001                 move.w     #$0001,-(a7)
[000157dc] 4879 0001 69ae            pea.l      $000169AE 'H,'
[000157e2] 4eb9 0001 436c            jsr        addstr
[000157e8] 5c8f                      addq.l     #6,a7
[000157ea] 4efa 0056                 jmp        $00015842(pc)
[000157ee] 3f3c 0006                 move.w     #$0006,-(a7)
[000157f2] 4879 0001 69b2            pea.l      $000169B2 'MOVEM.L'
[000157f8] 4eb9 0001 436c            jsr        addstr
[000157fe] 5c8f                      addq.l     #6,a7
[00015800] 33fc 0002 0001 8c36       move.w     #$0002,disasm.opsize
[00015808] 4eb9 0001 43ae            jsr        addspaces
[0001580e] 1f3c 0023                 move.b     #$23,-(a7)
[00015812] 4eb9 0001 434a            jsr        addch
[00015818] 548f                      addq.l     #2,a7
[0001581a] 4eb9 0001 459e            jsr        fetchword
[00015820] 3f3c 0001                 move.w     #$0001,-(a7)
[00015824] 4879 0001 69ba            pea.l      $000169BA 'H,'
[0001582a] 4eb9 0001 436c            jsr        addstr
[00015830] 5c8f                      addq.l     #6,a7
[00015832] 4efa 000e                 jmp        $00015842(pc)
[00015836] 4efa 000a                 jmp        $00015842(pc)
[0001583a] 000c
           002e
[0001583e] 0052
           009a
[00015842] 4eb9 0001 4ac4            jsr        printea
[00015848] 4efa 058c                 jmp        $00015DD6(pc)
case 10:
[0001584c] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015852] ec4d                      lsr.w      #6,d5
[00015854] 0245 0003                 andi.w     #$0003,d5
[00015858] 0c45 0003                 cmpi.w     #$0003,d5
[0001585c] 6628                      bne.s      $00015886
[0001585e] 3f3c 0002                 move.w     #$0002,-(a7)
[00015862] 4879 0001 69be            pea.l      $000169BE 'TAS'
[00015868] 4eb9 0001 436c            jsr        addstr
[0001586e] 5c8f                      addq.l     #6,a7
[00015870] 4279 0001 8c36            clr.w      disasm.opsize
[00015876] 4eb9 0001 43ae            jsr        addspaces
[0001587c] 4eb9 0001 4ac4            jsr        printea
[00015882] 4efa 0026                 jmp        $000158AA(pc)
[00015886] 3f3c 0002                 move.w     #$0002,-(a7)
[0001588a] 4879 0001 69c2            pea.l      $000169C2 'TST'
[00015890] 4eb9 0001 436c            jsr        addstr
[00015896] 5c8f                      addq.l     #6,a7
[00015898] 4eb9 0001 4448            jsr        printsize
[0001589e] 4eb9 0001 43ae            jsr        addspaces
[000158a4] 4eb9 0001 4ac4            jsr        printea
[000158aa] 4efa 052a                 jmp        $00015DD6(pc)
case 12:
[000158ae] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000158b4] ec4d                      lsr.w      #6,d5
[000158b6] 0245 0003                 andi.w     #$0003,d5
[000158ba] 4845                      swap       d5
[000158bc] 4245                      clr.w      d5
[000158be] 4845                      swap       d5
[000158c0] 2005                      move.l     d5,d0
[000158c2] 4eb9 0001 000a            jsr        CASEX
[000158c8] 0000 0000
[000158cc] 0000 0003
[000158d0] 0000 00f2
[000158d4] 3f3c 0006                 move.w     #$0006,-(a7)
[000158d8] 4879 0001 69c6            pea.l      $000169C6 'ILLEGAL'
[000158de] 4eb9 0001 436c            jsr        addstr
[000158e4] 5c8f                      addq.l     #6,a7
[000158e6] 4efa 00da                 jmp        $000159C2(pc)
[000158ea] 3f3c 0006                 move.w     #$0006,-(a7)
[000158ee] 4879 0001 69ce            pea.l      $000169CE 'MOVEM.W'
[000158f4] 4eb9 0001 436c            jsr        addstr
[000158fa] 5c8f                      addq.l     #6,a7
[000158fc] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[00015904] 4eb9 0001 43ae            jsr        addspaces
[0001590a] 286d fffc                 movea.l    -4(a5),a4
[0001590e] 286c 0012                 movea.l    18(a4),a4
[00015912] 3d54 fffe                 move.w     (a4),-2(a6)
[00015916] 4eb9 0001 4584            jsr        incpc
[0001591c] 4eb9 0001 4ac4            jsr        printea
[00015922] 3f3c 0001                 move.w     #$0001,-(a7)
[00015926] 4879 0001 69d6            pea.l      $000169D6 ',#'
[0001592c] 4eb9 0001 436c            jsr        addstr
[00015932] 5c8f                      addq.l     #6,a7
[00015934] 3f2e fffe                 move.w     -2(a6),-(a7)
[00015938] 4eb9 0001 452c            jsr        printhexword
[0001593e] 548f                      addq.l     #2,a7
[00015940] 1f3c 0048                 move.b     #$48,-(a7)
[00015944] 4eb9 0001 434a            jsr        addch
[0001594a] 548f                      addq.l     #2,a7
[0001594c] 4efa 0074                 jmp        $000159C2(pc)
[00015950] 3f3c 0006                 move.w     #$0006,-(a7)
[00015954] 4879 0001 69da            pea.l      $000169DA 'MOVEM.L'
[0001595a] 4eb9 0001 436c            jsr        addstr
[00015960] 5c8f                      addq.l     #6,a7
[00015962] 33fc 0002 0001 8c36       move.w     #$0002,disasm.opsize
[0001596a] 4eb9 0001 43ae            jsr        addspaces
[00015970] 286d fffc                 movea.l    -4(a5),a4
[00015974] 286c 0012                 movea.l    18(a4),a4
[00015978] 3d54 fffe                 move.w     (a4),-2(a6)
[0001597c] 4eb9 0001 4584            jsr        incpc
[00015982] 4eb9 0001 4ac4            jsr        printea
[00015988] 3f3c 0001                 move.w     #$0001,-(a7)
[0001598c] 4879 0001 69e2            pea.l      $000169E2 ',#'
[00015992] 4eb9 0001 436c            jsr        addstr
[00015998] 5c8f                      addq.l     #6,a7
[0001599a] 3f2e fffe                 move.w     -2(a6),-(a7)
[0001599e] 4eb9 0001 452c            jsr        printhexword
[000159a4] 548f                      addq.l     #2,a7
[000159a6] 1f3c 0048                 move.b     #$48,-(a7)
[000159aa] 4eb9 0001 434a            jsr        addch
[000159b0] 548f                      addq.l     #2,a7
[000159b2] 4efa 000e                 jmp        $000159C2(pc)
[000159b6] 4efa 000a                 jmp        $000159C2(pc)
[000159ba] 000c
           000c
[000159be] 0022
           0088
[000159c2] 4efa 0412                 jmp        $00015DD6(pc)
case 14:
[000159c6] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000159cc] 0245 00ff                 andi.w     #$00FF,d5
[000159d0] 33c5 0001 8c38            move.w     d5,disasm.subcode
[000159d6] 0c79 0040 0001 8c38       cmpi.w     #$0040,disasm.subcode
[000159de] 6546                      bcs.s      $00015A26
[000159e0] 0c79 004f 0001 8c38       cmpi.w     #$004F,disasm.subcode
[000159e8] 623c                      bhi.s      $00015A26
[000159ea] 3f3c 0003                 move.w     #$0003,-(a7)
[000159ee] 4879 0001 69e6            pea.l      $000169E6 'TRAP'
[000159f4] 4eb9 0001 436c            jsr        addstr
[000159fa] 5c8f                      addq.l     #6,a7
[000159fc] 4eb9 0001 43ae            jsr        addspaces
[00015a02] 1f3c 0023                 move.b     #$23,-(a7)
[00015a06] 4eb9 0001 434a            jsr        addch
[00015a0c] 548f                      addq.l     #2,a7
[00015a0e] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015a14] 0245 000f                 andi.w     #$000F,d5
[00015a18] 3f05                      move.w     d5,-(a7)
[00015a1a] 4eb9 0001 43d2            jsr        printhexchar
[00015a20] 548f                      addq.l     #2,a7
[00015a22] 4efa 02b8                 jmp        $00015CDC(pc)
[00015a26] 0c79 0050 0001 8c38       cmpi.w     #$0050,disasm.subcode
[00015a2e] 655e                      bcs.s      $00015A8E
[00015a30] 0c79 0057 0001 8c38       cmpi.w     #$0057,disasm.subcode
[00015a38] 6254                      bhi.s      $00015A8E
[00015a3a] 3f3c 0003                 move.w     #$0003,-(a7)
[00015a3e] 4879 0001 69ec            pea.l      $000169EC 'LINK'
[00015a44] 4eb9 0001 436c            jsr        addstr
[00015a4a] 5c8f                      addq.l     #6,a7
[00015a4c] 4eb9 0001 43ae            jsr        addspaces
[00015a52] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015a58] 0245 0007                 andi.w     #$0007,d5
[00015a5c] 3f05                      move.w     d5,-(a7)
[00015a5e] 4eb9 0001 463a            jsr        printaddrreg
[00015a64] 548f                      addq.l     #2,a7
[00015a66] 3f3c 0001                 move.w     #$0001,-(a7)
[00015a6a] 4879 0001 69f2            pea.l      $000169F2 ',#'
[00015a70] 4eb9 0001 436c            jsr        addstr
[00015a76] 5c8f                      addq.l     #6,a7
[00015a78] 4eb9 0001 459e            jsr        fetchword
[00015a7e] 1f3c 0048                 move.b     #$48,-(a7)
[00015a82] 4eb9 0001 434a            jsr        addch
[00015a88] 548f                      addq.l     #2,a7
[00015a8a] 4efa 0250                 jmp        $00015CDC(pc)
[00015a8e] 0c79 0058 0001 8c38       cmpi.w     #$0058,disasm.subcode
[00015a96] 653a                      bcs.s      $00015AD2
[00015a98] 0c79 005f 0001 8c38       cmpi.w     #$005F,disasm.subcode
[00015aa0] 6230                      bhi.s      $00015AD2
[00015aa2] 3f3c 0003                 move.w     #$0003,-(a7)
[00015aa6] 4879 0001 69f6            pea.l      $000169F6 'UNLK'
[00015aac] 4eb9 0001 436c            jsr        addstr
[00015ab2] 5c8f                      addq.l     #6,a7
[00015ab4] 4eb9 0001 43ae            jsr        addspaces
[00015aba] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015ac0] 0245 0007                 andi.w     #$0007,d5
[00015ac4] 3f05                      move.w     d5,-(a7)
[00015ac6] 4eb9 0001 463a            jsr        printaddrreg
[00015acc] 548f                      addq.l     #2,a7
[00015ace] 4efa 020c                 jmp        $00015CDC(pc)
[00015ad2] 0c79 0060 0001 8c38       cmpi.w     #$0060,disasm.subcode
[00015ada] 654c                      bcs.s      $00015B28
[00015adc] 0c79 0067 0001 8c38       cmpi.w     #$0067,disasm.subcode
[00015ae4] 6242                      bhi.s      $00015B28
[00015ae6] 3f3c 0003                 move.w     #$0003,-(a7)
[00015aea] 4879 0001 69fc            pea.l      $000169FC 'MOVE'
[00015af0] 4eb9 0001 436c            jsr        addstr
[00015af6] 5c8f                      addq.l     #6,a7
[00015af8] 4eb9 0001 43ae            jsr        addspaces
[00015afe] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015b04] 0245 0007                 andi.w     #$0007,d5
[00015b08] 3f05                      move.w     d5,-(a7)
[00015b0a] 4eb9 0001 463a            jsr        printaddrreg
[00015b10] 548f                      addq.l     #2,a7
[00015b12] 3f3c 0003                 move.w     #$0003,-(a7)
[00015b16] 4879 0001 6a02            pea.l      $00016A02 ',USP'
[00015b1c] 4eb9 0001 436c            jsr        addstr
[00015b22] 5c8f                      addq.l     #6,a7
[00015b24] 4efa 01b6                 jmp        $00015CDC(pc)
[00015b28] 0c79 0068 0001 8c38       cmpi.w     #$0068,disasm.subcode
[00015b30] 654c                      bcs.s      $00015B7E
[00015b32] 0c79 006f 0001 8c38       cmpi.w     #$006F,disasm.subcode
[00015b3a] 6242                      bhi.s      $00015B7E
[00015b3c] 3f3c 0003                 move.w     #$0003,-(a7)
[00015b40] 4879 0001 6a08            pea.l      $00016A08 'MOVE'
[00015b46] 4eb9 0001 436c            jsr        addstr
[00015b4c] 5c8f                      addq.l     #6,a7
[00015b4e] 4eb9 0001 43ae            jsr        addspaces
[00015b54] 3f3c 0003                 move.w     #$0003,-(a7)
[00015b58] 4879 0001 6a0e            pea.l      $00016A0E 'USP,'
[00015b5e] 4eb9 0001 436c            jsr        addstr
[00015b64] 5c8f                      addq.l     #6,a7
[00015b66] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015b6c] 0245 0007                 andi.w     #$0007,d5
[00015b70] 3f05                      move.w     d5,-(a7)
[00015b72] 4eb9 0001 463a            jsr        printaddrreg
[00015b78] 548f                      addq.l     #2,a7
[00015b7a] 4efa 0160                 jmp        $00015CDC(pc)
[00015b7e] 0c79 0070 0001 8c38       cmpi.w     #$0070,disasm.subcode
[00015b86] 6616                      bne.s      $00015B9E
[00015b88] 3f3c 0004                 move.w     #$0004,-(a7)
[00015b8c] 4879 0001 6a14            pea.l      $00016A14 'RESET'
[00015b92] 4eb9 0001 436c            jsr        addstr
[00015b98] 5c8f                      addq.l     #6,a7
[00015b9a] 4efa 0140                 jmp        $00015CDC(pc)
[00015b9e] 0c79 0071 0001 8c38       cmpi.w     #$0071,disasm.subcode
[00015ba6] 6616                      bne.s      $00015BBE
[00015ba8] 3f3c 0002                 move.w     #$0002,-(a7)
[00015bac] 4879 0001 6a1a            pea.l      $00016A1A 'NOP'
[00015bb2] 4eb9 0001 436c            jsr        addstr
[00015bb8] 5c8f                      addq.l     #6,a7
[00015bba] 4efa 0120                 jmp        $00015CDC(pc)
[00015bbe] 0c79 0072 0001 8c38       cmpi.w     #$0072,disasm.subcode
[00015bc6] 6616                      bne.s      $00015BDE
[00015bc8] 3f3c 0003                 move.w     #$0003,-(a7)
[00015bcc] 4879 0001 6a1e            pea.l      $00016A1E 'STOP'
[00015bd2] 4eb9 0001 436c            jsr        addstr
[00015bd8] 5c8f                      addq.l     #6,a7
[00015bda] 4efa 0100                 jmp        $00015CDC(pc)
[00015bde] 0c79 0073 0001 8c38       cmpi.w     #$0073,disasm.subcode
[00015be6] 6616                      bne.s      $00015BFE
[00015be8] 3f3c 0002                 move.w     #$0002,-(a7)
[00015bec] 4879 0001 6a24            pea.l      $00016A24 'RTE'
[00015bf2] 4eb9 0001 436c            jsr        addstr
[00015bf8] 5c8f                      addq.l     #6,a7
[00015bfa] 4efa 00e0                 jmp        $00015CDC(pc)
[00015bfe] 0c79 0075 0001 8c38       cmpi.w     #$0075,disasm.subcode
[00015c06] 6616                      bne.s      $00015C1E
[00015c08] 3f3c 0002                 move.w     #$0002,-(a7)
[00015c0c] 4879 0001 6a28            pea.l      $00016A28 'RTS'
[00015c12] 4eb9 0001 436c            jsr        addstr
[00015c18] 5c8f                      addq.l     #6,a7
[00015c1a] 4efa 00c0                 jmp        $00015CDC(pc)
[00015c1e] 0c79 0076 0001 8c38       cmpi.w     #$0076,disasm.subcode
[00015c26] 6616                      bne.s      $00015C3E
[00015c28] 3f3c 0004                 move.w     #$0004,-(a7)
[00015c2c] 4879 0001 6a2c            pea.l      $00016A2C 'TRAPV'
[00015c32] 4eb9 0001 436c            jsr        addstr
[00015c38] 5c8f                      addq.l     #6,a7
[00015c3a] 4efa 00a0                 jmp        $00015CDC(pc)
[00015c3e] 0c79 0077 0001 8c38       cmpi.w     #$0077,disasm.subcode
[00015c46] 6616                      bne.s      $00015C5E
[00015c48] 3f3c 0002                 move.w     #$0002,-(a7)
[00015c4c] 4879 0001 6a32            pea.l      $00016A32 'RTR'
[00015c52] 4eb9 0001 436c            jsr        addstr
[00015c58] 5c8f                      addq.l     #6,a7
[00015c5a] 4efa 0080                 jmp        $00015CDC(pc)
[00015c5e] 0c79 0080 0001 8c38       cmpi.w     #$0080,disasm.subcode
[00015c66] 652c                      bcs.s      $00015C94
[00015c68] 0c79 00bf 0001 8c38       cmpi.w     #$00BF,disasm.subcode
[00015c70] 6222                      bhi.s      $00015C94
[00015c72] 3f3c 0002                 move.w     #$0002,-(a7)
[00015c76] 4879 0001 6a36            pea.l      $00016A36 'JSR'
[00015c7c] 4eb9 0001 436c            jsr        addstr
[00015c82] 5c8f                      addq.l     #6,a7
[00015c84] 4eb9 0001 43ae            jsr        addspaces
[00015c8a] 4eb9 0001 4ac4            jsr        printea
[00015c90] 4efa 004a                 jmp        $00015CDC(pc)
[00015c94] 0c79 00c0 0001 8c38       cmpi.w     #$00C0,disasm.subcode
[00015c9c] 652c                      bcs.s      $00015CCA
[00015c9e] 0c79 00ff 0001 8c38       cmpi.w     #$00FF,disasm.subcode
[00015ca6] 6222                      bhi.s      $00015CCA
[00015ca8] 3f3c 0002                 move.w     #$0002,-(a7)
[00015cac] 4879 0001 6a3a            pea.l      $00016A3A 'JMP'
[00015cb2] 4eb9 0001 436c            jsr        addstr
[00015cb8] 5c8f                      addq.l     #6,a7
[00015cba] 4eb9 0001 43ae            jsr        addspaces
[00015cc0] 4eb9 0001 4ac4            jsr        printea
[00015cc6] 4efa 0014                 jmp        $00015CDC(pc)
[00015cca] 3f3c 0006                 move.w     #$0006,-(a7)
[00015cce] 4879 0001 6a3e            pea.l      $00016A3E 'ILLEGAL'
[00015cd4] 4eb9 0001 436c            jsr        addstr
[00015cda] 5c8f                      addq.l     #6,a7
[00015cdc] 4efa 00f8                 jmp        $00015DD6(pc)
[00015ce0] 4efa 0020                 jmp        $00015D02(pc)
[00015ce4] 000c
           07b2
[00015ce8] 0070
           07b2
           0086
[00015cee] 07b2
           00e8
[00015cf2] 07b2
           014c
[00015cf6] 07b2
           031e
           07b2
[00015cfc] 0380
[00015cfe] 07b2
           0498
[00015d02] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015d08] ec4d                      lsr.w      #6,d5
[00015d0a] 0245 0003                 andi.w     #$0003,d5
[00015d0e] 33c5 0001 8c38            move.w     d5,disasm.subcode
[00015d14] 0c79 0002 0001 8c38       cmpi.w     #$0002,disasm.subcode
[00015d1c] 664e                      bne.s      $00015D6C
[00015d1e] 3f3c 0002                 move.w     #$0002,-(a7)
[00015d22] 4879 0001 6a46            pea.l      $00016A46 'CHK'
[00015d28] 4eb9 0001 436c            jsr        addstr
[00015d2e] 5c8f                      addq.l     #6,a7
[00015d30] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[00015d38] 4eb9 0001 43ae            jsr        addspaces
[00015d3e] 4eb9 0001 4ac4            jsr        printea
[00015d44] 1f3c 002c                 move.b     #$2C,-(a7)
[00015d48] 4eb9 0001 434a            jsr        addch
[00015d4e] 548f                      addq.l     #2,a7
[00015d50] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015d56] e24d                      lsr.w      #1,d5
[00015d58] e04d                      lsr.w      #8,d5
[00015d5a] 0245 0007                 andi.w     #$0007,d5
[00015d5e] 3f05                      move.w     d5,-(a7)
[00015d60] 4eb9 0001 465a            jsr        printdatareg
[00015d66] 548f                      addq.l     #2,a7
[00015d68] 4efa 006c                 jmp        $00015DD6(pc)
[00015d6c] 0c79 0003 0001 8c38       cmpi.w     #$0003,disasm.subcode
[00015d74] 664e                      bne.s      $00015DC4
[00015d76] 3f3c 0002                 move.w     #$0002,-(a7)
[00015d7a] 4879 0001 6a4a            pea.l      $00016A4A 'LEA'
[00015d80] 4eb9 0001 436c            jsr        addstr
[00015d86] 5c8f                      addq.l     #6,a7
[00015d88] 33fc 0002 0001 8c36       move.w     #$0002,disasm.opsize
[00015d90] 4eb9 0001 43ae            jsr        addspaces
[00015d96] 4eb9 0001 4ac4            jsr        printea
[00015d9c] 1f3c 002c                 move.b     #$2C,-(a7)
[00015da0] 4eb9 0001 434a            jsr        addch
[00015da6] 548f                      addq.l     #2,a7
[00015da8] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015dae] e24d                      lsr.w      #1,d5
[00015db0] e04d                      lsr.w      #8,d5
[00015db2] 0245 0007                 andi.w     #$0007,d5
[00015db6] 3f05                      move.w     d5,-(a7)
[00015db8] 4eb9 0001 463a            jsr        printaddrreg
[00015dbe] 548f                      addq.l     #2,a7
[00015dc0] 4efa 0014                 jmp        $00015DD6(pc)
[00015dc4] 3f3c 0006                 move.w     #$0006,-(a7)
[00015dc8] 4879 0001 6a4e            pea.l      $00016A4E 'ILLEGAL'
[00015dce] 4eb9 0001 436c            jsr        addstr
[00015dd4] 5c8f                      addq.l     #6,a7
[00015dd6] 4e5e                      unlk       a6
[00015dd8] 4e75                      rts

disasm.disasm:
[00015dda] 4e56 fffe                 link       a6,#-2
[00015dde] 2f2d fffc                 move.l     -4(a5),-(a7)
[00015de2] 2b4e fffc                 move.l     a6,-4(a5)
[00015de6] 4279 0001 8c34            clr.w      disasm.strpos
[00015dec] 286e 0012                 movea.l    18(a6),a4
[00015df0] 33d4 0001 8c32            move.w     (a4),disasm.opcode
[00015df6] 4eb9 0001 4584            jsr        incpc
[00015dfc] 286e 000e                 movea.l    14(a6),a4
[00015e00] 38bc 0001                 move.w     #$0001,(a4)
[00015e04] 33fc 0004 0001 8c36       move.w     #$0004,disasm.opsize
[00015e0c] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015e12] e84d                      lsr.w      #4,d5
[00015e14] e04d                      lsr.w      #8,d5
[00015e16] 0245 000f                 andi.w     #$000F,d5
[00015e1a] 4845                      swap       d5
[00015e1c] 4245                      clr.w      d5
[00015e1e] 4845                      swap       d5
[00015e20] 2005                      move.l     d5,d0
[00015e22] 4eb9 0001 000a            jsr        CASEX
[00015e28] 0000 0000
[00015e2c] 0000 000e
[00015e30] 0000 09de
case 0:
[00015e34] 4eb9 0001 513c            jsr        group0
[00015e3a] 4efa 09fa                 jmp        $00016836(pc)
case 1:
[00015e3e] 4279 0001 8c36            clr.w      disasm.opsize
[00015e44] 3f3c 0005                 move.w     #$0005,-(a7)
[00015e48] 4879 0001 6a56            pea.l      $00016A56 'MOVE.B'
[00015e4e] 4eb9 0001 4f6e            jsr        printmoveinst
[00015e54] 5c8f                      addq.l     #6,a7
[00015e56] 4efa 09de                 jmp        $00016836(pc)
case 2:
[00015e5a] 33fc 0002 0001 8c36       move.w     #$0002,disasm.opsize
[00015e62] 3f3c 0005                 move.w     #$0005,-(a7)
[00015e66] 4879 0001 6a5e            pea.l      $00016A5E 'MOVE.L'
[00015e6c] 4eb9 0001 4f6e            jsr        printmoveinst
[00015e72] 5c8f                      addq.l     #6,a7
[00015e74] 4efa 09c0                 jmp        $00016836(pc)
case 3:
[00015e78] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[00015e80] 3f3c 0005                 move.w     #$0005,-(a7)
[00015e84] 4879 0001 6a66            pea.l      $00016A66 'MOVE.W'
[00015e8a] 4eb9 0001 4f6e            jsr        printmoveinst
[00015e90] 5c8f                      addq.l     #6,a7
[00015e92] 4efa 09a2                 jmp        $00016836(pc)
case 4:
[00015e96] 4eb9 0001 5510            jsr        group4
[00015e9c] 4efa 0998                 jmp        $00016836(pc)
case 5:
[00015ea0] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015ea6] ec4d                      lsr.w      #6,d5
[00015ea8] 0245 0007                 andi.w     #$0007,d5
[00015eac] 4845                      swap       d5
[00015eae] 4245                      clr.w      d5
[00015eb0] 4845                      swap       d5
[00015eb2] 2005                      move.l     d5,d0
[00015eb4] 4eb9 0001 000a            jsr        CASEX
[00015eba] 0000 0000
[00015ebe] 0000 0007
[00015ec2] 0000 019a
[00015ec6] 3f3c 0003                 move.w     #$0003,-(a7)
[00015eca] 4879 0001 6a6e            pea.l      $00016A6E 'ADDQ'
[00015ed0] 4eb9 0001 436c            jsr        addstr
[00015ed6] 5c8f                      addq.l     #6,a7
[00015ed8] 4eb9 0001 4448            jsr        printsize
[00015ede] 4eb9 0001 43ae            jsr        addspaces
[00015ee4] 1f3c 0023                 move.b     #$23,-(a7)
[00015ee8] 4eb9 0001 434a            jsr        addch
[00015eee] 548f                      addq.l     #2,a7
[00015ef0] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015ef6] e24d                      lsr.w      #1,d5
[00015ef8] e04d                      lsr.w      #8,d5
[00015efa] 0245 0007                 andi.w     #$0007,d5
[00015efe] 3f05                      move.w     d5,-(a7)
[00015f00] 4eb9 0001 441e            jsr        printquickval
[00015f06] 548f                      addq.l     #2,a7
[00015f08] 1f3c 002c                 move.b     #$2C,-(a7)
[00015f0c] 4eb9 0001 434a            jsr        addch
[00015f12] 548f                      addq.l     #2,a7
[00015f14] 4eb9 0001 4ac4            jsr        printea
[00015f1a] 4efa 0148                 jmp        $00016064(pc)
case 3:
[00015f1e] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015f24] e64d                      lsr.w      #3,d5
[00015f26] 0245 0007                 andi.w     #$0007,d5
[00015f2a] 0c45 0001                 cmpi.w     #$0001,d5
[00015f2e] 6602                      bne.s      $00015F32
[00015f30] 6004                      bra.s      $00015F36
[00015f32] 4efa 009c                 jmp        $00015FD0(pc)
[00015f36] 3f3c 0001                 move.w     #$0001,-(a7)
[00015f3a] 4879 0001 6a74            pea.l      $00016A74 'DB'
[00015f40] 4eb9 0001 436c            jsr        addstr
[00015f46] 5c8f                      addq.l     #6,a7
[00015f48] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015f4e] e04d                      lsr.w      #8,d5
[00015f50] 0245 000f                 andi.w     #$000F,d5
[00015f54] 0c45 0001                 cmpi.w     #$0001,d5
[00015f58] 6616                      bne.s      $00015F70
[00015f5a] 3f3c 0001                 move.w     #$0001,-(a7)
[00015f5e] 4879 0001 6a78            pea.l      $00016A78 'RA'
[00015f64] 4eb9 0001 436c            jsr        addstr
[00015f6a] 5c8f                      addq.l     #6,a7
[00015f6c] 4efa 0008                 jmp        $00015F76(pc)
[00015f70] 4eb9 0001 4b9e            jsr        printcc
[00015f76] 4eb9 0001 43ae            jsr        addspaces
[00015f7c] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00015f82] 0245 0007                 andi.w     #$0007,d5
[00015f86] 3f05                      move.w     d5,-(a7)
[00015f88] 4eb9 0001 465a            jsr        printdatareg
[00015f8e] 548f                      addq.l     #2,a7
[00015f90] 1f3c 002c                 move.b     #$2C,-(a7)
[00015f94] 4eb9 0001 434a            jsr        addch
[00015f9a] 548f                      addq.l     #2,a7
[00015f9c] 1f3c 005b                 move.b     #$5B,-(a7)
[00015fa0] 4eb9 0001 434a            jsr        addch
[00015fa6] 548f                      addq.l     #2,a7
[00015fa8] 4eb9 0001 459e            jsr        fetchword
[00015fae] 3f3c 0004                 move.w     #$0004,-(a7)
[00015fb2] 4879 0001 6a7c            pea.l      $00016A7C 'H] = '
[00015fb8] 4eb9 0001 436c            jsr        addstr
[00015fbe] 5c8f                      addq.l     #6,a7
[00015fc0] 3f3c 0002                 move.w     #$0002,-(a7)
[00015fc4] 4eb9 0001 45ce            jsr        printtarget
[00015fca] 548f                      addq.l     #2,a7
[00015fcc] 4efa 0026                 jmp        $00015FF4(pc)
[00015fd0] 1f3c 0053                 move.b     #$53,-(a7)
[00015fd4] 4eb9 0001 434a            jsr        addch
[00015fda] 548f                      addq.l     #2,a7
[00015fdc] 4279 0001 8c36            clr.w      disasm.opsize
[00015fe2] 4eb9 0001 4b9e            jsr        printcc
[00015fe8] 4eb9 0001 43ae            jsr        addspaces
[00015fee] 4eb9 0001 4ac4            jsr        printea
[00015ff4] 4efa 006e                 jmp        $00016064(pc)
case 4,5,6:
[00015ff8] 3f3c 0003                 move.w     #$0003,-(a7)
[00015ffc] 4879 0001 6a82            pea.l      $00016A82 'SUBQ'
[00016002] 4eb9 0001 436c            jsr        addstr
[00016008] 5c8f                      addq.l     #6,a7
[0001600a] 4eb9 0001 4448            jsr        printsize
[00016010] 4eb9 0001 43ae            jsr        addspaces
[00016016] 1f3c 0023                 move.b     #$23,-(a7)
[0001601a] 4eb9 0001 434a            jsr        addch
[00016020] 548f                      addq.l     #2,a7
[00016022] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016028] e24d                      lsr.w      #1,d5
[0001602a] e04d                      lsr.w      #8,d5
[0001602c] 0245 0007                 andi.w     #$0007,d5
[00016030] 3f05                      move.w     d5,-(a7)
[00016032] 4eb9 0001 441e            jsr        printquickval
[00016038] 548f                      addq.l     #2,a7
[0001603a] 1f3c 002c                 move.b     #$2C,-(a7)
[0001603e] 4eb9 0001 434a            jsr        addch
[00016044] 548f                      addq.l     #2,a7
[00016046] 4eb9 0001 4ac4            jsr        printea
[0001604c] 4efa 0016                 jmp        $00016064(pc)
[00016050] 4efa 0012                 jmp        $00016064(pc)
[00016054] 000c
           000c
[00016058] 000c
           0064
[0001605c] 013e
[0001605e] 013e
[00016060] 013e
[00016062] 0064
[00016064] 4efa 07d0                 jmp        $00016836(pc)
case 6:
[00016068] 1f3c 0042                 move.b     #$42,-(a7)
[0001606c] 4eb9 0001 434a            jsr        addch
[00016072] 548f                      addq.l     #2,a7
[00016074] 3a39 0001 8c32            move.w     disasm.opcode,d5
[0001607a] e04d                      lsr.w      #8,d5
[0001607c] 0245 000f                 andi.w     #$000F,d5
[00016080] 4a45                      tst.w      d5
[00016082] 6616                      bne.s      $0001609A
[00016084] 3f3c 0001                 move.w     #$0001,-(a7)
[00016088] 4879 0001 6a88            pea.l      $00016A88 'RA'
[0001608e] 4eb9 0001 436c            jsr        addstr
[00016094] 5c8f                      addq.l     #6,a7
[00016096] 4efa 0030                 jmp        $000160C8(pc)
[0001609a] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000160a0] e04d                      lsr.w      #8,d5
[000160a2] 0245 000f                 andi.w     #$000F,d5
[000160a6] 0c45 0001                 cmpi.w     #$0001,d5
[000160aa] 6616                      bne.s      $000160C2
[000160ac] 3f3c 0001                 move.w     #$0001,-(a7)
[000160b0] 4879 0001 6a8c            pea.l      $00016A8C 'SR'
[000160b6] 4eb9 0001 436c            jsr        addstr
[000160bc] 5c8f                      addq.l     #6,a7
[000160be] 4efa 0008                 jmp        $000160C8(pc)
[000160c2] 4eb9 0001 4b9e            jsr        printcc
[000160c8] 4eb9 0001 43ae            jsr        addspaces
[000160ce] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000160d4] 0245 00ff                 andi.w     #$00FF,d5
[000160d8] 4a45                      tst.w      d5
[000160da] 6762                      beq.s      $0001613E
[000160dc] 1f3c 005b                 move.b     #$5B,-(a7)
[000160e0] 4eb9 0001 434a            jsr        addch
[000160e6] 548f                      addq.l     #2,a7
[000160e8] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000160ee] 0245 00ff                 andi.w     #$00FF,d5
[000160f2] 3f05                      move.w     d5,-(a7)
[000160f4] 4eb9 0001 44f2            jsr        printhexbyte
[000160fa] 548f                      addq.l     #2,a7
[000160fc] 3f3c 0003                 move.w     #$0003,-(a7)
[00016100] 4879 0001 6a90            pea.l      $00016A90 '] = '
[00016106] 4eb9 0001 436c            jsr        addstr
[0001610c] 5c8f                      addq.l     #6,a7
[0001610e] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016114] 0245 00ff                 andi.w     #$00FF,d5
[00016118] 33c5 0001 8c3a            move.w     d5,disp
[0001611e] 0c79 0080 0001 8c3a       cmpi.w     #$0080,disp
[00016126] 6d08                      blt.s      $00016130
[00016128] 0479 0100 0001 8c3a       subi.w     #$0100,disp
[00016130] 4267                      clr.w      -(a7)
[00016132] 4eb9 0001 45ce            jsr        printtarget
[00016138] 548f                      addq.l     #2,a7
[0001613a] 4efa 0032                 jmp        $0001616E(pc)
[0001613e] 1f3c 005b                 move.b     #$5B,-(a7)
[00016142] 4eb9 0001 434a            jsr        addch
[00016148] 548f                      addq.l     #2,a7
[0001614a] 4eb9 0001 459e            jsr        fetchword
[00016150] 3f3c 0004                 move.w     #$0004,-(a7)
[00016154] 4879 0001 6a96            pea.l      $00016A96 'H] = '
[0001615a] 4eb9 0001 436c            jsr        addstr
[00016160] 5c8f                      addq.l     #6,a7
[00016162] 3f3c 0002                 move.w     #$0002,-(a7)
[00016166] 4eb9 0001 45ce            jsr        printtarget
[0001616c] 548f                      addq.l     #2,a7
[0001616e] 4efa 06c6                 jmp        $00016836(pc)
case 7:
[00016172] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016178] e04d                      lsr.w      #8,d5
[0001617a] 0245 0001                 andi.w     #$0001,d5
[0001617e] 0c45 0001                 cmpi.w     #$0001,d5
[00016182] 6616                      bne.s      $0001619A
[00016184] 3f3c 0006                 move.w     #$0006,-(a7)
[00016188] 4879 0001 6a9c            pea.l      $00016A9C 'ILLEGAL'
[0001618e] 4eb9 0001 436c            jsr        addstr
[00016194] 5c8f                      addq.l     #6,a7
[00016196] 4efa 005e                 jmp        $000161F6(pc)
[0001619a] 3f3c 0004                 move.w     #$0004,-(a7)
[0001619e] 4879 0001 6aa4            pea.l      $00016AA4 'MOVEQ'
[000161a4] 4eb9 0001 436c            jsr        addstr
[000161aa] 5c8f                      addq.l     #6,a7
[000161ac] 4eb9 0001 43ae            jsr        addspaces
[000161b2] 1f3c 0023                 move.b     #$23,-(a7)
[000161b6] 4eb9 0001 434a            jsr        addch
[000161bc] 548f                      addq.l     #2,a7
[000161be] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000161c4] 0245 00ff                 andi.w     #$00FF,d5
[000161c8] 3f05                      move.w     d5,-(a7)
[000161ca] 4eb9 0001 44f2            jsr        printhexbyte
[000161d0] 548f                      addq.l     #2,a7
[000161d2] 1f3c 002c                 move.b     #$2C,-(a7)
[000161d6] 4eb9 0001 434a            jsr        addch
[000161dc] 548f                      addq.l     #2,a7
[000161de] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000161e4] e24d                      lsr.w      #1,d5
[000161e6] e04d                      lsr.w      #8,d5
[000161e8] 0245 0007                 andi.w     #$0007,d5
[000161ec] 3f05                      move.w     d5,-(a7)
[000161ee] 4eb9 0001 465a            jsr        printdatareg
[000161f4] 548f                      addq.l     #2,a7
[000161f6] 4efa 063e                 jmp        $00016836(pc)
case 8:
[000161fa] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016200] e84d                      lsr.w      #4,d5
[00016202] 0245 001f                 andi.w     #$001F,d5
[00016206] 0c45 0010                 cmpi.w     #$0010,d5
[0001620a] 6622                      bne.s      $0001622E
[0001620c] 3f3c 0003                 move.w     #$0003,-(a7)
[00016210] 4879 0001 6aaa            pea.l      $00016AAA 'SBCB'
[00016216] 4eb9 0001 436c            jsr        addstr
[0001621c] 5c8f                      addq.l     #6,a7
[0001621e] 4eb9 0001 43ae            jsr        addspaces
[00016224] 4eb9 0001 4aee            jsr        printdataorpredec
[0001622a] 4efa 00ee                 jmp        $0001631A(pc)
[0001622e] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016234] ec4d                      lsr.w      #6,d5
[00016236] 0245 0007                 andi.w     #$0007,d5
[0001623a] 4845                      swap       d5
[0001623c] 4245                      clr.w      d5
[0001623e] 4845                      swap       d5
[00016240] 2005                      move.l     d5,d0
[00016242] 4eb9 0001 000a            jsr        CASEX
[00016248] 0000 0000
[0001624c] 0000 0007
[00016250] 0000 00c2
[00016254] 3f3c 0001                 move.w     #$0001,-(a7)
[00016258] 4879 0001 6ab0            pea.l      $00016AB0 'OR'
[0001625e] 4eb9 0001 5012            jsr        printdyadicinst
[00016264] 5c8f                      addq.l     #6,a7
[00016266] 4efa 00b2                 jmp        $0001631A(pc)
case 8.3
[0001626a] 3f3c 0003                 move.w     #$0003,-(a7)
[0001626e] 4879 0001 6ab4            pea.l      $00016AB4 'DIVU'
[00016274] 4eb9 0001 436c            jsr        addstr
[0001627a] 5c8f                      addq.l     #6,a7
[0001627c] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[00016284] 4eb9 0001 43ae            jsr        addspaces
[0001628a] 4eb9 0001 4ac4            jsr        printea
[00016290] 1f3c 002c                 move.b     #$2C,-(a7)
[00016294] 4eb9 0001 434a            jsr        addch
[0001629a] 548f                      addq.l     #2,a7
[0001629c] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000162a2] e24d                      lsr.w      #1,d5
[000162a4] e04d                      lsr.w      #8,d5
[000162a6] 0245 0007                 andi.w     #$0007,d5
[000162aa] 3f05                      move.w     d5,-(a7)
[000162ac] 4eb9 0001 465a            jsr        printdatareg
[000162b2] 548f                      addq.l     #2,a7
[000162b4] 4efa 0064                 jmp        $0001631A(pc)
caes 8.7
[000162b8] 3f3c 0003                 move.w     #$0003,-(a7)
[000162bc] 4879 0001 6aba            pea.l      $00016ABA 'DIVS'
[000162c2] 4eb9 0001 436c            jsr        addstr
[000162c8] 5c8f                      addq.l     #6,a7
[000162ca] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[000162d2] 4eb9 0001 43ae            jsr        addspaces
[000162d8] 4eb9 0001 4ac4            jsr        printea
[000162de] 1f3c 002c                 move.b     #$2C,-(a7)
[000162e2] 4eb9 0001 434a            jsr        addch
[000162e8] 548f                      addq.l     #2,a7
[000162ea] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000162f0] e24d                      lsr.w      #1,d5
[000162f2] e04d                      lsr.w      #8,d5
[000162f4] 0245 0007                 andi.w     #$0007,d5
[000162f8] 3f05                      move.w     d5,-(a7)
[000162fa] 4eb9 0001 465a            jsr        printdatareg
[00016300] 548f                      addq.l     #2,a7
[00016302] 4efa 0016                 jmp        $0001631A(pc)
[00016306] 4efa 0012                 jmp        $0001631A(pc)
[0001630a] 000c
           000c
[0001630e] 000c
           0022
[00016312] 000c
           000c
[00016316] 000c
           0070
[0001631a] 4efa 051a                 jmp        $00016836(pc)
case 9:
[0001631e] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016324] e04d                      lsr.w      #8,d5
[00016326] 0245 0001                 andi.w     #$0001,d5
[0001632a] 0c45 0001                 cmpi.w     #$0001,d5
[0001632e] 664a                      bne.s      $0001637A
[00016330] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016336] e84d                      lsr.w      #4,d5
[00016338] 0245 0003                 andi.w     #$0003,d5
[0001633c] 4a45                      tst.w      d5
[0001633e] 663a                      bne.s      $0001637A
[00016340] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016346] ec4d                      lsr.w      #6,d5
[00016348] 0245 0003                 andi.w     #$0003,d5
[0001634c] 0c45 0003                 cmpi.w     #$0003,d5
[00016350] 6728                      beq.s      $0001637A
[00016352] 3f3c 0003                 move.w     #$0003,-(a7)
[00016356] 4879 0001 6ac0            pea.l      $00016AC0 'SUBX'
[0001635c] 4eb9 0001 436c            jsr        addstr
[00016362] 5c8f                      addq.l     #6,a7
[00016364] 4eb9 0001 4448            jsr        printsize
[0001636a] 4eb9 0001 43ae            jsr        addspaces
[00016370] 4eb9 0001 4aee            jsr        printdataorpredec
[00016376] 4efa 0014                 jmp        $0001638C(pc)
[0001637a] 3f3c 0002                 move.w     #$0002,-(a7)
[0001637e] 4879 0001 6ac6            pea.l      $00016AC6 'SUB'
[00016384] 4eb9 0001 5012            jsr        printdyadicinst
[0001638a] 5c8f                      addq.l     #6,a7
[0001638c] 4efa 04a8                 jmp        $00016836(pc)
case 11:
[00016390] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016396] e04d                      lsr.w      #8,d5
[00016398] 0245 0001                 andi.w     #$0001,d5
[0001639c] 0c45 0001                 cmpi.w     #$0001,d5
[000163a0] 6614                      bne.s      $000163B6
[000163a2] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000163a8] ec4d                      lsr.w      #6,d5
[000163aa] 0245 0003                 andi.w     #$0003,d5
[000163ae] 0c45 0003                 cmpi.w     #$0003,d5
[000163b2] 6702                      beq.s      $000163B6
[000163b4] 6004                      bra.s      $000163BA
[000163b6] 4efa 00ae                 jmp        $00016466(pc)
[000163ba] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000163c0] e64d                      lsr.w      #3,d5
[000163c2] 0245 0007                 andi.w     #$0007,d5
[000163c6] 0c45 0001                 cmpi.w     #$0001,d5
[000163ca] 6602                      bne.s      $000163CE
[000163cc] 6004                      bra.s      $000163D2
[000163ce] 4efa 0080                 jmp        $00016450(pc)
[000163d2] 3f3c 0003                 move.w     #$0003,-(a7)
[000163d6] 4879 0001 6aca            pea.l      $00016ACA 'CMPM'
[000163dc] 4eb9 0001 436c            jsr        addstr
[000163e2] 5c8f                      addq.l     #6,a7
[000163e4] 4eb9 0001 4448            jsr        printsize
[000163ea] 4eb9 0001 43ae            jsr        addspaces
[000163f0] 1f3c 0028                 move.b     #$28,-(a7)
[000163f4] 4eb9 0001 434a            jsr        addch
[000163fa] 548f                      addq.l     #2,a7
[000163fc] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016402] 0245 0007                 andi.w     #$0007,d5
[00016406] 3f05                      move.w     d5,-(a7)
[00016408] 4eb9 0001 463a            jsr        printaddrreg
[0001640e] 548f                      addq.l     #2,a7
[00016410] 3f3c 0003                 move.w     #$0003,-(a7)
[00016414] 4879 0001 6ad0            pea.l      $00016AD0 ')+,('
[0001641a] 4eb9 0001 436c            jsr        addstr
[00016420] 5c8f                      addq.l     #6,a7
[00016422] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016428] e24d                      lsr.w      #1,d5
[0001642a] e04d                      lsr.w      #8,d5
[0001642c] 0245 0007                 andi.w     #$0007,d5
[00016430] 3f05                      move.w     d5,-(a7)
[00016432] 4eb9 0001 463a            jsr        printaddrreg
[00016438] 548f                      addq.l     #2,a7
[0001643a] 3f3c 0001                 move.w     #$0001,-(a7)
[0001643e] 4879 0001 6ad6            pea.l      $00016AD6 ')+'
[00016444] 4eb9 0001 436c            jsr        addstr
[0001644a] 5c8f                      addq.l     #6,a7
[0001644c] 4efa 0014                 jmp        $00016462(pc)
[00016450] 3f3c 0002                 move.w     #$0002,-(a7)
[00016454] 4879 0001 6ada            pea.l      $00016ADA 'EOR'
[0001645a] 4eb9 0001 5012            jsr        printdyadicinst
[00016460] 5c8f                      addq.l     #6,a7
[00016462] 4efa 0014                 jmp        $00016478(pc)
[00016466] 3f3c 0002                 move.w     #$0002,-(a7)
[0001646a] 4879 0001 6ade            pea.l      $00016ADE 'CMP'
[00016470] 4eb9 0001 5012            jsr        printdyadicinst
[00016476] 5c8f                      addq.l     #6,a7
[00016478] 4efa 03bc                 jmp        $00016836(pc)
case 12:
[0001647c] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016482] e64d                      lsr.w      #3,d5
[00016484] 0245 003f                 andi.w     #$003F,d5
[00016488] 33c5 0001 8c38            move.w     d5,disasm.subcode
[0001648e] 0c79 0028 0001 8c38       cmpi.w     #$0028,disasm.subcode
[00016496] 6654                      bne.s      $000164EC
[00016498] 3f3c 0002                 move.w     #$0002,-(a7)
[0001649c] 4879 0001 6ae2            pea.l      $00016AE2 'EXG'
[000164a2] 4eb9 0001 436c            jsr        addstr
[000164a8] 5c8f                      addq.l     #6,a7
[000164aa] 4eb9 0001 43ae            jsr        addspaces
[000164b0] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000164b6] e24d                      lsr.w      #1,d5
[000164b8] e04d                      lsr.w      #8,d5
[000164ba] 0245 0007                 andi.w     #$0007,d5
[000164be] 3f05                      move.w     d5,-(a7)
[000164c0] 4eb9 0001 465a            jsr        printdatareg
[000164c6] 548f                      addq.l     #2,a7
[000164c8] 1f3c 002c                 move.b     #$2C,-(a7)
[000164cc] 4eb9 0001 434a            jsr        addch
[000164d2] 548f                      addq.l     #2,a7
[000164d4] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000164da] 0245 0007                 andi.w     #$0007,d5
[000164de] 3f05                      move.w     d5,-(a7)
[000164e0] 4eb9 0001 465a            jsr        printdatareg
[000164e6] 548f                      addq.l     #2,a7
[000164e8] 4efa 01b8                 jmp        $000166A2(pc)
[000164ec] 0c79 0029 0001 8c38       cmpi.w     #$0029,disasm.subcode
[000164f4] 6654                      bne.s      $0001654A
[000164f6] 3f3c 0002                 move.w     #$0002,-(a7)
[000164fa] 4879 0001 6ae6            pea.l      $00016AE6 'EXG'
[00016500] 4eb9 0001 436c            jsr        addstr
[00016506] 5c8f                      addq.l     #6,a7
[00016508] 4eb9 0001 43ae            jsr        addspaces
[0001650e] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016514] e24d                      lsr.w      #1,d5
[00016516] e04d                      lsr.w      #8,d5
[00016518] 0245 0007                 andi.w     #$0007,d5
[0001651c] 3f05                      move.w     d5,-(a7)
[0001651e] 4eb9 0001 463a            jsr        printaddrreg
[00016524] 548f                      addq.l     #2,a7
[00016526] 1f3c 002c                 move.b     #$2C,-(a7)
[0001652a] 4eb9 0001 434a            jsr        addch
[00016530] 548f                      addq.l     #2,a7
[00016532] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016538] 0245 0007                 andi.w     #$0007,d5
[0001653c] 3f05                      move.w     d5,-(a7)
[0001653e] 4eb9 0001 463a            jsr        printaddrreg
[00016544] 548f                      addq.l     #2,a7
[00016546] 4efa 015a                 jmp        $000166A2(pc)
[0001654a] 0c79 0031 0001 8c38       cmpi.w     #$0031,disasm.subcode
[00016552] 6654                      bne.s      $000165A8
[00016554] 3f3c 0002                 move.w     #$0002,-(a7)
[00016558] 4879 0001 6aea            pea.l      $00016AEA 'EXG'
[0001655e] 4eb9 0001 436c            jsr        addstr
[00016564] 5c8f                      addq.l     #6,a7
[00016566] 4eb9 0001 43ae            jsr        addspaces
[0001656c] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016572] e24d                      lsr.w      #1,d5
[00016574] e04d                      lsr.w      #8,d5
[00016576] 0245 0007                 andi.w     #$0007,d5
[0001657a] 3f05                      move.w     d5,-(a7)
[0001657c] 4eb9 0001 465a            jsr        printdatareg
[00016582] 548f                      addq.l     #2,a7
[00016584] 1f3c 002c                 move.b     #$2C,-(a7)
[00016588] 4eb9 0001 434a            jsr        addch
[0001658e] 548f                      addq.l     #2,a7
[00016590] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016596] 0245 0007                 andi.w     #$0007,d5
[0001659a] 3f05                      move.w     d5,-(a7)
[0001659c] 4eb9 0001 463a            jsr        printaddrreg
[000165a2] 548f                      addq.l     #2,a7
[000165a4] 4efa 00fc                 jmp        $000166A2(pc)
[000165a8] 3a39 0001 8c38            move.w     disasm.subcode,d5
[000165ae] e24d                      lsr.w      #1,d5
[000165b0] 0c45 0010                 cmpi.w     #$0010,d5
[000165b4] 6622                      bne.s      $000165D8
[000165b6] 3f3c 0003                 move.w     #$0003,-(a7)
[000165ba] 4879 0001 6aee            pea.l      $00016AEE 'ABCD'
[000165c0] 4eb9 0001 436c            jsr        addstr
[000165c6] 5c8f                      addq.l     #6,a7
[000165c8] 4eb9 0001 43ae            jsr        addspaces
[000165ce] 4eb9 0001 4aee            jsr        printdataorpredec
[000165d4] 4efa 00cc                 jmp        $000166A2(pc)
[000165d8] 3a39 0001 8c38            move.w     disasm.subcode,d5
[000165de] e64d                      lsr.w      #3,d5
[000165e0] 0c45 0007                 cmpi.w     #$0007,d5
[000165e4] 664e                      bne.s      $00016634
[000165e6] 3f3c 0003                 move.w     #$0003,-(a7)
[000165ea] 4879 0001 6af4            pea.l      $00016AF4 'MULS'
[000165f0] 4eb9 0001 436c            jsr        addstr
[000165f6] 5c8f                      addq.l     #6,a7
[000165f8] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[00016600] 4eb9 0001 43ae            jsr        addspaces
[00016606] 4eb9 0001 4ac4            jsr        printea
[0001660c] 1f3c 002c                 move.b     #$2C,-(a7)
[00016610] 4eb9 0001 434a            jsr        addch
[00016616] 548f                      addq.l     #2,a7
[00016618] 3a39 0001 8c32            move.w     disasm.opcode,d5
[0001661e] e24d                      lsr.w      #1,d5
[00016620] e04d                      lsr.w      #8,d5
[00016622] 0245 0007                 andi.w     #$0007,d5
[00016626] 3f05                      move.w     d5,-(a7)
[00016628] 4eb9 0001 465a            jsr        printdatareg
[0001662e] 548f                      addq.l     #2,a7
[00016630] 4efa 0070                 jmp        $000166A2(pc)
[00016634] 3a39 0001 8c38            move.w     disasm.subcode,d5
[0001663a] e64d                      lsr.w      #3,d5
[0001663c] 0c45 0003                 cmpi.w     #$0003,d5
[00016640] 664e                      bne.s      $00016690
[00016642] 3f3c 0003                 move.w     #$0003,-(a7)
[00016646] 4879 0001 6afa            pea.l      $00016AFA 'MULU'
[0001664c] 4eb9 0001 436c            jsr        addstr
[00016652] 5c8f                      addq.l     #6,a7
[00016654] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[0001665c] 4eb9 0001 43ae            jsr        addspaces
[00016662] 4eb9 0001 4ac4            jsr        printea
[00016668] 1f3c 002c                 move.b     #$2C,-(a7)
[0001666c] 4eb9 0001 434a            jsr        addch
[00016672] 548f                      addq.l     #2,a7
[00016674] 3a39 0001 8c32            move.w     disasm.opcode,d5
[0001667a] e24d                      lsr.w      #1,d5
[0001667c] e04d                      lsr.w      #8,d5
[0001667e] 0245 0007                 andi.w     #$0007,d5
[00016682] 3f05                      move.w     d5,-(a7)
[00016684] 4eb9 0001 465a            jsr        printdatareg
[0001668a] 548f                      addq.l     #2,a7
[0001668c] 4efa 0014                 jmp        $000166A2(pc)
[00016690] 3f3c 0002                 move.w     #$0002,-(a7)
[00016694] 4879 0001 6b00            pea.l      $00016B00 'AND'
[0001669a] 4eb9 0001 5012            jsr        printdyadicinst
[000166a0] 5c8f                      addq.l     #6,a7
[000166a2] 4efa 0192                 jmp        $00016836(pc)
case 13:
[000166a6] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000166ac] e04d                      lsr.w      #8,d5
[000166ae] 0245 0001                 andi.w     #$0001,d5
[000166b2] 0c45 0001                 cmpi.w     #$0001,d5
[000166b6] 664a                      bne.s      $00016702
[000166b8] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000166be] e84d                      lsr.w      #4,d5
[000166c0] 0245 0003                 andi.w     #$0003,d5
[000166c4] 4a45                      tst.w      d5
[000166c6] 663a                      bne.s      $00016702
[000166c8] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000166ce] ec4d                      lsr.w      #6,d5
[000166d0] 0245 0003                 andi.w     #$0003,d5
[000166d4] 0c45 0003                 cmpi.w     #$0003,d5
[000166d8] 6728                      beq.s      $00016702
[000166da] 3f3c 0003                 move.w     #$0003,-(a7)
[000166de] 4879 0001 6b04            pea.l      $00016B04 'ADDX'
[000166e4] 4eb9 0001 436c            jsr        addstr
[000166ea] 5c8f                      addq.l     #6,a7
[000166ec] 4eb9 0001 4448            jsr        printsize
[000166f2] 4eb9 0001 43ae            jsr        addspaces
[000166f8] 4eb9 0001 4aee            jsr        printdataorpredec
[000166fe] 4efa 0014                 jmp        $00016714(pc)
[00016702] 3f3c 0002                 move.w     #$0002,-(a7)
[00016706] 4879 0001 6b0a            pea.l      $00016B0A 'ADD'
[0001670c] 4eb9 0001 5012            jsr        printdyadicinst
[00016712] 5c8f                      addq.l     #6,a7
[00016714] 4efa 0120                 jmp        $00016836(pc)
case 14:
[00016718] 3a39 0001 8c32            move.w     disasm.opcode,d5
[0001671e] ec4d                      lsr.w      #6,d5
[00016720] 0245 0003                 andi.w     #$0003,d5
[00016724] 0c45 0003                 cmpi.w     #$0003,d5
[00016728] 6642                      bne.s      $0001676C
[0001672a] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016730] e24d                      lsr.w      #1,d5
[00016732] e04d                      lsr.w      #8,d5
[00016734] 0245 0003                 andi.w     #$0003,d5
[00016738] 3f05                      move.w     d5,-(a7)
[0001673a] 4eb9 0001 4d44            jsr        printshiftinst
[00016740] 548f                      addq.l     #2,a7
[00016742] 3f3c 0001                 move.w     #$0001,-(a7)
[00016746] 4879 0001 6b0e            pea.l      $00016B0E '.W'
[0001674c] 4eb9 0001 436c            jsr        addstr
[00016752] 5c8f                      addq.l     #6,a7
[00016754] 33fc 0001 0001 8c36       move.w     #$0001,disasm.opsize
[0001675c] 4eb9 0001 43ae            jsr        addspaces
[00016762] 4eb9 0001 4ac4            jsr        printea
[00016768] 4efa 0094                 jmp        $000167FE(pc)
[0001676c] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016772] e64d                      lsr.w      #3,d5
[00016774] 0245 0003                 andi.w     #$0003,d5
[00016778] 3f05                      move.w     d5,-(a7)
[0001677a] 4eb9 0001 4d44            jsr        printshiftinst
[00016780] 548f                      addq.l     #2,a7
[00016782] 4eb9 0001 4448            jsr        printsize
[00016788] 4eb9 0001 43ae            jsr        addspaces
[0001678e] 3a39 0001 8c32            move.w     disasm.opcode,d5
[00016794] ea4d                      lsr.w      #5,d5
[00016796] 0245 0001                 andi.w     #$0001,d5
[0001679a] 4a45                      tst.w      d5
[0001679c] 6628                      bne.s      $000167C6
[0001679e] 1f3c 0023                 move.b     #$23,-(a7)
[000167a2] 4eb9 0001 434a            jsr        addch
[000167a8] 548f                      addq.l     #2,a7
[000167aa] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000167b0] e24d                      lsr.w      #1,d5
[000167b2] e04d                      lsr.w      #8,d5
[000167b4] 0245 0007                 andi.w     #$0007,d5
[000167b8] 3f05                      move.w     d5,-(a7)
[000167ba] 4eb9 0001 441e            jsr        printquickval
[000167c0] 548f                      addq.l     #2,a7
[000167c2] 4efa 001a                 jmp        $000167DE(pc)
[000167c6] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000167cc] e24d                      lsr.w      #1,d5
[000167ce] e04d                      lsr.w      #8,d5
[000167d0] 0245 0007                 andi.w     #$0007,d5
[000167d4] 3f05                      move.w     d5,-(a7)
[000167d6] 4eb9 0001 465a            jsr        printdatareg
[000167dc] 548f                      addq.l     #2,a7
[000167de] 1f3c 002c                 move.b     #$2C,-(a7)
[000167e2] 4eb9 0001 434a            jsr        addch
[000167e8] 548f                      addq.l     #2,a7
[000167ea] 3a39 0001 8c32            move.w     disasm.opcode,d5
[000167f0] 0245 0007                 andi.w     #$0007,d5
[000167f4] 3f05                      move.w     d5,-(a7)
[000167f6] 4eb9 0001 465a            jsr        printdatareg
[000167fc] 548f                      addq.l     #2,a7
[000167fe] 4efa 0036                 jmp        $00016836(pc)
case 10:
case 15:
[00016802] 4efa 0020                 jmp        $00016824(pc)
[00016806] 000c
           0016
[0001680a] 0032
           0050
           006e
[00016810] 0078
           0240
           034a
[00016816] 03d2
[00016818] 04f6
           09da
           0568
           0654
[00016820] 087e
           08f0
default:
[00016824] 3f3c 0006                 move.w     #$0006,-(a7)
[00016828] 4879 0001 6b12            pea.l      $00016B12 'ILLEGAL'
[0001682e] 4eb9 0001 436c            jsr        addstr
[00016834] 5c8f                      addq.l     #6,a7
[00016836] 4227                      clr.b      -(a7)
[00016838] 4eb9 0001 434a            jsr        addch
[0001683e] 548f                      addq.l     #2,a7
[00016840] 2b5f fffc                 move.l     (a7)+,-4(a5)
[00016844] 4e5e                      unlk       a6
[00016846] 4e75                      rts

[00016848] 2e42                      .asciiz '.B'
[0001684c] 2e57                      .asciiz '.W'
[00016850] 2e4c                      .asciiz '.L'
[00016854] 2e3f                      .asciiz '.?'
[00016858] 2e57                      .asciiz '.W'
[0001685c] 2e4c                      .asciiz '.L'
[00016860] 2e3f                      .asciiz '.?'
[00016864] 292b                      .asciiz ')+'
[00016868] 2d28                      .asciiz '-('
[0001686c] 485d                      .asciiz 'H] = '
[00016872] 5d20                      .asciiz '] = '
[00016878] 3f3f                      .asciiz '???'
[0001687c] 3f3f                      .asciiz '???'
[00016880] 2d28 0000                 .asciiz '-('
[00016884] 292c 2d28                 .asciiz '),-('
[0001688a] 4849                      .asciiz 'HI'
[0001688e] 4c53                      .asciiz 'LS'
[00016892] 4343                      .asciiz 'CC'
[00016896] 4353                      .asciiz 'CS'
[0001689a] 4e45                      .asciiz 'NE'
[0001689e] 4551                      .asciiz 'EQ'
[000168a2] 5643                      .asciiz 'VC'
[000168a6] 5653                      .asciiz 'VS'
[000168aa] 504c                      .asciiz 'PL'
[000168ae] 4d49                      .asciiz 'MI'
[000168b2] 4745                      .asciiz 'GE'
[000168b6] 4c54                      .asciiz 'LT'
[000168ba] 4754                      .asciiz 'GT'
[000168be] 4c45                      .asciiz 'LE'
[000168c2] 4153                      .asciiz 'AS'
[000168c6] 4c53                      .asciiz 'LS'
[000168ca] 524f                      .asciiz 'ROX'
[000168ce] 524f                      .asciiz 'RO'
[000168d2] 2c43                      .asciiz ',CCR'
[000168d8] 482c                      .asciiz 'H,SR'
[000168de] 3f3f                      .asciiz '???'
[000168e2] 412e 0000                 .asciiz 'A.'
[000168e6] 4d4f                      .asciiz 'MOVEP.W'
[000168ee] 4d4f                      .asciiz 'MOVEP.L'
[000168f6] 4828 0000                 .asciiz 'H('
[000168fa] 292c 0000                 .asciiz '),'
[000168fe] 4828 0000                 .asciiz 'H('
[00016902] 4f52                      .asciiz 'ORI'
[00016906] 414e                      .asciiz 'ANDI'
[0001690c] 5355                      .asciiz 'SUBI'
[00016912] 4144                      .asciiz 'ADDI'
[00016918] 4254                      .asciiz 'BTST'
[0001691e] 4243                      .asciiz 'BCHG'
[00016924] 4243                      .asciiz 'BCLR'
[0001692a] 4253                      .asciiz 'BSET'
[00016930] 482c                      .asciiz 'H,'
[00016934] 454f                      .asciiz 'EORI'
[0001693a] 434d                      .asciiz 'CMPI'
[00016940] 4254                      .asciiz 'BTST'
[00016946] 4243                      .asciiz 'BCHG'
[0001694c] 4243                      .asciiz 'BCLR'
[00016952] 4253                      .asciiz 'BSET'
[00016958] 4d4f                      .asciiz 'MOVE'
[0001695e] 5352                      .asciiz 'SR,'
[00016962] 4e45                      .asciiz 'NEGX'
[00016968] 434c                      .asciiz 'CLR'
[0001696c] 4d4f                      .asciiz 'MOVE'
[00016972] 2c43                      .asciiz ',CCR'
[00016978] 4e45                      .asciiz 'NEG'
[0001697c] 4d4f                      .asciiz 'MOVE'
[00016982] 2c53                      .asciiz ',SR'
[00016986] 4e4f                      .asciiz 'NOT'
[0001698a] 4558                      .asciiz 'EXT.L'
[00016990] 4558                      .asciiz 'EXT.W'
[00016996] 5357                      .asciiz 'SWAP'
[0001699c] 4e42                      .asciiz 'NBCD'
[000169a2] 5045                      .asciiz 'PEA'
[000169a6] 4d4f                      .asciiz 'MOVEM.W'
[000169ae] 482c 0000                 .asciiz 'H,'
[000169b2] 4d4f                      .asciiz 'MOVEM.L'
[000169ba] 482c 0000                 .asciiz 'H,'
[000169be] 5441                      .asciiz 'TAS'
[000169c2] 5453                      .asciiz 'TST'
[000169c6] 494c                      .asciiz 'ILLEGAL'
[000169ce] 4d4f                      .asciiz 'MOVEM.W'
[000169d6] 2c23                      .asciiz ',#'
[000169da] 4d4f                      .asciiz 'MOVEM.L'
[000169e2] 2c23                      .asciiz ',#'
[000169e6] 5452                      .asciiz 'TRAP'
[000169ec] 4c49                      .asciiz 'LINK'
[000169f2] 2c23                      .asciiz ',#'
[000169f6] 554e                      .asciiz 'UNLK'
[000169fc] 4d4f                      .asciiz 'MOVE'
[00016a02] 2c55                      .asciiz ',USP'
[00016a08] 4d4f                      .asciiz 'MOVE'
[00016a0e] 5553                      .asciiz 'USP,'
[00016a14] 5245                      .asciiz 'RESET'
[00016a1a] 4e4f                      .asciiz 'NOP'
[00016a1e] 5354                      .asciiz 'STOP'
[00016a24] 5254                      .asciiz 'RTE'
[00016a28] 5254                      .asciiz 'RTS'
[00016a2c] 5452                      .asciiz 'TRAPV'
[00016a32] 5254                      .asciiz 'RTR'
[00016a36] 4a53                      .asciiz 'JSR'
[00016a3a] 4a4d                      .asciiz 'JMP'
[00016a3e] 494c                      .asciiz 'ILLEGAL'
[00016a46] 4348                      .asciiz 'CHK'
[00016a4a] 4c45 4100                 .asciiz 'LEA'
[00016a4e] 494c                      .asciiz 'ILLEGAL'
[00016a56] 4d4f                      .asciiz 'MOVE.B'
[00016a5e] 4d4f                      .asciiz 'MOVE.L'
[00016a66] 4d4f                      .asciiz 'MOVE.W'
[00016a6e] 4144                      .asciiz 'ADDQ'
[00016a74] 4442                      .asciiz 'DB'
[00016a78] 5241                      .asciiz 'RA'
[00016a7c] 485d                      .asciiz 'H] = '
[00016a82] 5355                      .asciiz 'SUBQ'
[00016a88] 5241                      .asciiz 'RA'
[00016a8c] 5352                      .asciiz 'SR'
[00016a90] 5d20                      .asciiz '] = '
[00016a96] 485d                      .asciiz 'H] = '
[00016a9c] 494c                      .asciiz 'ILLEGAL'
[00016aa4] 4d4f                      .asciiz 'MOVEQ'
[00016aaa] 5342                      .asciiz 'SBCB'
[00016ab0] 4f52                      .asciiz 'OR'
[00016ab4] 4449                      .asciiz 'DIVU'
[00016aba] 4449                      .asciiz 'DIVS'
[00016ac0] 5355                      .asciiz 'SUBX'
[00016ac6] 5355                      .asciiz 'SUB'
[00016aca] 434d                      .asciiz 'CMPM'
[00016ad0] 292b                      .asciiz ')+,('
[00016ad6] 292b 0000                 .asciiz ')+'
[00016ada] 454f                      .asciiz 'EOR'
[00016ade] 434d                      .asciiz 'CMP'
[00016ae2] 4558                      .asciiz 'EXG'
[00016ae6] 4558                      .asciiz 'EXG'
[00016aea] 4558                      .asciiz 'EXG'
[00016aee] 4142                      .asciiz 'ABCD'
[00016af4] 4d55                      .asciiz 'MULS'
[00016afa] 4d55                      .asciiz 'MULU'
[00016b00] 414e                      .asciiz 'AND'
[00016b04] 4144                      .asciiz 'ADDX'
[00016b0a] 4144                      .asciiz 'ADD'
[00016b0e] 2e57                      .asciiz '.W'
[00016b12] 494c                      .asciiz 'ILLEGAL'

***
* MODULE Filepool
***

Filepool.PoolAlloc:
[00016b1a] 4e56                      link       a6,#-80
[00016b1e] 286e 0008                 movea.l    8(a6),a4
[00016b22] 47ee ffb0                 lea.l      -80(a6),a3
[00016b26] 7a13                      moveq.l    #19,d5
[00016b28] 26dc                      move.l     (a4)+,(a3)+
[00016b2a] 51cd fffc                 dbf        d5,$00016B28
[00016b2e] 5279 0001 8c3c            addq.w     #1,Filepool.fileid
[00016b34] 3a39 0001 8c3c            move.w     Filepool.fileid,d5
[00016b3a] cafc 0050                 mulu.w     #$0050,d5
[00016b3e] 49f9 0001 8c3e            lea.l      $00018C3E,a4
[00016b44] 47ee ffb0                 lea.l      -80(a6),a3
[00016b48] 49f4 5000                 lea.l      0(a4,d5.w),a4
[00016b4c] 7a13                      moveq.l    #19,d5
[00016b4e] 28db                      move.l     (a3)+,(a4)+
[00016b50] 51cd fffc                 dbf        d5,$00016B4E
[00016b54] 3d79 0001 8c3c 000c       move.w     Filepool.fileid,12(a6)
[00016b5c] 4e5e                      unlk       a6
[00016b5e] 4e75                      rts

Filepool.init:
[00016b60] 4ef9 0001 3eec            jmp        NewStreams.init
[00016b66] 4e56 0000                 link       a6,#0
[00016b6a] 4279 0001 8c3c            clr.w      Filepool.fileid
[00016b70] 4e5e                      unlk       a6
[00016b72] 4ef9 0001 796a            jmp        DecLnk.init+6

***
* MODULE declnk
***

ParameterError:
[00016b78] 4e56 0000                 link       a6,#0
[00016b7c] 3a2e 000c                 move.w     12(a6),d5
[00016b80] 3f05                      move.w     d5,-(a7)
[00016b82] 286e 0008                 movea.l    8(a6),a4
[00016b86] 4854                      pea.l      (a4)
[00016b88] 4eb9 0001 1316            jsr        AppWindow.WriteString
[00016b8e] 5c8f                      addq.l     #6,a7
[00016b90] 4eb9 0001 13e0            jsr        AppWindow.WriteLn
[00016b96] 4e5e                      unlk       a6
[00016b98] 4e75                      rts

OpenFiles:
[00016b9a] 4e56 fef6                 link       a6,#-266
[00016b9e] 3f3c 0008                 move.w     #$0008,-(a7)
[00016ba2] 4879 0001 79e2            pea.l       'Link file'
[00016ba8] 4267                      clr.w      -(a7)
[00016baa] 4879 0001 79ec            pea.l      $000179EC ''
[00016bb0] 3f3c 0005                 move.w     #$0005,-(a7)
[00016bb4] 4879 0001 8f62            pea.l      declnk.lnkFile
[00016bba] 1f3c 0001                 move.b     #$01,-(a7)
[00016bbe] 4227                      clr.b      -(a7)
[00016bc0] 3f3c 0031                 move.w     #$0031,-(a7)
[00016bc4] 486e ffce                 pea.l      -50(a6)
[00016bc8] 486e ff9b                 pea.l      -101(a6)
[00016bcc] 4eb9 0001 342e            jsr        NewStreams.FileLookup
[00016bd2] 4fef 0020                 lea.l      32(a7),a7
[00016bd6] 4a2e ff9b                 tst.b      -101(a6)
[00016bda] 675a                      beq.s      $00016C36
[00016bdc] 558f                      subq.l     #2,a7
[00016bde] 4879 0001 79ee            pea.l      $000179EE  "List"
[00016be4] 4eb9 0001 6b1a            jsr        Filepool.PoolAlloc
[00016bea] 588f                      addq.l     #4,a7
[00016bec] 3d5f fef8                 move.w     (a7)+,-264(a6)
[00016bf0] 486e fefa                 pea.l      -262(a6)
[00016bf4] 486e ff9a                 pea.l      -102(a6)
[00016bf8] 4eb9 0001 3c40            jsr        NewStreams.GetOptionInfo
[00016bfe] 508f                      addq.l     #8,a7
[00016c00] 3f3c 000a                 move.w     #$000A,-(a7)
[00016c04] 4879 0001 79f4            pea.l      $000179F4 "Decode file"
[00016c0a] 3f3c 0031                 move.w     #$0031,-(a7)
[00016c0e] 486e ffce                 pea.l      -50(a6)
[00016c12] 3f3c 000e                 move.w     #$000E,-(a7)
[00016c16] 4879 0001 8f66            pea.l      declnk.decFile
[00016c1c] 4227                      clr.b      -(a7)
[00016c1e] 4227                      clr.b      -(a7)
[00016c20] 3f3c 0031                 move.w     #$0031,-(a7)
[00016c24] 486e ff9c                 pea.l      -100(a6)
[00016c28] 486e ff9b                 pea.l      -101(a6)
[00016c2c] 4eb9 0001 3914            jsr        NewStreams.FileLookupOutput
[00016c32] 4fef 0020                 lea.l      32(a7),a7
[00016c36] 4a2e ff9b                 tst.b      -101(a6)
[00016c3a] 57c5                      seq        d5
[00016c3c] 4405                      neg.b      d5
[00016c3e] 13c5 0001 8f60            move.b     d5,declnk.outputFailed
[00016c44] 4e5e                      unlk       a6
[00016c46] 4e75                      rts

CloseFiles:
[00016c48] 4e56 fffe                 link       a6,#-2
[00016c4c] 4879 0001 8f62            pea.l      declnk.lnkFile
[00016c52] 486e ffff                 pea.l      -1(a6)
[00016c56] 4eb9 0001 3dea            jsr        NewStreams.Close
[00016c5c] 508f                      addq.l     #8,a7
[00016c5e] 4879 0001 8f66            pea.l      declnk.decFile
[00016c64] 486e ffff                 pea.l      -1(a6)
[00016c68] 4eb9 0001 3dea            jsr        NewStreams.Close
[00016c6e] 508f                      addq.l     #8,a7
[00016c70] 4e5e                      unlk       a6
[00016c72] 4e75                      rts

declnk.Read16Bit:
[00016c74] 4e56 0000                 link       a6,#0
[00016c78] 4879 0001 8f62            pea.l      declnk.lnkFile
[00016c7e] 286e 0008                 movea.l    8(a6),a4
[00016c82] 4854                      pea.l      (a4)
[00016c84] 4eb9 0001 3e88            jsr        NewStreams.Read16Bit
[00016c8a] 508f                      addq.l     #8,a7
[00016c8c] 286e 0008                 movea.l    8(a6),a4
[00016c90] 3a14                      move.w     (a4),d5
[00016c92] db79 0001 8f5e            add.w      d5,declnk.crc
[00016c98] 4e5e                      unlk       a6
[00016c9a] 4e75                      rts

declnk.Write:
[00016c9c] 4e56 0000                 link       a6,#0
[00016ca0] 4879 0001 8f66            pea.l      declnk.decFile
[00016ca6] 1f2e 0008                 move.b     8(a6),-(a7)
[00016caa] 4eb9 0001 3e48            jsr        NewStreams.WriteChar
[00016cb0] 5c8f                      addq.l     #6,a7
[00016cb2] 4e5e                      unlk       a6
[00016cb4] 4e75                      rts

declnk.WriteLn:
[00016cb6] 4e56 0000                 link       a6,#0
[00016cba] 4879 0001 8f66            pea.l      declnk.decFile
[00016cc0] 1f3c 000d                 move.b     #$0D,-(a7)
[00016cc4] 4eb9 0001 3e48            jsr        NewStreams.WriteChar
[00016cca] 5c8f                      addq.l     #6,a7
[00016ccc] 4e5e                      unlk       a6
[00016cce] 4e75                      rts

decsym.WriteString:
[00016cd0] 4e56 fffe                 link       a6,#-2
[00016cd4] 426e fffe                 clr.w      -2(a6)
[00016cd8] 3a2e fffe                 move.w     -2(a6),d5
[00016cdc] ba6e 000c                 cmp.w      12(a6),d5
[00016ce0] 622e                      bhi.s      $00016D10
[00016ce2] 3a2e fffe                 move.w     -2(a6),d5
[00016ce6] 286e 0008                 movea.l    8(a6),a4
[00016cea] 4a34 5000                 tst.b      0(a4,d5.w)
[00016cee] 6720                      beq.s      $00016D10
[00016cf0] 4879 0001 8f66            pea.l      declnk.decFile
[00016cf6] 3a2e fffe                 move.w     -2(a6),d5
[00016cfa] 286e 0008                 movea.l    8(a6),a4
[00016cfe] 1f34 5000                 move.b     0(a4,d5.w),-(a7)
[00016d02] 4eb9 0001 3e48            jsr        NewStreams.WriteChar
[00016d08] 5c8f                      addq.l     #6,a7
[00016d0a] 526e fffe                 addq.w     #1,-2(a6)
[00016d0e] 60c8                      bra.s      $00016CD8
[00016d10] 4e5e                      unlk       a6
[00016d12] 4e75                      rts

declnk.WriteSpaces:
[00016d14] 4e56 0000                 link       a6,#0
[00016d18] 4a6e 0008                 tst.w      8(a6)
[00016d1c] 6f18                      ble.s      $00016D36
[00016d1e] 4879 0001 8f66            pea.l      declnk.decFile
[00016d24] 1f3c 0020                 move.b     #$20,-(a7)
[00016d28] 4eb9 0001 3e48            jsr        NewStreams.WriteChar
[00016d2e] 5c8f                      addq.l     #6,a7
[00016d30] 536e 0008                 subq.w     #1,8(a6)
[00016d34] 60e2                      bra.s      $00016D18
[00016d36] 4e5e                      unlk       a6
[00016d38] 4e75                      rts

declnk.WriteHexCard:
[00016d3a] 4e56 ffec                 link       a6,#-20
[00016d3e] 3f2e 000a                 move.w     10(a6),-(a7)
[00016d42] 3f2e 0008                 move.w     8(a6),-(a7)
[00016d46] 3f3c 0013                 move.w     #$0013,-(a7)
[00016d4a] 486e ffec                 pea.l      -20(a6)
[00016d4e] 4eb9 0001 416e            jsr        StrUtil.FormatHexCard
[00016d54] 4fef 000a                 lea.l      10(a7),a7
[00016d58] 3f3c 0013                 move.w     #$0013,-(a7)
[00016d5c] 486e ffec                 pea.l      -20(a6)
[00016d60] 6100 ff6e                 bsr        declnk.WriteString
[00016d64] 5c8f                      addq.l     #6,a7
[00016d66] 4e5e                      unlk       a6
[00016d68] 4e75                      rts

declnk.WriteHexZeroCard:
[00016d6a] 4e56 fff8                 link       a6,#-8
[00016d6e] 3f2e 0008                 move.w     8(a6),-(a7)
[00016d72] 3f3c 0005                 move.w     #$0005,-(a7)
[00016d76] 3f3c 0004                 move.w     #$0004,-(a7)
[00016d7a] 486e fffa                 pea.l      -6(a6)
[00016d7e] 4eb9 0001 416e            jsr        StrUtil.FormatHexCard
[00016d84] 4fef 000a                 lea.l      10(a7),a7
[00016d88] 422e fffe                 clr.b      -2(a6)
[00016d8c] 426e fff8                 clr.w      -8(a6)
[00016d90] 3a2e fff8                 move.w     -8(a6),d5
[00016d94] 49ee fffa                 lea.l      -6(a6),a4
[00016d98] 0c34 0020 5000            cmpi.b     #$20,0(a4,d5.w)
[00016d9e] 660e                      bne.s      $00016DAE
[00016da0] 3a2e fff8                 move.w     -8(a6),d5
[00016da4] 49ee fffa                 lea.l      -6(a6),a4
[00016da8] 19bc 0030 5000            move.b     #$30,0(a4,d5.w)
[00016dae] 526e fff8                 addq.w     #1,-8(a6)
[00016db2] 0c6e 0004 fff8            cmpi.w     #$0004,-8(a6)
[00016db8] 66d6                      bne.s      $00016D90
[00016dba] 3f3c 0004                 move.w     #$0004,-(a7)
[00016dbe] 486e fffa                 pea.l      -6(a6)
[00016dc2] 6100 ff0c                 bsr        declnk.WriteString
[00016dc6] 5c8f                      addq.l     #6,a7
[00016dc8] 4e5e                      unlk       a6
[00016dca] 4e75                      rts

declnk.WriteCard:
[00016dcc] 4e56 fff6                 link       a6,#-10
[00016dd0] 3f2e 000a                 move.w     10(a6),-(a7)
[00016dd4] 3f2e 0008                 move.w     8(a6),-(a7)
[00016dd8] 3f3c 0009                 move.w     #$0009,-(a7)
[00016ddc] 486e fff6                 pea.l      -10(a6)
[00016de0] 4eb9 0001 4130            jsr        StrUtil.FormatCard
[00016de6] 4fef 000a                 lea.l      10(a7),a7
[00016dea] 3f3c 0009                 move.w     #$0009,-(a7)
[00016dee] 486e fff6                 pea.l      -10(a6)
[00016df2] 6100 fedc                 bsr        declnk.WriteString
[00016df6] 5c8f                      addq.l     #6,a7
[00016df8] 4e5e                      unlk       a6
[00016dfa] 4e75                      rts

declnk.WriteLong:
[00016dfc] 4e56 fff6                 link       a6,#-10
[00016e00] 2f2e 000a                 move.l     10(a6),-(a7)
[00016e04] 3f2e 0008                 move.w     8(a6),-(a7)
[00016e08] 3f3c 0009                 move.w     #$0009,-(a7)
[00016e0c] 486e fff6                 pea.l      -10(a6)
[00016e10] 4eb9 0001 41ac            jsr        StrUtil.FormatLong
[00016e16] 4fef 000c                 lea.l      12(a7),a7
[00016e1a] 3f3c 0009                 move.w     #$0009,-(a7)
[00016e1e] 486e fff6                 pea.l      -10(a6)
[00016e22] 6100 feac                 bsr        declnk.WriteString
[00016e26] 5c8f                      addq.l     #6,a7
[00016e28] 4e5e                      unlk       a6
[00016e2a] 4e75                      rts

resetCrc:
[00016e2c] 4e56 0000                 link       a6,#0
[00016e30] 4279 0001 8f5e            clr.w      declnk.crc
[00016e36] 4e5e                      unlk       a6
[00016e38] 4e75                      rts

declnk.WriteRange:
[00016e3a] 4e56 0000                 link       a6,#0
[00016e3e] 3f2e 000a                 move.w     10(a6),-(a7)
[00016e42] 3f3c 0007                 move.w     #$0007,-(a7)
[00016e46] 6100 fef2                 bsr        declnk.WriteHexCard
[00016e4a] 588f                      addq.l     #4,a7
[00016e4c] 4a6e 0008                 tst.w      8(a6)
[00016e50] 6718                      beq.s      $00016E6A
[00016e52] 3a2e 0008                 move.w     8(a6),d5
[00016e56] da6e 000a                 add.w      10(a6),d5
[00016e5a] 3f05                      move.w     d5,-(a7)
[00016e5c] 3f3c 0008                 move.w     #$0008,-(a7)
[00016e60] 6100 fed8                 bsr        declnk.WriteHexCard
[00016e64] 588f                      addq.l     #4,a7
[00016e66] 4efa 000c                 jmp        $00016E74(pc)
[00016e6a] 3f3c 0008                 move.w     #$0008,-(a7)
[00016e6e] 6100 fea4                 bsr        declnk.WriteSpaces
[00016e72] 548f                      addq.l     #2,a7
[00016e74] 4e5e                      unlk       a6
[00016e76] 4e75                      rts

declnk.WriteData:
[00016e78] 4e56 fffc                 link       a6,#-4
[00016e7c] 7a05                      moveq.l    #5,d5
[00016e7e] 9a6e 0008                 sub.w      8(a6),d5
[00016e82] 3d45 fffc                 move.w     d5,-4(a6)
[00016e86] 426e fffe                 clr.w      -2(a6)
[00016e8a] 4a6e 0008                 tst.w      8(a6)
[00016e8e] 6728                      beq.s      $00016EB8
[00016e90] 3a2e fffe                 move.w     -2(a6),d5
[00016e94] da45                      add.w      d5,d5
[00016e96] 286e 000a                 movea.l    10(a6),a4
[00016e9a] 3f34 5000                 move.w     0(a4,d5.w),-(a7)
[00016e9e] 6100 feca                 bsr        declnk.WriteHexZeroCard
[00016ea2] 548f                      addq.l     #2,a7
[00016ea4] 1f3c 0020                 move.b     #$20,-(a7)
[00016ea8] 6100 fdf2                 bsr        declnk.Write
[00016eac] 548f                      addq.l     #2,a7
[00016eae] 526e fffe                 addq.w     #1,-2(a6)
[00016eb2] 536e 0008                 subq.w     #1,8(a6)
[00016eb6] 60d2                      bra.s      $00016E8A
[00016eb8] 4a6e fffc                 tst.w      -4(a6)
[00016ebc] 6710                      beq.s      $00016ECE
[00016ebe] 3f3c 0005                 move.w     #$0005,-(a7)
[00016ec2] 6100 fe50                 bsr        declnk.WriteSpaces
[00016ec6] 548f                      addq.l     #2,a7
[00016ec8] 536e fffc                 subq.w     #1,-4(a6)
[00016ecc] 60ea                      bra.s      $00016EB8
[00016ece] 4e5e                      unlk       a6
[00016ed0] 4e75                      rts

declnk.DecodeData:
[00016ed2] 4e56 fff8                 link       a6,#-8
[00016ed6] 6100 fdde                 bsr        declnk.WriteLn
[00016eda] 3f3c 0016                 move.w     #$0016,-(a7)
[00016ede] 4879 0001 7a00            pea.l      $00017A00 'NO DECODE -------- DATA'
[00016ee4] 6100 fdea                 bsr        declnk.WriteString
[00016ee8] 5c8f                      addq.l     #6,a7
[00016eea] 6100 fdca                 bsr        declnk.WriteLn
[00016eee] 42ae fff8                 clr.l      -8(a6)
[00016ef2] 3d7c 0005 fffe            move.w     #$0005,-2(a6)
[00016ef8] 2a2e fff8                 move.l     -8(a6),d5
[00016efc] baae 0008                 cmp.l      8(a6),d5
[00016f00] 6452                      bcc.s      $00016F54
[00016f02] 0c6e 0005 fffe            cmpi.w     #$0005,-2(a6)
[00016f08] 6622                      bne.s      $00016F2C
[00016f0a] 426e fffe                 clr.w      -2(a6)
[00016f0e] 6100 fda6                 bsr        declnk.WriteLn
[00016f12] 2a2e fff8                 move.l     -8(a6),d5
[00016f16] 3f05                      move.w     d5,-(a7)
[00016f18] 3f2e 000c                 move.w     12(a6),-(a7)
[00016f1c] 6100 ff1c                 bsr        declnk.WriteRange
[00016f20] 588f                      addq.l     #4,a7
[00016f22] 1f3c 0020                 move.b     #$20,-(a7)
[00016f26] 6100 fd74                 bsr        declnk.Write
[00016f2a] 548f                      addq.l     #2,a7
[00016f2c] 486e fffc                 pea.l      -4(a6)
[00016f30] 6100 fd42                 bsr        declnk.Read16Bit
[00016f34] 588f                      addq.l     #4,a7
[00016f36] 3f2e fffc                 move.w     -4(a6),-(a7)
[00016f3a] 6100 fe2e                 bsr        declnk.WriteHexZeroCard
[00016f3e] 548f                      addq.l     #2,a7
[00016f40] 3f3c 0005                 move.w     #$0005,-(a7)
[00016f44] 6100 fdce                 bsr        declnk.WriteSpaces
[00016f48] 548f                      addq.l     #2,a7
[00016f4a] 54ae fff8                 addq.l     #2,-8(a6)
[00016f4e] 526e fffe                 addq.w     #1,-2(a6)
[00016f52] 60a4                      bra.s      $00016EF8
[00016f54] 4e5e                      unlk       a6
[00016f56] 4e75                      rts

[00016f58] 4e56 ff90                 link       a6,#-112
[00016f5c] 426e fff8                 clr.w      -8(a6)
[00016f60] 6100 fd54                 bsr        declnk.WriteLn
[00016f64] 3f3c 0032                 move.w     #$0032,-(a7)
[00016f68] 4879 0001 7a18            pea.l      ' DECODE --------                        INSTRUCTION'
[00016f6e] 6100 fd60                 bsr        declnk.WriteString
[00016f72] 5c8f                      addq.l     #6,a7
[00016f74] 6100 fd40                 bsr        declnk.WriteLn
[00016f78] 3a2e 000c                 move.w     12(a6),d5
[00016f7c] 0205 0001                 andi.b     #$01,d5
[00016f80] 4a05                      tst.b      d5
[00016f82] 6616                      bne.s      $00016F9A
[00016f84] 3a2e 0008                 move.w     8(a6),d5
[00016f88] 0205 0001                 andi.b     #$01,d5
[00016f8c] 4a05                      tst.b      d5
[00016f8e] 660a                      bne.s      $00016F9A
[00016f90] 3a2e 000c                 move.w     12(a6),d5
[00016f94] ba6e 0008                 cmp.w      8(a6),d5
[00016f98] 6328                      bls.s      $00016FC2
[00016f9a] 3f3c 0016                 move.w     #$0016,-(a7)
[00016f9e] 4879 0001 7a4c            pea.l      $00017A4C 'Decode parameter error.'
[00016fa4] 6100 fbd2                 bsr        ParameterError
[00016fa8] 5c8f                      addq.l     #6,a7
[00016faa] 6100 fd0a                 bsr        declnk.WriteLn
[00016fae] 3f3c 0016                 move.w     #$0016,-(a7)
[00016fb2] 4879 0001 7a4c            pea.l      $00017A4C
[00016fb8] 6100 fd16                 bsr        declnk.WriteString
[00016fbc] 5c8f                      addq.l     #6,a7
[00016fbe] 4efa 0168                 jmp        $00017128(pc)
[00016fc2] 3a2e fff8                 move.w     -8(a6),d5
[00016fc6] ba6e 000c                 cmp.w      12(a6),d5
[00016fca] 643a                      bcc.s      $00017006
[00016fcc] 3f2e fff8                 move.w     -8(a6),-(a7)
[00016fd0] 3f2e 000a                 move.w     10(a6),-(a7)
[00016fd4] 6100 fe64                 bsr        declnk.WriteRange
[00016fd8] 588f                      addq.l     #4,a7
[00016fda] 3f3c 0005                 move.w     #$0005,-(a7)
[00016fde] 6100 fd34                 bsr        declnk.WriteSpaces
[00016fe2] 548f                      addq.l     #2,a7
[00016fe4] 486e fff6                 pea.l      -10(a6)
[00016fe8] 6100 fc8a                 bsr        declnk.Read16Bit
[00016fec] 588f                      addq.l     #4,a7
[00016fee] 3f2e fff6                 move.w     -10(a6),-(a7)
[00016ff2] 3f3c 000a                 move.w     #$000A,-(a7)
[00016ff6] 6100 fd42                 bsr        declnk.WriteHexCard
[00016ffa] 588f                      addq.l     #4,a7
[00016ffc] 6100 fcb8                 bsr        declnk.WriteLn
[00017000] 546e fff8                 addq.w     #2,-8(a6)
[00017004] 60bc                      bra.s      $00016FC2
[00017006] 426e fffa                 clr.w      -6(a6)
[0001700a] 3a2e fff8                 move.w     -8(a6),d5
[0001700e] ba6e 0008                 cmp.w      8(a6),d5
[00017012] 6426                      bcc.s      $0001703A
[00017014] 0c6e 0004 fffa            cmpi.w     #$0004,-6(a6)
[0001701a] 621e                      bhi.s      $0001703A
[0001701c] 3a2e fffa                 move.w     -6(a6),d5
[00017020] da45                      add.w      d5,d5
[00017022] 49ee ffec                 lea.l      -20(a6),a4
[00017026] 4874 5000                 pea.l      0(a4,d5.w)
[0001702a] 6100 fc48                 bsr        declnk.Read16Bit
[0001702e] 588f                      addq.l     #4,a7
[00017030] 546e fff8                 addq.w     #2,-8(a6)
[00017034] 526e fffa                 addq.w     #1,-6(a6)
[00017038] 60d0                      bra.s      $0001700A
[0001703a] 7a02                      moveq.l    #2,d5
[0001703c] caee fffa                 mulu.w     -6(a6),d5
[00017040] 382e fff8                 move.w     -8(a6),d4
[00017044] 9845                      sub.w      d5,d4
[00017046] 4844                      swap       d4
[00017048] 4244                      clr.w      d4
[0001704a] 4844                      swap       d4
[0001704c] 2f04                      move.l     d4,-(a7)
[0001704e] 49ee ffec                 lea.l      -20(a6),a4
[00017052] 2a0c                      move.l     a4,d5
[00017054] 2f05                      move.l     d5,-(a7)
[00017056] 486e fffc                 pea.l      -4(a6)
[0001705a] 3f3c 005a                 move.w     #$005A,-(a7)
[0001705e] 486e ff90                 pea.l      -112(a6)
[00017062] 4eb9 0001 5dda            jsr        disasm.disasm
[00017068] 4fef 0012                 lea.l      18(a7),a7
[0001706c] 7a02                      moveq.l    #2,d5
[0001706e] caee fffa                 mulu.w     -6(a6),d5
[00017072] 382e fff8                 move.w     -8(a6),d4
[00017076] 9845                      sub.w      d5,d4
[00017078] 3f04                      move.w     d4,-(a7)
[0001707a] 3f2e 000a                 move.w     10(a6),-(a7)
[0001707e] 6100 fdba                 bsr        declnk.WriteRange
[00017082] 588f                      addq.l     #4,a7
[00017084] 3f3c 0004                 move.w     #$0004,-(a7)
[00017088] 486e ffec                 pea.l      -20(a6)
[0001708c] 3f2e fffc                 move.w     -4(a6),-(a7)
[00017090] 6100 fde6                 bsr        declnk.WriteData
[00017094] 508f                      addq.l     #8,a7
[00017096] 3f3c 005a                 move.w     #$005A,-(a7)
[0001709a] 486e ff90                 pea.l      -112(a6)
[0001709e] 6100 fc30                 bsr        declnk.WriteString
[000170a2] 5c8f                      addq.l     #6,a7
[000170a4] 6100 fc10                 bsr        declnk.WriteLn
[000170a8] 3a2e fffc                 move.w     -4(a6),d5
[000170ac] ba6e fffa                 cmp.w      -6(a6),d5
[000170b0] 6456                      bcc.s      $00017108
[000170b2] 0c6e 0005 fffc            cmpi.w     #$0005,-4(a6)
[000170b8] 644e                      bcc.s      $00017108
[000170ba] 4a6e fffa                 tst.w      -6(a6)
[000170be] 6348                      bls.s      $00017108
[000170c0] 3d6e fffc fffe            move.w     -4(a6),-2(a6)
[000170c6] 3a2e fffa                 move.w     -6(a6),d5
[000170ca] 5345                      subq.w     #1,d5
[000170cc] 3f05                      move.w     d5,-(a7)
[000170ce] 302e fffe                 move.w     -2(a6),d0
[000170d2] b057                      cmp.w      (a7),d0
[000170d4] 6304                      bls.s      $000170DA
[000170d6] 4efa 002e                 jmp        $00017106(pc)
[000170da] 3a2e fffe                 move.w     -2(a6),d5
[000170de] da45                      add.w      d5,d5
[000170e0] 49ee ffec                 lea.l      -20(a6),a4
[000170e4] 382e fffe                 move.w     -2(a6),d4
[000170e8] 986e fffc                 sub.w      -4(a6),d4
[000170ec] d844                      add.w      d4,d4
[000170ee] 47ee ffec                 lea.l      -20(a6),a3
[000170f2] 37b4 5000 4000            move.w     0(a4,d5.w),0(a3,d4.w)
[000170f8] 302e fffe                 move.w     -2(a6),d0
[000170fc] b057                      cmp.w      (a7),d0
[000170fe] 6406                      bcc.s      $00017106
[00017100] 526e fffe                 addq.w     #1,-2(a6)
[00017104] 60d4                      bra.s      $000170DA
[00017106] 548f                      addq.l     #2,a7
[00017108] 3a2e fffa                 move.w     -6(a6),d5
[0001710c] 9a6e fffc                 sub.w      -4(a6),d5
[00017110] 3d45 fffa                 move.w     d5,-6(a6)
[00017114] 3a2e fff8                 move.w     -8(a6),d5
[00017118] ba6e 0008                 cmp.w      8(a6),d5
[0001711c] 6506                      bcs.s      $00017124
[0001711e] 4a6e fffa                 tst.w      -6(a6)
[00017122] 6304                      bls.s      $00017128
[00017124] 6000 fee4                 bra        $0001700A
[00017128] 4e5e                      unlk       a6
[0001712a] 4e75                      rts

[0001712c] 4e56 0000                 link       a6,#0
[00017130] 7a00                      moveq.l    #0,d5
[00017132] 1a2e 0008                 move.b     8(a6),d5
[00017136] 2005                      move.l     d5,d0
[00017138] 4eb9 0001 000a            jsr        CASEX
[0001713e] 0000 0000
[00017142] 0000 0023
[00017146] 0000 02b8
[0001714a] 3f3c 000b                 move.w     #$000B,-(a7)
[0001714e] 4879 0001 7a64            pea.l      $00017A64 'scmod header'
[00017154] 6100 fb7a                 bsr        declnk.WriteString
[00017158] 5c8f                      addq.l     #6,a7
[0001715a] 4efa 02f2                 jmp        $0001744E(pc)
[0001715e] 3f3c 0005                 move.w     #$0005,-(a7)
[00017162] 4879 0001 7a72            pea.l      $00017A72 'import'
[00017168] 6100 fb66                 bsr        declnk.WriteString
[0001716c] 5c8f                      addq.l     #6,a7
[0001716e] 4efa 02de                 jmp        $0001744E(pc)
[00017172] 3f3c 0008                 move.w     #$0008,-(a7)
[00017176] 4879 0001 7a7a            pea.l      $00017A7A 'data size'
[0001717c] 6100 fb52                 bsr        declnk.WriteString
[00017180] 5c8f                      addq.l     #6,a7
[00017182] 4efa 02ca                 jmp        $0001744E(pc)
[00017186] 3f3c 000a                 move.w     #$000A,-(a7)
[0001718a] 4879 0001 7a84            pea.l      $00017A84 'filled data'
[00017190] 6100 fb3e                 bsr        declnk.WriteString
[00017194] 5c8f                      addq.l     #6,a7
[00017196] 4efa 02b6                 jmp        $0001744E(pc)
[0001719a] 3f3c 0008                 move.w     #$0008,-(a7)
[0001719e] 4879 0001 7a90            pea.l      $00017A90 'proc code'
[000171a4] 6100 fb2a                 bsr        declnk.WriteString
[000171a8] 5c8f                      addq.l     #6,a7
[000171aa] 4efa 02a2                 jmp        $0001744E(pc)
[000171ae] 3f3c 0008                 move.w     #$0008,-(a7)
[000171b2] 4879 0001 7a9a            pea.l      $00017A9A 'init code'
[000171b8] 6100 fb16                 bsr        declnk.WriteString
[000171bc] 5c8f                      addq.l     #6,a7
[000171be] 4efa 028e                 jmp        $0001744E(pc)
[000171c2] 3f3c 000e                 move.w     #$000E,-(a7)
[000171c6] 4879 0001 7aa4            pea.l      $00017AA4 'scmod init code'
[000171cc] 6100 fb02                 bsr        declnk.WriteString
[000171d0] 5c8f                      addq.l     #6,a7
[000171d2] 4efa 027a                 jmp        $0001744E(pc)
[000171d6] 3f3c 0008                 move.w     #$0008,-(a7)
[000171da] 4879 0001 7ab4            pea.l      $00017AB4 'excp code'
[000171e0] 6100 faee                 bsr        declnk.WriteString
[000171e4] 5c8f                      addq.l     #6,a7
[000171e6] 4efa 0266                 jmp        $0001744E(pc)
[000171ea] 3f3c 000b                 move.w     #$000B,-(a7)
[000171ee] 4879 0001 7abe            pea.l      $00017ABE 'ref own data'
[000171f4] 6100 fada                 bsr        declnk.WriteString
[000171f8] 5c8f                      addq.l     #6,a7
[000171fa] 4efa 0252                 jmp        $0001744E(pc)
[000171fe] 3f3c 000b                 move.w     #$000B,-(a7)
[00017202] 4879 0001 7acc            pea.l      $00017ACC 'ref ext data'
[00017208] 6100 fac6                 bsr        declnk.WriteString
[0001720c] 5c8f                      addq.l     #6,a7
[0001720e] 4efa 023e                 jmp        $0001744E(pc)
[00017212] 3f3c 000b                 move.w     #$000B,-(a7)
[00017216] 4879 0001 7ada            pea.l      $00017ADA 'ref own code'
[0001721c] 6100 fab2                 bsr        declnk.WriteString
[00017220] 5c8f                      addq.l     #6,a7
[00017222] 4efa 022a                 jmp        $0001744E(pc)
[00017226] 3f3c 0010                 move.w     #$0010,-(a7)
[0001722a] 4879 0001 7ae8            pea.l      $00017AE8 'ref own proc call'
[00017230] 6100 fa9e                 bsr        declnk.WriteString
[00017234] 5c8f                      addq.l     #6,a7
[00017236] 4efa 0216                 jmp        $0001744E(pc)
[0001723a] 3f3c 0010                 move.w     #$0010,-(a7)
[0001723e] 4879 0001 7afa            pea.l      $00017AFA 'ref ext proc call'
[00017244] 6100 fa8a                 bsr        declnk.WriteString
[00017248] 5c8f                      addq.l     #6,a7
[0001724a] 4efa 0202                 jmp        $0001744E(pc)
[0001724e] 3f3c 000f                 move.w     #$000F,-(a7)
[00017252] 4879 0001 7b0c            pea.l      $00017B0C 'ref own proc ass'
[00017258] 6100 fa76                 bsr        declnk.WriteString
[0001725c] 5c8f                      addq.l     #6,a7
[0001725e] 4efa 01ee                 jmp        $0001744E(pc)
[00017262] 3f3c 000f                 move.w     #$000F,-(a7)
[00017266] 4879 0001 7b1e            pea.l      $00017B1E 'ref ext proc ass'
[0001726c] 6100 fa62                 bsr        declnk.WriteString
[00017270] 5c8f                      addq.l     #6,a7
[00017272] 4efa 01da                 jmp        $0001744E(pc)
[00017276] 3f3c 000b                 move.w     #$000B,-(a7)
[0001727a] 4879 0001 7b30            pea.l      $00017B30 'ref own excp'
[00017280] 6100 fa4e                 bsr        declnk.WriteString
[00017284] 5c8f                      addq.l     #6,a7
[00017286] 4efa 01c6                 jmp        $0001744E(pc)
[0001728a] 3f3c 000b                 move.w     #$000B,-(a7)
[0001728e] 4879 0001 7b3e            pea.l      $00017B3E 'ref ext excp'
[00017294] 6100 fa3a                 bsr        declnk.WriteString
[00017298] 5c8f                      addq.l     #6,a7
[0001729a] 4efa 01b2                 jmp        $0001744E(pc)
[0001729e] 3f3c 0010                 move.w     #$0010,-(a7)
[000172a2] 4879 0001 7b4c            pea.l      $00017B4C 'ref ext init call'
[000172a8] 6100 fa26                 bsr        declnk.WriteString
[000172ac] 5c8f                      addq.l     #6,a7
[000172ae] 4efa 019e                 jmp        $0001744E(pc)
[000172b2] 3f3c 0008                 move.w     #$0008,-(a7)
[000172b6] 4879 0001 7b5e            pea.l      $00017B5E 'scmod end'
[000172bc] 6100 fa12                 bsr        declnk.WriteString
[000172c0] 5c8f                      addq.l     #6,a7
[000172c2] 4efa 018a                 jmp        $0001744E(pc)
[000172c6] 3f3c 0011                 move.w     #$0011,-(a7)
[000172ca] 4879 0001 7b68            pea.l      $00017B68 'link code version:'
[000172d0] 6100 f9fe                 bsr        declnk.WriteString
[000172d4] 5c8f                      addq.l     #6,a7
[000172d6] 4efa 0176                 jmp        $0001744E(pc)
[000172da] 3f3c 0011                 move.w     #$0011,-(a7)
[000172de] 4879 0001 7b7c            pea.l      $00017B7C 'ref any proc call:'
[000172e4] 6100 f9ea                 bsr        declnk.WriteString
[000172e8] 5c8f                      addq.l     #6,a7
[000172ea] 4efa 0162                 jmp        $0001744E(pc)
[000172ee] 3f3c 0010                 move.w     #$0010,-(a7)
[000172f2] 4879 0001 7b90            pea.l      $00017B90 'ref any proc ass:'
[000172f8] 6100 f9d6                 bsr        declnk.WriteString
[000172fc] 5c8f                      addq.l     #6,a7
[000172fe] 4efa 014e                 jmp        $0001744E(pc)
[00017302] 3f3c 000b                 move.w     #$000B,-(a7)
[00017306] 4879 0001 7ba2            pea.l      $00017BA2 'string data:'
[0001730c] 6100 f9c2                 bsr        declnk.WriteString
[00017310] 5c8f                      addq.l     #6,a7
[00017312] 4efa 013a                 jmp        $0001744E(pc)
[00017316] 3f3c 000a                 move.w     #$000A,-(a7)
[0001731a] 4879 0001 7bb0            pea.l      $00017BB0 'bound data:'
[00017320] 6100 f9ae                 bsr        declnk.WriteString
[00017324] 5c8f                      addq.l     #6,a7
[00017326] 4efa 0126                 jmp        $0001744E(pc)
[0001732a] 3f3c 000e                 move.w     #$000E,-(a7)
[0001732e] 4879 0001 7bbc            pea.l      $00017BBC 'ref own string:'
[00017334] 6100 f99a                 bsr        declnk.WriteString
[00017338] 5c8f                      addq.l     #6,a7
[0001733a] 4efa 0112                 jmp        $0001744E(pc)
[0001733e] 3f3c 000d                 move.w     #$000D,-(a7)
[00017342] 4879 0001 7bcc            pea.l      $00017BCC 'ref own bound:'
[00017348] 6100 f986                 bsr        declnk.WriteString
[0001734c] 5c8f                      addq.l     #6,a7
[0001734e] 4efa 00fe                 jmp        $0001744E(pc)
[00017352] 3f3c 0008                 move.w     #$0008,-(a7)
[00017356] 4879 0001 7bdc            pea.l      $00017BDC 'ref util:'
[0001735c] 6100 f972                 bsr        declnk.WriteString
[00017360] 5c8f                      addq.l     #6,a7
[00017362] 4efa 00ea                 jmp        $0001744E(pc)
[00017366] 3f3c 0009                 move.w     #$0009,-(a7)
[0001736a] 4879 0001 7be6            pea.l      $00017BE6 'load util:'
[00017370] 6100 f95e                 bsr        declnk.WriteString
[00017374] 5c8f                      addq.l     #6,a7
[00017376] 4efa 00d6                 jmp        $0001744E(pc)
[0001737a] 3f3c 000e                 move.w     #$000E,-(a7)
[0001737e] 4879 0001 7bf2            pea.l      $00017BF2 'def abs symbol:'
[00017384] 6100 f94a                 bsr        declnk.WriteString
[00017388] 5c8f                      addq.l     #6,a7
[0001738a] 4efa 00c2                 jmp        $0001744E(pc)
[0001738e] 3f3c 000e                 move.w     #$000E,-(a7)
[00017392] 4879 0001 7c02            pea.l      $00017C02 'ref abs symbol:'
[00017398] 6100 f936                 bsr        declnk.WriteString
[0001739c] 5c8f                      addq.l     #6,a7
[0001739e] 4efa 00ae                 jmp        $0001744E(pc)
[000173a2] 3f3c 0011                 move.w     #$0011,-(a7)
[000173a6] 4879 0001 7c12            pea.l      $00017C12 'ref own quick call'
[000173ac] 6100 f922                 bsr        declnk.WriteString
[000173b0] 5c8f                      addq.l     #6,a7
[000173b2] 4efa 009a                 jmp        $0001744E(pc)
[000173b6] 3f3c 0011                 move.w     #$0011,-(a7)
[000173ba] 4879 0001 7c26            pea.l      $00017C26 'ref ext quick call'
[000173c0] 6100 f90e                 bsr        declnk.WriteString
[000173c4] 5c8f                      addq.l     #6,a7
[000173c6] 4efa 0086                 jmp        $0001744E(pc)
[000173ca] 3f3c 0010                 move.w     #$0010,-(a7)
[000173ce] 4879 0001 7c3a            pea.l      $00017C3A 'ref own quick ass'
[000173d4] 6100 f8fa                 bsr        declnk.WriteString
[000173d8] 5c8f                      addq.l     #6,a7
[000173da] 4efa 0072                 jmp        $0001744E(pc)
[000173de] 3f3c 0010                 move.w     #$0010,-(a7)
[000173e2] 4879 0001 7c4c            pea.l      $00017C4C 'ref ext quick ass'
[000173e8] 6100 f8e6                 bsr        declnk.WriteString
[000173ec] 5c8f                      addq.l     #6,a7
[000173ee] 4efa 005e                 jmp        $0001744E(pc)
[000173f2] 4efa 004a                 jmp        $0001743E(pc)
[000173f6] 000c
           0020
[000173fa] 0034
           0048
           005c
[00017400] 0070
           0084
           0098
[00017406] 00ac
           00c0
           00d4
           00e8
[0001740e] 00fc
           0110
           0124
[00017414] 0138
           014c
[00017418] 0160
[0001741a] 0174
           0188
[0001741e] 019c
[00017420] 01b0
           01c4
[00017424] 01d8
[00017426] 01ec
           0200
[0001742a] 0214
           0228
[0001742e] 023c
           0250
[00017432] 02b4
           02b4
           0264
           028c
[0001743a] 0278
           02a0
[0001743e] 3f3c                      move.w     #$0015,-(a7)
[00017440] 4879 0001 7c5e            pea.l      $00017C5E '--- unknown Symbol ---'
[00017448] 6100 f886                 bsr        declnk.WriteString
[0001744c] 5c8f                      addq.l     #6,a7
[0001744e] 4e5e                      unlk       a6
[00017450] 4e75                      rts

[00017452] 4e56 fffe                 link       a6,#-2
[00017456] 1f3c 0013                 move.b     #$13,-(a7)
[0001745a] 6100 fcd0                 bsr        $0001712C
[0001745e] 548f                      addq.l     #2,a7
[00017460] 486e fffe                 pea.l      -2(a6)
[00017464] 6100 f80e                 bsr        declnk.Read16Bit
[00017468] 588f                      addq.l     #4,a7
[0001746a] 1f3c 0020                 move.b     #$20,-(a7)
[0001746e] 6100 f82c                 bsr        declnk.Write
[00017472] 548f                      addq.l     #2,a7
[00017474] 3a2e fffe                 move.w     -2(a6),d5
[00017478] e04d                      lsr.w      #8,d5
[0001747a] 3f05                      move.w     d5,-(a7)
[0001747c] 3f3c 0003                 move.w     #$0003,-(a7)
[00017480] 6100 f8b8                 bsr        declnk.WriteHexCard
[00017484] 588f                      addq.l     #4,a7
[00017486] 1f3c 0020                 move.b     #$20,-(a7)
[0001748a] 6100 f810                 bsr        declnk.Write
[0001748e] 548f                      addq.l     #2,a7
[00017490] 3a2e fffe                 move.w     -2(a6),d5
[00017494] 0245 00ff                 andi.w     #$00FF,d5
[00017498] 3f05                      move.w     d5,-(a7)
[0001749a] 3f3c 0003                 move.w     #$0003,-(a7)
[0001749e] 6100 f89a                 bsr        declnk.WriteHexCard
[000174a2] 588f                      addq.l     #4,a7
[000174a4] 6100 f810                 bsr        declnk.WriteLn
[000174a8] 4e5e                      unlk       a6
[000174aa] 4e75                      rts

[000174ac] 4e56 ffe6                 link       a6,#-26
[000174b0] 1f3c 0020                 move.b     #$20,-(a7)
[000174b4] 6100 f7e6                 bsr        declnk.Write
[000174b8] 548f                      addq.l     #2,a7
[000174ba] 426e ffe6                 clr.w      -26(a6)
[000174be] 3a2e ffe6                 move.w     -26(a6),d5
[000174c2] da45                      add.w      d5,d5
[000174c4] 49ee ffe8                 lea.l      -24(a6),a4
[000174c8] 4874 5000                 pea.l      0(a4,d5.w)
[000174cc] 6100 f7a6                 bsr        declnk.Read16Bit
[000174d0] 588f                      addq.l     #4,a7
[000174d2] 526e ffe6                 addq.w     #1,-26(a6)
[000174d6] 0c6e 000c ffe6            cmpi.w     #$000C,-26(a6)
[000174dc] 66e0                      bne.s      $000174BE
[000174de] 3f3c 0017                 move.w     #$0017,-(a7)
[000174e2] 486e ffe8                 pea.l      -24(a6)
[000174e6] 6100 f7e8                 bsr        declnk.WriteString
[000174ea] 5c8f                      addq.l     #6,a7
[000174ec] 4e5e                      unlk       a6
[000174ee] 4e75                      rts

[000174f0] 4e56 fffe                 link       a6,#-2
[000174f4] 486e fffe                 pea.l      -2(a6)
[000174f8] 6100 f77a                 bsr        declnk.Read16Bit
[000174fc] 588f                      addq.l     #4,a7
[000174fe] 3f2e fffe                 move.w     -2(a6),-(a7)
[00017502] 3f3c 0007                 move.w     #$0007,-(a7)
[00017506] 6100 f832                 bsr        declnk.WriteHexCard
[0001750a] 588f                      addq.l     #4,a7
[0001750c] 4e5e                      unlk       a6
[0001750e] 4e75                      rts

[00017510] 4e56 0000                 link       a6,#0
[00017514] 3f3c 0006                 move.w     #$0006,-(a7)
[00017518] 4879 0001 7c76            pea.l      $00017C76 ', key ='
[0001751e] 6100 f7b0                 bsr        declnk.WriteString
[00017522] 5c8f                      addq.l     #6,a7
[00017524] 6100 ffca                 bsr.w      $000174F0
[00017528] 6100 ffc6                 bsr.w      $000174F0
[0001752c] 6100 ffc2                 bsr.w      $000174F0
[00017530] 4e5e                      unlk       a6
[00017532] 4e75                      rts

[00017534] 4e56 fffe                 link       a6,#-2
[00017538] 486e fffe                 pea.l      -2(a6)
[0001753c] 6100 f736                 bsr        declnk.Read16Bit
[00017540] 588f                      addq.l     #4,a7
[00017542] 3f3c 000a                 move.w     #$000A,-(a7)
[00017546] 4879 0001 7c7e            pea.l      $00017C7E ', modnum = '
[0001754c] 6100 f782                 bsr        declnk.WriteString
[00017550] 5c8f                      addq.l     #6,a7
[00017552] 3f2e fffe                 move.w     -2(a6),-(a7)
[00017556] 3f3c 0002                 move.w     #$0002,-(a7)
[0001755a] 6100 f870                 bsr        declnk.WriteCard
[0001755e] 588f                      addq.l     #4,a7
[00017560] 4e5e                      unlk       a6
[00017562] 4e75                      rts

[00017564] 4e56 fffe                 link       a6,#-2
[00017568] 486e fffe                 pea.l      -2(a6)
[0001756c] 6100 f706                 bsr        declnk.Read16Bit
[00017570] 588f                      addq.l     #4,a7
[00017572] 3f3c 0013                 move.w     #$0013,-(a7)
[00017576] 4879 0001 7c8a            pea.l      $00017C8A ', number of bytes = '
[0001757c] 6100 f752                 bsr        declnk.WriteString
[00017580] 5c8f                      addq.l     #6,a7
[00017582] 3f2e fffe                 move.w     -2(a6),-(a7)
[00017586] 3f3c 0001                 move.w     #$0001,-(a7)
[0001758a] 6100 f840                 bsr        declnk.WriteCard
[0001758e] 588f                      addq.l     #4,a7
[00017590] 3d6e fffe 0008            move.w     -2(a6),8(a6)
[00017596] 4e5e                      unlk       a6
[00017598] 4e75                      rts

[0001759a] 4e56 fff8                 link       a6,#-8
[0001759e] 486e fffc                 pea.l      -4(a6)
[000175a2] 6100 f6d0                 bsr        declnk.Read16Bit
[000175a6] 588f                      addq.l     #4,a7
[000175a8] 486e fffe                 pea.l      -2(a6)
[000175ac] 6100 f6c6                 bsr        declnk.Read16Bit
[000175b0] 588f                      addq.l     #4,a7
[000175b2] 7a00                      moveq.l    #0,d5
[000175b4] 3a2e fffc                 move.w     -4(a6),d5
[000175b8] 7010                      moveq.l    #16,d0
[000175ba] e1a5                      asl.l      d0,d5
[000175bc] 7800                      moveq.l    #0,d4
[000175be] 382e fffe                 move.w     -2(a6),d4
[000175c2] da84                      add.l      d4,d5
[000175c4] 2d45 fff8                 move.l     d5,-8(a6)
[000175c8] 3f3c 0013                 move.w     #$0013,-(a7)
[000175cc] 4879 0001 7ca0            pea.l      $00017CA0 ', number of bytes = '
[000175d2] 6100 f6fc                 bsr        declnk.WriteString
[000175d6] 5c8f                      addq.l     #6,a7
[000175d8] 2f2e fff8                 move.l     -8(a6),-(a7)
[000175dc] 3f3c 0001                 move.w     #$0001,-(a7)
[000175e0] 6100 f81a                 bsr        declnk.WriteLong
[000175e4] 5c8f                      addq.l     #6,a7
[000175e6] 2d6e fff8 0008            move.l     -8(a6),8(a6)
[000175ec] 4e5e                      unlk       a6
[000175ee] 4e75                      rts

[000175f0] 4e56 fffe                 link       a6,#-2
[000175f4] 486e fffe                 pea.l      -2(a6)
[000175f8] 6100 f67a                 bsr        declnk.Read16Bit
[000175fc] 588f                      addq.l     #4,a7
[000175fe] 3f3c 000b                 move.w     #$000B,-(a7)
[00017602] 4879 0001 7cb6            pea.l      $00017CB6 ', procnum = '
[00017608] 6100 f6c6                 bsr        declnk.WriteString
[0001760c] 5c8f                      addq.l     #6,a7
[0001760e] 3f2e fffe                 move.w     -2(a6),-(a7)
[00017612] 3f3c 0002                 move.w     #$0002,-(a7)
[00017616] 6100 f7b4                 bsr        declnk.WriteCard
[0001761a] 588f                      addq.l     #4,a7
[0001761c] 4e5e                      unlk       a6
[0001761e] 4e75                      rts

[00017620] 4e56 fffe                 link       a6,#-2
[00017624] 486e fffe                 pea.l      -2(a6)
[00017628] 6100 f64a                 bsr        declnk.Read16Bit
[0001762c] 588f                      addq.l     #4,a7
[0001762e] 3f3c 000d                 move.w     #$000D,-(a7)
[00017632] 4879 0001 7cc4            pea.l      $00017CC4 ', entrypoint ='
[00017638] 6100 f696                 bsr        declnk.WriteString
[0001763c] 5c8f                      addq.l     #6,a7
[0001763e] 3f2e fffe                 move.w     -2(a6),-(a7)
[00017642] 3f3c 0007                 move.w     #$0007,-(a7)
[00017646] 6100 f6f2                 bsr        declnk.WriteHexCard
[0001764a] 588f                      addq.l     #4,a7
[0001764c] 3d6e fffe 0008            move.w     -2(a6),8(a6)
[00017652] 4e5e                      unlk       a6
[00017654] 4e75                      rts

[00017656] 4e56 fffe                 link       a6,#-2
[0001765a] 486e fffe                 pea.l      -2(a6)
[0001765e] 6100 f614                 bsr        declnk.Read16Bit
[00017662] 588f                      addq.l     #4,a7
[00017664] 3f3c 0002                 move.w     #$0002,-(a7)
[00017668] 4879 0001 7cd4            pea.l      $00017CD4 ' at'
[0001766e] 6100 f660                 bsr        declnk.WriteString
[00017672] 5c8f                      addq.l     #6,a7
[00017674] 3f2e fffe                 move.w     -2(a6),-(a7)
[00017678] 3f3c 0007                 move.w     #$0007,-(a7)
[0001767c] 6100 f6bc                 bsr        declnk.WriteHexCard
[00017680] 588f                      addq.l     #4,a7
[00017682] 4e5e                      unlk       a6
[00017684] 4e75                      rts

[00017686] 4e56 fffc                 link       a6,#-4
[0001768a] 3d79 0001 8f5e fffc       move.w     declnk.crc,-4(a6)
[00017692] 486e fffe                 pea.l      -2(a6)
[00017696] 6100 f5dc                 bsr        declnk.Read16Bit
[0001769a] 588f                      addq.l     #4,a7
[0001769c] 33ee fffc 0001 8f5e       move.w     -4(a6),declnk.crc
[000176a4] 3a39 0001 8f5e            move.w     declnk.crc,d5
[000176aa] ba6e fffe                 cmp.w      -2(a6),d5
[000176ae] 663a                      bne.s      $000176EA
[000176b0] 3f3c 000a                 move.w     #$000A,-(a7)
[000176b4] 4879 0001 7cd8            pea.l      $00017CD8 '  checksum:'
[000176ba] 6100 f614                 bsr        declnk.WriteString
[000176be] 5c8f                      addq.l     #6,a7
[000176c0] 4a39 0001 8f61            tst.b      $00018F61
[000176c6] 670e                      beq.s      $000176D6
[000176c8] 3f2e fffe                 move.w     -2(a6),-(a7)
[000176cc] 3f3c 0007                 move.w     #$0007,-(a7)
[000176d0] 6100 f668                 bsr        declnk.WriteHexCard
[000176d4] 588f                      addq.l     #4,a7
[000176d6] 3f3c 0004                 move.w     #$0004,-(a7)
[000176da] 4879 0001 7ce4            pea.l      $00017CE4 ' o.k.'
[000176e0] 6100 f5ee                 bsr        declnk.WriteString
[000176e4] 5c8f                      addq.l     #6,a7
[000176e6] 4efa 0040                 jmp        $00017728(pc)
[000176ea] 3f3c 0016                 move.w     #$0016,-(a7)
[000176ee] 4879 0001 7cea            pea.l      $00017CEA '  ---- checksum error: '
[000176f4] 6100 f5da                 bsr        declnk.WriteString
[000176f8] 5c8f                      addq.l     #6,a7
[000176fa] 3f2e fffe                 move.w     -2(a6),-(a7)
[000176fe] 3f3c 0007                 move.w     #$0007,-(a7)
[00017702] 6100 f636                 bsr        declnk.WriteHexCard
[00017706] 588f                      addq.l     #4,a7
[00017708] 3f3c 000a                 move.w     #$000A,-(a7)
[0001770c] 4879 0001 7d02            pea.l      $00017D02 ' should be '
[00017712] 6100 f5bc                 bsr        declnk.WriteString
[00017716] 5c8f                      addq.l     #6,a7
[00017718] 3f39 0001 8f5e            move.w     declnk.crc,-(a7)
[0001771e] 3f3c 0007                 move.w     #$0007,-(a7)
[00017722] 6100 f616                 bsr        declnk.WriteHexCard
[00017726] 588f                      addq.l     #4,a7
[00017728] 6100 f58c                 bsr        declnk.WriteLn
[0001772c] 4e5e                      unlk       a6
[0001772e] 4e75                      rts

[00017730] 4e56 0000                 link       a6,#0
[00017734] 3a2e 000e                 move.w     14(a6),d5
[00017738] 3f05                      move.w     d5,-(a7)
[0001773a] 286e 000a                 movea.l    10(a6),a4
[0001773e] 4854                      pea.l      (a4)
[00017740] 4eb9 0001 1316            jsr        AppWindow.WriteString
[00017746] 5c8f                      addq.l     #6,a7
[00017748] 4eb9 0001 13e0            jsr        AppWindow.WriteLn
[0001774e] 4e5e                      unlk       a6
[00017750] 4e75                      rts

[00017752] 4e56 fff4                 link       a6,#-12
[00017756] 486e fff8                 pea.l      -8(a6)
[0001775a] 6100 f518                 bsr        declnk.Read16Bit
[0001775e] 588f                      addq.l     #4,a7
[00017760] 7a13                      moveq.l    #19,d5
[00017762] ba6e fff8                 cmp.w      -8(a6),d5
[00017766] 6602                      bne.s      $0001776A
[00017768] 6004                      bra.s      $0001776E
[0001776a] 4efa 01dc                 jmp        $00017948(pc)
[0001776e] 6100 fce2                 bsr        $00017452
[00017772] 6100 ff12                 bsr        $00017686
[00017776] 6100 f53e                 bsr        declnk.WriteLn
[0001777a] 486e fff8                 pea.l      -8(a6)
[0001777e] 6100 f4f4                 bsr        declnk.Read16Bit
[00017782] 588f                      addq.l     #4,a7
[00017784] 7a23                      moveq.l    #35,d5
[00017786] ba6e fff8                 cmp.w      -8(a6),d5
[0001778a] 6502                      bcs.s      $0001778E
[0001778c] 6004                      bra.s      $00017792
[0001778e] 4efa 018e                 jmp        $0001791E(pc)
[00017792] 3a2e fff8                 move.w     -8(a6),d5
[00017796] 1d45 ffff                 move.b     d5,-1(a6)
[0001779a] 1f2e ffff                 move.b     -1(a6),-(a7)
[0001779e] 6100 f98c                 bsr        $0001712C
[000177a2] 548f                      addq.l     #2,a7
[000177a4] 7a00                      moveq.l    #0,d5
[000177a6] 1a2e ffff                 move.b     -1(a6),d5
[000177aa] 2005                      move.l     d5,d0
[000177ac] 4eb9 0001 000a            jsr        CASEX
[000177b2] 0000 0000
[000177b6] 0000 0023
[000177ba] 0000 00fe
case 0:
[000177be] 3f3c 0008                 move.w     #$0008,-(a7)
[000177c2] 4879 0001 7d0e            pea.l      $00017D0E ': MODULE'
[000177c8] 6100 f506                 bsr        declnk.WriteString
[000177cc] 5c8f                      addq.l     #6,a7
[000177ce] 6100 fcdc                 bsr        $000174AC
[000177d2] 6100 fd3c                 bsr        $00017510
[000177d6] 4efa 013e                 jmp        $00017916(pc)
case 1:
[000177da] 6100 fcd0                 bsr        $000174AC
[000177de] 6100 fd30                 bsr        $00017510
[000177e2] 6100 fd50                 bsr        $00017534
[000177e6] 4efa 012e                 jmp        $00017916(pc)
case 2:
[000177ea] 598f                      subq.l     #4,a7
[000177ec] 6100 fdac                 bsr        $0001759A
[000177f0] 2d5f fff4                 move.l     (a7)+,-12(a6)
[000177f4] 4efa 0120                 jmp        $00017916(pc)
case 3:
[000177f8] 3f3c 0013                 move.w     #$0013,-(a7)
[000177fc] 4879 0001 7d18            pea.l      $00017D18 ', rel. start addr. ='
[00017802] 6100 f4cc                 bsr        declnk.WriteString
[00017806] 5c8f                      addq.l     #6,a7
[00017808] 6100 fce6                 bsr        $000174F0
[0001780c] 598f                      subq.l     #4,a7
[0001780e] 6100 fd8a                 bsr        $0001759A
[00017812] 2d5f fff4                 move.l     (a7)+,-12(a6)
[00017816] 4267                      clr.w      -(a7)
[00017818] 2f2e fff4                 move.l     -12(a6),-(a7)
[0001781c] 6100 f6b4                 bsr        declnk.DecodeData
[00017820] 5c8f                      addq.l     #6,a7
[00017822] 4efa 00f2                 jmp        $00017916(pc)
case 22:
case 23:
[00017826] 598f                      subq.l     #4,a7
[00017828] 6100 fd70                 bsr        $0001759A
[0001782c] 2d5f fff4                 move.l     (a7)+,-12(a6)
[00017830] 4267                      clr.w      -(a7)
[00017832] 2f2e fff4                 move.l     -12(a6),-(a7)
[00017836] 6100 f69a                 bsr        declnk.DecodeData
[0001783a] 5c8f                      addq.l     #6,a7
[0001783c] 4efa 00d8                 jmp        $00017916(pc)
case 4, 5, 6:
[00017840] 6100 fdae                 bsr        $000175F0
[00017844] 558f                      subq.l     #2,a7
[00017846] 6100 fdd8                 bsr        $00017620
[0001784a] 3d5f fffc                 move.w     (a7)+,-4(a6)
[0001784e] 558f                      subq.l     #2,a7
[00017850] 6100 fd12                 bsr        $00017564
[00017854] 3d5f fffa                 move.w     (a7)+,-6(a6)
[00017858] 3f2e fffc                 move.w     -4(a6),-(a7)
[0001785c] 4267                      clr.w      -(a7)
[0001785e] 3f2e fffa                 move.w     -6(a6),-(a7)
[00017862] 6100 f6f4                 bsr        $00016F58
[00017866] 5c8f                      addq.l     #6,a7
[00017868] 4efa 00ac                 jmp        $00017916(pc)
case 7:
case 15:
[0001786c] 4efa 00a8                 jmp        $00017916(pc)
case 8:
case 10:
case 17:
case 24:
case 25:
[00017870] 6100 fde4                 bsr        $00017656
[00017874] 4efa 00a0                 jmp        $00017916(pc)
case 11:
case 13:
case 26:
case 32:
case 33:
[00017878] 6100 fddc                 bsr        $00017656
[0001787c] 6100 fd72                 bsr        $000175F0
[00017880] 4efa 0094                 jmp        $00017916(pc)
case 9:
[00017884] 6100 fdd0                 bsr        $00017656
[00017888] 6100 fcaa                 bsr        $00017534
[0001788c] 4efa 0088                 jmp        $00017916(pc)
case 12:
case 14:
case 16:
case 34:
case 35:
[00017890] 6100 fdc4                 bsr        $00017656
[00017894] 6100 fd5a                 bsr        $000175F0
[00017898] 6100 fc9a                 bsr        $00017534
[0001789c] 4efa 0078                 jmp        $00017916(pc)
case 27:
[000178a0] 6100 fd4e                 bsr        $000175F0
[000178a4] 4efa 0070                 jmp        $00017916(pc)
case 18:
[000178a8] 4efa 006c                 jmp        $00017916(pc)
case 19:
case 20:
case 21:
case 28:
case 29:
case 30:
case 31:
default:
[000178ac] 4efa 004a                 jmp        $000178F8(pc)
[000178b0] 000c
           0028
[000178b4] 0038
           0046
           008e
[000178ba] 008e
           008e
           00ba
[000178c0] 00be
           00d2
           00be
[000178c6] 00c6
[000178c8] 00de
[000178ca] 00c6
[000178cc] 00de
[000178ce] 00ba
           00de
           00be
           00f6
[000178d6] 00fa
           00fa
           00fa
[000178dc] 0074
           0074
           00be
[000178e2] 00be
           00c6
           00ee
[000178e8] 00fa
           00fa
           00fa
[000178ee] 00fa
           00c6
           00c6
[000178f4] 00de
[000178f6] 00de
[000178f8] 3f3c 0016                 move.w     #$0016,-(a7)
[000178fc] 4879 0001 7d2e            pea.l      $00017D2E ' ---- illegal Directive'
[00017902] 7a00                      moveq.l    #0,d5
[00017904] 1a2e ffff                 move.b     -1(a6),d5
[00017908] 3f05                      move.w     d5,-(a7)
[0001790a] 6100 fe24                 bsr        $00017730
[0001790e] 508f                      addq.l     #8,a7
[00017910] 1d7c 0012 ffff            move.b     #$12,-1(a6)
[00017916] 6100 fd6e                 bsr        $00017686
[0001791a] 4efa 001c                 jmp        $00017938(pc)
[0001791e] 3f3c 001d                 move.w     #$001D,-(a7)
[00017922] 4879 0001 7d46            pea.l      $00017D46 ' ---- unknown directive number'
[00017928] 3f2e fff8                 move.w     -8(a6),-(a7)
[0001792c] 6100 fe02                 bsr        $00017730
[00017930] 508f                      addq.l     #8,a7
[00017932] 1d7c 0012 ffff            move.b     #$12,-1(a6)
[00017938] 0c2e 0012 ffff            cmpi.b     #$12,-1(a6)
[0001793e] 6704                      beq.s      $00017944
[00017940] 6000 fe34                 bra        $00017776
[00017944] 4efa 001a                 jmp        $00017960(pc)
[00017948] 3f3c 0025                 move.w     #$0025,-(a7)
[0001794c] 4879 0001 7d66            pea.l      $00017D66 ' ---- no LinkCodeVersion found - halt '
[00017952] 4eb9 0001 1316            jsr        AppWindow.WriteString
[00017958] 5c8f                      addq.l     #6,a7
[0001795a] 4eb9 0001 13e0            jsr        AppWindow.WriteLn
[00017960] 4e5e                      unlk       a6
[00017962] 4e75                      rts

DecLnk.init:

[00017964] 4ef9 0001 6b60            jmp        Filepool.init
[0001796a] 4e56 0000                 link       a6,#0
[0001796e] 6100 f4bc                 bsr        resetCrc
[00017972] 3f3c 0021                 move.w     #$0021,-(a7)
[00017976] 4879 0001 7d8e            pea.l      $00017D8E 'Link file decoder   Version  2.00a'
[0001797c] 4eb9 0001 1316            jsr        AppWindow.WriteString
[00017982] 5c8f                      addq.l     #6,a7
[00017984] 4eb9 0001 13e0            jsr        AppWindow.WriteLn
[0001798a] 4eb9 0001 13e0            jsr        AppWindow.WriteLn
[00017990] 4239 0001 8f60            clr.b      declnk.outputFailed
[00017996] 4239 0001 8f61            clr.b      $00018F61
[0001799c] 6100 f1fc                 bsr        OpenFiles
[000179a0] 4a39 0001 8f60            tst.b      declnk.outputFailed
[000179a6] 6608                      bne.s      $000179B0
[000179a8] 6100 fda8                 bsr        $00017752
[000179ac] 6100 f29a                 bsr        CloseFiles
[000179b0] 4eb9 0001 13e0            jsr        AppWindow.WriteLn
[000179b6] 3f3c 000c                 move.w     #$000C,-(a7)
[000179ba] 4879 0001 7db2            pea.l      $00017DB2 'End of decode'
[000179c0] 4eb9 0001 1316            jsr        AppWindow.WriteString
[000179c6] 5c8f                      addq.l     #6,a7
[000179c8] 4eb9 0001 13e0            jsr        AppWindow.WriteLn
[000179ce] 4267                      clr.w      -(a7)
[000179d0] 4227                      clr.b      -(a7)
[000179d2] 4eb9 0001 2466            jsr        ExecUtil.IOError
[000179d8] 588f                      addq.l     #4,a7
[000179da] 4e5e                      unlk       a6
[000179dc] 4e75                      rts

[000179de] 0000                      dc.w       $0000
[000179e0] 0000
[000179e2] 4c69                      .asciiz 'Link file'
[000179ec] 0000                      .asciiz ''
[000179ee] 4c69 7374 0000            .asciiz "List"
[000179f4] 4465                      .asciiz "Decode file"
[00017a00] 4e4f                      .asciiz 'NO DECODE -------- DATA'
[00017a18] 2044                      .asciiz ' DECODE --------                        INSTRUCTION'
[00017a4c] 4465                      .asciiz 'Decode parameter error.'
[00017a64] 7363                      .asciiz 'scmod header'
[00017a72] 696d                      .asciiz 'import'
[00017a7a] 6461                      .asciiz 'data size'
[00017a84] 6669 6c6c                 .asciiz 'filled data'
[00017a90] 7072                      .asciiz 'proc code'
[00017a9a] 696e                      .asciiz 'init code'
[00017aa4] 7363                      .asciiz 'scmod init code'
[00017ab4] 6578                      .asciiz 'excp code'
[00017abe] 7265                      .asciiz 'ref own data'
[00017acc] 7265                      .asciiz 'ref ext data'
[00017ada] 7265                      .asciiz 'ref own code'
[00017ae8] 7265                      .asciiz 'ref own proc call'
[00017afa] 7265                      .asciiz 'ref ext proc call'
[00017b0c] 7265                      .asciiz 'ref own proc ass'
[00017b1e] 7265                      .asciiz 'ref ext proc ass'
[00017b30] 7265                      .asciiz 'ref own excp'
[00017b3e] 7265                      .asciiz 'ref ext excp'
[00017b4c] 7265                      .asciiz 'ref ext init call'
[00017b5e] 7363                      .asciiz 'scmod end'
[00017b68] 6c69                      .asciiz 'link code version:'
[00017b7c] 7265                      .asciiz 'ref any proc call:'
[00017b90] 7265                      .asciiz 'ref any proc ass:'
[00017ba2] 7374                      .asciiz 'string data:'
[00017bb0] 626f                      .asciiz 'bound data:'
[00017bbc] 7265                      .asciiz 'ref own string:'
[00017bcc] 7265                      .asciiz 'ref own bound:'
[00017bdc] 7265                      .asciiz 'ref util:'
[00017be6] 6c6f                      .asciiz 'load util:'
[00017bf2] 6465                      .asciiz 'def abs symbol:'
[00017c02] 7265                      .asciiz 'ref abs symbol:'
[00017c12] 7265                      .asciiz 'ref own quick call'
[00017c26] 7265                      .asciiz 'ref ext quick call'
[00017c3a] 7265                      .asciiz 'ref own quick ass'
[00017c4c] 7265                      .asciiz 'ref ext quick ass'
[00017c5e] 2d2d 2d20                 .asciiz '--- unknown Symbol ---'
[00017c76] 2c20                      .asciiz ', key ='
[00017c7e] 2c20                      .asciiz ', modnum = '
[00017c8a] 2c20                      .asciiz ', number of bytes = '
[00017ca0] 2c20                      .asciiz ', number of bytes = '
[00017cb6] 2c20                      .asciiz ', procnum = '
[00017cc4] 2c20                      .asciiz ', entrypoint ='
[00017cd4] 2061                      .asciiz ' at'
[00017cd8] 2020                      .asciiz '  checksum:'
[00017ce4] 206f 2e6b                 .asciiz ' o.k.'
[00017cea] 2020                      .asciiz '  ---- checksum error: '
[00017d02] 2073 686f                 .asciiz ' should be '
[00017d0e] 3a20                      .asciiz ': MODULE'
[00017d18] 2c20                      .asciiz ', rel. start addr. ='
[00017d2e] 202d                      .asciiz ' ---- illegal Directive'
[00017d46] 202d                      .asciiz ' ---- unknown directive number'
[00017d66] 202d                      .asciiz ' ---- no LinkCodeVersion found - halt '
[00017d8e] 4c69                      .asciiz 'Link file decoder   Version  2.00a'
[00017db2] 456e                      .asciiz 'End of decode'

17dc0: BasePageAddress
17dc4: ErrorProcessor
17dc8: ErrorContext
17dfc: CodeBase
17e00: PgmSize
17e04: ExceptionVecs1
17e34: ExceptionVecs2
17e74: 
17e80: AESParameters
17e98: AESGlobal
17eb6: AESControl
17ec0: AESIntIn
17ee2: AESIntOut
17ef2: AESAddrIn
17efe: AESAddrOut
17f06: AESCallResult
17f20: GEMVDIbase.intin
18020: GEMVDIbase.ptsin
18120: GEMVDIbase.intout
18220: GEMVDIbase.ptsout
18324: GEMVDIbase.ADRintin
18328: GEMVDIbase.ADRptsin
1832c: GEMVDIbase.ADRintout
18330: GEMVDIbase.ADRptsout
18334: GEMVDIbase.ADRparams
18338: GEMVDIbase.parameterBlock
1834c:
18360: AppBase.apId
18362: AppBase.wdwHandle
18364: AppBase.vdiHandle
18366: AppBase.doUpdateWindow
1836a: AppBase.openFiles
1836e: AppBase.openStreams
18372: AppBase.shellTail
183c2: AppBase.xfer
183c4: AppWindow.wchar
183c6: AppWindow.hchar
183c8: AppWindow.wbox
183ca: AppWindow.hbox
183cc: AppWindow.workx
183ce: AppWindow.worky
183d0: AppWindow.workw
183d2: AppWindow.workh
183d4: AppWindow.CursorX
183d6: AppWindow.CursorY
183d8: AppWindow.winrows
183da: AppWindow.screenbuffer
1888a: AppWindow.lineLength
188ba: AppWindow.windowtitle
188e2: Strings.terminator
188e4: Buffers.bufptr
188e8: Buffers.count
188ea: Buffers.buffers
18912: ExecUtil.
18916: ExecUtil.
1891a: ExecUtil.
1891c: ExecUtil.terminated
1891e: M2Option.accId
18920: M2Option.msgbuf
18940: M2Option.replybuf
18960: M2Option.options
18a6c: NewStreams.searchpaths
18bca: NewStreams.needfile
18bcc: NewStreams.mainfilename
18bf4: NewStreams.outfilename
18c1c: NewStreams.currInfoType
18c1d: NewStreams.dump
18c1e: NewStreams.queryfiles
18c1f: NewStreams.reffiles
18c20: NewStreams.listing
18c21: NewStreams.linkmap
18c22: NewStreams.linkopt
18c23: NewStreams.debugtable
18c24: NewStreams.stacksize
18c28: NewStreams.heapsize
18c2a: NewStreams.DtaPtr
18c2e: StrUtil.conv
18c32: disasm.opcode
18c34: disasm.strpos
18c36: disasm.opsize
18c38: disasm.subcode
18c3a: disasm.disp
18c3c: Filepool.fileid
18c3e: Filepool.names
18f5e: declnk.crc
18f60: declnk.outputFailed
18f62: declnk.lnkFile
