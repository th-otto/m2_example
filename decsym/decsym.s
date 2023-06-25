; ph_branch = 0x601a
; ph_tlen = 0x00005caa
; ph_dlen = 0x00000000
; ph_blen = 0x000011bc
; ph_slen = 0x00000000
; ph_res1 = 0x00000000
; ph_prgflags = 0x00000000
; ph_absflag = 0x0000
; first relocation = 0x00000002
; relocation bytes = 0x000004e2

[00010000] 4ef9 0001 5920            jmp        DecSym.init
[00010006] 0000 2000                 ori.b      #$00,d0 ; stacksize

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

[00010028] 4e56 ffe8                 link       a6,#-24
[0001002c] 2a00                      move.l     d0,d5
[0001002e] 7809                      moveq.l    #9,d4
[00010030] da84                      add.l      d4,d5
[00010032] 3d45 fffe                 move.w     d5,-2(a6)
[00010036] 2a0e                      move.l     a6,d5
[00010038] 5085                      addq.l     #8,d5
[0001003a] 2d45 ffe8                 move.l     d5,-24(a6)
[0001003e] 40ee fff8                 move.w     sr,-8(a6)
[00010042] 2d4d fff4                 move.l     a5,-12(a6)
[00010046] 2d56 fff0                 move.l     (a6),-16(a6)
[0001004a] 4e68                      move.l     usp,a0
[0001004c] 2d48 ffec                 move.l     a0,-20(a6)
[00010050] 0c6e 0007 fffe            cmpi.w     #$0007,-2(a6)
[00010056] 6708                      beq.s      $00010060
[00010058] 0c6e 0008 fffe            cmpi.w     #$0008,-2(a6)
[0001005e] 6614                      bne.s      $00010074
[00010060] 2d6e 0012 fffa            move.l     18(a6),-6(a6)
[00010066] 2a2e ffe8                 move.l     -24(a6),d5
[0001006a] 5085                      addq.l     #8,d5
[0001006c] 2d45 ffe8                 move.l     d5,-24(a6)
[00010070] 4efa 0042                 jmp        $000100B4(pc)
[00010074] 0c6e 000f fffe            cmpi.w     #$000F,-2(a6)
[0001007a] 660c                      bne.s      $00010088
[0001007c] 4e68                      move.l     usp,a0
[0001007e] 2d68 0008 fffa            move.l     8(a0),-6(a6)
[00010084] 4efa 002e                 jmp        $000100B4(pc)
[00010088] 0c6e 0010 fffe            cmpi.w     #$0010,-2(a6)
[0001008e] 660c                      bne.s      $0001009C
[00010090] 42ae fffa                 clr.l      -6(a6)
[00010094] 42ae fff0                 clr.l      -16(a6)
[00010098] 4efa 001a                 jmp        $000100B4(pc)
[0001009c] 0c6e 0009 fffe            cmpi.w     #$0009,-2(a6)
[000100a2] 650a                      bcs.s      $000100AE
[000100a4] 4e68                      move.l     usp,a0
[000100a6] 2d50 fffa                 move.l     (a0),-6(a6)
[000100aa] 4efa 0008                 jmp        $000100B4(pc)
[000100ae] 2d6e 000a fffa            move.l     10(a6),-6(a6)
[000100b4] 49f9 0001 5cb2            lea.l      $00015CB2,a4
[000100ba] 38ae fffe                 move.w     -2(a6),(a4)
[000100be] 422c 0002                 clr.b      2(a4)
[000100c2] 296e fffa 0004            move.l     -6(a6),4(a4)
[000100c8] 396e fff8 0008            move.w     -8(a6),8(a4)
[000100ce] 296e fff4 000a            move.l     -12(a6),10(a4)
[000100d4] 296e fff0 000e            move.l     -16(a6),14(a4)
[000100da] 296e ffec 0012            move.l     -20(a6),18(a4)
[000100e0] 296e fff0 0016            move.l     -16(a6),22(a4)
[000100e6] 197c 0001 001a            move.b     #$01,26(a4)
[000100ec] 2e6e ffe8                 movea.l    -24(a6),a7
[000100f0] 2039 0001 5cae            move.l     ErrorProcessor,d0
[000100f6] 2f40 0002                 move.l     d0,2(a7)
[000100fa] 3ebc 0000                 move.w     #$0000,(a7)
[000100fe] 2c56                      movea.l    (a6),a6
[00010100] 4e68                      move.l     usp,a0
[00010102] 5988                      subq.l     #4,a0
[00010104] 4e60                      move.l     a0,usp
[00010106] 4e73                      rte
[00010108] 4e5e                      unlk       a6
[0001010a] 4e75                      rts

; VAR global: AESGlobalType   -30
; VAR pb: AESParameterType    -54
; VAR control: AESControlType -64
; VAR intin: ARRAY[0..0] OF INTEGER -66
; VAR intout: ARRAY[0..0] OF INTEGER -68
; VAR addrin: ARRAY[0..0] OF ADDRESS -72
; VAR i: INTEGER
[0001010c] 4e56 ffb6                 link       a6,#-74
[00010110] 426e ffb6                 clr.w      -74(a6) for i = 0 TO 14 global[i] := 0
[00010114] 3a2e ffb6                 move.w     -74(a6),d5
[00010118] da45                      add.w      d5,d5
[0001011a] 49ee ffe2                 lea.l      -30(a6),a4
[0001011e] 4274 5000                 clr.w      0(a4,d5.w)
[00010122] 526e ffb6                 addq.w     #1,-74(a6)
[00010126] 0c6e 000f ffb6            cmpi.w     #$000F,-74(a6)
[0001012c] 66e6                      bne.s      $00010114
[0001012e] 49ee ffc0                 lea.l      -64(a6),a4 ; pb.control := ADR(control)
[00010132] 2a0c                      move.l     a4,d5
[00010134] 2d45 ffca                 move.l     d5,-54(a6)
[00010138] 49ee ffe2                 lea.l      -30(a6),a4 ; pb.global := ADR(global)
[0001013c] 2a0c                      move.l     a4,d5
[0001013e] 2d45 ffce                 move.l     d5,-50(a6)
[00010142] 49ee ffbe                 lea.l      -66(a6),a4 ; pb.intIn := ADR(intin)
[00010146] 2a0c                      move.l     a4,d5
[00010148] 2d45 ffd2                 move.l     d5,-46(a6)
[0001014c] 49ee ffbc                 lea.l      -68(a6),a4 ; pb.intOut := ADR(intout)
[00010150] 2a0c                      move.l     a4,d5
[00010152] 2d45 ffd6                 move.l     d5,-42(a6)
[00010156] 49ee ffb8                 lea.l      -72(a6),a4 ; pb.addrIn := ADR(addrin)
[0001015a] 2a0c                      move.l     a4,d5
[0001015c] 2d45 ffda                 move.l     d5,-38(a6)
[00010160] 7aff                      moveq.l    #-1,d5 ; pb.addrOut := ADDRESS(-1)
[00010162] 2d45 ffde                 move.l     d5,-34(a6)
[00010166] 3d7c 000a ffc0            move.w     #$000A,-64(a6) ; control.opcode := 10 appl_init
[0001016c] 426e ffc2                 clr.w      -62(a6)        ; control.sizeIntIn := 0
[00010170] 3d7c 0001 ffc4            move.w     #$0001,-60(a6) ; control.sizeIntOut := 1
[00010176] 426e ffc6                 clr.w      -58(a6)        ; control.sizeAddrIn := 0
[0001017a] 426e ffc8                 clr.w      -56(a6)        ; control.sizeAddrOut := 0
[0001017e] 203c 0000 00c8            move.l     #$000000C8,d0  ; SETREG(0, ADDRESS(200))
[00010184] 49ee ffca                 lea.l      -54(a6),a4     ; SETREG(1, ADR(pb))
[00010188] 2a0c                      move.l     a4,d5
[0001018a] 2205                      move.l     d5,d1
[0001018c] 4e42                      trap       #2
[0001018e] 3d7c 004e ffc0            move.w     #$004E,-64(a6) ; control.opcode := 78 graf_mouse
[00010194] 3d7c 0001 ffc2            move.w     #$0001,-62(a6) ; control.sizeIntIn := 1
[0001019a] 3d7c 0001 ffc4            move.w     #$0001,-60(a6) ; control.sizeIntOut := 1
[000101a0] 3d7c 0001 ffc6            move.w     #$0001,-58(a6) ; control.sizeAddrIn := 1
[000101a6] 426e ffc8                 clr.w      -56(a6)        ; control.sizeAddrOut := 0
[000101aa] 3d7c 0101 ffbe            move.w     #$0101,-66(a6) ; intin[0] := MouseOn
[000101b0] 7aff                      moveq.l    #-1,d5         ; addrin[0] := ADDRESS(-1)
[000101b2] 2d45 ffb8                 move.l     d5,-72(a6)
[000101b6] 203c 0000 00c8            move.l     #$000000C8,d0  ; SETREG(0, ADDRESS(200))
[000101bc] 49ee ffca                 lea.l      -54(a6),a4     ; SETREG(1, ADR(pb))
[000101c0] 2a0c                      move.l     a4,d5
[000101c2] 2205                      move.l     d5,d1
[000101c4] 4e42                      trap       #2
[000101c6] 3d7c 0034 ffc0            move.w     #$0034,-64(a6) ; control.opcode := 52 form_alert
[000101cc] 3d7c 0001 ffc2            move.w     #$0001,-62(a6) ; control.sizeIntIn := 1
[000101d2] 3d7c 0001 ffc4            move.w     #$0001,-60(a6) ; control.sizeIntOut := 1
[000101d8] 3d7c 0001 ffc6            move.w     #$0001,-58(a6) ; control.sizeAdrIn := 1
[000101de] 426e ffc8                 clr.w      -56(a6)        ; control.sizeAddrOut := 0
[000101e2] 3d7c 0001 ffbe            move.w     #$0001,-66(a6) ; intin[0] := 1
[000101e8] 286d fffc                 movea.l    -4(a5),a4
[000101ec] 49ec ff9a                 lea.l      -102(a4),a4
[000101f0] 2a0c                      move.l     a4,d5
[000101f2] 2d45 ffb8                 move.l     d5,-72(a6)
[000101f6] 203c 0000 00c8            move.l     #$000000C8,d0  ; SETREG(0, ADDRESS(200))
[000101fc] 49ee ffca                 lea.l      -54(a6),a4     ; SETREG(1, ADR(pb))
[00010200] 2a0c                      move.l     a4,d5
[00010202] 2205                      move.l     d5,d1
[00010204] 4e42                      trap       #2
[00010206] 3d7c 0013 ffc0            move.w     #$0013,-64(a6) ; control.opcode := 19 appl_exit
[0001020c] 426e ffc2                 clr.w      -62(a6)
[00010210] 3d7c 0001 ffc4            move.w     #$0001,-60(a6)
[00010216] 426e ffc6                 clr.w      -58(a6)
[0001021a] 426e ffc8                 clr.w      -56(a6)
[0001021e] 203c 0000 00c8            move.l     #$000000C8,d0
[00010224] 49ee ffca                 lea.l      -54(a6),a4
[00010228] 2a0c                      move.l     a4,d5
[0001022a] 2205                      move.l     d5,d1
[0001022c] 4e42                      trap       #2
[0001022e] 4eb9 0001 0570            jsr        $00010570
[00010234] 704c                      moveq.l    #76,d0
[00010236] 3f00                      move.w     d0,-(a7)
[00010238] 3039 0001 5cb2            move.w     $00015CB2,d0
[0001023e] 4e41                      trap       #1
[00010240] 4e5e                      unlk       a6
[00010242] 4e75                      rts

[00010244] 4e56 ff88                 link       a6,#-120
[00010248] 2f2d fffc                 move.l     -4(a5),-(a7)
[0001024c] 2b4e fffc                 move.l     a6,-4(a5)
[00010250] 49f9 0001 07f0            lea.l      $000107F0,a4
[00010256] 47ee ff9a                 lea.l      -102(a6),a3
[0001025a] 7a2b                      moveq.l    #43,d5
[0001025c] 16dc                      move.b     (a4)+,(a3)+
[0001025e] 57cd fffc                 dbeq       d5,$0001025C
[00010262] 426e ff8c                 clr.w      -116(a6)
[00010266] 3a2e ff8c                 move.w     -116(a6),d5
[0001026a] 49ee ff9a                 lea.l      -102(a6),a4
[0001026e] 4a34 5000                 tst.b      0(a4,d5.w)
[00010272] 6706                      beq.s      $0001027A
[00010274] 526e ff8c                 addq.w     #1,-116(a6)
[00010278] 60ec                      bra.s      $00010266
[0001027a] 3d79 0001 5cb2 ff88       move.w     $00015CB2,-120(a6)
[00010282] 0c6e 000a ff88            cmpi.w     #$000A,-120(a6)
[00010288] 6412                      bcc.s      $0001029C
[0001028a] 3a2e ff8c                 move.w     -116(a6),d5
[0001028e] 49ee ff9a                 lea.l      -102(a6),a4
[00010292] 19bc 0030 5000            move.b     #$30,0(a4,d5.w)
[00010298] 4efa 0028                 jmp        $000102C2(pc)
[0001029c] 7a00                      moveq.l    #0,d5
[0001029e] 3a2e ff88                 move.w     -120(a6),d5
[000102a2] 8afc 000a                 divu.w     #$000A,d5
[000102a6] 4845                      swap       d5
[000102a8] 4245                      clr.w      d5
[000102aa] 4845                      swap       d5
[000102ac] 8afc 000a                 divu.w     #$000A,d5
[000102b0] 4845                      swap       d5
[000102b2] 7830                      moveq.l    #48,d4
[000102b4] da44                      add.w      d4,d5
[000102b6] 382e ff8c                 move.w     -116(a6),d4
[000102ba] 49ee ff9a                 lea.l      -102(a6),a4
[000102be] 1985 4000                 move.b     d5,0(a4,d4.w)
[000102c2] 526e ff8c                 addq.w     #1,-116(a6)
[000102c6] 7a00                      moveq.l    #0,d5
[000102c8] 3a2e ff88                 move.w     -120(a6),d5
[000102cc] 8afc 000a                 divu.w     #$000A,d5
[000102d0] 4845                      swap       d5
[000102d2] 7830                      moveq.l    #48,d4
[000102d4] da44                      add.w      d4,d5
[000102d6] 382e ff8c                 move.w     -116(a6),d4
[000102da] 49ee ff9a                 lea.l      -102(a6),a4
[000102de] 1985 4000                 move.b     d5,0(a4,d4.w)
[000102e2] 526e ff8c                 addq.w     #1,-116(a6)
[000102e6] 49f9 0001 081c            lea.l      $0001081C,a4
[000102ec] 47ee ff8e                 lea.l      -114(a6),a3
[000102f0] 7a05                      moveq.l    #5,d5
[000102f2] 16dc                      move.b     (a4)+,(a3)+
[000102f4] 57cd fffc                 dbeq       d5,$000102F2
[000102f8] 426e ff8a                 clr.w      -118(a6)
[000102fc] 3a2e ff8a                 move.w     -118(a6),d5
[00010300] 49ee ff8e                 lea.l      -114(a6),a4
[00010304] 382e ff8c                 move.w     -116(a6),d4
[00010308] d86e ff8a                 add.w      -118(a6),d4
[0001030c] 47ee ff9a                 lea.l      -102(a6),a3
[00010310] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[00010316] 526e ff8a                 addq.w     #1,-118(a6)
[0001031a] 3a2e ff8a                 move.w     -118(a6),d5
[0001031e] 49ee ff8e                 lea.l      -114(a6),a4
[00010322] 4a34 5000                 tst.b      0(a4,d5.w)
[00010326] 6702                      beq.s      $0001032A
[00010328] 60d2                      bra.s      $000102FC
[0001032a] 4eb9 0001 010c            jsr        $0001010C
[00010330] 2b5f fffc                 move.l     (a7)+,-4(a5)
[00010334] 4e5e                      unlk       a6
[00010336] 4e75                      rts

trap6:
[00010338] 46fc 2700                 move.w     #$2700,sr
[0001033c] 2f4e fffc                 move.l     a6,-4(a7)
[00010340] 4e6e                      move.l     usp,a6
[00010342] 2d2f 0002                 move.l     2(a7),-(a6)
[00010346] 3d17                      move.w     (a7),-(a6)
[00010348] 2d2f fffc                 move.l     -4(a7),-(a6)
[0001034c] 48e6 fffc                 movem.l    d0-d7/a0-a5,-(a6)
[00010350] 2251                      movea.l    (a1),a1
[00010352] 208e                      move.l     a6,(a0)
[00010354] 2c49                      movea.l    a1,a6
[00010356] 4cde 3fff                 movem.l    (a6)+,d0-d7/a0-a5
[0001035a] 2f5e fffc                 move.l     (a6)+,-4(a7)
[0001035e] 3e9e                      move.w     (a6)+,(a7)
[00010360] 2f5e 0002                 move.l     (a6)+,2(a7)
[00010364] 4e66                      move.l     a6,usp
[00010366] 2c6f fffc                 movea.l    -4(a7),a6
[0001036a] 4e73                      rte

trap5:
[0001036c] 46fc 2700                 move.w     #$2700,sr
[00010370] 2f4e fffc                 move.l     a6,-4(a7)
[00010374] 4e6e                      move.l     usp,a6
[00010376] 2d2f 0002                 move.l     2(a7),-(a6)
[0001037a] 3d17                      move.w     (a7),-(a6)
[0001037c] 2d2f fffc                 move.l     -4(a7),-(a6)
[00010380] 48e6 fffc                 movem.l    d0-d7/a0-a5,-(a6)
[00010384] 2251                      movea.l    (a1),a1
[00010386] 208e                      move.l     a6,(a0)
[00010388] 47fa 002a                 lea.l      $000103B4(pc),a3
[0001038c] 2d0b                      move.l     a3,-(a6)
[0001038e] 3d3c 4eb9                 move.w     #$4EB9,-(a6)
[00010392] 3d3c 2700                 move.w     #$2700,-(a6)
[00010396] 3d3c 46fc                 move.w     #$46FC,-(a6)
[0001039a] 248e                      move.l     a6,(a2)
[0001039c] 2c49                      movea.l    a1,a6
[0001039e] 4cde 3fff                 movem.l    (a6)+,d0-d7/a0-a5
[000103a2] 2f5e fffc                 move.l     (a6)+,-4(a7)
[000103a6] 3e9e                      move.w     (a6)+,(a7)
[000103a8] 2f5e 0002                 move.l     (a6)+,2(a7)
[000103ac] 4e66                      move.l     a6,usp
[000103ae] 2c6f fffc                 movea.l    -4(a7),a6
[000103b2] 4e73                      rte
[000103b4] 2f4e fffc                 move.l     a6,-4(a7)
[000103b8] 4e6e                      move.l     usp,a6
[000103ba] 2d2f 0006                 move.l     6(a7),-(a6)
[000103be] 3d2f 0004                 move.w     4(a7),-(a6)
[000103c2] 2d2f fffc                 move.l     -4(a7),-(a6)
[000103c6] 48e6 fffc                 movem.l    d0-d7/a0-a5,-(a6)
[000103ca] 205f                      movea.l    (a7)+,a0
[000103cc] 2268 0024                 movea.l    36(a0),a1
[000103d0] 228e                      move.l     a6,(a1)
[000103d2] 2c48                      movea.l    a0,a6
[000103d4] 4cde 3fff                 movem.l    (a6)+,d0-d7/a0-a5
[000103d8] 2f5e fffc                 move.l     (a6)+,-4(a7)
[000103dc] 3e9e                      move.w     (a6)+,(a7)
[000103de] 2f5e 0002                 move.l     (a6)+,2(a7)
[000103e2] 4e66                      move.l     a6,usp
[000103e4] 2c6f fffc                 movea.l    -4(a7),a6
[000103e8] 4e73                      rte

trap7:
[000103ea] 46fc 2700                 move.w     #$2700,sr
[000103ee] 5300                      subq.b     #1,d0
[000103f0] 5300                      subq.b     #1,d0
[000103f2] 6608                      bne.s      $000103FC
trap7_func2:
[000103f4] 0257 f8ff                 andi.w     #$F8FF,(a7)
[000103f8] 8357                      or.w       d1,(a7)
[000103fa] 4e73                      rte
[000103fc] 5300                      subq.b     #1,d0
[000103fe] 6604                      bne.s      $00010404
trap7_func3:
[00010400] 3e81                      move.w     d1,(a7)
[00010402] 4e73                      rte
[00010404] 5300                      subq.b     #1,d0
[00010406] 6606                      bne.s      $0001040E
trap7_func4:
[00010408] 46fc 2000                 move.w     #$2000,sr
[0001040c] 4e73                      rte
[0001040e] 5300                      subq.b     #1,d0
[00010410] 6604                      bne.s      $00010416
trap7_func5:
[00010412] 4e71                      nop
[00010414] 4e73                      rte
[00010416] 5300                      subq.b     #1,d0
[00010418] 660a                      bne.s      $00010424
trap7_func6:
[0001041a] 2001                      move.l     d1,d0
[0001041c] 4eb9 0001 0028            jsr        $00010028
[00010422] 4e73                      rte
trap7_func7:
[00010424] 4e68                      move.l     usp,a0
[00010426] 42a0                      clr.l      -(a0)
[00010428] 42a0                      clr.l      -(a0)
[0001042a] 42a0                      clr.l      -(a0)
[0001042c] 2039 0001 5cea            move.l     PgmSize,d0
[00010432] 2100                      move.l     d0,-(a0)
[00010434] 42a0                      clr.l      -(a0)
[00010436] 2a48                      movea.l    a0,a5
[00010438] 90fc 0024                 suba.w     #$0024,a0
[0001043c] 43fa 0006                 lea.l      $00010444(pc),a1
[00010440] 2109                      move.l     a1,-(a0)
[00010442] 6016                      bra.s      $0001045A
[00010444] 4eb9 0001 0570            jsr        $00010570
[0001044a] 203c 0000 004c            move.l     #$0000004C,d0
[00010450] 3f00                      move.w     d0,-(a7)
[00010452] 203c 0000 0000            move.l     #$00000000,d0
[00010458] 4e41                      trap       #1
[0001045a] 4e60                      move.l     a0,usp
[0001045c] 9dce                      suba.l     a6,a6
[0001045e] 0257 d8ff                 andi.w     #$D8FF,(a7)
[00010462] 4e73                      rte

DIVU32:
[00010464] 4e56 0000                 link       a6,#0
[00010468] 48e7 7800                 movem.l    d1-d4,-(a7)
[0001046c] 222e 000c                 move.l     12(a6),d1
[00010470] 242e 0008                 move.l     8(a6),d2
[00010474] b4bc 0000 ffff            cmp.l      #$0000FFFF,d2
[0001047a] 621e                      bhi.s      $0001049A
[0001047c] 4243                      clr.w      d3
[0001047e] 82c2                      divu.w     d2,d1
[00010480] 680e                      bvc.s      $00010490
[00010482] 3801                      move.w     d1,d4
[00010484] 4241                      clr.w      d1
[00010486] 4841                      swap       d1
[00010488] 82c2                      divu.w     d2,d1
[0001048a] 3601                      move.w     d1,d3
[0001048c] 3204                      move.w     d4,d1
[0001048e] 82c2                      divu.w     d2,d1
[00010490] 4843                      swap       d3
[00010492] 3601                      move.w     d1,d3
[00010494] 4241                      clr.w      d1
[00010496] 4841                      swap       d1
[00010498] 601e                      bra.s      $000104B8
[0001049a] 4283                      clr.l      d3
[0001049c] 3601                      move.w     d1,d3
[0001049e] 4843                      swap       d3
[000104a0] 4241                      clr.w      d1
[000104a2] 4841                      swap       d1
[000104a4] 383c 000f                 move.w     #$000F,d4
[000104a8] e38b                      lsl.l      #1,d3
[000104aa] e391                      roxl.l     #1,d1
[000104ac] b282                      cmp.l      d2,d1
[000104ae] 6504                      bcs.s      $000104B4
[000104b0] 9282                      sub.l      d2,d1
[000104b2] 5243                      addq.w     #1,d3
[000104b4] 51cc fff2                 dbf        d4,$000104A8
[000104b8] 2d43 000c                 move.l     d3,12(a6)
[000104bc] 2d41 0008                 move.l     d1,8(a6)
[000104c0] 4cdf 001e                 movem.l    (a7)+,d1-d4
[000104c4] 4e5e                      unlk       a6
[000104c6] 4e75                      rts

bus_err:
[000104c8] 46fc 2700                 move.w     #$2700,sr
[000104cc] 70ff                      moveq.l    #-1,d0
[000104ce] 4eb9 0001 0028            jsr        $00010028
[000104d4] 4e73                      rte

address_err:
[000104d6] 46fc 2700                 move.w     #$2700,sr
[000104da] 70fe                      moveq.l    #-2,d0
[000104dc] 4eb9 0001 0028            jsr        $00010028
[000104e2] 4e73                      rte

division_zero:
[000104e4] 46fc 2700                 move.w     #$2700,sr
[000104e8] 70fc                      moveq.l    #-4,d0
[000104ea] 4eb9 0001 0028            jsr        $00010028
[000104f0] 4e73                      rte

rangechk:
[000104f2] 46fc 2700                 move.w     #$2700,sr
[000104f6] 70fb                      moveq.l    #-5,d0
[000104f8] 4eb9 0001 0028            jsr        $00010028
[000104fe] 4e73                      rte

trapv:
[00010500] 46fc 2700                 move.w     #$2700,sr
[00010504] 70fa                      moveq.l    #-6,d0
[00010506] 4eb9 0001 0028            jsr        $00010028
[0001050c] 4e73                      rte

privilege:
[0001050e] 46fc 2700                 move.w     #$2700,sr
[00010512] 70f9                      moveq.l    #-7,d0
[00010514] 4eb9 0001 0028            jsr        $00010028
[0001051a] 4e73                      rte

SetException:
[0001051c] 4e56 fffc                 link       a6,#-4
[00010520] 202e 000a                 move.l     10(a6),d0
[00010524] 2f00                      move.l     d0,-(a7)
[00010526] 322e 0008                 move.w     8(a6),d1
[0001052a] 3f01                      move.w     d1,-(a7)
[0001052c] 3f3c 0005                 move.w     #$0005,-(a7) ; Setexc
[00010530] 4e4d                      trap       #13
[00010532] 2a00                      move.l     d0,d5
[00010534] 2d45 fffc                 move.l     d5,-4(a6)
[00010538] 0c6e 000b 0008            cmpi.w     #$000B,8(a6)
[0001053e] 6216                      bhi.s      $00010556
[00010540] 3a2e 0008                 move.w     8(a6),d5
[00010544] e545                      asl.w      #2,d5
[00010546] 49f9 0001 5cee            lea.l      $00015CEE,a4
[0001054c] 29ae fffc 5000            move.l     -4(a6),0(a4,d5.w)
[00010552] 4efa 0018                 jmp        $0001056C(pc)
[00010556] 3a2e 0008                 move.w     8(a6),d5
[0001055a] 0445 0020                 subi.w     #$0020,d5
[0001055e] e545                      asl.w      #2,d5
[00010560] 49f9 0001 5d1e            lea.l      $00015D1E,a4
[00010566] 29ae fffc 5000            move.l     -4(a6),0(a4,d5.w)
[0001056c] 4e5e                      unlk       a6
[0001056e] 4e75                      rts

[00010570] 4e56 0000                 link       a6,#0
[00010574] 2f39 0001 5cfa            move.l     $00015CFA,-(a7)
[0001057a] 3f3c 0003                 move.w     #$0003,-(a7)
[0001057e] 4eb9 0001 051c            jsr        $0001051C
[00010584] 5c8f                      addq.l     #6,a7
[00010586] 2f39 0001 5cf6            move.l     $00015CF6,-(a7)
[0001058c] 3f3c 0002                 move.w     #$0002,-(a7)
[00010590] 4eb9 0001 051c            jsr        $0001051C
[00010596] 5c8f                      addq.l     #6,a7
[00010598] 2f39 0001 5d02            move.l     $00015D02,-(a7)
[0001059e] 3f3c 0005                 move.w     #$0005,-(a7)
[000105a2] 4eb9 0001 051c            jsr        $0001051C
[000105a8] 5c8f                      addq.l     #6,a7
[000105aa] 2f39 0001 5d06            move.l     $00015D06,-(a7)
[000105b0] 3f3c 0006                 move.w     #$0006,-(a7)
[000105b4] 4eb9 0001 051c            jsr        $0001051C
[000105ba] 5c8f                      addq.l     #6,a7
[000105bc] 2f39 0001 5d0a            move.l     $00015D0A,-(a7)
[000105c2] 3f3c 0007                 move.w     #$0007,-(a7)
[000105c6] 4eb9 0001 051c            jsr        $0001051C
[000105cc] 5c8f                      addq.l     #6,a7
[000105ce] 2f39 0001 5d0e            move.l     $00015D0E,-(a7)
[000105d4] 3f3c 0008                 move.w     #$0008,-(a7)
[000105d8] 4eb9 0001 051c            jsr        $0001051C
[000105de] 5c8f                      addq.l     #6,a7
[000105e0] 2f39 0001 5d3a            move.l     $00015D3A,-(a7)
[000105e6] 3f3c 0027                 move.w     #$0027,-(a7)
[000105ea] 4eb9 0001 051c            jsr        $0001051C
[000105f0] 5c8f                      addq.l     #6,a7
[000105f2] 2f39 0001 5d36            move.l     $00015D36,-(a7)
[000105f8] 3f3c 0026                 move.w     #$0026,-(a7)
[000105fc] 4eb9 0001 051c            jsr        $0001051C
[00010602] 5c8f                      addq.l     #6,a7
[00010604] 2f39 0001 5d32            move.l     $00015D32,-(a7)
[0001060a] 3f3c 0025                 move.w     #$0025,-(a7)
[0001060e] 4eb9 0001 051c            jsr        $0001051C
[00010614] 5c8f                      addq.l     #6,a7
[00010616] 4e5e                      unlk       a6
[00010618] 4e75                      rts

***
* MODULE GEMX
***

GEMX.init
[0001061a] 4e71                      nop
[0001061c] 4e71                      nop
[0001061e] 4e71                      nop

[00010620] 204f                      movea.l    a7,a0
[00010622] 2068 0004                 movea.l    4(a0),a0
[00010626] 2a08                      move.l     a0,d5
[00010628] 23c5 0001 5caa            move.l     d5,BasePageAddress
[0001062e] 2879 0001 5caa            movea.l    BasePageAddress,a4
[00010634] 23ec 0008 0001 5ce6       move.l     8(a4),textbase
[0001063c] 2028 000c                 move.l     12(a0),d0
[00010640] d0a8 0014                 add.l      20(a0),d0
[00010644] d0a8 001c                 add.l      28(a0),d0
[00010648] 2879 0001 5ce6            movea.l    textbase,a4
[0001064e] 2a2c 0006                 move.l     6(a4),d5
[00010652] d085                      add.l      d5,d0
[00010654] 0680 0000 0100            addi.l     #$00000100,d0
[0001065a] 2e40                      movea.l    d0,a7
[0001065c] dfc8                      adda.l     a0,a7
[0001065e] 2f00                      move.l     d0,-(a7)
[00010660] 2f08                      move.l     a0,-(a7)
[00010662] 3f00                      move.w     d0,-(a7)
[00010664] 3f3c 004a                 move.w     #$004A,-(a7) ; Mshrink
[00010668] 4e41                      trap       #1
[0001066a] dffc 0000 000c            adda.l     #$0000000C,a7
[00010670] 2879 0001 5caa            movea.l    BasePageAddress,a4
[00010676] 2a2c 0008                 move.l     8(a4),d5
[0001067a] daac 000c                 add.l      12(a4),d5
[0001067e] daac 0014                 add.l      20(a4),d5
[00010682] daac 001c                 add.l      28(a4),d5
[00010686] 23c5 0001 5cea            move.l     d5,PgmSize

[0001068c] 2f3c 0001 04d6            move.l     #$000104D6,-(a7)
[00010692] 3f3c 0003                 move.w     #$0003,-(a7)
[00010696] 4eb9 0001 051c            jsr        $0001051C
[0001069c] 5c8f                      addq.l     #6,a7

[0001069e] 2f3c 0001 04c8            move.l     #$000104C8,-(a7)
[000106a4] 3f3c 0002                 move.w     #$0002,-(a7)
[000106a8] 4eb9 0001 051c            jsr        $0001051C
[000106ae] 5c8f                      addq.l     #6,a7

[000106b0] 2f3c 0001 04e4            move.l     #$000104E4,-(a7)
[000106b6] 3f3c 0005                 move.w     #$0005,-(a7)
[000106ba] 4eb9 0001 051c            jsr        $0001051C
[000106c0] 5c8f                      addq.l     #6,a7

[000106c2] 2f3c 0001 04f2            move.l     #$000104F2,-(a7)
[000106c8] 3f3c 0006                 move.w     #$0006,-(a7)
[000106cc] 4eb9 0001 051c            jsr        $0001051C
[000106d2] 5c8f                      addq.l     #6,a7

[000106d4] 2f3c 0001 0500            move.l     #$00010500,-(a7)
[000106da] 3f3c 0007                 move.w     #$0007,-(a7)
[000106de] 4eb9 0001 051c            jsr        $0001051C
[000106e4] 5c8f                      addq.l     #6,a7

[000106e6] 2f3c 0001 050e            move.l     #$0001050E,-(a7)
[000106ec] 3f3c 0008                 move.w     #$0008,-(a7)
[000106f0] 4eb9 0001 051c            jsr        $0001051C
[000106f6] 5c8f                      addq.l     #6,a7

[000106f8] 2f3c 0001 03ea            move.l     #$000103EA,-(a7)
[000106fe] 3f3c 0027                 move.w     #$0027,-(a7)
[00010702] 4eb9 0001 051c            jsr        $0001051C
[00010708] 5c8f                      addq.l     #6,a7

[0001070a] 2f3c 0001 0338            move.l     #$00010338,-(a7)
[00010710] 3f3c 0026                 move.w     #$0026,-(a7)
[00010714] 4eb9 0001 051c            jsr        $0001051C
[0001071a] 5c8f                      addq.l     #6,a7

[0001071c] 2f3c 0001 036c            move.l     #trap5,-(a7)
[00010722] 3f3c 0025                 move.w     #$0025,-(a7)
[00010726] 4eb9 0001 051c            jsr        $0001051C
[0001072c] 5c8f                      addq.l     #6,a7

[0001072e] 23fc 0001 0244 0001 5cae  move.l     #$00010244,ErrorProcessor
[00010738] 7007                      moveq.l    #7,d0
[0001073a] 4e47                      trap       #7
[0001073c] 4ef9 0001 0b40            jmp        GEMAESbase.init+6

[00010742] 4745                      .asciiz   "GEMX"
[00010748] 4d6f                      .asciiz 'Modula-2/ST (c) Copyright Modula 2 Software Ltd. 1985,1986,1987. '
[0001078a] 2863                      .asciiz '(c) Copyright TDI Software Inc. 1985,1986,1987. '
[000107bc] 5468                      .ascizz 'The team : Chris Hall, Paul Curtis, and Phil Camp .'

[000107f0] 5b33 5d5b 4d6f 6475       .asciiz "[3][Modula-2 Run Time Error : | |         #"
[0001081c] 5d5b                      .asciiz "][OK]"

***
* MODULE GEMDOS
***

trap_1_w:
[00010822] 4e56 0000                 link       a6,#0
[00010826] 3f2e 0008                 move.w     8(a6),-(a7)
[0001082a] 4e41                      trap       #1
[0001082c] 2a00                      move.l     d0,d5
[0001082e] 2d45 000a                 move.l     d5,10(a6)
[00010832] 4e5e                      unlk       a6
[00010834] 4e75                      rts

trap_1_ww:
[00010836] 4e56 0000                 link       a6,#0
[0001083a] 3f2e 0008                 move.w     8(a6),-(a7)
[0001083e] 3f2e 000a                 move.w     10(a6),-(a7)
[00010842] 4e41                      trap       #1
[00010844] 2a00                      move.l     d0,d5
[00010846] 2d45 000c                 move.l     d5,12(a6)
[0001084a] 4e5e                      unlk       a6
[0001084c] 4e75                      rts

trap_1_wwll:
[0001084e] 4e56 0000                 link       a6,#0
[00010852] 2f2e 0008                 move.l     8(a6),-(a7)
[00010856] 2f2e 000c                 move.l     12(a6),-(a7)
[0001085a] 3f2e 0010                 move.w     16(a6),-(a7)
[0001085e] 3f2e 0012                 move.w     18(a6),-(a7)
[00010862] 4e41                      trap       #1
[00010864] 2a00                      move.l     d0,d5
[00010866] 2d45 0014                 move.l     d5,20(a6)
[0001086a] 4e5e                      unlk       a6
[0001086c] 4e75                      rts

trap_1_wl:
[0001086e] 4e56 0000                 link       a6,#0
[00010872] 2f2e 0008                 move.l     8(a6),-(a7)
[00010876] 3f2e 000c                 move.w     12(a6),-(a7)
[0001087a] 4e41                      trap       #1
[0001087c] 2a00                      move.l     d0,d5
[0001087e] 2d45 000e                 move.l     d5,14(a6)
[00010882] 4e5e                      unlk       a6
[00010884] 4e75                      rts

trap_1_wlw:
[00010886] 4e56 0000                 link       a6,#0
[0001088a] 3f2e 0008                 move.w     8(a6),-(a7)
[0001088e] 2f2e 000a                 move.l     10(a6),-(a7)
[00010892] 3f2e 000e                 move.w     14(a6),-(a7)
[00010896] 4e41                      trap       #1
[00010898] 2a00                      move.l     d0,d5
[0001089a] 2d45 0010                 move.l     d5,16(a6)
[0001089e] 4e5e                      unlk       a6
[000108a0] 4e75                      rts

trap_1_wlww:
[000108a2] 4e56 0000                 link       a6,#0
[000108a6] 3f2e 0008                 move.w     8(a6),-(a7)
[000108aa] 3f2e 000a                 move.w     10(a6),-(a7)
[000108ae] 2f2e 000c                 move.l     12(a6),-(a7)
[000108b2] 3f2e 0010                 move.w     16(a6),-(a7)
[000108b6] 4e41                      trap       #1
[000108b8] 2a00                      move.l     d0,d5
[000108ba] 2d45 0012                 move.l     d5,18(a6)
[000108be] 4e5e                      unlk       a6
[000108c0] 4e75                      rts

GEMDOS.GetDrv:
[000108c2] 4e56 0000                 link       a6,#0
[000108c6] 598f                      subq.l     #4,a7
[000108c8] 3f3c 0019                 move.w     #$0019,-(a7)
[000108cc] 6100 ff54                 bsr        trap_1_w
[000108d0] 548f                      addq.l     #2,a7
[000108d2] 2a1f                      move.l     (a7)+,d5
[000108d4] 286e 0008                 movea.l    8(a6),a4
[000108d8] 3885                      move.w     d5,(a4)
[000108da] 4e5e                      unlk       a6
[000108dc] 4e75                      rts

GEMDOS.Create:
[000108de] 4e56 0000                 link       a6,#0
[000108e2] 598f                      subq.l     #4,a7
[000108e4] 3f3c 003c                 move.w     #$003C,-(a7)
[000108e8] 286e 000e                 movea.l    14(a6),a4
[000108ec] 2a0c                      move.l     a4,d5
[000108ee] 2f05                      move.l     d5,-(a7)
[000108f0] 3f2e 000c                 move.w     12(a6),-(a7)
[000108f4] 6100 ff90                 bsr.w      trap_1_wlw
[000108f8] 508f                      addq.l     #8,a7
[000108fa] 2a1f                      move.l     (a7)+,d5
[000108fc] 286e 0008                 movea.l    8(a6),a4
[00010900] 3885                      move.w     d5,(a4)
[00010902] 4e5e                      unlk       a6
[00010904] 4e75                      rts

GEMDOS.Open:
[00010906] 4e56 0000                 link       a6,#0
[0001090a] 598f                      subq.l     #4,a7
[0001090c] 3f3c 003d                 move.w     #$003D,-(a7)
[00010910] 286e 000e                 movea.l    14(a6),a4
[00010914] 2a0c                      move.l     a4,d5
[00010916] 2f05                      move.l     d5,-(a7)
[00010918] 3f2e 000c                 move.w     12(a6),-(a7)
[0001091c] 6100 ff68                 bsr        trap_1_wlw
[00010920] 508f                      addq.l     #8,a7
[00010922] 2a1f                      move.l     (a7)+,d5
[00010924] 286e 0008                 movea.l    8(a6),a4
[00010928] 3885                      move.w     d5,(a4)
[0001092a] 4e5e                      unlk       a6
[0001092c] 4e75                      rts

GEMDOS.Close:
[0001092e] 4e56 0000                 link       a6,#0
[00010932] 598f                      subq.l     #4,a7
[00010934] 3f3c 003e                 move.w     #$003E,-(a7)
[00010938] 3f2e 0008                 move.w     8(a6),-(a7)
[0001093c] 6100 fef8                 bsr        trap_1_ww
[00010940] 588f                      addq.l     #4,a7
[00010942] 4a9f                      tst.l      (a7)+
[00010944] 57c5                      seq        d5
[00010946] 4405                      neg.b      d5
[00010948] 1d45 000a                 move.b     d5,10(a6)
[0001094c] 4e5e                      unlk       a6
[0001094e] 4e75                      rts

GEMDOS.Read:
[00010950] 4e56 0000                 link       a6,#0
[00010954] 598f                      subq.l     #4,a7
[00010956] 3f3c 003f                 move.w     #$003F,-(a7)
[0001095a] 3f2e 0010                 move.w     16(a6),-(a7)
[0001095e] 286e 000c                 movea.l    12(a6),a4
[00010962] 2f14                      move.l     (a4),-(a7)
[00010964] 2f2e 0008                 move.l     8(a6),-(a7)
[00010968] 6100 fee4                 bsr        trap_1_wwll
[0001096c] 4fef 000c                 lea.l      12(a7),a7
[00010970] 286e 000c                 movea.l    12(a6),a4
[00010974] 289f                      move.l     (a7)+,(a4)
[00010976] 4e5e                      unlk       a6
[00010978] 4e75                      rts

GEMDOS.Write:
[0001097a] 4e56 0000                 link       a6,#0
[0001097e] 598f                      subq.l     #4,a7
[00010980] 3f3c 0040                 move.w     #$0040,-(a7)
[00010984] 3f2e 0010                 move.w     16(a6),-(a7)
[00010988] 286e 000c                 movea.l    12(a6),a4
[0001098c] 2f14                      move.l     (a4),-(a7)
[0001098e] 2f2e 0008                 move.l     8(a6),-(a7)
[00010992] 6100 feba                 bsr        trap_1_wwll
[00010996] 4fef 000c                 lea.l      12(a7),a7
[0001099a] 286e 000c                 movea.l    12(a6),a4
[0001099e] 289f                      move.l     (a7)+,(a4)
[000109a0] 4e5e                      unlk       a6
[000109a2] 4e75                      rts

GEMDOS.Seek:
[000109a4] 4e56 0000                 link       a6,#0
[000109a8] 598f                      subq.l     #4,a7
[000109aa] 3f3c 0042                 move.w     #$0042,-(a7)
[000109ae] 2f2e 0010                 move.l     16(a6),-(a7)
[000109b2] 3f2e 000e                 move.w     14(a6),-(a7)
[000109b6] 7a00                      moveq.l    #0,d5
[000109b8] 1a2e 000c                 move.b     12(a6),d5
[000109bc] 3f05                      move.w     d5,-(a7)
[000109be] 6100 fee2                 bsr        trap_1_wlww
[000109c2] 4fef 000a                 lea.l      10(a7),a7
[000109c6] 286e 0008                 movea.l    8(a6),a4
[000109ca] 289f                      move.l     (a7)+,(a4)
[000109cc] 4e5e                      unlk       a6
[000109ce] 4e75                      rts

GEMDOS.GetPath:
[000109d0] 4e56 fffc                 link       a6,#-4
[000109d4] 598f                      subq.l     #4,a7
[000109d6] 3f3c 0047                 move.w     #$0047,-(a7)
[000109da] 286e 000a                 movea.l    10(a6),a4
[000109de] 2a0c                      move.l     a4,d5
[000109e0] 2f05                      move.l     d5,-(a7)
[000109e2] 3f2e 0008                 move.w     8(a6),-(a7)
[000109e6] 6100 fe9e                 bsr        trap_1_wlw
[000109ea] 508f                      addq.l     #8,a7
[000109ec] 2d5f fffc                 move.l     (a7)+,-4(a6)
[000109f0] 4e5e                      unlk       a6
[000109f2] 4e75                      rts

GEMDOS.Alloc:
[000109f4] 4e56 0000                 link       a6,#0
[000109f8] 598f                      subq.l     #4,a7
[000109fa] 3f3c 0048                 move.w     #$0048,-(a7)
[000109fe] 2f2e 000c                 move.l     12(a6),-(a7)
[00010a02] 6100 fe6a                 bsr        trap_1_wl
[00010a06] 5c8f                      addq.l     #6,a7
[00010a08] 286e 0008                 movea.l    8(a6),a4
[00010a0c] 289f                      move.l     (a7)+,(a4)
[00010a0e] 4e5e                      unlk       a6
[00010a10] 4e75                      rts

GEMDOS.Free:
[00010a12] 4e56 0000                 link       a6,#0
[00010a16] 598f                      subq.l     #4,a7
[00010a18] 3f3c 0049                 move.w     #$0049,-(a7)
[00010a1c] 2f2e 0008                 move.l     8(a6),-(a7)
[00010a20] 6100 fe4c                 bsr        trap_1_wl
[00010a24] 5c8f                      addq.l     #6,a7
[00010a26] 4a9f                      tst.l      (a7)+
[00010a28] 57c5                      seq        d5
[00010a2a] 4405                      neg.b      d5
[00010a2c] 1d45 000c                 move.b     d5,12(a6)
[00010a30] 4e5e                      unlk       a6
[00010a32] 4e75                      rts

***
* MODULE GEMAESbase
***

GEMAESbase.GemCall:
[00010a34] 4e56 0000                 link       a6,#0
[00010a38] 49f9 0001 5da0            lea.l      $00015DA0,a4
[00010a3e] 38ae 0010                 move.w     16(a6),(a4)
[00010a42] 396e 000e 0002            move.w     14(a6),2(a4)
[00010a48] 396e 000c 0004            move.w     12(a6),4(a4)
[00010a4e] 396e 000a 0006            move.w     10(a6),6(a4)
[00010a54] 396e 0008 0008            move.w     8(a6),8(a4)
[00010a5a] 203c 0000 00c8            move.l     #$000000C8,d0
[00010a60] 49f9 0001 5d6a            lea.l      $00015D6A,a4
[00010a66] 2a0c                      move.l     a4,d5
[00010a68] 2205                      move.l     d5,d1
[00010a6a] 4e42                      trap       #2
[00010a6c] 33f9 0001 5dcc 0001 5df0  move.w     $00015DCC,$00015DF0
[00010a76] 3d79 0001 5df0 0012       move.w     $00015DF0,18(a6)
[00010a7e] 4e5e                      unlk       a6
[00010a80] 4e75                      rts

GEMAESbase.IntIn2:
[00010a82] 4e56 0000                 link       a6,#0
[00010a86] 33ee 000a 0001 5daa       move.w     10(a6),$00015DAA
[00010a8e] 33ee 0008 0001 5dac       move.w     8(a6),$00015DAC
[00010a96] 4e5e                      unlk       a6
[00010a98] 4e75                      rts

GEMAESbase.IntIn4:
[00010a9a] 4e56 0000                 link       a6,#0
[00010a9e] 33ee 000e 0001 5daa       move.w     14(a6),$00015DAA
[00010aa6] 33ee 000c 0001 5dac       move.w     12(a6),$00015DAC
[00010aae] 33ee 000a 0001 5dae       move.w     10(a6),$00015DAE
[00010ab6] 33ee 0008 0001 5db0       move.w     8(a6),$00015DB0
[00010abe] 4e5e                      unlk       a6
[00010ac0] 4e75                      rts

GEMAESbase.IntIn8:
[00010ac2] 4e56 0000                 link       a6,#0
[00010ac6] 33ee 0016 0001 5daa       move.w     22(a6),$00015DAA
[00010ace] 33ee 0014 0001 5dac       move.w     20(a6),$00015DAC
[00010ad6] 33ee 0012 0001 5dae       move.w     18(a6),$00015DAE
[00010ade] 33ee 0010 0001 5db0       move.w     16(a6),$00015DB0
[00010ae6] 33ee 000e 0001 5db2       move.w     14(a6),$00015DB2
[00010aee] 33ee 000c 0001 5db4       move.w     12(a6),$00015DB4
[00010af6] 33ee 000a 0001 5db6       move.w     10(a6),$00015DB6
[00010afe] 33ee 0008 0001 5db8       move.w     8(a6),$00015DB8
[00010b06] 4e5e                      unlk       a6
[00010b08] 4e75                      rts

GEMAESbase.IntOut4:
[00010b0a] 4e56 0000                 link       a6,#0
[00010b0e] 286e 0014                 movea.l    20(a6),a4
[00010b12] 38b9 0001 5dce            move.w     $00015DCE,(a4)
[00010b18] 286e 0010                 movea.l    16(a6),a4
[00010b1c] 38b9 0001 5dd0            move.w     $00015DD0,(a4)
[00010b22] 286e 000c                 movea.l    12(a6),a4
[00010b26] 38b9 0001 5dd2            move.w     $00015DD2,(a4)
[00010b2c] 286e 0008                 movea.l    8(a6),a4
[00010b30] 38b9 0001 5dd4            move.w     $00015DD4,(a4)
[00010b36] 4e5e                      unlk       a6
[00010b38] 4e75                      rts

GEMAESbase.init:
[00010b3a] 4ef9 0001 061a            jmp        GEMX.init

[00010b40] 4e56 0000                 link       a6,#0
[00010b44] 49f9 0001 5d82            lea.l      $00015D82,a4
[00010b4a] 42ac 000a                 clr.l      10(a4)
[00010b4e] 42ac 000e                 clr.l      14(a4)
[00010b52] 42ac 0012                 clr.l      18(a4)
[00010b56] 42ac 0016                 clr.l      22(a4)
[00010b5a] 42ac 001a                 clr.l      26(a4)
[00010b5e] 49f9 0001 5d6a            lea.l      $00015D6A,a4
[00010b64] 47f9 0001 5da0            lea.l      $00015DA0,a3
[00010b6a] 2a0b                      move.l     a3,d5
[00010b6c] 2885                      move.l     d5,(a4)
[00010b6e] 47f9 0001 5d82            lea.l      $00015D82,a3
[00010b74] 2a0b                      move.l     a3,d5
[00010b76] 2945 0004                 move.l     d5,4(a4)
[00010b7a] 47f9 0001 5daa            lea.l      $00015DAA,a3
[00010b80] 2a0b                      move.l     a3,d5
[00010b82] 2945 0008                 move.l     d5,8(a4)
[00010b86] 47f9 0001 5dcc            lea.l      $00015DCC,a3
[00010b8c] 2a0b                      move.l     a3,d5
[00010b8e] 2945 000c                 move.l     d5,12(a4)
[00010b92] 47f9 0001 5ddc            lea.l      $00015DDC,a3
[00010b98] 2a0b                      move.l     a3,d5
[00010b9a] 2945 0010                 move.l     d5,16(a4)
[00010b9e] 47f9 0001 5de8            lea.l      $00015DE8,a3
[00010ba4] 2a0b                      move.l     a3,d5
[00010ba6] 2945 0014                 move.l     d5,20(a4)
[00010baa] 4e5e                      unlk       a6
[00010bac] 4ef9 0001 0f02            jmp        GEMVDIbase.init+6

***
* MODULE AESGraphics
***

AESGraphics.GrafGrowBox:
[00010bb2] 4e56 0000                 link       a6,#0
[00010bb6] 3f2e 0016                 move.w     22(a6),-(a7)
[00010bba] 3f2e 0014                 move.w     20(a6),-(a7)
[00010bbe] 3f2e 0012                 move.w     18(a6),-(a7)
[00010bc2] 3f2e 0010                 move.w     16(a6),-(a7)
[00010bc6] 3f2e 000e                 move.w     14(a6),-(a7)
[00010bca] 3f2e 000c                 move.w     12(a6),-(a7)
[00010bce] 3f2e 000a                 move.w     10(a6),-(a7)
[00010bd2] 3f2e 0008                 move.w     8(a6),-(a7)
[00010bd6] 4eb9 0001 0ac2            jsr        GEMAESbase.IntIn8
[00010bdc] 4fef 0010                 lea.l      16(a7),a7
[00010be0] 558f                      subq.l     #2,a7
[00010be2] 3f3c 0049                 move.w     #$0049,-(a7)
[00010be6] 3f3c 0008                 move.w     #$0008,-(a7)
[00010bea] 3f3c 0001                 move.w     #$0001,-(a7)
[00010bee] 4267                      clr.w      -(a7)
[00010bf0] 4267                      clr.w      -(a7)
[00010bf2] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00010bf8] 4fef 000a                 lea.l      10(a7),a7
[00010bfc] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[00010c02] 4e5e                      unlk       a6
[00010c04] 4e75                      rts

AESGraphics.GrafShrinkBox:
[00010c06] 4e56 0000                 link       a6,#0
[00010c0a] 3f2e 0016                 move.w     22(a6),-(a7)
[00010c0e] 3f2e 0014                 move.w     20(a6),-(a7)
[00010c12] 3f2e 0012                 move.w     18(a6),-(a7)
[00010c16] 3f2e 0010                 move.w     16(a6),-(a7)
[00010c1a] 3f2e 000e                 move.w     14(a6),-(a7)
[00010c1e] 3f2e 000c                 move.w     12(a6),-(a7)
[00010c22] 3f2e 000a                 move.w     10(a6),-(a7)
[00010c26] 3f2e 0008                 move.w     8(a6),-(a7)
[00010c2a] 4eb9 0001 0ac2            jsr        GEMAESbase.IntIn8
[00010c30] 4fef 0010                 lea.l      16(a7),a7
[00010c34] 558f                      subq.l     #2,a7
[00010c36] 3f3c 004a                 move.w     #$004A,-(a7)
[00010c3a] 3f3c 0008                 move.w     #$0008,-(a7)
[00010c3e] 3f3c 0001                 move.w     #$0001,-(a7)
[00010c42] 4267                      clr.w      -(a7)
[00010c44] 4267                      clr.w      -(a7)
[00010c46] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00010c4c] 4fef 000a                 lea.l      10(a7),a7
[00010c50] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[00010c56] 4e5e                      unlk       a6
[00010c58] 4e75                      rts

AESGraphics.GrafHandle:
[00010c5a] 4e56 fffe                 link       a6,#-2
[00010c5e] 558f                      subq.l     #2,a7
[00010c60] 3f3c 004d                 move.w     #$004D,-(a7)
[00010c64] 4267                      clr.w      -(a7)
[00010c66] 3f3c 0005                 move.w     #$0005,-(a7)
[00010c6a] 4267                      clr.w      -(a7)
[00010c6c] 4267                      clr.w      -(a7)
[00010c6e] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00010c74] 4fef 000a                 lea.l      10(a7),a7
[00010c78] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00010c7c] 286e 0014                 movea.l    20(a6),a4
[00010c80] 4854                      pea.l      (a4)
[00010c82] 286e 0010                 movea.l    16(a6),a4
[00010c86] 4854                      pea.l      (a4)
[00010c88] 286e 000c                 movea.l    12(a6),a4
[00010c8c] 4854                      pea.l      (a4)
[00010c8e] 286e 0008                 movea.l    8(a6),a4
[00010c92] 4854                      pea.l      (a4)
[00010c94] 4eb9 0001 0b0a            jsr        GEMAESbase.IntOut4
[00010c9a] 4fef 0010                 lea.l      16(a7),a7
[00010c9e] 3d6e fffe 0018            move.w     -2(a6),24(a6)
[00010ca4] 4e5e                      unlk       a6
[00010ca6] 4e75                      rts

AESGraphics.GrafMouse:
[00010ca8] 4e56 0000                 link       a6,#0
[00010cac] 33ee 000c 0001 5daa       move.w     12(a6),$00015DAA
[00010cb4] 23ee 0008 0001 5ddc       move.l     8(a6),$00015DDC
[00010cbc] 558f                      subq.l     #2,a7
[00010cbe] 3f3c 004e                 move.w     #$004E,-(a7)
[00010cc2] 3f3c 0001                 move.w     #$0001,-(a7)
[00010cc6] 3f3c 0001                 move.w     #$0001,-(a7)
[00010cca] 3f3c 0001                 move.w     #$0001,-(a7)
[00010cce] 4267                      clr.w      -(a7)
[00010cd0] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00010cd6] 4fef 000a                 lea.l      10(a7),a7
[00010cda] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[00010ce0] 4e5e                      unlk       a6
[00010ce2] 4e75                      rts

***
* MODULE AESWindows
***

AESWindows.WindowCreate:
[00010ce4] 4e56 0000                 link       a6,#0
[00010ce8] 3f2e 0010                 move.w     16(a6),-(a7)
[00010cec] 3f2e 000e                 move.w     14(a6),-(a7)
[00010cf0] 3f2e 000c                 move.w     12(a6),-(a7)
[00010cf4] 3f2e 000a                 move.w     10(a6),-(a7)
[00010cf8] 4eb9 0001 0a9a            jsr        GEMAESbase.IntIn4
[00010cfe] 508f                      addq.l     #8,a7
[00010d00] 33ee 0008 0001 5db2       move.w     8(a6),$00015DB2
[00010d08] 558f                      subq.l     #2,a7
[00010d0a] 3f3c 0064                 move.w     #$0064,-(a7)
[00010d0e] 3f3c 0005                 move.w     #$0005,-(a7)
[00010d12] 3f3c 0001                 move.w     #$0001,-(a7)
[00010d16] 4267                      clr.w      -(a7)
[00010d18] 4267                      clr.w      -(a7)
[00010d1a] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00010d20] 4fef 000a                 lea.l      10(a7),a7
[00010d24] 3d5f 0012                 move.w     (a7)+,18(a6)
[00010d28] 4e5e                      unlk       a6
[00010d2a] 4e75                      rts

AESWindows.WindowOpen:
[00010d2c] 4e56 0000                 link       a6,#0
[00010d30] 3f2e 0010                 move.w     16(a6),-(a7)
[00010d34] 3f2e 000e                 move.w     14(a6),-(a7)
[00010d38] 3f2e 000c                 move.w     12(a6),-(a7)
[00010d3c] 3f2e 000a                 move.w     10(a6),-(a7)
[00010d40] 4eb9 0001 0a9a            jsr        GEMAESbase.IntIn4
[00010d46] 508f                      addq.l     #8,a7
[00010d48] 33ee 0008 0001 5db2       move.w     8(a6),$00015DB2
[00010d50] 558f                      subq.l     #2,a7
[00010d52] 3f3c 0065                 move.w     #$0065,-(a7)
[00010d56] 3f3c 0005                 move.w     #$0005,-(a7)
[00010d5a] 3f3c 0001                 move.w     #$0001,-(a7)
[00010d5e] 4267                      clr.w      -(a7)
[00010d60] 4267                      clr.w      -(a7)
[00010d62] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00010d68] 4fef 000a                 lea.l      10(a7),a7
[00010d6c] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[00010d72] 4e5e                      unlk       a6
[00010d74] 4e75                      rts

AESWindows.WindowClose:
[00010d76] 4e56 0000                 link       a6,#0
[00010d7a] 33ee 0008 0001 5daa       move.w     8(a6),$00015DAA
[00010d82] 558f                      subq.l     #2,a7
[00010d84] 3f3c 0066                 move.w     #$0066,-(a7)
[00010d88] 3f3c 0001                 move.w     #$0001,-(a7)
[00010d8c] 3f3c 0001                 move.w     #$0001,-(a7)
[00010d90] 4267                      clr.w      -(a7)
[00010d92] 4267                      clr.w      -(a7)
[00010d94] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00010d9a] 4fef 000a                 lea.l      10(a7),a7
[00010d9e] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[00010da4] 4e5e                      unlk       a6
[00010da6] 4e75                      rts

AESWindows.WindowDelete:
[00010da8] 4e56 0000                 link       a6,#0
[00010dac] 33ee 0008 0001 5daa       move.w     8(a6),$00015DAA
[00010db4] 558f                      subq.l     #2,a7
[00010db6] 3f3c 0067                 move.w     #$0067,-(a7)
[00010dba] 3f3c 0001                 move.w     #$0001,-(a7)
[00010dbe] 3f3c 0001                 move.w     #$0001,-(a7)
[00010dc2] 4267                      clr.w      -(a7)
[00010dc4] 4267                      clr.w      -(a7)
[00010dc6] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00010dcc] 4fef 000a                 lea.l      10(a7),a7
[00010dd0] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[00010dd6] 4e5e                      unlk       a6
[00010dd8] 4e75                      rts

AESWindows.WindowGet:
[00010dda] 4e56 0000                 link       a6,#0
[00010dde] 3f2e 001a                 move.w     26(a6),-(a7)
[00010de2] 3f2e 0018                 move.w     24(a6),-(a7)
[00010de6] 4eb9 0001 0a82            jsr        GEMAESbase.IntIn2
[00010dec] 588f                      addq.l     #4,a7
[00010dee] 558f                      subq.l     #2,a7
[00010df0] 3f3c 0068                 move.w     #$0068,-(a7)
[00010df4] 3f3c 0002                 move.w     #$0002,-(a7)
[00010df8] 3f3c 0005                 move.w     #$0005,-(a7)
[00010dfc] 4267                      clr.w      -(a7)
[00010dfe] 4267                      clr.w      -(a7)
[00010e00] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00010e06] 4fef 000a                 lea.l      10(a7),a7
[00010e0a] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[00010e10] 286e 0014                 movea.l    20(a6),a4
[00010e14] 4854                      pea.l      (a4)
[00010e16] 286e 0010                 movea.l    16(a6),a4
[00010e1a] 4854                      pea.l      (a4)
[00010e1c] 286e 000c                 movea.l    12(a6),a4
[00010e20] 4854                      pea.l      (a4)
[00010e22] 286e 0008                 movea.l    8(a6),a4
[00010e26] 4854                      pea.l      (a4)
[00010e28] 4eb9 0001 0b0a            jsr        GEMAESbase.IntOut4
[00010e2e] 4fef 0010                 lea.l      16(a7),a7
[00010e32] 4e5e                      unlk       a6
[00010e34] 4e75                      rts

AESWindows.WindowSet:
[00010e36] 4e56 0000                 link       a6,#0
[00010e3a] 3f2e 0012                 move.w     18(a6),-(a7)
[00010e3e] 3f2e 0010                 move.w     16(a6),-(a7)
[00010e42] 3f2e 000e                 move.w     14(a6),-(a7)
[00010e46] 3f2e 000c                 move.w     12(a6),-(a7)
[00010e4a] 4eb9 0001 0a9a            jsr        GEMAESbase.IntIn4
[00010e50] 508f                      addq.l     #8,a7
[00010e52] 33ee 000a 0001 5db2       move.w     10(a6),$00015DB2
[00010e5a] 33ee 0008 0001 5db4       move.w     8(a6),$00015DB4
[00010e62] 558f                      subq.l     #2,a7
[00010e64] 3f3c 0069                 move.w     #$0069,-(a7)
[00010e68] 3f3c 0006                 move.w     #$0006,-(a7)
[00010e6c] 3f3c 0001                 move.w     #$0001,-(a7)
[00010e70] 4267                      clr.w      -(a7)
[00010e72] 4267                      clr.w      -(a7)
[00010e74] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00010e7a] 4fef 000a                 lea.l      10(a7),a7
[00010e7e] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[00010e84] 4e5e                      unlk       a6
[00010e86] 4e75                      rts

AESWindows.WindowUpdate:
[00010e88] 4e56 0000                 link       a6,#0
[00010e8c] 33ee 0008 0001 5daa       move.w     8(a6),$00015DAA
[00010e94] 558f                      subq.l     #2,a7
[00010e96] 3f3c 006b                 move.w     #$006B,-(a7)
[00010e9a] 3f3c 0001                 move.w     #$0001,-(a7)
[00010e9e] 3f3c 0001                 move.w     #$0001,-(a7)
[00010ea2] 4267                      clr.w      -(a7)
[00010ea4] 4267                      clr.w      -(a7)
[00010ea6] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00010eac] 4fef 000a                 lea.l      10(a7),a7
[00010eb0] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[00010eb6] 4e5e                      unlk       a6
[00010eb8] 4e75                      rts

***
* MODULE GEMVDIbase
***

GEMVDIbase.CallVDI:
[00010eba] 4e56 0000                 link       a6,#0
[00010ebe] 7073                      moveq.l    #115,d0
[00010ec0] 2239 0001 621e            move.l     $0001621E,d1
[00010ec6] 4e42                      trap       #2
[00010ec8] 4e5e                      unlk       a6
[00010eca] 4e75                      rts

GEMVDIbase.SetContrl:
[00010ecc] 4e56 0000                 link       a6,#0
[00010ed0] 33ee 0010 0001 5df2       move.w     16(a6),$00015DF2
[00010ed8] 33ee 000e 0001 5df4       move.w     14(a6),$00015DF4
[00010ee0] 33ee 000c 0001 5df8       move.w     12(a6),$00015DF8
[00010ee8] 33ee 000a 0001 5dfc       move.w     10(a6),$00015DFC
[00010ef0] 33ee 0008 0001 5dfe       move.w     8(a6),$00015DFE
[00010ef8] 4e5e                      unlk       a6
[00010efa] 4e75                      rts

GEMVDIbase.init:
[00010efc] 4ef9 0001 0b3a            jmp        GEMAESbase.init

[00010f02] 4e56 0000                 link       a6,#0
[00010f06] 49f9 0001 5e0a            lea.l      $00015E0A,a4
[00010f0c] 2a0c                      move.l     a4,d5
[00010f0e] 23c5 0001 620e            move.l     d5,$0001620E
[00010f14] 49f9 0001 5f0a            lea.l      $00015F0A,a4
[00010f1a] 2a0c                      move.l     a4,d5
[00010f1c] 23c5 0001 6212            move.l     d5,$00016212
[00010f22] 49f9 0001 600a            lea.l      $0001600A,a4
[00010f28] 2a0c                      move.l     a4,d5
[00010f2a] 23c5 0001 6216            move.l     d5,$00016216
[00010f30] 49f9 0001 610a            lea.l      $0001610A,a4
[00010f36] 2a0c                      move.l     a4,d5
[00010f38] 23c5 0001 621a            move.l     d5,$0001621A
[00010f3e] 49f9 0001 5df2            lea.l      $00015DF2,a4
[00010f44] 2a0c                      move.l     a4,d5
[00010f46] 23c5 0001 6222            move.l     d5,$00016222
[00010f4c] 23f9 0001 620e 0001 6226  move.l     $0001620E,$00016226
[00010f56] 23f9 0001 6212 0001 622a  move.l     $00016212,$0001622A
[00010f60] 23f9 0001 6216 0001 622e  move.l     $00016216,$0001622E
[00010f6a] 23f9 0001 621a 0001 6232  move.l     $0001621A,$00016232
[00010f74] 49f9 0001 6222            lea.l      $00016222,a4
[00010f7a] 2a0c                      move.l     a4,d5
[00010f7c] 23c5 0001 621e            move.l     d5,$0001621E
[00010f82] 4e5e                      unlk       a6
[00010f84] 4ef9 0001 129c            jmp        $0001129C

***
* MODULE VDIAttribs
***

VDIAttribs.SetGraphicTextAlignment:
[00010f8a] 4e56 0000                 link       a6,#0
[00010f8e] 33ee 0012 0001 5e0a       move.w     18(a6),$00015E0A
[00010f96] 33ee 0010 0001 5e0c       move.w     16(a6),$00015E0C
[00010f9e] 3f3c 0027                 move.w     #$0027,-(a7)
[00010fa2] 4267                      clr.w      -(a7)
[00010fa4] 3f3c 0002                 move.w     #$0002,-(a7)
[00010fa8] 4267                      clr.w      -(a7)
[00010faa] 3f2e 0014                 move.w     20(a6),-(a7)
[00010fae] 4eb9 0001 0ecc            jsr        GEMVDIbase.SetContrl
[00010fb4] 4fef 000a                 lea.l      10(a7),a7
[00010fb8] 4eb9 0001 0eba            jsr        GEMVDIbase.CallVDI
[00010fbe] 286e 000c                 movea.l    12(a6),a4
[00010fc2] 38b9 0001 600a            move.w     $0001600A,(a4)
[00010fc8] 286e 0008                 movea.l    8(a6),a4
[00010fcc] 38b9 0001 600c            move.w     $0001600C,(a4)
[00010fd2] 4e5e                      unlk       a6
[00010fd4] 4e75                      rts

VDIAttribs.SetFillInteriorStyle:
[00010fd6] 4e56 0000                 link       a6,#0
[00010fda] 33ee 0008 0001 5e0a       move.w     8(a6),$00015E0A
[00010fe2] 3f3c 0017                 move.w     #$0017,-(a7)
[00010fe6] 4267                      clr.w      -(a7)
[00010fe8] 3f3c 0001                 move.w     #$0001,-(a7)
[00010fec] 4267                      clr.w      -(a7)
[00010fee] 3f2e 000a                 move.w     10(a6),-(a7)
[00010ff2] 4eb9 0001 0ecc            jsr        GEMVDIbase.SetContrl
[00010ff8] 4fef 000a                 lea.l      10(a7),a7
[00010ffc] 4eb9 0001 0eba            jsr        GEMVDIbase.CallVDI
[00011002] 3d79 0001 600a 000c       move.w     $0001600A,12(a6)
[0001100a] 4e5e                      unlk       a6
[0001100c] 4e75                      rts

VDIAttribs.SetFillColour:
[0001100e] 4e56 0000                 link       a6,#0
[00011012] 33ee 0008 0001 5e0a       move.w     8(a6),$00015E0A
[0001101a] 3f3c 0019                 move.w     #$0019,-(a7)
[0001101e] 4267                      clr.w      -(a7)
[00011020] 3f3c 0001                 move.w     #$0001,-(a7)
[00011024] 4267                      clr.w      -(a7)
[00011026] 3f2e 000a                 move.w     10(a6),-(a7)
[0001102a] 4eb9 0001 0ecc            jsr        GEMVDIbase.SetContrl
[00011030] 4fef 000a                 lea.l      10(a7),a7
[00011034] 4eb9 0001 0eba            jsr        GEMVDIbase.CallVDI
[0001103a] 3d79 0001 600a 000c       move.w     $0001600A,12(a6)
[00011042] 4e5e                      unlk       a6
[00011044] 4e75                      rts

***
* MODULE VDIOutputs
***

VDIOutputs.GraphicText:
[00011046] 4e56 0000                 link       a6,#0
[0001104a] 4279 0001 623a            clr.w      $0001623A
[00011050] 33ee 000c 0001 623c       move.w     12(a6),$0001623C
[00011058] 3a39 0001 623a            move.w     $0001623A,d5
[0001105e] ba79 0001 623c            cmp.w      $0001623C,d5
[00011064] 6e10                      bgt.s      $00011076
[00011066] 3a39 0001 623a            move.w     $0001623A,d5
[0001106c] 286e 0008                 movea.l    8(a6),a4
[00011070] 4a34 5000                 tst.b      0(a4,d5.w)
[00011074] 6604                      bne.s      $0001107A
[00011076] 4efa 002c                 jmp        $000110A4(pc)
[0001107a] 3a39 0001 623a            move.w     $0001623A,d5
[00011080] 286e 0008                 movea.l    8(a6),a4
[00011084] 7800                      moveq.l    #0,d4
[00011086] 1834 5000                 move.b     0(a4,d5.w),d4
[0001108a] 3a39 0001 623a            move.w     $0001623A,d5
[00011090] da45                      add.w      d5,d5
[00011092] 49f9 0001 5e0a            lea.l      $00015E0A,a4
[00011098] 3984 5000                 move.w     d4,0(a4,d5.w)
[0001109c] 5279 0001 623a            addq.w     #1,$0001623A
[000110a2] 60b4                      bra.s      $00011058
[000110a4] 3f3c 0008                 move.w     #$0008,-(a7)
[000110a8] 3f3c 0001                 move.w     #$0001,-(a7)
[000110ac] 3f39 0001 623a            move.w     $0001623A,-(a7)
[000110b2] 4267                      clr.w      -(a7)
[000110b4] 3f2e 0012                 move.w     18(a6),-(a7)
[000110b8] 4eb9 0001 0ecc            jsr        GEMVDIbase.SetContrl
[000110be] 4fef 000a                 lea.l      10(a7),a7
[000110c2] 33ee 0010 0001 5f0a       move.w     16(a6),$00015F0A
[000110ca] 33ee 000e 0001 5f0c       move.w     14(a6),$00015F0C
[000110d2] 4eb9 0001 0eba            jsr        GEMVDIbase.CallVDI
[000110d8] 4e5e                      unlk       a6
[000110da] 4e75                      rts

VDIOutputs.FillRectangle:
[000110dc] 4e56 0000                 link       a6,#0
[000110e0] 3f3c 0072                 move.w     #$0072,-(a7)
[000110e4] 3f3c 0002                 move.w     #$0002,-(a7)
[000110e8] 4267                      clr.w      -(a7)
[000110ea] 4267                      clr.w      -(a7)
[000110ec] 3f2e 000c                 move.w     12(a6),-(a7)
[000110f0] 4eb9 0001 0ecc            jsr        GEMVDIbase.SetContrl
[000110f6] 4fef 000a                 lea.l      10(a7),a7
[000110fa] 286e 0008                 movea.l    8(a6),a4
[000110fe] 2a0c                      move.l     a4,d5
[00011100] 23c5 0001 622a            move.l     d5,$0001622A
[00011106] 4eb9 0001 0eba            jsr        GEMVDIbase.CallVDI
[0001110c] 23f9 0001 6212 0001 622a  move.l     $00016212,$0001622A
[00011116] 4e5e                      unlk       a6
[00011118] 4e75                      rts

***
* MODULE VDIControls
***

VDIControls.OpenVirtualWorkstation:
[0001111a] 4e56 0000                 link       a6,#0
[0001111e] 3f3c 0064                 move.w     #$0064,-(a7)
[00011122] 4267                      clr.w      -(a7)
[00011124] 3f3c 000b                 move.w     #$000B,-(a7)
[00011128] 4267                      clr.w      -(a7)
[0001112a] 286e 000c                 movea.l    12(a6),a4
[0001112e] 3f14                      move.w     (a4),-(a7)
[00011130] 4eb9 0001 0ecc            jsr        GEMVDIbase.SetContrl
[00011136] 4fef 000a                 lea.l      10(a7),a7
[0001113a] 4279 0001 623e            clr.w      $0001623E
[00011140] 3a39 0001 623e            move.w     $0001623E,d5
[00011146] 286e 0010                 movea.l    16(a6),a4
[0001114a] da45                      add.w      d5,d5
[0001114c] 3839 0001 623e            move.w     $0001623E,d4
[00011152] d844                      add.w      d4,d4
[00011154] 47f9 0001 5e0a            lea.l      $00015E0A,a3
[0001115a] 37b4 5000 4000            move.w     0(a4,d5.w),0(a3,d4.w)
[00011160] 5279 0001 623e            addq.w     #1,$0001623E
[00011166] 0c79 000b 0001 623e       cmpi.w     #$000B,$0001623E
[0001116e] 66d0                      bne.s      $00011140
[00011170] 4eb9 0001 0eba            jsr        GEMVDIbase.CallVDI
[00011176] 4279 0001 623e            clr.w      $0001623E
[0001117c] 3a39 0001 623e            move.w     $0001623E,d5
[00011182] da45                      add.w      d5,d5
[00011184] 49f9 0001 600a            lea.l      $0001600A,a4
[0001118a] 3839 0001 623e            move.w     $0001623E,d4
[00011190] 266e 0008                 movea.l    8(a6),a3
[00011194] d844                      add.w      d4,d4
[00011196] 37b4 5000 4000            move.w     0(a4,d5.w),0(a3,d4.w)
[0001119c] 5279 0001 623e            addq.w     #1,$0001623E
[000111a2] 0c79 002d 0001 623e       cmpi.w     #$002D,$0001623E
[000111aa] 66d0                      bne.s      $0001117C
[000111ac] 33fc 002d 0001 623e       move.w     #$002D,$0001623E
[000111b4] 3a39 0001 623e            move.w     $0001623E,d5
[000111ba] 0445 002d                 subi.w     #$002D,d5
[000111be] da45                      add.w      d5,d5
[000111c0] 49f9 0001 610a            lea.l      $0001610A,a4
[000111c6] 3839 0001 623e            move.w     $0001623E,d4
[000111cc] 266e 0008                 movea.l    8(a6),a3
[000111d0] d844                      add.w      d4,d4
[000111d2] 37b4 5000 4000            move.w     0(a4,d5.w),0(a3,d4.w)
[000111d8] 5279 0001 623e            addq.w     #1,$0001623E
[000111de] 0c79 0039 0001 623e       cmpi.w     #$0039,$0001623E
[000111e6] 66cc                      bne.s      $000111B4
[000111e8] 286e 000c                 movea.l    12(a6),a4
[000111ec] 38b9 0001 5dfe            move.w     $00015DFE,(a4)
[000111f2] 4e5e                      unlk       a6
[000111f4] 4e75                      rts

VDIControls.CloseVirtualWorkstation:
[000111f6] 4e56 0000                 link       a6,#0
[000111fa] 3f3c 0065                 move.w     #$0065,-(a7)
[000111fe] 4267                      clr.w      -(a7)
[00011200] 4267                      clr.w      -(a7)
[00011202] 4267                      clr.w      -(a7)
[00011204] 3f2e 0008                 move.w     8(a6),-(a7)
[00011208] 4eb9 0001 0ecc            jsr        GEMVDIbase.SetContrl
[0001120e] 4fef 000a                 lea.l      10(a7),a7
[00011212] 4eb9 0001 0eba            jsr        GEMVDIbase.CallVDI
[00011218] 4e5e                      unlk       a6
[0001121a] 4e75                      rts

***
* MODULE VDIRasters
***

VDIRasters.CopyRasterOpaque:
[0001121c] 4e56 0000                 link       a6,#0
[00011220] 33ee 0014 0001 5e0a       move.w     20(a6),$00015E0A
[00011228] 286e 0010                 movea.l    16(a6),a4
[0001122c] 2a0c                      move.l     a4,d5
[0001122e] 23c5 0001 622a            move.l     d5,$0001622A
[00011234] 3f3c 006d                 move.w     #$006D,-(a7)
[00011238] 3f3c 0004                 move.w     #$0004,-(a7)
[0001123c] 3f3c 0001                 move.w     #$0001,-(a7)
[00011240] 4267                      clr.w      -(a7)
[00011242] 3f2e 0016                 move.w     22(a6),-(a7)
[00011246] 4eb9 0001 0ecc            jsr        GEMVDIbase.SetContrl
[0001124c] 4fef 000a                 lea.l      10(a7),a7
[00011250] 49f9 0001 6246            lea.l      $00016246,a4
[00011256] 28ae 000c                 move.l     12(a6),(a4)
[0001125a] 33d4 0001 5e00            move.w     (a4),$00015E00
[00011260] 33ec 0002 0001 5e02       move.w     2(a4),$00015E02
[00011268] 28ae 0008                 move.l     8(a6),(a4)
[0001126c] 33d4 0001 5e04            move.w     (a4),$00015E04
[00011272] 33ec 0002 0001 5e06       move.w     2(a4),$00015E06
[0001127a] 4eb9 0001 0eba            jsr        GEMVDIbase.CallVDI
[00011280] 23f9 0001 6212 0001 622a  move.l     $00016212,$0001622A
[0001128a] 4e5e                      unlk       a6
[0001128c] 4e75                      rts

***
* MODULE AppBase 
***

[0001128e] 4e56 0000                 link       a6,#0
[00011292] 4e5e                      unlk       a6
[00011294] 4e75                      rts

.init
[00011296] 4ef9 0001 0efc            jmp        GEMVDIbase.init

[0001129c] 4e56 0000                 link       a6,#0
[000112a0] 23fc 0001 128e 0001 6250  move.l     #$0001128E,AppBase.doUpdateWindow
[000112aa] 33fc ffff 0001 624a       move.w     #$FFFF,AppBase.apId ; apid
[000112b2] 33fc ffff 0001 624e       move.w     #$FFFF,AppBase.vdiHandle ; vdihandle
[000112ba] 33fc ffff 0001 624c       move.w     #$FFFF,AppBase.wdwHandle ; window handle
[000112c2] 42b9 0001 6254            clr.l      AppBase.openFiles
[000112c8] 42b9 0001 6258            clr.l      AppBase.openStreams
[000112ce] 4239 0001 625c            clr.b      AppBase.shellTail
[000112d4] 4e5e                      unlk       a6
[000112d6] 4ef9 0001 19e0            jmp        $000119E0

***
* MODULE AppWindow
***

PROCEDURE mouseOn(on: BOOLEAN);
[000112dc] 4e56 0000                 link       a6,#0
[000112e0] 4a2e 0008                 tst.b      8(a6)
[000112e4] 6714                      beq.s      $000112FA
[000112e6] 3f3c 0101                 move.w     #$0101,-(a7)
[000112ea] 7aff                      moveq.l    #-1,d5
[000112ec] 2f05                      move.l     d5,-(a7)
[000112ee] 4eb9 0001 0ca8            jsr        AESGraphics.GrafMouse
[000112f4] 5c8f                      addq.l     #6,a7
[000112f6] 4efa 0012                 jmp        $0001130A(pc)
[000112fa] 3f3c 0100                 move.w     #$0100,-(a7)
[000112fe] 7aff                      moveq.l    #-1,d5
[00011300] 2f05                      move.l     d5,-(a7)
[00011302] 4eb9 0001 0ca8            jsr        AESGraphics.GrafMouse
[00011308] 5c8f                      addq.l     #6,a7
[0001130a] 4e5e                      unlk       a6
[0001130c] 4e75                      rts

AppWindow.WriteString:
[0001130e] 4e56 fffc                 link       a6,#-4
[00011312] 4227                      clr.b      -(a7)
[00011314] 4eb9 0001 12dc            jsr        mouseOn
[0001131a] 548f                      addq.l     #2,a7
[0001131c] 3f39 0001 624e            move.w     AppBase.vdiHandle,-(a7)
[00011322] 3a39 0001 62be            move.w     AppWindow.CursorX,d5
[00011328] cbf9 0001 62ae            muls.w     AppWindow.wchar,d5
[0001132e] da79 0001 62b6            add.w      AppWindow.workx,d5
[00011334] 3f05                      move.w     d5,-(a7)
[00011336] 3a39 0001 62c0            move.w     AppWindow.CursorY,d5
[0001133c] cbf9 0001 62b0            muls.w     AppWindow.hchar,d5
[00011342] da79 0001 62b8            add.w      AppWindow.worky,d5
[00011348] 3f05                      move.w     d5,-(a7)
[0001134a] 3a2e 000c                 move.w     12(a6),d5
[0001134e] 3f05                      move.w     d5,-(a7)
[00011350] 286e 0008                 movea.l    8(a6),a4
[00011354] 4854                      pea.l      (a4)
[00011356] 4eb9 0001 1046            jsr        VDIOutputs.GraphicText
[0001135c] 4fef 000c                 lea.l      12(a7),a7
[00011360] 426e fffc                 clr.w      -4(a6)
[00011364] 3a2e fffc                 move.w     -4(a6),d5
[00011368] ba6e 000c                 cmp.w      12(a6),d5
[0001136c] 6250                      bhi.s      $000113BE
[0001136e] 3a2e fffc                 move.w     -4(a6),d5
[00011372] 286e 0008                 movea.l    8(a6),a4
[00011376] 4a34 5000                 tst.b      0(a4,d5.w)
[0001137a] 6742                      beq.s      $000113BE
[0001137c] 3a39 0001 62be            move.w     AppWindow.CursorX,d5
[00011382] da6e fffc                 add.w      -4(a6),d5
[00011386] 0c45 0010                 cmpi.w     #$0010,d5
[0001138a] 652c                      bcs.s      $000113B8
[0001138c] 3a2e fffc                 move.w     -4(a6),d5
[00011390] 286e 0008                 movea.l    8(a6),a4
[00011394] 3839 0001 62c0            move.w     AppWindow.CursorY,d4
[0001139a] c8fc 0032                 mulu.w     #$0032,d4
[0001139e] 47f9 0001 6292            lea.l      $00016292,a3 AppWindow.screenBuffer
[000113a4] 3639 0001 62be            move.w     AppWindow.CursorX,d3
[000113aa] d66e fffc                 add.w      -4(a6),d3
[000113ae] 47f3 40f0                 lea.l      -16(a3,d4.w),a3
[000113b2] 17b4 5000 3000            move.b     0(a4,d5.w),0(a3,d3.w)
[000113b8] 526e fffc                 addq.w     #1,-4(a6)
[000113bc] 60a6                      bra.s      $00011364
[000113be] 3a2e fffc                 move.w     -4(a6),d5
[000113c2] db79 0001 62be            add.w      d5,AppWindow.CursorX
[000113c8] 1f3c 0001                 move.b     #$01,-(a7)
[000113cc] 4eb9 0001 12dc            jsr        mouseOn
[000113d2] 548f                      addq.l     #2,a7
[000113d4] 4e5e                      unlk       a6
[000113d6] 4e75                      rts

AppWindow.WriteLn
[000113d8] 4e56 ffdc                 link       a6,#-36
[000113dc] 3a39 0001 62be            move.w     AppWindow.CursorX,d5
[000113e2] 5345                      subq.w     #1,d5
[000113e4] 3839 0001 62c0            move.w     AppWindow.CursorY,d4
[000113ea] d844                      add.w      d4,d4
[000113ec] 49f9 0001 6772            lea.l      $00016772,a4 lineLength
[000113f2] 3985 4000                 move.w     d5,0(a4,d4.w)
[000113f6] 3a39 0001 62c0            move.w     AppWindow.CursorY,d5
[000113fc] ba79 0001 62c2            cmp.w      winrows,d5
[00011402] 6d02                      blt.s      $00011406
[00011404] 6004                      bra.s      $0001140A
[00011406] 4efa 0218                 jmp        $00011620(pc)
[0001140a] 3d79 0001 6774 ffdc       move.w     $00016774,-36(a6)
[00011412] 3d7c 0002 ffde            move.w     #$0002,-34(a6)
[00011418] 3a39 0001 62c2            move.w     winrows,d5
[0001141e] 3f05                      move.w     d5,-(a7)
[00011420] 302e ffde                 move.w     -34(a6),d0
[00011424] b057                      cmp.w      (a7),d0
[00011426] 6304                      bls.s      $0001142C
[00011428] 4efa 0088                 jmp        $000114B2(pc)
[0001142c] 3a2e ffde                 move.w     -34(a6),d5
[00011430] da45                      add.w      d5,d5
[00011432] 49f9 0001 6772            lea.l      $00016772,a4 lineLength
[00011438] 3834 5000                 move.w     0(a4,d5.w),d4
[0001143c] b86e ffdc                 cmp.w      -36(a6),d4
[00011440] 6312                      bls.s      $00011454
[00011442] 3a2e ffde                 move.w     -34(a6),d5
[00011446] da45                      add.w      d5,d5
[00011448] 49f9 0001 6772            lea.l      $00016772,a4 lineLength
[0001144e] 3d74 5000 ffdc            move.w     0(a4,d5.w),-36(a6)
[00011454] 3a2e ffde                 move.w     -34(a6),d5
[00011458] da45                      add.w      d5,d5
[0001145a] 49f9 0001 6772            lea.l      $00016772,a4 lineLength
[00011460] 382e ffde                 move.w     -34(a6),d4
[00011464] 5344                      subq.w     #1,d4
[00011466] d844                      add.w      d4,d4
[00011468] 47f9 0001 6772            lea.l      $00016772,a3 lineLength
[0001146e] 37b4 5000 4000            move.w     0(a4,d5.w),0(a3,d4.w)
[00011474] 3a2e ffde                 move.w     -34(a6),d5
[00011478] cafc 0032                 mulu.w     #$0032,d5
[0001147c] 49f9 0001 6292            lea.l      $00016292,a4 AppWindow.screenBuffer
[00011482] 382e ffde                 move.w     -34(a6),d4
[00011486] 5344                      subq.w     #1,d4
[00011488] c8fc 0032                 mulu.w     #$0032,d4
[0001148c] 47f9 0001 6292            lea.l      $00016292,a3 AppWindow.screenBuffer
[00011492] 49f4 5000                 lea.l      0(a4,d5.w),a4
[00011496] 47f3 4000                 lea.l      0(a3,d4.w),a3
[0001149a] 7a18                      moveq.l    #24,d5
[0001149c] 36dc                      move.w     (a4)+,(a3)+
[0001149e] 51cd fffc                 dbf        d5,$0001149C
[000114a2] 302e ffde                 move.w     -34(a6),d0
[000114a6] b057                      cmp.w      (a7),d0
[000114a8] 6408                      bcc.s      $000114B2
[000114aa] 526e ffde                 addq.w     #1,-34(a6)
[000114ae] 6000 ff7c                 bra        $0001142C
[000114b2] 548f                      addq.l     #2,a7
[000114b4] 42ae fffc                 clr.l      -4(a6)
[000114b8] 42ae fff8                 clr.l      -8(a6)
[000114bc] 3a39 0001 62b6            move.w     AppWindow.workx,d5
[000114c2] da79 0001 62ae            add.w      AppWindow.wchar,d5
[000114c8] 3d45 ffe8                 move.w     d5,-24(a6)
[000114cc] 3a39 0001 62b8            move.w     AppWindow.worky,d5
[000114d2] da79 0001 62b0            add.w      AppWindow.hchar,d5
[000114d8] 3d45 ffea                 move.w     d5,-22(a6)
[000114dc] 3a2e ffdc                 move.w     -36(a6),d5
[000114e0] 5245                      addq.w     #1,d5
[000114e2] cbf9 0001 62ae            muls.w     AppWindow.wchar,d5
[000114e8] da79 0001 62b6            add.w      AppWindow.workx,d5
[000114ee] 3d45 ffec                 move.w     d5,-20(a6)
[000114f2] 3a39 0001 62b8            move.w     AppWindow.worky,d5
[000114f8] da79 0001 62bc            add.w      AppWindow.workh,d5
[000114fe] 3d45 ffee                 move.w     d5,-18(a6)
[00011502] 3a39 0001 62b6            move.w     AppWindow.workx,d5
[00011508] da79 0001 62ae            add.w      AppWindow.wchar,d5
[0001150e] 3d45 fff0                 move.w     d5,-16(a6)
[00011512] 3d79 0001 62b8 fff2       move.w     AppWindow.worky,-14(a6)
[0001151a] 3d6e ffec fff4            move.w     -20(a6),-12(a6)
[00011520] 3a2e ffee                 move.w     -18(a6),d5
[00011524] 9a79 0001 62b0            sub.w      AppWindow.hchar,d5
[0001152a] 3d45 fff6                 move.w     d5,-10(a6)
[0001152e] 4227                      clr.b      -(a7)
[00011530] 4eb9 0001 12dc            jsr        mouseOn
[00011536] 548f                      addq.l     #2,a7
[00011538] 3f39 0001 624e            move.w     AppBase.vdiHandle,-(a7)
[0001153e] 3f3c 0003                 move.w     #$0003,-(a7)
[00011542] 486e ffe8                 pea.l      -24(a6)
[00011546] 49ee fffc                 lea.l      -4(a6),a4
[0001154a] 2a0c                      move.l     a4,d5
[0001154c] 2f05                      move.l     d5,-(a7)
[0001154e] 49ee fff8                 lea.l      -8(a6),a4
[00011552] 2a0c                      move.l     a4,d5
[00011554] 2f05                      move.l     d5,-(a7)
[00011556] 4eb9 0001 121c            jsr        VDIRasters.CopyRasterOpaque
[0001155c] 4fef 0010                 lea.l      16(a7),a7
[00011560] 3a39 0001 62b6            move.w     AppWindow.workx,d5
[00011566] da79 0001 62ae            add.w      AppWindow.wchar,d5
[0001156c] 3d45 ffe0                 move.w     d5,-32(a6)
[00011570] 3a39 0001 62c2            move.w     winrows,d5
[00011576] 5345                      subq.w     #1,d5
[00011578] cbf9 0001 62b0            muls.w     AppWindow.hchar,d5
[0001157e] da79 0001 62b8            add.w      AppWindow.worky,d5
[00011584] 5245                      addq.w     #1,d5
[00011586] 3d45 ffe2                 move.w     d5,-30(a6)
[0001158a] 3a39 0001 62c2            move.w     winrows,d5
[00011590] da45                      add.w      d5,d5
[00011592] 49f9 0001 6772            lea.l      $00016772,a4 lineLength
[00011598] 3834 5000                 move.w     0(a4,d5.w),d4
[0001159c] 5244                      addq.w     #1,d4
[0001159e] c9f9 0001 62ae            muls.w     AppWindow.wchar,d4
[000115a4] d879 0001 62b6            add.w      AppWindow.workx,d4
[000115aa] 3d44 ffe4                 move.w     d4,-28(a6)
[000115ae] 3a2e ffe2                 move.w     -30(a6),d5
[000115b2] da79 0001 62b0            add.w      AppWindow.hchar,d5
[000115b8] 5345                      subq.w     #1,d5
[000115ba] 3d45 ffe6                 move.w     d5,-26(a6)
[000115be] 3f39 0001 624e            move.w     AppBase.vdiHandle,-(a7)
[000115c4] 486e ffe0                 pea.l      -32(a6)
[000115c8] 4eb9 0001 10dc            jsr        VDIOutputs.FillRectangle
[000115ce] 5c8f                      addq.l     #6,a7
[000115d0] 1f3c 0001                 move.b     #$01,-(a7)
[000115d4] 4eb9 0001 12dc            jsr        mouseOn
[000115da] 548f                      addq.l     #2,a7
[000115dc] 3d7c 0010 ffde            move.w     #$0010,-34(a6)
[000115e2] 3a39 0001 62c2            move.w     winrows,d5
[000115e8] cafc 0032                 mulu.w     #$0032,d5
[000115ec] 49f9 0001 6292            lea.l      $00016292,a4 AppWindow.screenBuffer
[000115f2] 382e ffde                 move.w     -34(a6),d4
[000115f6] 49f4 50f0                 lea.l      -16(a4,d5.w),a4
[000115fa] 4234 4000                 clr.b      0(a4,d4.w)
[000115fe] 526e ffde                 addq.w     #1,-34(a6)
[00011602] 0c6e 0042 ffde            cmpi.w     #$0042,-34(a6)
[00011608] 66d8                      bne.s      $000115E2
[0001160a] 3a39 0001 62c2            move.w     winrows,d5
[00011610] da45                      add.w      d5,d5
[00011612] 49f9 0001 6772            lea.l      $00016772,a4 lineLength
[00011618] 4274 5000                 clr.w      0(a4,d5.w)
[0001161c] 4efa 0008                 jmp        $00011626(pc)
[00011620] 5279 0001 62c0            addq.w     #1,AppWindow.CursorY
[00011626] 33fc 0001 0001 62be       move.w     #$0001,AppWindow.CursorX
[0001162e] 4e5e                      unlk       a6
[00011630] 4e75                      rts

AppWindow.initWin:
[00011632] 4e56 ff70                 link       a6,#-144
[00011636] 558f                      subq.l     #2,a7
[00011638] 4879 0001 62ae            pea.l      AppWindow.wchar
[0001163e] 4879 0001 62b0            pea.l      AppWindow.hchar
[00011644] 4879 0001 62b2            pea.l      AppWindow.wbox
[0001164a] 4879 0001 62b4            pea.l      AppWindow.hbox
[00011650] 4eb9 0001 0c5a            jsr        AESGraphics.GrafHandle
[00011656] 4fef 0010                 lea.l      16(a7),a7
[0001165a] 33df 0001 624e            move.w     (a7)+,AppBase.vdiHandle
[00011660] 426e fffe                 clr.w      -2(a6)
[00011664] 3a2e fffe                 move.w     -2(a6),d5
[00011668] da45                      add.w      d5,d5
[0001166a] 49ee ffe8                 lea.l      -24(a6),a4
[0001166e] 39bc 0001 5000            move.w     #$0001,0(a4,d5.w)
[00011674] 526e fffe                 addq.w     #1,-2(a6)
[00011678] 0c6e 000a fffe            cmpi.w     #$000A,-2(a6)
[0001167e] 66e4                      bne.s      $00011664
[00011680] 3d7c 0002 fffc            move.w     #$0002,-4(a6)
[00011686] 486e ffe8                 pea.l      -24(a6)
[0001168a] 4879 0001 624e            pea.l      AppBase.vdiHandle
[00011690] 486e ff74                 pea.l      -140(a6)
[00011694] 4eb9 0001 111a            jsr        VDIControls.OpenVirtualWorkstation
[0001169a] 4fef 000c                 lea.l      12(a7),a7
[0001169e] 4227                      clr.b      -(a7)
[000116a0] 4eb9 0001 12dc            jsr        mouseOn
[000116a6] 548f                      addq.l     #2,a7
[000116a8] 3d6e ff74 ff72            move.w     -140(a6),-142(a6)
[000116ae] 3d6e ff76 ff70            move.w     -138(a6),-144(a6)
[000116b4] 558f                      subq.l     #2,a7
[000116b6] 3f3c 0001                 move.w     #$0001,-(a7)
[000116ba] 3f3c 000a                 move.w     #$000A,-(a7)
[000116be] 3f3c 0019                 move.w     #$0019,-(a7)
[000116c2] 3a2e ff72                 move.w     -142(a6),d5
[000116c6] 0445 0014                 subi.w     #$0014,d5
[000116ca] 3f05                      move.w     d5,-(a7)
[000116cc] 3a2e ff70                 move.w     -144(a6),d5
[000116d0] 0445 0020                 subi.w     #$0020,d5
[000116d4] 3f05                      move.w     d5,-(a7)
[000116d6] 4eb9 0001 0ce4            jsr        AESWindows.WindowCreate
[000116dc] 4fef 000a                 lea.l      10(a7),a7
[000116e0] 33df 0001 624c            move.w     (a7)+,AppBase.wdwHandle
[000116e6] 3f3c 000a                 move.w     #$000A,-(a7)
[000116ea] 3f3c 0019                 move.w     #$0019,-(a7)
[000116ee] 3f3c 0001                 move.w     #$0001,-(a7)
[000116f2] 3f3c 0001                 move.w     #$0001,-(a7)
[000116f6] 3f3c 000a                 move.w     #$000A,-(a7)
[000116fa] 3f3c 0019                 move.w     #$0019,-(a7)
[000116fe] 3a2e ff72                 move.w     -142(a6),d5
[00011702] 0445 0014                 subi.w     #$0014,d5
[00011706] 3f05                      move.w     d5,-(a7)
[00011708] 3a2e ff70                 move.w     -144(a6),d5
[0001170c] 0445 0020                 subi.w     #$0020,d5
[00011710] 3f05                      move.w     d5,-(a7)
[00011712] 4eb9 0001 0bb2            jsr        AESGraphics.GrafGrowBox
[00011718] 4fef 0010                 lea.l      16(a7),a7
[0001171c] 3f39 0001 624c            move.w     AppBase.wdwHandle,-(a7)
[00011722] 3f3c 000a                 move.w     #$000A,-(a7)
[00011726] 3f3c 0019                 move.w     #$0019,-(a7)
[0001172a] 3a2e ff72                 move.w     -142(a6),d5
[0001172e] 0445 0014                 subi.w     #$0014,d5
[00011732] 3f05                      move.w     d5,-(a7)
[00011734] 3a2e ff70                 move.w     -144(a6),d5
[00011738] 0445 0020                 subi.w     #$0020,d5
[0001173c] 3f05                      move.w     d5,-(a7)
[0001173e] 4eb9 0001 0d2c            jsr        AESWindows.WindowOpen
[00011744] 4fef 000a                 lea.l      10(a7),a7
[00011748] 3f39 0001 624c            move.w     AppBase.wdwHandle,-(a7)
[0001174e] 3f3c 0004                 move.w     #$0004,-(a7)
[00011752] 4879 0001 62b6            pea.l      AppWindow.workx
[00011758] 4879 0001 62b8            pea.l      AppWindow.worky
[0001175e] 4879 0001 62ba            pea.l      AppWindow.workw
[00011764] 4879 0001 62bc            pea.l      AppWindow.workh
[0001176a] 4eb9 0001 0dda            jsr        AESWindows.WindowGet
[00011770] 4fef 0014                 lea.l      20(a7),a7
[00011774] 3a39 0001 62bc            move.w     AppWindow.workh,d5
[0001177a] 48c5                      ext.l      d5
[0001177c] 8bf9 0001 62b0            divs.w     AppWindow.hchar,d5
[00011782] 33c5 0001 62c2            move.w     d5,winrows
[00011788] 49f9 0001 1a0c            lea.l      $00011A0C,a4 ' Modula-2/ST     Release 3.00a '
[0001178e] 47f9 0001 67a4            lea.l      $000167A4,a3
[00011794] 7a1f                      moveq.l    #31,d5
[00011796] 16dc                      move.b     (a4)+,(a3)+
[00011798] 57cd fffc                 dbeq       d5,$00011796
[0001179c] 3f39 0001 624c            move.w     AppBase.wdwHandle,-(a7)
[000117a2] 3f3c 0002                 move.w     #$0002,-(a7)
[000117a6] 49f9 0001 67a4            lea.l      $000167A4,a4
[000117ac] 2a0c                      move.l     a4,d5
[000117ae] 7810                      moveq.l    #16,d4
[000117b0] e8ad                      lsr.l      d4,d5
[000117b2] 3f05                      move.w     d5,-(a7)
[000117b4] 49f9 0001 67a4            lea.l      $000167A4,a4
[000117ba] 2a0c                      move.l     a4,d5
[000117bc] 0285 0000 ffff            andi.l     #$0000FFFF,d5
[000117c2] 3f05                      move.w     d5,-(a7)
[000117c4] 4267                      clr.w      -(a7)
[000117c6] 4267                      clr.w      -(a7)
[000117c8] 4eb9 0001 0e36            jsr        AESWindows.WindowSet
[000117ce] 4fef 000c                 lea.l      12(a7),a7
[000117d2] 558f                      subq.l     #2,a7
[000117d4] 3f39 0001 624e            move.w     AppBase.vdiHandle,-(a7)
[000117da] 3f3c 0001                 move.w     #$0001,-(a7)
[000117de] 4eb9 0001 0fd6            jsr        VDIAttribs.SetFillInteriorStyle
[000117e4] 588f                      addq.l     #4,a7
[000117e6] 3d5f fffe                 move.w     (a7)+,-2(a6)
[000117ea] 558f                      subq.l     #2,a7
[000117ec] 3f39 0001 624e            move.w     AppBase.vdiHandle,-(a7)
[000117f2] 4267                      clr.w      -(a7)
[000117f4] 4eb9 0001 100e            jsr        VDIAttribs.SetFillColour
[000117fa] 588f                      addq.l     #4,a7
[000117fc] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00011800] 3f39 0001 624e            move.w     AppBase.vdiHandle,-(a7)
[00011806] 4267                      clr.w      -(a7)
[00011808] 3f3c 0003                 move.w     #$0003,-(a7)
[0001180c] 486e fffe                 pea.l      -2(a6)
[00011810] 486e fffe                 pea.l      -2(a6)
[00011814] 4eb9 0001 0f8a            jsr        VDIAttribs.SetGraphicTextAlignment
[0001181a] 4fef 000e                 lea.l      14(a7),a7
[0001181e] 4eb9 0001 183a            jsr        AppWindow.Clear
[00011824] 4eb9 0001 13d8            jsr        AppWindow.WriteLn
[0001182a] 1f3c 0001                 move.b     #$01,-(a7)
[0001182e] 4eb9 0001 12dc            jsr        mouseOn
[00011834] 548f                      addq.l     #2,a7
[00011836] 4e5e                      unlk       a6
[00011838] 4e75                      rts

AppWindow.Clear:
[0001183a] 4e56 fff4                 link       a6,#-12
[0001183e] 3d79 0001 62b6 fff8       move.w     AppWindow.workx,-8(a6)
[00011846] 3d79 0001 62b8 fffa       move.w     AppWindow.worky,-6(a6)
[0001184e] 3a39 0001 62b6            move.w     AppWindow.workx,d5
[00011854] da79 0001 62ba            add.w      AppWindow.workw,d5
[0001185a] 3d45 fffc                 move.w     d5,-4(a6)
[0001185e] 3a39 0001 62b8            move.w     AppWindow.worky,d5
[00011864] da79 0001 62bc            add.w      AppWindow.workh,d5
[0001186a] 3d45 fffe                 move.w     d5,-2(a6)
[0001186e] 3f39 0001 624e            move.w     AppBase.vdiHandle,-(a7)
[00011874] 486e fff8                 pea.l      -8(a6)
[00011878] 4eb9 0001 10dc            jsr        VDIOutputs.FillRectangle
[0001187e] 5c8f                      addq.l     #6,a7
[00011880] 3d7c 0001 fff4            move.w     #$0001,-12(a6)
[00011886] 3a2e fff4                 move.w     -12(a6),d5
[0001188a] da45                      add.w      d5,d5
[0001188c] 49f9 0001 6772            lea.l      $00016772,a4 lineLength
[00011892] 4274 5000                 clr.w      0(a4,d5.w)
[00011896] 3d7c 0010 fff6            move.w     #$0010,-10(a6)
[0001189c] 3a2e fff4                 move.w     -12(a6),d5
[000118a0] cafc 0032                 mulu.w     #$0032,d5
[000118a4] 49f9 0001 6292            lea.l      $00016292,a4 AppWindow.screenBuffer
[000118aa] 382e fff6                 move.w     -10(a6),d4
[000118ae] 49f4 50f0                 lea.l      -16(a4,d5.w),a4
[000118b2] 4234 4000                 clr.b      0(a4,d4.w)
[000118b6] 526e fff6                 addq.w     #1,-10(a6)
[000118ba] 0c6e 0042 fff6            cmpi.w     #$0042,-10(a6)
[000118c0] 66da                      bne.s      $0001189C
[000118c2] 526e fff4                 addq.w     #1,-12(a6)
[000118c6] 0c6e 0019 fff4            cmpi.w     #$0019,-12(a6)
[000118cc] 66b8                      bne.s      $00011886
[000118ce] 33fc 0001 0001 62be       move.w     #$0001,AppWindow.CursorX
[000118d6] 33fc 0001 0001 62c0       move.w     #$0001,AppWindow.CursorY
[000118de] 4e5e                      unlk       a6
[000118e0] 4e75                      rts

AppWindow.updateWindow
[000118e2] 4e56 fff4                 link       a6,#-12
[000118e6] 4227                      clr.b      -(a7)
[000118e8] 4eb9 0001 12dc            jsr        mouseOn
[000118ee] 548f                      addq.l     #2,a7
[000118f0] 3f3c 0001                 move.w     #$0001,-(a7)
[000118f4] 4eb9 0001 0e88            jsr        AESWindows.WindowUpdate
[000118fa] 548f                      addq.l     #2,a7
[000118fc] 7a10                      moveq.l    #16,d5
[000118fe] caf9 0001 62ae            mulu.w     AppWindow.wchar,d5
[00011904] da79 0001 62b6            add.w      AppWindow.workx,d5
[0001190a] 3d45 fff4                 move.w     d5,-12(a6)
[0001190e] 3d79 0001 62b8 fff6       move.w     AppWindow.worky,-10(a6)
[00011916] 3a39 0001 62b6            move.w     AppWindow.workx,d5
[0001191c] da79 0001 62ba            add.w      AppWindow.workw,d5
[00011922] 3d45 fff8                 move.w     d5,-8(a6)
[00011926] 3a39 0001 62b8            move.w     AppWindow.worky,d5
[0001192c] da79 0001 62bc            add.w      AppWindow.workh,d5
[00011932] 3d45 fffa                 move.w     d5,-6(a6)
[00011936] 3f39 0001 624e            move.w     AppBase.vdiHandle,-(a7)
[0001193c] 486e fff4                 pea.l      -12(a6)
[00011940] 4eb9 0001 10dc            jsr        VDIOutputs.FillRectangle
[00011946] 5c8f                      addq.l     #6,a7
[00011948] 7a10                      moveq.l    #16,d5
[0001194a] caf9 0001 62ae            mulu.w     AppWindow.wchar,d5
[00011950] da79 0001 62b6            add.w      AppWindow.workx,d5
[00011956] 3d45 fffe                 move.w     d5,-2(a6)
[0001195a] 3d7c 0001 fffc            move.w     #$0001,-4(a6)
[00011960] 3a39 0001 62c2            move.w     winrows,d5
[00011966] 3f05                      move.w     d5,-(a7)
[00011968] 302e fffc                 move.w     -4(a6),d0
[0001196c] b057                      cmp.w      (a7),d0
[0001196e] 6f04                      ble.s      $00011974
[00011970] 4efa 004c                 jmp        $000119BE(pc)
[00011974] 3f39 0001 624e            move.w     AppBase.vdiHandle,-(a7)
[0001197a] 3f2e fffe                 move.w     -2(a6),-(a7)
[0001197e] 3a2e fffc                 move.w     -4(a6),d5
[00011982] cbf9 0001 62b0            muls.w     AppWindow.hchar,d5
[00011988] da79 0001 62b8            add.w      AppWindow.worky,d5
[0001198e] 3f05                      move.w     d5,-(a7)
[00011990] 3a2e fffc                 move.w     -4(a6),d5
[00011994] cafc 0032                 mulu.w     #$0032,d5
[00011998] 49f9 0001 6292            lea.l      $00016292,a4 AppWindow.screenBuffer
[0001199e] 3f3c 0031                 move.w     #$0031,-(a7)
[000119a2] 4874 5000                 pea.l      0(a4,d5.w)
[000119a6] 4eb9 0001 1046            jsr        VDIOutputs.GraphicText
[000119ac] 4fef 000c                 lea.l      12(a7),a7
[000119b0] 302e fffc                 move.w     -4(a6),d0
[000119b4] b057                      cmp.w      (a7),d0
[000119b6] 6c06                      bge.s      $000119BE
[000119b8] 526e fffc                 addq.w     #1,-4(a6)
[000119bc] 60b6                      bra.s      $00011974
[000119be] 548f                      addq.l     #2,a7
[000119c0] 4267                      clr.w      -(a7)
[000119c2] 4eb9 0001 0e88            jsr        AESWindows.WindowUpdate
[000119c8] 548f                      addq.l     #2,a7
[000119ca] 1f3c 0001                 move.b     #$01,-(a7)
[000119ce] 4eb9 0001 12dc            jsr        mouseOn
[000119d4] 548f                      addq.l     #2,a7
[000119d6] 4e5e                      unlk       a6
[000119d8] 4e75                      rts

.init
[000119da] 4ef9 0001 1296            jmp        $00011296

[000119e0] 4e56 0000                 link       a6,#0
[000119e4] 3f3c 0002                 move.w     #$0002,-(a7)
[000119e8] 7aff                      moveq.l    #-1,d5
[000119ea] 2f05                      move.l     d5,-(a7)
[000119ec] 4eb9 0001 0ca8            jsr        AESGraphics.GrafMouse
[000119f2] 5c8f                      addq.l     #6,a7
[000119f4] 4eb9 0001 1632            jsr        $00011632
[000119fa] 23fc 0001 18e2 0001 6250  move.l     #$000118E2,AppBase.doUpdateWindow
[00011a04] 4e5e                      unlk       a6
[00011a06] 4ef9 0001 1fc6            jmp        Strings.init+6

[00011a0c] 204d                      .asciiz ' Modula-2/ST     Release 3.00a '

***
* MODULE AESApplications
***

AESApplications.ApplInitialise:
[00011a2c] 4e56 0000                 link       a6,#0
[00011a30] 558f                      subq.l     #2,a7
[00011a32] 3f3c 000a                 move.w     #$000A,-(a7)
[00011a36] 4267                      clr.w      -(a7)
[00011a38] 3f3c 0001                 move.w     #$0001,-(a7)
[00011a3c] 4267                      clr.w      -(a7)
[00011a3e] 4267                      clr.w      -(a7)
[00011a40] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00011a46] 4fef 000a                 lea.l      10(a7),a7
[00011a4a] 3d5f 0008                 move.w     (a7)+,8(a6)
[00011a4e] 4e5e                      unlk       a6
[00011a50] 4e75                      rts

AESApplications.ApplWrite:
[00011a52] 4e56 0000                 link       a6,#0
[00011a56] 3f2e 000e                 move.w     14(a6),-(a7)
[00011a5a] 3f2e 000c                 move.w     12(a6),-(a7)
[00011a5e] 4eb9 0001 0a82            jsr        GEMAESbase.IntIn2
[00011a64] 588f                      addq.l     #4,a7
[00011a66] 23ee 0008 0001 5ddc       move.l     8(a6),$00015DDC
[00011a6e] 558f                      subq.l     #2,a7
[00011a70] 3f3c 000c                 move.w     #$000C,-(a7)
[00011a74] 3f3c 0002                 move.w     #$0002,-(a7)
[00011a78] 3f3c 0001                 move.w     #$0001,-(a7)
[00011a7c] 3f3c 0001                 move.w     #$0001,-(a7)
[00011a80] 4267                      clr.w      -(a7)
[00011a82] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00011a88] 4fef 000a                 lea.l      10(a7),a7
[00011a8c] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[00011a92] 4e5e                      unlk       a6
[00011a94] 4e75                      rts

AESApplications.ApplFind:
[00011a96] 4e56 0000                 link       a6,#0
[00011a9a] 286e 0008                 movea.l    8(a6),a4
[00011a9e] 2a0c                      move.l     a4,d5
[00011aa0] 23c5 0001 5ddc            move.l     d5,$00015DDC
[00011aa6] 558f                      subq.l     #2,a7
[00011aa8] 3f3c 000d                 move.w     #$000D,-(a7)
[00011aac] 4267                      clr.w      -(a7)
[00011aae] 3f3c 0001                 move.w     #$0001,-(a7)
[00011ab2] 3f3c 0001                 move.w     #$0001,-(a7)
[00011ab6] 4267                      clr.w      -(a7)
[00011ab8] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00011abe] 4fef 000a                 lea.l      10(a7),a7
[00011ac2] 3d5f 000e                 move.w     (a7)+,14(a6)
[00011ac6] 4e5e                      unlk       a6
[00011ac8] 4e75                      rts

AESApplications.ApplExit:
[00011aca] 4e56 0000                 link       a6,#0
[00011ace] 558f                      subq.l     #2,a7
[00011ad0] 3f3c 0013                 move.w     #$0013,-(a7)
[00011ad4] 4267                      clr.w      -(a7)
[00011ad6] 3f3c 0001                 move.w     #$0001,-(a7)
[00011ada] 4267                      clr.w      -(a7)
[00011adc] 4267                      clr.w      -(a7)
[00011ade] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00011ae4] 4fef 000a                 lea.l      10(a7),a7
[00011ae8] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[00011aee] 4e5e                      unlk       a6
[00011af0] 4e75                      rts

***
* MODULE AESForms
***

AESForms.FormAlert:
[00011af2] 4e56 0000                 link       a6,#0
[00011af6] 33ee 000e 0001 5daa       move.w     14(a6),$00015DAA
[00011afe] 286e 0008                 movea.l    8(a6),a4
[00011b02] 2a0c                      move.l     a4,d5
[00011b04] 23c5 0001 5ddc            move.l     d5,$00015DDC
[00011b0a] 558f                      subq.l     #2,a7
[00011b0c] 3f3c 0034                 move.w     #$0034,-(a7)
[00011b10] 3f3c 0001                 move.w     #$0001,-(a7)
[00011b14] 3f3c 0001                 move.w     #$0001,-(a7)
[00011b18] 3f3c 0001                 move.w     #$0001,-(a7)
[00011b1c] 4267                      clr.w      -(a7)
[00011b1e] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00011b24] 4fef 000a                 lea.l      10(a7),a7
[00011b28] 3d5f 0010                 move.w     (a7)+,16(a6)
[00011b2c] 4e5e                      unlk       a6
[00011b2e] 4e75                      rts

AESForms.FormError:
[00011b30] 4e56 0000                 link       a6,#0
[00011b34] 33ee 0008 0001 5dac       move.w     8(a6),$00015DAC
[00011b3c] 558f                      subq.l     #2,a7
[00011b3e] 3f3c 0035                 move.w     #$0035,-(a7)
[00011b42] 3f3c 0001                 move.w     #$0001,-(a7)
[00011b46] 3f3c 0001                 move.w     #$0001,-(a7)
[00011b4a] 4267                      clr.w      -(a7)
[00011b4c] 4267                      clr.w      -(a7)
[00011b4e] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00011b54] 4fef 000a                 lea.l      10(a7),a7
[00011b58] 3d5f 000a                 move.w     (a7)+,10(a6)
[00011b5c] 4e5e                      unlk       a6
[00011b5e] 4e75                      rts

AESForms.FileSelectorInput:
[00011b60] 4e56 0000                 link       a6,#0
[00011b64] 23ee 0010 0001 5ddc       move.l     16(a6),$00015DDC
[00011b6c] 23ee 000c 0001 5de0       move.l     12(a6),$00015DE0
[00011b74] 558f                      subq.l     #2,a7
[00011b76] 3f3c 005a                 move.w     #$005A,-(a7)
[00011b7a] 4267                      clr.w      -(a7)
[00011b7c] 3f3c 0002                 move.w     #$0002,-(a7)
[00011b80] 3f3c 0002                 move.w     #$0002,-(a7)
[00011b84] 4267                      clr.w      -(a7)
[00011b86] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00011b8c] 4fef 000a                 lea.l      10(a7),a7
[00011b90] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[00011b96] 286e 0008                 movea.l    8(a6),a4
[00011b9a] 38b9 0001 5dce            move.w     $00015DCE,(a4)
[00011ba0] 4e5e                      unlk       a6
[00011ba2] 4e75                      rts

***
* MODULE AESShells
***

AESShells.ShellRead:
[00011ba4] 4e56 0000                 link       a6,#0
[00011ba8] 23ee 000c 0001 5ddc       move.l     12(a6),$00015DDC
[00011bb0] 23ee 0008 0001 5de0       move.l     8(a6),$00015DE0
[00011bb8] 558f                      subq.l     #2,a7
[00011bba] 3f3c 0078                 move.w     #$0078,-(a7)
[00011bbe] 4267                      clr.w      -(a7)
[00011bc0] 3f3c 0001                 move.w     #$0001,-(a7)
[00011bc4] 3f3c 0002                 move.w     #$0002,-(a7)
[00011bc8] 4267                      clr.w      -(a7)
[00011bca] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00011bd0] 4fef 000a                 lea.l      10(a7),a7
[00011bd4] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[00011bda] 4e5e                      unlk       a6
[00011bdc] 4e75                      rts

AESShells.ShellWrite:
[00011bde] 4e56 0000                 link       a6,#0
[00011be2] 3f2e 0014                 move.w     20(a6),-(a7)
[00011be6] 3f2e 0012                 move.w     18(a6),-(a7)
[00011bea] 4eb9 0001 0a82            jsr        GEMAESbase.IntIn2
[00011bf0] 588f                      addq.l     #4,a7
[00011bf2] 33ee 0010 0001 5dae       move.w     16(a6),$00015DAE
[00011bfa] 23ee 000c 0001 5ddc       move.l     12(a6),$00015DDC
[00011c02] 23ee 0008 0001 5de0       move.l     8(a6),$00015DE0
[00011c0a] 558f                      subq.l     #2,a7
[00011c0c] 3f3c 0079                 move.w     #$0079,-(a7)
[00011c10] 3f3c 0003                 move.w     #$0003,-(a7)
[00011c14] 3f3c 0001                 move.w     #$0001,-(a7)
[00011c18] 3f3c 0002                 move.w     #$0002,-(a7)
[00011c1c] 4267                      clr.w      -(a7)
[00011c1e] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00011c24] 4fef 000a                 lea.l      10(a7),a7
[00011c28] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[00011c2e] 4e5e                      unlk       a6
[00011c30] 4e75                      rts

***
* MODULE Strings
***

Strings.InitStringModule:
[00011c32] 4e56 0000                 link       a6,#0
[00011c36] 4239 0001 67cc            clr.b      Strings.terminator
[00011c3c] 4e5e                      unlk       a6
[00011c3e] 4e75                      rts

Strings.Assign:
[00011c40] 4e56 fffc                 link       a6,#-4
[00011c44] 558f                      subq.l     #2,a7
[00011c46] 3a2e 000c                 move.w     12(a6),d5
[00011c4a] 3f05                      move.w     d5,-(a7)
[00011c4c] 286e 0008                 movea.l    8(a6),a4
[00011c50] 4854                      pea.l      (a4)
[00011c52] 6100 0244                 bsr        Strings.Length
[00011c56] 5c8f                      addq.l     #6,a7
[00011c58] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00011c5c] 3a2e 0012                 move.w     18(a6),d5
[00011c60] 5245                      addq.w     #1,d5
[00011c62] ba6e fffe                 cmp.w      -2(a6),d5
[00011c66] 640a                      bcc.s      $00011C72
[00011c68] 3a2e 0012                 move.w     18(a6),d5
[00011c6c] 5245                      addq.w     #1,d5
[00011c6e] 3d45 fffe                 move.w     d5,-2(a6)
[00011c72] 426e fffc                 clr.w      -4(a6)
[00011c76] 3a2e fffe                 move.w     -2(a6),d5
[00011c7a] 5345                      subq.w     #1,d5
[00011c7c] 3f05                      move.w     d5,-(a7)
[00011c7e] 302e fffc                 move.w     -4(a6),d0
[00011c82] b057                      cmp.w      (a7),d0
[00011c84] 6f04                      ble.s      $00011C8A
[00011c86] 4efa 0026                 jmp        $00011CAE(pc)
[00011c8a] 3a2e fffc                 move.w     -4(a6),d5
[00011c8e] 286e 0008                 movea.l    8(a6),a4
[00011c92] 382e fffc                 move.w     -4(a6),d4
[00011c96] 266e 000e                 movea.l    14(a6),a3
[00011c9a] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[00011ca0] 302e fffc                 move.w     -4(a6),d0
[00011ca4] b057                      cmp.w      (a7),d0
[00011ca6] 6c06                      bge.s      $00011CAE
[00011ca8] 526e fffc                 addq.w     #1,-4(a6)
[00011cac] 60dc                      bra.s      $00011C8A
[00011cae] 548f                      addq.l     #2,a7
[00011cb0] 3a2e fffe                 move.w     -2(a6),d5
[00011cb4] ba6e 0012                 cmp.w      18(a6),d5
[00011cb8] 6210                      bhi.s      $00011CCA
[00011cba] 3a2e fffe                 move.w     -2(a6),d5
[00011cbe] 286e 000e                 movea.l    14(a6),a4
[00011cc2] 19b9 0001 67cc 5000       move.b     Strings.terminator,0(a4,d5.w)
[00011cca] 4e5e                      unlk       a6
[00011ccc] 4e75                      rts

Strings.Insert:
[00011cce] 4e56 fffa                 link       a6,#-6
[00011cd2] 558f                      subq.l     #2,a7
[00011cd4] 3a2e 0014                 move.w     20(a6),d5
[00011cd8] 3f05                      move.w     d5,-(a7)
[00011cda] 286e 0010                 movea.l    16(a6),a4
[00011cde] 4854                      pea.l      (a4)
[00011ce0] 6100 01b6                 bsr        Strings.Length
[00011ce4] 5c8f                      addq.l     #6,a7
[00011ce6] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00011cea] 558f                      subq.l     #2,a7
[00011cec] 3a2e 000e                 move.w     14(a6),d5
[00011cf0] 3f05                      move.w     d5,-(a7)
[00011cf2] 286e 000a                 movea.l    10(a6),a4
[00011cf6] 4854                      pea.l      (a4)
[00011cf8] 6100 019e                 bsr        Strings.Length
[00011cfc] 5c8f                      addq.l     #6,a7
[00011cfe] 3d5f fffc                 move.w     (a7)+,-4(a6)
[00011d02] 3a2e fffc                 move.w     -4(a6),d5
[00011d06] da6e fffe                 add.w      -2(a6),d5
[00011d0a] ba6e 000e                 cmp.w      14(a6),d5
[00011d0e] 640c                      bcc.s      $00011D1C
[00011d10] 3a2e 0008                 move.w     8(a6),d5
[00011d14] ba6e fffc                 cmp.w      -4(a6),d5
[00011d18] 6402                      bcc.s      $00011D1C
[00011d1a] 6004                      bra.s      $00011D20
[00011d1c] 4efa 0090                 jmp        $00011DAE(pc)
[00011d20] 3a2e fffc                 move.w     -4(a6),d5
[00011d24] da6e fffe                 add.w      -2(a6),d5
[00011d28] 3d45 fffa                 move.w     d5,-6(a6)
[00011d2c] 3a2e 0008                 move.w     8(a6),d5
[00011d30] da6e fffe                 add.w      -2(a6),d5
[00011d34] 3f05                      move.w     d5,-(a7)
[00011d36] 3017                      move.w     (a7),d0
[00011d38] b06e fffa                 cmp.w      -6(a6),d0
[00011d3c] 6304                      bls.s      $00011D42
[00011d3e] 4efa 002a                 jmp        $00011D6A(pc)
[00011d42] 3a2e fffa                 move.w     -6(a6),d5
[00011d46] 9a6e fffe                 sub.w      -2(a6),d5
[00011d4a] 286e 000a                 movea.l    10(a6),a4
[00011d4e] 382e fffa                 move.w     -6(a6),d4
[00011d52] 266e 000a                 movea.l    10(a6),a3
[00011d56] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[00011d5c] 3017                      move.w     (a7),d0
[00011d5e] b06e fffa                 cmp.w      -6(a6),d0
[00011d62] 6406                      bcc.s      $00011D6A
[00011d64] 536e fffa                 subq.w     #1,-6(a6)
[00011d68] 60d8                      bra.s      $00011D42
[00011d6a] 548f                      addq.l     #2,a7
[00011d6c] 426e fffa                 clr.w      -6(a6)
[00011d70] 3a2e fffe                 move.w     -2(a6),d5
[00011d74] 5345                      subq.w     #1,d5
[00011d76] 3f05                      move.w     d5,-(a7)
[00011d78] 302e fffa                 move.w     -6(a6),d0
[00011d7c] b057                      cmp.w      (a7),d0
[00011d7e] 6304                      bls.s      $00011D84
[00011d80] 4efa 002a                 jmp        $00011DAC(pc)
[00011d84] 3a2e fffa                 move.w     -6(a6),d5
[00011d88] 286e 0010                 movea.l    16(a6),a4
[00011d8c] 382e fffa                 move.w     -6(a6),d4
[00011d90] d86e 0008                 add.w      8(a6),d4
[00011d94] 266e 000a                 movea.l    10(a6),a3
[00011d98] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[00011d9e] 302e fffa                 move.w     -6(a6),d0
[00011da2] b057                      cmp.w      (a7),d0
[00011da4] 6406                      bcc.s      $00011DAC
[00011da6] 526e fffa                 addq.w     #1,-6(a6)
[00011daa] 60d8                      bra.s      $00011D84
[00011dac] 548f                      addq.l     #2,a7
[00011dae] 4e5e                      unlk       a6
[00011db0] 4e75                      rts

Strings.Concat:
[00011db2] 4e56 fffa                 link       a6,#-6
[00011db6] 558f                      subq.l     #2,a7
[00011db8] 3a2e 0018                 move.w     24(a6),d5
[00011dbc] 3f05                      move.w     d5,-(a7)
[00011dbe] 286e 0014                 movea.l    20(a6),a4
[00011dc2] 4854                      pea.l      (a4)
[00011dc4] 6100 00d2                 bsr        Strings.Length
[00011dc8] 5c8f                      addq.l     #6,a7
[00011dca] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00011dce] 558f                      subq.l     #2,a7
[00011dd0] 3a2e 0012                 move.w     18(a6),d5
[00011dd4] 3f05                      move.w     d5,-(a7)
[00011dd6] 286e 000e                 movea.l    14(a6),a4
[00011dda] 4854                      pea.l      (a4)
[00011ddc] 6100 00ba                 bsr        Strings.Length
[00011de0] 5c8f                      addq.l     #6,a7
[00011de2] 3d5f fffc                 move.w     (a7)+,-4(a6)
[00011de6] 3a2e fffe                 move.w     -2(a6),d5
[00011dea] da6e fffc                 add.w      -4(a6),d5
[00011dee] 4a45                      tst.w      d5
[00011df0] 660e                      bne.s      $00011E00
[00011df2] 286e 0008                 movea.l    8(a6),a4
[00011df6] 18b9 0001 67cc            move.b     Strings.terminator,(a4)
[00011dfc] 4efa 0096                 jmp        $00011E94(pc)
[00011e00] 3a2e fffe                 move.w     -2(a6),d5
[00011e04] da6e fffc                 add.w      -4(a6),d5
[00011e08] 382e 000c                 move.w     12(a6),d4
[00011e0c] 5444                      addq.w     #2,d4
[00011e0e] b845                      cmp.w      d5,d4
[00011e10] 6302                      bls.s      $00011E14
[00011e12] 6004                      bra.s      $00011E18
[00011e14] 4efa 007e                 jmp        $00011E94(pc)
[00011e18] 3a2e 000c                 move.w     12(a6),d5
[00011e1c] 3f05                      move.w     d5,-(a7)
[00011e1e] 286e 0008                 movea.l    8(a6),a4
[00011e22] 4854                      pea.l      (a4)
[00011e24] 3a2e 0018                 move.w     24(a6),d5
[00011e28] 3f05                      move.w     d5,-(a7)
[00011e2a] 286e 0014                 movea.l    20(a6),a4
[00011e2e] 4854                      pea.l      (a4)
[00011e30] 6100 fe0e                 bsr        Strings.Assign
[00011e34] 4fef 000c                 lea.l      12(a7),a7
[00011e38] 3d6e fffe fffa            move.w     -2(a6),-6(a6)
[00011e3e] 3a2e fffe                 move.w     -2(a6),d5
[00011e42] da6e fffc                 add.w      -4(a6),d5
[00011e46] 5345                      subq.w     #1,d5
[00011e48] 3f05                      move.w     d5,-(a7)
[00011e4a] 302e fffa                 move.w     -6(a6),d0
[00011e4e] b057                      cmp.w      (a7),d0
[00011e50] 6304                      bls.s      $00011E56
[00011e52] 4efa 002a                 jmp        $00011E7E(pc)
[00011e56] 3a2e fffa                 move.w     -6(a6),d5
[00011e5a] 9a6e fffe                 sub.w      -2(a6),d5
[00011e5e] 286e 000e                 movea.l    14(a6),a4
[00011e62] 382e fffa                 move.w     -6(a6),d4
[00011e66] 266e 0008                 movea.l    8(a6),a3
[00011e6a] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[00011e70] 302e fffa                 move.w     -6(a6),d0
[00011e74] b057                      cmp.w      (a7),d0
[00011e76] 6406                      bcc.s      $00011E7E
[00011e78] 526e fffa                 addq.w     #1,-6(a6)
[00011e7c] 60d8                      bra.s      $00011E56
[00011e7e] 548f                      addq.l     #2,a7
[00011e80] 3a2e fffe                 move.w     -2(a6),d5
[00011e84] da6e fffc                 add.w      -4(a6),d5
[00011e88] 286e 0008                 movea.l    8(a6),a4
[00011e8c] 19b9 0001 67cc 5000       move.b     Strings.terminator,0(a4,d5.w)
[00011e94] 4e5e                      unlk       a6
[00011e96] 4e75                      rts

Strings.Length:
[00011e98] 4e56 fffe                 link       a6,#-2
[00011e9c] 426e fffe                 clr.w      -2(a6)
[00011ea0] 3a2e 000c                 move.w     12(a6),d5
[00011ea4] 3f05                      move.w     d5,-(a7)
[00011ea6] 302e fffe                 move.w     -2(a6),d0
[00011eaa] b057                      cmp.w      (a7),d0
[00011eac] 6304                      bls.s      $00011EB2
[00011eae] 4efa 002e                 jmp        $00011EDE(pc)
[00011eb2] 3a2e fffe                 move.w     -2(a6),d5
[00011eb6] 286e 0008                 movea.l    8(a6),a4
[00011eba] 1834 5000                 move.b     0(a4,d5.w),d4
[00011ebe] b839 0001 67cc            cmp.b      Strings.terminator,d4
[00011ec4] 660a                      bne.s      $00011ED0
[00011ec6] 3d6e fffe 000e            move.w     -2(a6),14(a6)
[00011ecc] 4e5e                      unlk       a6
[00011ece] 4e75                      rts
[00011ed0] 302e fffe                 move.w     -2(a6),d0
[00011ed4] b057                      cmp.w      (a7),d0
[00011ed6] 6406                      bcc.s      $00011EDE
[00011ed8] 526e fffe                 addq.w     #1,-2(a6)
[00011edc] 60d4                      bra.s      $00011EB2
[00011ede] 548f                      addq.l     #2,a7
[00011ee0] 3a2e 000c                 move.w     12(a6),d5
[00011ee4] 5245                      addq.w     #1,d5
[00011ee6] 3d45 000e                 move.w     d5,14(a6)
[00011eea] 4e5e                      unlk       a6
[00011eec] 4e75                      rts

Strings.Pos:
[00011eee] 4e56 fff8                 link       a6,#-8
[00011ef2] 558f                      subq.l     #2,a7
[00011ef4] 3a2e 0018                 move.w     24(a6),d5
[00011ef8] 3f05                      move.w     d5,-(a7)
[00011efa] 286e 0014                 movea.l    20(a6),a4
[00011efe] 4854                      pea.l      (a4)
[00011f00] 6100 ff96                 bsr.w      Strings.Length
[00011f04] 5c8f                      addq.l     #6,a7
[00011f06] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00011f0a] 558f                      subq.l     #2,a7
[00011f0c] 3a2e 0012                 move.w     18(a6),d5
[00011f10] 3f05                      move.w     d5,-(a7)
[00011f12] 286e 000e                 movea.l    14(a6),a4
[00011f16] 4854                      pea.l      (a4)
[00011f18] 6100 ff7e                 bsr        Strings.Length
[00011f1c] 5c8f                      addq.l     #6,a7
[00011f1e] 3d5f fffc                 move.w     (a7)+,-4(a6)
[00011f22] 4a6e fffe                 tst.w      -2(a6)
[00011f26] 6714                      beq.s      $00011F3C
[00011f28] 4a6e fffc                 tst.w      -4(a6)
[00011f2c] 670e                      beq.s      $00011F3C
[00011f2e] 3a2e 000c                 move.w     12(a6),d5
[00011f32] da6e fffc                 add.w      -4(a6),d5
[00011f36] ba6e fffe                 cmp.w      -2(a6),d5
[00011f3a] 6310                      bls.s      $00011F4C
[00011f3c] 286e 0008                 movea.l    8(a6),a4
[00011f40] 38ae fffe                 move.w     -2(a6),(a4)
[00011f44] 422e 001a                 clr.b      26(a6)
[00011f48] 4e5e                      unlk       a6
[00011f4a] 4e75                      rts
[00011f4c] 3a2e fffe                 move.w     -2(a6),d5
[00011f50] 9a6e fffc                 sub.w      -4(a6),d5
[00011f54] 3d45 fff8                 move.w     d5,-8(a6)
[00011f58] 426e fffa                 clr.w      -6(a6)
[00011f5c] 3a2e fffa                 move.w     -6(a6),d5
[00011f60] 286e 000e                 movea.l    14(a6),a4
[00011f64] 382e 000c                 move.w     12(a6),d4
[00011f68] d86e fffa                 add.w      -6(a6),d4
[00011f6c] 266e 0014                 movea.l    20(a6),a3
[00011f70] 1634 5000                 move.b     0(a4,d5.w),d3
[00011f74] b633 4000                 cmp.b      0(a3,d4.w),d3
[00011f78] 6704                      beq.s      $00011F7E
[00011f7a] 4efa 0024                 jmp        $00011FA0(pc)
[00011f7e] 526e fffa                 addq.w     #1,-6(a6)
[00011f82] 3a2e fffa                 move.w     -6(a6),d5
[00011f86] ba6e fffc                 cmp.w      -4(a6),d5
[00011f8a] 6612                      bne.s      $00011F9E
[00011f8c] 286e 0008                 movea.l    8(a6),a4
[00011f90] 38ae 000c                 move.w     12(a6),(a4)
[00011f94] 1d7c 0001 001a            move.b     #$01,26(a6)
[00011f9a] 4e5e                      unlk       a6
[00011f9c] 4e75                      rts
[00011f9e] 60bc                      bra.s      $00011F5C
[00011fa0] 526e 000c                 addq.w     #1,12(a6)
[00011fa4] 3a2e 000c                 move.w     12(a6),d5
[00011fa8] ba6e fff8                 cmp.w      -8(a6),d5
[00011fac] 6310                      bls.s      $00011FBE
[00011fae] 286e 0008                 movea.l    8(a6),a4
[00011fb2] 38ae fffe                 move.w     -2(a6),(a4)
[00011fb6] 422e 001a                 clr.b      26(a6)
[00011fba] 4e5e                      unlk       a6
[00011fbc] 4e75                      rts
[00011fbe] 6098                      bra.s      $00011F58

Strings.init:
[00011fc0] 4ef9 0001 19da            jmp        $000119DA

[00011fc6] 4e56 0000                 link       a6,#0
[00011fca] 6100 fc66                 bsr        Strings.InitStringModule
[00011fce] 4e5e                      unlk       a6
[00011fd0] 4ef9 0001 2046            jmp        Buffers.init+6

***
* MODULE Buffers
***

Buffers.FreeAll:
[00011fd6] 4e56 0000                 link       a6,#0
[00011fda] 4a79 0001 67d2            tst.w      $000167D2
[00011fe0] 6d52                      blt.s      $00012034
[00011fe2] 3a39 0001 67d2            move.w     $000167D2,d5
[00011fe8] e545                      asl.w      #2,d5
[00011fea] 49f9 0001 67d4            lea.l      $000167D4,a4
[00011ff0] 78ff                      moveq.l    #-1,d4
[00011ff2] b8b4 5000                 cmp.l      0(a4,d5.w),d4
[00011ff6] 6734                      beq.s      $0001202C
[00011ff8] 558f                      subq.l     #2,a7
[00011ffa] 3a39 0001 67d2            move.w     $000167D2,d5
[00012000] e545                      asl.w      #2,d5
[00012002] 49f9 0001 67d4            lea.l      $000167D4,a4
[00012008] 2f34 5000                 move.l     0(a4,d5.w),-(a7)
[0001200c] 4eb9 0001 0a12            jsr        GEMDOS.Free
[00012012] 588f                      addq.l     #4,a7
[00012014] 4a1f                      tst.b      (a7)+
[00012016] 6714                      beq.s      $0001202C
[00012018] 3a39 0001 67d2            move.w     $000167D2,d5
[0001201e] e545                      asl.w      #2,d5
[00012020] 49f9 0001 67d4            lea.l      $000167D4,a4
[00012026] 78ff                      moveq.l    #-1,d4
[00012028] 2984 5000                 move.l     d4,0(a4,d5.w)
[0001202c] 5379 0001 67d2            subq.w     #1,$000167D2
[00012032] 60a6                      bra.s      $00011FDA
[00012034] 7aff                      moveq.l    #-1,d5
[00012036] 23c5 0001 67ce            move.l     d5,$000167CE
[0001203c] 4e5e                      unlk       a6
[0001203e] 4e75                      rts

Buffers.init:
[00012040] 4ef9 0001 1fc0            jmp        Strings.init

[00012046] 4e56 0000                 link       a6,#0
[0001204a] 33fc ffff 0001 67d2       move.w     #$FFFF,$000167D2
[00012052] 4e5e                      unlk       a6
[00012054] 4ef9 0001 2622            jmp        ExecUtil.init+6

***
* MODULE ExecUtil
***

ExecUtil.FreeBuffers.
[0001205a] 4e56 0000                 link       a6,#0
[0001205e] 4eb9 0001 1fd6            jsr        $00011FD6
[00012064] 4e5e                      unlk       a6
[00012066] 4e75                      rts

ExecUtil.Terminate:
[00012068] 4e56 fff8                 link       a6,#-8
[0001206c] 4a39 0001 6806            tst.b      ExecUtil.terminated
[00012072] 6602                      bne.s      $00012076
[00012074] 6004                      bra.s      $0001207A
[00012076] 4efa 00b8                 jmp        $00012130(pc)
[0001207a] 3f3c 0100                 move.w     #$0100,-(a7)
[0001207e] 7aff                      moveq.l    #-1,d5
[00012080] 2f05                      move.l     d5,-(a7)
[00012082] 4eb9 0001 0ca8            jsr        AESGraphics.GrafMouse
[00012088] 5c8f                      addq.l     #6,a7
[0001208a] 4a79 0001 624c            tst.w      AppBase.wdwHandle
[00012090] 6d6a                      blt.s      $000120FC
[00012092] 3f39 0001 624c            move.w     AppBase.wdwHandle,-(a7)
[00012098] 3f3c 0005                 move.w     #$0005,-(a7)
[0001209c] 486e fffe                 pea.l      -2(a6)
[000120a0] 486e fffc                 pea.l      -4(a6)
[000120a4] 486e fffa                 pea.l      -6(a6)
[000120a8] 486e fff8                 pea.l      -8(a6)
[000120ac] 4eb9 0001 0dda            jsr        AESWindows.WindowGet
[000120b2] 4fef 0014                 lea.l      20(a7),a7
[000120b6] 3f3c 000a                 move.w     #$000A,-(a7)
[000120ba] 3f3c 0019                 move.w     #$0019,-(a7)
[000120be] 3f3c 0001                 move.w     #$0001,-(a7)
[000120c2] 3f3c 0001                 move.w     #$0001,-(a7)
[000120c6] 3f2e fffe                 move.w     -2(a6),-(a7)
[000120ca] 3f2e fffc                 move.w     -4(a6),-(a7)
[000120ce] 3f2e fffa                 move.w     -6(a6),-(a7)
[000120d2] 3f2e fff8                 move.w     -8(a6),-(a7)
[000120d6] 4eb9 0001 0c06            jsr        AESGraphics.GrafShrinkBox
[000120dc] 4fef 0010                 lea.l      16(a7),a7
[000120e0] 3f39 0001 624c            move.w     AppBase.wdwHandle,-(a7)
[000120e6] 4eb9 0001 0d76            jsr        AESWindows.WindowClose
[000120ec] 548f                      addq.l     #2,a7
[000120ee] 3f39 0001 624c            move.w     AppBase.wdwHandle,-(a7)
[000120f4] 4eb9 0001 0da8            jsr        AESWindows.WindowDelete
[000120fa] 548f                      addq.l     #2,a7
[000120fc] 4a79 0001 624e            tst.w      AppBase.vdiHandle
[00012102] 6d0e                      blt.s      $00012112
[00012104] 3f39 0001 624e            move.w     AppBase.vdiHandle,-(a7)
[0001210a] 4eb9 0001 11f6            jsr        CloseVirtualWorkstation
[00012110] 548f                      addq.l     #2,a7
[00012112] 3f3c 0101                 move.w     #$0101,-(a7)
[00012116] 7aff                      moveq.l    #-1,d5
[00012118] 2f05                      move.l     d5,-(a7)
[0001211a] 4eb9 0001 0ca8            jsr        AESGraphics.GrafMouse
[00012120] 5c8f                      addq.l     #6,a7
[00012122] 4eb9 0001 1aca            jsr        AESApplications.ApplExit
[00012128] 13fc 0001 0001 6806       move.b     #$01,ExecUtil.terminated
[00012130] 4e5e                      unlk       a6
[00012132] 4e75                      rts

ExecUtil.ReplaceExtension:
[00012134] 4e56 fffc                 link       a6,#-4
[00012138] 426e fffe                 clr.w      -2(a6)
[0001213c] 426e fffc                 clr.w      -4(a6)
[00012140] 3a2e fffe                 move.w     -2(a6),d5
[00012144] ba6e 0012                 cmp.w      18(a6),d5
[00012148] 622e                      bhi.s      $00012178
[0001214a] 3a2e fffe                 move.w     -2(a6),d5
[0001214e] 286e 000e                 movea.l    14(a6),a4
[00012152] 4a34 5000                 tst.b      0(a4,d5.w)
[00012156] 6720                      beq.s      $00012178
[00012158] 3a2e fffe                 move.w     -2(a6),d5
[0001215c] 286e 000e                 movea.l    14(a6),a4
[00012160] 0c34 005c 5000            cmpi.b     #$5C,0(a4,d5.w)
[00012166] 660a                      bne.s      $00012172
[00012168] 3a2e fffe                 move.w     -2(a6),d5
[0001216c] 5245                      addq.w     #1,d5
[0001216e] 3d45 fffc                 move.w     d5,-4(a6)
[00012172] 526e fffe                 addq.w     #1,-2(a6)
[00012176] 60c8                      bra.s      $00012140
[00012178] 3d6e fffc fffe            move.w     -4(a6),-2(a6)
[0001217e] 3a2e fffe                 move.w     -2(a6),d5
[00012182] ba6e 0012                 cmp.w      18(a6),d5
[00012186] 6232                      bhi.s      $000121BA
[00012188] 3a2e fffe                 move.w     -2(a6),d5
[0001218c] 286e 000e                 movea.l    14(a6),a4
[00012190] 4a34 5000                 tst.b      0(a4,d5.w)
[00012194] 6724                      beq.s      $000121BA
[00012196] 3a2e fffe                 move.w     -2(a6),d5
[0001219a] 286e 000e                 movea.l    14(a6),a4
[0001219e] 0c34 002e 5000            cmpi.b     #$2E,0(a4,d5.w)
[000121a4] 6714                      beq.s      $000121BA
[000121a6] 3a2e fffe                 move.w     -2(a6),d5
[000121aa] 9a6e fffc                 sub.w      -4(a6),d5
[000121ae] 0c45 0008                 cmpi.w     #$0008,d5
[000121b2] 6406                      bcc.s      $000121BA
[000121b4] 526e fffe                 addq.w     #1,-2(a6)
[000121b8] 60c4                      bra.s      $0001217E
[000121ba] 3a2e 0012                 move.w     18(a6),d5
[000121be] 9a6e 000c                 sub.w      12(a6),d5
[000121c2] 5545                      subq.w     #2,d5
[000121c4] ba6e fffe                 cmp.w      -2(a6),d5
[000121c8] 6404                      bcc.s      $000121CE
[000121ca] 4e5e                      unlk       a6
[000121cc] 4e75                      rts
[000121ce] 3a2e fffe                 move.w     -2(a6),d5
[000121d2] 286e 000e                 movea.l    14(a6),a4
[000121d6] 0c34 002e 5000            cmpi.b     #$2E,0(a4,d5.w)
[000121dc] 670e                      beq.s      $000121EC
[000121de] 3a2e fffe                 move.w     -2(a6),d5
[000121e2] 286e 000e                 movea.l    14(a6),a4
[000121e6] 19bc 002e 5000            move.b     #$2E,0(a4,d5.w)
[000121ec] 426e fffc                 clr.w      -4(a6)
[000121f0] 3a2e 000c                 move.w     12(a6),d5
[000121f4] 3f05                      move.w     d5,-(a7)
[000121f6] 302e fffc                 move.w     -4(a6),d0
[000121fa] b057                      cmp.w      (a7),d0
[000121fc] 6304                      bls.s      $00012202
[000121fe] 4efa 002a                 jmp        $0001222A(pc)
[00012202] 526e fffe                 addq.w     #1,-2(a6)
[00012206] 3a2e fffc                 move.w     -4(a6),d5
[0001220a] 286e 0008                 movea.l    8(a6),a4
[0001220e] 382e fffe                 move.w     -2(a6),d4
[00012212] 266e 000e                 movea.l    14(a6),a3
[00012216] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[0001221c] 302e fffc                 move.w     -4(a6),d0
[00012220] b057                      cmp.w      (a7),d0
[00012222] 6406                      bcc.s      $0001222A
[00012224] 526e fffc                 addq.w     #1,-4(a6)
[00012228] 60d8                      bra.s      $00012202
[0001222a] 548f                      addq.l     #2,a7
[0001222c] 3a2e fffe                 move.w     -2(a6),d5
[00012230] ba6e 0012                 cmp.w      18(a6),d5
[00012234] 640e                      bcc.s      $00012244
[00012236] 3a2e fffe                 move.w     -2(a6),d5
[0001223a] 5245                      addq.w     #1,d5
[0001223c] 286e 000e                 movea.l    14(a6),a4
[00012240] 4234 5000                 clr.b      0(a4,d5.w)
[00012244] 4e5e                      unlk       a6
[00012246] 4e75                      rts

ExecUtil.RunCmd(VAR cmd: ARRAY OF CHAR; VAR tail: ARRAY OF CHAR);
[00012248] 4e56 0000                 link       a6,#0
[0001224c] 3f3c 0001                 move.w     #$0001,-(a7)
[00012250] 3f3c 0001                 move.w     #$0001,-(a7)
[00012254] 3f3c 0001                 move.w     #$0001,-(a7)
[00012258] 286e 000e                 movea.l    14(a6),a4
[0001225c] 2a0c                      move.l     a4,d5
[0001225e] 2f05                      move.l     d5,-(a7)
[00012260] 286e 0008                 movea.l    8(a6),a4
[00012264] 2a0c                      move.l     a4,d5
[00012266] 2f05                      move.l     d5,-(a7)
[00012268] 4eb9 0001 1bde            jsr        AESShells.ShellWrite
[0001226e] 4fef 000e                 lea.l      14(a7),a7
[00012272] 4e5e                      unlk       a6
[00012274] 4e75                      rts

OpenStream:
[00012276] 4e56 fffc                 link       a6,#-4
[0001227a] 2a39 0001 6258            move.l     AppBase.openStreams,d5
[00012280] 0805 000c                 btst       #12,d5
[00012284] 660c                      bne.s      $00012292
[00012286] 2a39 0001 6258            move.l     AppBase.openStreams,d5
[0001228c] 0805 000b                 btst       #11,d5
[00012290] 6720                      beq.s      $000122B2
[00012292] 3f3c 0009                 move.w     #$0009,-(a7)
[00012296] 4879 0001 2656            pea.l      $00012656
[0001229c] 3f3c 004f                 move.w     #$004F,-(a7)
[000122a0] 4879 0001 625c            pea.l      AppBase.shellTail
[000122a6] 6100 ffa0                 bsr.w      ExecUtil.RunCmd
[000122aa] 4fef 000c                 lea.l      12(a7),a7
[000122ae] 4efa 0112                 jmp        $000123C2(pc)
[000122b2] 558f                      subq.l     #2,a7
[000122b4] 3f3c 004f                 move.w     #$004F,-(a7)
[000122b8] 4879 0001 625c            pea.l      AppBase.shellTail
[000122be] 3f3c 0003                 move.w     #$0003,-(a7)
[000122c2] 4879 0001 2662            pea.l      $00012662
[000122c8] 4267                      clr.w      -(a7)
[000122ca] 486e fffe                 pea.l      -2(a6)
[000122ce] 4eb9 0001 1eee            jsr        Strings.Pos
[000122d4] 4fef 0012                 lea.l      18(a7),a7
[000122d8] 4a1f                      tst.b      (a7)+
[000122da] 6702                      beq.s      $000122DE
[000122dc] 6004                      bra.s      $000122E2
[000122de] 4efa 00aa                 jmp        $0001238A(pc)
[000122e2] 3f3c 004f                 move.w     #$004F,-(a7)
[000122e6] 4879 0001 625c            pea.l      AppBase.shellTail
[000122ec] 3f3c 0002                 move.w     #$0002,-(a7)
[000122f0] 4879 0001 2668            pea.l      $00012668 'DEF'
[000122f6] 6100 fe3c                 bsr        ExecUtil.ReplaceExtension
[000122fa] 4fef 000c                 lea.l      12(a7),a7
[000122fe] 3f3c 004f                 move.w     #$004F,-(a7)
[00012302] 4879 0001 625c            pea.l      AppBase.shellTail
[00012308] 4267                      clr.w      -(a7)
[0001230a] 486e fffc                 pea.l      -4(a6)
[0001230e] 4eb9 0001 0906            jsr        GEMDOS.Open
[00012314] 4fef 000c                 lea.l      12(a7),a7
[00012318] 4a6e fffc                 tst.w      -4(a6)
[0001231c] 6c3c                      bge.s      $0001235A
[0001231e] 3f3c 004f                 move.w     #$004F,-(a7)
[00012322] 4879 0001 625c            pea.l      AppBase.shellTail
[00012328] 3f3c 0002                 move.w     #$0002,-(a7)
[0001232c] 4879 0001 266c            pea.l      $0001266C
[00012332] 6100 fe00                 bsr        ExecUtil.ReplaceExtension
[00012336] 4fef 000c                 lea.l      12(a7),a7
[0001233a] 3f3c 0009                 move.w     #$0009,-(a7)
[0001233e] 4879 0001 2670            pea.l      $00012670
[00012344] 3f3c 004f                 move.w     #$004F,-(a7)
[00012348] 4879 0001 625c            pea.l      AppBase.shellTail
[0001234e] 6100 fef8                 bsr        ExecUtil.RunCmd
[00012352] 4fef 000c                 lea.l      12(a7),a7
[00012356] 4efa 002e                 jmp        $00012386(pc)
[0001235a] 558f                      subq.l     #2,a7
[0001235c] 3f2e fffc                 move.w     -4(a6),-(a7)
[00012360] 4eb9 0001 092e            jsr        GEMDOS.Close
[00012366] 548f                      addq.l     #2,a7
[00012368] 4a1f                      tst.b      (a7)+
[0001236a] 4e71                      nop
[0001236c] 3f3c 0009                 move.w     #$0009,-(a7)
[00012370] 4879 0001 267c            pea.l      $0001267C
[00012376] 4267                      clr.w      -(a7)
[00012378] 4879 0001 2688            pea.l      $00012688
[0001237e] 6100 fec8                 bsr        ExecUtil.RunCmd
[00012382] 4fef 000c                 lea.l      12(a7),a7
[00012386] 4efa 003a                 jmp        $000123C2(pc)
[0001238a] 3f3c 004f                 move.w     #$004F,-(a7)
[0001238e] 4879 0001 625c            pea.l      AppBase.shellTail
[00012394] 3f3c 0002                 move.w     #$0002,-(a7)
[00012398] 4879 0001 268a            pea.l      $0001268A
[0001239e] 6100 fd94                 bsr        ExecUtil.ReplaceExtension
[000123a2] 4fef 000c                 lea.l      12(a7),a7
[000123a6] 3f3c 0009                 move.w     #$0009,-(a7)
[000123aa] 4879 0001 268e            pea.l      $0001268E
[000123b0] 3f3c 004f                 move.w     #$004F,-(a7)
[000123b4] 4879 0001 625c            pea.l      AppBase.shellTail
[000123ba] 6100 fe8c                 bsr        ExecUtil.RunCmd
[000123be] 4fef 000c                 lea.l      12(a7),a7
[000123c2] 4e5e                      unlk       a6
[000123c4] 4e75                      rts

ExecUtil.IOError.RunProgram:
[000123c6] 4e56 0000                 link       a6,#0
[000123ca] 2a39 0001 6258            move.l     AppBase.openStreams,d5
[000123d0] 0805 0007                 btst       #7,d5
[000123d4] 6746                      beq.s      $0001241C
[000123d6] 286d fffc                 movea.l    -4(a5),a4
[000123da] 4a2c 0008                 tst.b      8(a4)
[000123de] 663c                      bne.s      $0001241C
[000123e0] 3f3c 004f                 move.w     #$004F,-(a7)
[000123e4] 4879 0001 625c            pea.l      AppBase.shellTail
[000123ea] 3f3c 0002                 move.w     #$0002,-(a7)
[000123ee] 4879 0001 269a            pea.l      $0001269A
[000123f4] 6100 fd3e                 bsr        ExecUtil.ReplaceExtension
[000123f8] 4fef 000c                 lea.l      12(a7),a7
[000123fc] 3f3c 0007                 move.w     #$0007,-(a7)
[00012400] 4879 0001 269e            pea.l      $0001269E
[00012406] 3f3c 004f                 move.w     #$004F,-(a7)
[0001240a] 4879 0001 625c            pea.l      AppBase.shellTail
[00012410] 6100 fe36                 bsr        ExecUtil.RunCmd
[00012414] 4fef 000c                 lea.l      12(a7),a7
[00012418] 4efa 0008                 jmp        $00012422(pc)
[0001241c] 4239 0001 62ac            clr.b      AppBase.xfer
[00012422] 4e5e                      unlk       a6
[00012424] 4e75                      rts

ExecUtil.IOError.RunCompiler:
[00012426] 4e56 0000                 link       a6,#0
[0001242a] 286d fffc                 movea.l    -4(a5),a4
[0001242e] 4a2c 0008                 tst.b      8(a4)
[00012432] 6620                      bne.s      $00012454
[00012434] 3f3c 0009                 move.w     #$0009,-(a7)
[00012438] 4879 0001 26a8            pea.l      $000126A8
[0001243e] 3f3c 004f                 move.w     #$004F,-(a7)
[00012442] 4879 0001 625c            pea.l      AppBase.shellTail
[00012448] 6100 fdfe                 bsr        ExecUtil.RunCmd
[0001244c] 4fef 000c                 lea.l      12(a7),a7
[00012450] 4efa 0008                 jmp        $0001245A(pc)
[00012454] 4239 0001 62ac            clr.b      AppBase.xfer
[0001245a] 4e5e                      unlk       a6
[0001245c] 4e75                      rts

ExecUtil.IOError:
[0001245e] 4e56 ff5a                 link       a6,#-166
[00012462] 2f2d fffc                 move.l     -4(a5),-(a7)
[00012466] 2b4e fffc                 move.l     a6,-4(a5)
[0001246a] 6100 fbee                 bsr        ExecUtil.FreeBuffers
[0001246e] 4267                      clr.w      -(a7)
[00012470] 7aff                      moveq.l    #-1,d5
[00012472] 2f05                      move.l     d5,-(a7)
[00012474] 4eb9 0001 0ca8            jsr        AESGraphics.GrafMouse
[0001247a] 5c8f                      addq.l     #6,a7
[0001247c] 4a39 0001 62ac            tst.b      AppBase.xfer
[00012482] 6758                      beq.s      $000124DC
[00012484] 7a00                      moveq.l    #0,d5
[00012486] 3a2e 000a                 move.w     10(a6),d5
[0001248a] 2005                      move.l     d5,d0
[0001248c] 4eb9 0001 000a            jsr        CASEX
casex1:
[00012492] 0000 0000                 dc.l 0
[00012496] 0000 0003                 dc.l 3
[0001249a] 0000 0028                 dc.l casex1_tab-casex1
case 0:
[0001249e] 6100 fdd6                 bsr        OpenStream
[000124a2] 4efa 0038                 jmp        $000124DC(pc)
case 1:
[000124a6] 6100 ff1e                 bsr        RunProgram
[000124aa] 4efa 0030                 jmp        $000124DC(pc)
case 3:
[000124ae] 6100 ff76                 bsr        ExecUtil.IOError.RunCompiler
[000124b2] 4efa 0028                 jmp        $000124DC(pc)
case 2:
default:
[000124b6] 4efa 000a                 jmp        $000124C2(pc)
casex1_tab:
[000124ba] 000c 
           0014
[000124be] 0024
           001c
[000124c2] 3f3c 0009                 move.w     #$0009,-(a7)
[000124c6] 4879 0001 26b4            pea.l      $000126B4
[000124cc] 4267                      clr.w      -(a7)
[000124ce] 4879 0001 26c0            pea.l      $000126C0
[000124d4] 6100 fd72                 bsr        ExecUtil.RunCmd
[000124d8] 4fef 000c                 lea.l      12(a7),a7
[000124dc] 4a2e 0008                 tst.b      8(a6)
[000124e0] 670a                      beq.s      $000124EC
[000124e2] 4a39 0001 62ac            tst.b      AppBase.xfer
[000124e8] 6602                      bne.s      $000124EC
[000124ea] 6004                      bra.s      $000124F0
[000124ec] 4efa 010c                 jmp        $000125FA(pc)
[000124f0] 7a00                      moveq.l    #0,d5
[000124f2] 3a2e 000a                 move.w     10(a6),d5
[000124f6] 2005                      move.l     d5,d0
[000124f8] 4eb9 0001 000a            jsr        CASEX
casex2:
[000124fe] 0000                      dc.l 0
[00012502] 0000 0004                 dc.l 4
[00012506] 0000 007e                 dc.l casex2_tab-casex2
case 0:
[0001250a] 49f9 0001 26c2            lea.l      $000126C2,a4
[00012510] 47ee ffae                 lea.l      -82(a6),a3
[00012514] 7a0b                      moveq.l    #11,d5
[00012516] 16dc                      move.b     (a4)+,(a3)+
[00012518] 57cd fffc                 dbeq       d5,$00012516
[0001251c] 4efa 007a                 jmp        $00012598(pc)
case 1:
[00012520] 49f9 0001 26ce            lea.l      $000126CE,a4
[00012526] 47ee ffae                 lea.l      -82(a6),a3
[0001252a] 7a07                      moveq.l    #7,d5
[0001252c] 16dc                      move.b     (a4)+,(a3)+
[0001252e] 57cd fffc                 dbeq       d5,$0001252C
[00012532] 4efa 0064                 jmp        $00012598(pc)
case 2:
[00012536] 49f9 0001 26d6            lea.l      $000126D6,a4
[0001253c] 47ee ffae                 lea.l      -82(a6),a3
[00012540] 7a09                      moveq.l    #9,d5
[00012542] 16dc                      move.b     (a4)+,(a3)+
[00012544] 57cd fffc                 dbeq       d5,$00012542
[00012548] 4efa 004e                 jmp        $00012598(pc)
case 3:
[0001254c] 49f9 0001 26e0            lea.l      $000126E0,a4
[00012552] 47ee ffae                 lea.l      -82(a6),a3
[00012556] 7a07                      moveq.l    #7,d5
[00012558] 16dc                      move.b     (a4)+,(a3)+
[0001255a] 57cd fffc                 dbeq       d5,$00012558
[0001255e] 4efa 0038                 jmp        $00012598(pc)
case 4:
[00012562] 49f9 0001 26e8            lea.l      $000126E8,a4
[00012568] 47ee ffae                 lea.l      -82(a6),a3
[0001256c] 7a0f                      moveq.l    #15,d5
[0001256e] 16dc                      move.b     (a4)+,(a3)+
[00012570] 57cd fffc                 dbeq       d5,$0001256E
[00012574] 4efa 0022                 jmp        $00012598(pc)
default:
[00012578] 4efa 000c                 jmp        $00012586(pc)
casex2_tab:
[0001257c] 000c
           0022
[00012580] 0038
           004e
           0064
[00012586] 49f9 0001 26f8            lea.l      $000126F8,a4
[0001258c] 47ee ffae                 lea.l      -82(a6),a3
[00012590] 7a0e                      moveq.l    #14,d5
[00012592] 16dc                      move.b     (a4)+,(a3)+
[00012594] 57cd fffc                 dbeq       d5,$00012592
[00012598] 3f3c 001b                 move.w     #$001B,-(a7)
[0001259c] 4879 0001 2708            pea.l      $00012708
[000125a2] 3f3c 004f                 move.w     #$004F,-(a7)
[000125a6] 486e ffae                 pea.l      -82(a6)
[000125aa] 3f3c 004f                 move.w     #$004F,-(a7)
[000125ae] 486e ff5e                 pea.l      -162(a6)
[000125b2] 4eb9 0001 1db2            jsr        Strings.Concat
[000125b8] 4fef 0012                 lea.l      18(a7),a7
[000125bc] 3f3c 004f                 move.w     #$004F,-(a7)
[000125c0] 486e ff5e                 pea.l      -162(a6)
[000125c4] 3f3c 0008                 move.w     #$0008,-(a7)
[000125c8] 4879 0001 2726            pea.l      $00012726
[000125ce] 3f3c 004f                 move.w     #$004F,-(a7)
[000125d2] 486e ffae                 pea.l      -82(a6)
[000125d6] 4eb9 0001 1db2            jsr        Strings.Concat
[000125dc] 4fef 0012                 lea.l      18(a7),a7
[000125e0] 558f                      subq.l     #2,a7
[000125e2] 3f3c 0001                 move.w     #$0001,-(a7)
[000125e6] 3f3c 004f                 move.w     #$004F,-(a7)
[000125ea] 486e ffae                 pea.l      -82(a6)
[000125ee] 4eb9 0001 1af2            jsr        AESForms.FormAlert
[000125f4] 508f                      addq.l     #8,a7
[000125f6] 3d5f fffe                 move.w     (a7)+,-2(a6)

[000125fa] 6100 fa6c                 bsr        ExecUtil.Terminate
[000125fe] 2a0d                      move.l     a5,d5
[00012600] 7828                      moveq.l    #40,d4
[00012602] 9a84                      sub.l      d4,d5
[00012604] 2d45 ff5a                 move.l     d5,-166(a6)
[00012608] 286e ff5a                 movea.l    -166(a6),a4
[0001260c] 2f0c                      move.l     a4,-(a7)
[0001260e] 2854                      movea.l    (a4),a4
[00012610] 4e94                      jsr        (a4)
[00012612] 285f                      movea.l    (a7)+,a4
[00012614] 2b5f fffc                 move.l     (a7)+,-4(a5)
[00012618] 4e5e                      unlk       a6
[0001261a] 4e75                      rts

ExecUtil.init:
[0001261c] 4ef9 0001 2040            jmp        Buffers.init

[00012622] 4e56 0000                 link       a6,#0
[00012626] 4279 0001 6804            clr.w      $00016804
[0001262c] 42b9 0001 67fc            clr.l      $000167FC
[00012632] 7aff                      moveq.l    #-1,d5
[00012634] 23c5 0001 6800            move.l     d5,$00016800
[0001263a] 558f                      subq.l     #2,a7
[0001263c] 4eb9 0001 1a2c            jsr        AESApplications.ApplInitialise
[00012642] 33df 0001 624a            move.w     (a7)+,AppBase.apId
[00012648] 4239 0001 6806            clr.b      ExecUtil.terminated
[0001264e] 4e5e                      unlk       a6
[00012650] 4ef9 0001 2b42            jmp        M2Option.init+6

[00012656] 4544                      .asciiz 'EDITOR.PRG'
[00012662] 2e4d                      .asciiz '.MOD'
[00012668] 4445                      .asciiz 'DEF'
[0001266C]                           .asciiz 'LNK'
[00012670] 4c49 4e4b                 .asciiz 'LINKER.PRG'
[0001267c] 4544                      .asciiz 'EDITOR.PRG'
[00012688] 0000                      .asciiz ''
[0001268a] 4d4f                      .asciiz 'MOD'
[0001268e] 4544                      .asciiz 'EDITOR.PRG'
[0001269a] 5052                      .asciiz 'PRG'
[0001269e] 4558                      .asciiz 'EXEC.PRG'
[000126a8] 4d4f                      .asciiZ 'MODULA.PRG'
[000126b4] 4544                      .asciiz 'EDITOR.PRG'
[000126c0] 0000
[000126c2] 636f                      .asciiz 'compilation'
[000126ce] 6c69                      .asciiz 'linking'
[000126d6] 6465                      .asciiz 'debugging'
[000126e0] 6564                      .asciiz 'editing'
[000126e8] 7574                      .asciiz 'utility program'
[000126f8] 4d6f                      .asciiz 'Modula Product'
[00012708] 5b31                      .asciiz '[1][Error(s) occured during|'
[00012726] 5d5b                      .asciiz '][  OK  ]'

***
* MODULE AESEvents
***

AESEvents.EventMessage:
[00012730] 4e56 0000                 link       a6,#0
[00012734] 23ee 0008 0001 5ddc       move.l     8(a6),$00015DDC
[0001273c] 558f                      subq.l     #2,a7
[0001273e] 3f3c 0017                 move.w     #$0017,-(a7)
[00012742] 4267                      clr.w      -(a7)
[00012744] 3f3c 0001                 move.w     #$0001,-(a7)
[00012748] 3f3c 0001                 move.w     #$0001,-(a7)
[0001274c] 4267                      clr.w      -(a7)
[0001274e] 4eb9 0001 0a34            jsr        GEMAESbase.GemCall
[00012754] 4fef 000a                 lea.l      10(a7),a7
[00012758] 33df 0001 5df0            move.w     (a7)+,$00015DF0
[0001275e] 4e5e                      unlk       a6
[00012760] 4e75                      rts

***
* MODULE M2Option
***

M2Option.SendMsg:
[00012762] 4e56 0000                 link       a6,#0
[00012766] 33fc 0046 0001 680a       move.w     #$0046,M2Option.msgbuf
[0001276e] 33f9 0001 624a 0001 680c  move.w     AppBase.apId,M2Option.msgbuf+2
[00012778] 4279 0001 680e            clr.w      M2Option.msgbuf+4
[0001277e] 33ee 0008 0001 6810       move.w     8(a6),M2Option.msgbuf+6
[00012786] 3f39 0001 6808            move.w     M2Option.accId,-(a7)
[0001278c] 3f3c 0010                 move.w     #$0010,-(a7)
[00012790] 49f9 0001 680a            lea.l      M2Option.msgbuf,a4
[00012796] 2a0c                      move.l     a4,d5
[00012798] 2f05                      move.l     d5,-(a7)
[0001279a] 4eb9 0001 1a52            jsr        AESApplications.ApplWrite
[000127a0] 508f                      addq.l     #8,a7
[000127a2] 49f9 0001 682a            lea.l      $0001682A,a4
[000127a8] 2a0c                      move.l     a4,d5
[000127aa] 2f05                      move.l     d5,-(a7)
[000127ac] 4eb9 0001 2730            jsr        AESEvents.EventMessage
[000127b2] 588f                      addq.l     #4,a7
[000127b4] 0c79 0047 0001 682a       cmpi.w     #$0047,$0001682A
[000127bc] 6702                      beq.s      $000127C0
[000127be] 60e2                      bra.s      $000127A2
[000127c0] 4e5e                      unlk       a6
[000127c2] 4e75                      rts

M2Option.GetSystemOptions:
[000127c4] 4e56 fff8                 link       a6,#-8
[000127c8] 4a79 0001 6808            tst.w      M2Option.accId
[000127ce] 6d02                      blt.s      $000127D2
[000127d0] 6004                      bra.s      $000127D6
[000127d2] 4efa 00a8                 jmp        $0001287C(pc)
[000127d6] 49f9 0001 684a            lea.l      $0001684A,a4
[000127dc] 2a0c                      move.l     a4,d5
[000127de] 7810                      moveq.l    #16,d4
[000127e0] e8ad                      lsr.l      d4,d5
[000127e2] 33c5 0001 6812            move.w     d5,M2Option.msgbuf+8
[000127e8] 49f9 0001 684a            lea.l      $0001684A,a4
[000127ee] 2a0c                      move.l     a4,d5
[000127f0] 33c5 0001 6814            move.w     d5,M2Option.msgbuf+10
[000127f6] 3f3c 0005                 move.w     #$0005,-(a7)
[000127fa] 4eb9 0001 2762            jsr        M2Option.SendMsg
[00012800] 548f                      addq.l     #2,a7
[00012802] 3a39 0001 6830            move.w     M2Option.replybuf+6,d5
[00012808] 48c5                      ext.l      d5
[0001280a] 286e 0014                 movea.l    20(a6),a4
[0001280e] 1885                      move.b     d5,(a4)
[00012810] 3a39 0001 6832            move.w     M2Option.replybuf+8,d5
[00012816] 48c5                      ext.l      d5
[00012818] 286e 0010                 movea.l    16(a6),a4
[0001281c] 1885                      move.b     d5,(a4)
[0001281e] 3a39 0001 6834            move.w     M2Option.replybuf+10,d5
[00012824] 48c5                      ext.l      d5
[00012826] 286e 000c                 movea.l    12(a6),a4
[0001282a] 1885                      move.b     d5,(a4)
[0001282c] 426e fffe                 clr.w      -2(a6)
[00012830] 426e fffc                 clr.w      -4(a6)
[00012834] 3a2e fffe                 move.w     -2(a6),d5
[00012838] cafc 0026                 mulu.w     #$0026,d5
[0001283c] da6e fffc                 add.w      -4(a6),d5
[00012840] 49f9 0001 684a            lea.l      $0001684A,a4
[00012846] 382e fffe                 move.w     -2(a6),d4
[0001284a] 266e 0008                 movea.l    8(a6),a3
[0001284e] c8fc 0032                 mulu.w     #$0032,d4
[00012852] 362e fffc                 move.w     -4(a6),d3
[00012856] 47f3 4000                 lea.l      0(a3,d4.w),a3
[0001285a] 17b4 5000 3000            move.b     0(a4,d5.w),0(a3,d3.w)
[00012860] 526e fffc                 addq.w     #1,-4(a6)
[00012864] 0c6e 0026 fffc            cmpi.w     #$0026,-4(a6)
[0001286a] 66c8                      bne.s      $00012834
[0001286c] 526e fffe                 addq.w     #1,-2(a6)
[00012870] 0c6e 0007 fffe            cmpi.w     #$0007,-2(a6)
[00012876] 66b8                      bne.s      $00012830
[00012878] 4efa 0030                 jmp        $000128AA(pc)
[0001287c] 286e 0014                 movea.l    20(a6),a4
[00012880] 18bc 0001                 move.b     #$01,(a4)
[00012884] 286e 0010                 movea.l    16(a6),a4
[00012888] 4214                      clr.b      (a4)
[0001288a] 426e fffe                 clr.w      -2(a6)
[0001288e] 3a2e fffe                 move.w     -2(a6),d5
[00012892] 286e 0008                 movea.l    8(a6),a4
[00012896] cafc 0032                 mulu.w     #$0032,d5
[0001289a] 4234 5000                 clr.b      0(a4,d5.w)
[0001289e] 526e fffe                 addq.w     #1,-2(a6)
[000128a2] 0c6e 0007 fffe            cmpi.w     #$0007,-2(a6)
[000128a8] 66e4                      bne.s      $0001288E
[000128aa] 1d7c 005c fff9            move.b     #$5C,-7(a6)
[000128b0] 426e fffe                 clr.w      -2(a6)
[000128b4] 3a2e fffe                 move.w     -2(a6),d5
[000128b8] 286e 0008                 movea.l    8(a6),a4
[000128bc] cafc 0032                 mulu.w     #$0032,d5
[000128c0] 4a34 5000                 tst.b      0(a4,d5.w)
[000128c4] 6602                      bne.s      $000128C8
[000128c6] 6004                      bra.s      $000128CC
[000128c8] 4efa 0072                 jmp        $0001293C(pc)
[000128cc] 3a2e fffe                 move.w     -2(a6),d5
[000128d0] 286e 0008                 movea.l    8(a6),a4
[000128d4] cafc 0032                 mulu.w     #$0032,d5
[000128d8] 3f3c 0031                 move.w     #$0031,-(a7)
[000128dc] 4874 5000                 pea.l      0(a4,d5.w)
[000128e0] 4267                      clr.w      -(a7)
[000128e2] 4eb9 0001 09d0            jsr        GEMDOS.GetPath
[000128e8] 508f                      addq.l     #8,a7
[000128ea] 3a2e fffe                 move.w     -2(a6),d5
[000128ee] 286e 0008                 movea.l    8(a6),a4
[000128f2] cafc 0032                 mulu.w     #$0032,d5
[000128f6] 4a34 5000                 tst.b      0(a4,d5.w)
[000128fa] 6640                      bne.s      $0001293C
[000128fc] 3a2e fffe                 move.w     -2(a6),d5
[00012900] 286e 0008                 movea.l    8(a6),a4
[00012904] cafc 0032                 mulu.w     #$0032,d5
[00012908] 47f9 0001 2b68            lea.l      $00012B68,a3
[0001290e] 49f4 5000                 lea.l      0(a4,d5.w),a4
[00012912] 7a03                      moveq.l    #3,d5
[00012914] 18db                      move.b     (a3)+,(a4)+
[00012916] 57cd fffc                 dbeq       d5,$00012914
[0001291a] 486e fffa                 pea.l      -6(a6)
[0001291e] 4eb9 0001 08c2            jsr        GEMDOS.GetDrv
[00012924] 588f                      addq.l     #4,a7
[00012926] 7a41                      moveq.l    #65,d5
[00012928] da6e fffa                 add.w      -6(a6),d5
[0001292c] 382e fffe                 move.w     -2(a6),d4
[00012930] 286e 0008                 movea.l    8(a6),a4
[00012934] c8fc 0032                 mulu.w     #$0032,d4
[00012938] 1985 4000                 move.b     d5,0(a4,d4.w)
[0001293c] 3a2e fffe                 move.w     -2(a6),d5
[00012940] 286e 0008                 movea.l    8(a6),a4
[00012944] cafc 0032                 mulu.w     #$0032,d5
[00012948] 0c34 003a 5001            cmpi.b     #$3A,1(a4,d5.w)
[0001294e] 674c                      beq.s      $0001299C
[00012950] 3f3c 0001                 move.w     #$0001,-(a7)
[00012954] 4879 0001 2b6c            pea.l      $00012B6C
[0001295a] 3a2e fffe                 move.w     -2(a6),d5
[0001295e] 286e 0008                 movea.l    8(a6),a4
[00012962] cafc 0032                 mulu.w     #$0032,d5
[00012966] 3f3c 0031                 move.w     #$0031,-(a7)
[0001296a] 4874 5000                 pea.l      0(a4,d5.w)
[0001296e] 4267                      clr.w      -(a7)
[00012970] 4eb9 0001 1cce            jsr        Strings.Insert
[00012976] 4fef 000e                 lea.l      14(a7),a7
[0001297a] 486e fffa                 pea.l      -6(a6)
[0001297e] 4eb9 0001 08c2            jsr        GEMDOS.GetDrv
[00012984] 588f                      addq.l     #4,a7
[00012986] 7a41                      moveq.l    #65,d5
[00012988] da6e fffa                 add.w      -6(a6),d5
[0001298c] 382e fffe                 move.w     -2(a6),d4
[00012990] 286e 0008                 movea.l    8(a6),a4
[00012994] c8fc 0032                 mulu.w     #$0032,d4
[00012998] 1985 4000                 move.b     d5,0(a4,d4.w)
[0001299c] 558f                      subq.l     #2,a7
[0001299e] 3a2e fffe                 move.w     -2(a6),d5
[000129a2] 286e 0008                 movea.l    8(a6),a4
[000129a6] cafc 0032                 mulu.w     #$0032,d5
[000129aa] 3f3c 0031                 move.w     #$0031,-(a7)
[000129ae] 4874 5000                 pea.l      0(a4,d5.w)
[000129b2] 4eb9 0001 1e98            jsr        Strings.Length
[000129b8] 5c8f                      addq.l     #6,a7
[000129ba] 3d5f fffc                 move.w     (a7)+,-4(a6)
[000129be] 0c6e 0002 fffc            cmpi.w     #$0002,-4(a6)
[000129c4] 631e                      bls.s      $000129E4
[000129c6] 3a2e fffe                 move.w     -2(a6),d5
[000129ca] 286e 0008                 movea.l    8(a6),a4
[000129ce] cafc 0032                 mulu.w     #$0032,d5
[000129d2] 382e fffc                 move.w     -4(a6),d4
[000129d6] 5344                      subq.w     #1,d4
[000129d8] 49f4 5000                 lea.l      0(a4,d5.w),a4
[000129dc] 0c34 005c 4000            cmpi.b     #$5C,0(a4,d4.w)
[000129e2] 6734                      beq.s      $00012A18
[000129e4] 3a2e fffe                 move.w     -2(a6),d5
[000129e8] 286e 0008                 movea.l    8(a6),a4
[000129ec] cafc 0032                 mulu.w     #$0032,d5
[000129f0] 382e fffc                 move.w     -4(a6),d4
[000129f4] 49f4 5000                 lea.l      0(a4,d5.w),a4
[000129f8] 19bc 005c 4000            move.b     #$5C,0(a4,d4.w)
[000129fe] 3a2e fffe                 move.w     -2(a6),d5
[00012a02] 286e 0008                 movea.l    8(a6),a4
[00012a06] cafc 0032                 mulu.w     #$0032,d5
[00012a0a] 382e fffc                 move.w     -4(a6),d4
[00012a0e] 5244                      addq.w     #1,d4
[00012a10] 49f4 5000                 lea.l      0(a4,d5.w),a4
[00012a14] 4234 4000                 clr.b      0(a4,d4.w)
[00012a18] 3a2e fffe                 move.w     -2(a6),d5
[00012a1c] 286e 0008                 movea.l    8(a6),a4
[00012a20] cafc 0032                 mulu.w     #$0032,d5
[00012a24] 0c34 005c 5002            cmpi.b     #$5C,2(a4,d5.w)
[00012a2a] 6728                      beq.s      $00012A54
[00012a2c] 4267                      clr.w      -(a7)
[00012a2e] 486e fff9                 pea.l      -7(a6)
[00012a32] 3a2e fffe                 move.w     -2(a6),d5
[00012a36] 286e 0008                 movea.l    8(a6),a4
[00012a3a] cafc 0032                 mulu.w     #$0032,d5
[00012a3e] 3f3c 0031                 move.w     #$0031,-(a7)
[00012a42] 4874 5000                 pea.l      0(a4,d5.w)
[00012a46] 3f3c 0002                 move.w     #$0002,-(a7)
[00012a4a] 4eb9 0001 1cce            jsr        Strings.Insert
[00012a50] 4fef 000e                 lea.l      14(a7),a7
[00012a54] 526e fffe                 addq.w     #1,-2(a6)
[00012a58] 0c6e 0007 fffe            cmpi.w     #$0007,-2(a6)
[00012a5e] 6600 fe54                 bne        $000128B4
[00012a62] 4e5e                      unlk       a6
[00012a64] 4e75                      rts

M2Option.GetCompilerOptions:
[00012a66] 4e56 0000                 link       a6,#0
[00012a6a] 4a79 0001 6808            tst.w      M2Option.accId
[00012a70] 6d36                      blt.s      $00012AA8
[00012a72] 3f3c 0003                 move.w     #$0003,-(a7)
[00012a76] 4eb9 0001 2762            jsr        M2Option.SendMsg
[00012a7c] 548f                      addq.l     #2,a7
[00012a7e] 3a39 0001 6830            move.w     M2Option.replybuf+6,d5
[00012a84] 48c5                      ext.l      d5
[00012a86] 286e 0010                 movea.l    16(a6),a4
[00012a8a] 1885                      move.b     d5,(a4)
[00012a8c] 3a39 0001 6832            move.w     M2Option.replybuf+8,d5
[00012a92] 48c5                      ext.l      d5
[00012a94] 286e 000c                 movea.l    12(a6),a4
[00012a98] 1885                      move.b     d5,(a4)
[00012a9a] 286e 0008                 movea.l    8(a6),a4
[00012a9e] 38b9 0001 6834            move.w     M2Option.replybuf+10,(a4)
[00012aa4] 4efa 0014                 jmp        $00012ABA(pc)
[00012aa8] 286e 0010                 movea.l    16(a6),a4
[00012aac] 4214                      clr.b      (a4)
[00012aae] 286e 000c                 movea.l    12(a6),a4
[00012ab2] 4214                      clr.b      (a4)
[00012ab4] 286e 0008                 movea.l    8(a6),a4
[00012ab8] 4254                      clr.w      (a4)
[00012aba] 4e5e                      unlk       a6
[00012abc] 4e75                      rts

M2Option.GetLinkerOptions:
[00012abe] 4e56 0000                 link       a6,#0
[00012ac2] 4a79 0001 6808            tst.w      M2Option.accId
[00012ac8] 6d56                      blt.s      $00012B20
[00012aca] 3f3c 0002                 move.w     #$0002,-(a7)
[00012ace] 4eb9 0001 2762            jsr        M2Option.SendMsg
[00012ad4] 548f                      addq.l     #2,a7
[00012ad6] 3a39 0001 6830            move.w     M2Option.replybuf+6,d5
[00012adc] 48c5                      ext.l      d5
[00012ade] 286e 000c                 movea.l    12(a6),a4
[00012ae2] 1885                      move.b     d5,(a4)
[00012ae4] 3a39 0001 6832            move.w     M2Option.replybuf+8,d5
[00012aea] 48c5                      ext.l      d5
[00012aec] 286e 0010                 movea.l    16(a6),a4
[00012af0] 1885                      move.b     d5,(a4)
[00012af2] 3a39 0001 6834            move.w     M2Option.replybuf+10,d5
[00012af8] 48c5                      ext.l      d5
[00012afa] 286e 0014                 movea.l    20(a6),a4
[00012afe] 1885                      move.b     d5,(a4)
[00012b00] 7a00                      moveq.l    #0,d5
[00012b02] 3a39 0001 6836            move.w     M2Option.replybuf+12,d5
[00012b08] 7010                      moveq.l    #16,d0
[00012b0a] e1a5                      asl.l      d0,d5
[00012b0c] 7800                      moveq.l    #0,d4
[00012b0e] 3839 0001 6838            move.w     M2Option.replybuf+14,d4
[00012b14] da84                      add.l      d4,d5
[00012b16] 286e 0008                 movea.l    8(a6),a4
[00012b1a] 2885                      move.l     d5,(a4)
[00012b1c] 4efa 001a                 jmp        $00012B38(pc)
[00012b20] 286e 000c                 movea.l    12(a6),a4
[00012b24] 4214                      clr.b      (a4)
[00012b26] 286e 0014                 movea.l    20(a6),a4
[00012b2a] 4214                      clr.b      (a4)
[00012b2c] 286e 0010                 movea.l    16(a6),a4
[00012b30] 4214                      clr.b      (a4)
[00012b32] 286e 0008                 movea.l    8(a6),a4
[00012b36] 4294                      clr.l      (a4)
[00012b38] 4e5e                      unlk       a6
[00012b3a] 4e75                      rts

M2Option.init:
[00012b3c] 4ef9 0001 261c            jmp        ExecUtil.init

[00012b42] 4e56 0000                 link       a6,#0
[00012b46] 558f                      subq.l     #2,a7
[00012b48] 3f3c 0007                 move.w     #$0007,-(a7)
[00012b4c] 4879 0001 2b70            pea.l      $00012B70 'M2OPTION'
[00012b52] 4eb9 0001 1a96            jsr        AESApplications.ApplFind
[00012b58] 5c8f                      addq.l     #6,a7
[00012b5a] 33df 0001 6808            move.w     (a7)+,M2Option.accId
[00012b60] 4e5e                      unlk       a6
[00012b62] 4ef9 0001 3f42            jmp        NewStreams.init+6

[00012b68] 413a 5c00                 .asciiz "A:\"
[00012b6c] 413a 0000                 .asciiz "A:"
[00012b70] 4d32 4f50                 .asciiz 'M2OPTION'

***
* MODULE NewStreams
***

NewStreams.FileError:
[00012b7a] 4e56                      link       a6,#-402
[00012b7e] 4267                      clr.w      -(a7)
[00012b80] 7aff                      moveq.l    #-1,d5
[00012b82] 2f05                      move.l     d5,-(a7)
[00012b84] 4eb9 0001 0ca8            jsr        AESGraphics.GrafMouse
[00012b8a] 5c8f                      addq.l     #6,a7
[00012b8c] 0c6e ffdf 0008            cmpi.w     #$FFDF,8(a6)
[00012b92] 6602                      bne.s      $00012B96
[00012b94] 6004                      bra.s      $00012B9A
[00012b96] 4efa 008e                 jmp        $00012C26(pc)
[00012b9a] 49f9 0001 3ffa            lea.l      $00013FFA,a4 '[1][The following file could|not be found:|'
[00012ba0] 47ee ff36                 lea.l      -202(a6),a3
[00012ba4] 7a2b                      moveq.l    #43,d5
[00012ba6] 16dc                      move.b     (a4)+,(a3)+
[00012ba8] 57cd fffc                 dbeq       d5,$00012BA6
[00012bac] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012bb0] 486e ff36                 pea.l      -202(a6)
[00012bb4] 3a2e 000e                 move.w     14(a6),d5
[00012bb8] 3f05                      move.w     d5,-(a7)
[00012bba] 286e 000a                 movea.l    10(a6),a4
[00012bbe] 4854                      pea.l      (a4)
[00012bc0] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012bc4] 486e fe6e                 pea.l      -402(a6)
[00012bc8] 4eb9 0001 1db2            jsr        Strings.Concat
[00012bce] 4fef 0012                 lea.l      18(a7),a7
[00012bd2] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012bd6] 486e fe6e                 pea.l      -402(a6)
[00012bda] 3f3c 0015                 move.w     #$0015,-(a7)
[00012bde] 4879 0001 4026            pea.l      $00014026 '][ENTER NAME|CONTINUE]'
[00012be4] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012be8] 486e ff36                 pea.l      -202(a6)
[00012bec] 4eb9 0001 1db2            jsr        Strings.Concat
[00012bf2] 4fef 0012                 lea.l      18(a7),a7
[00012bf6] 558f                      subq.l     #2,a7
[00012bf8] 3f3c 0001                 move.w     #$0001,-(a7)
[00012bfc] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012c00] 486e ff36                 pea.l      -202(a6)
[00012c04] 4eb9 0001 1af2            jsr        AESForms.FormAlert
[00012c0a] 508f                      addq.l     #8,a7
[00012c0c] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00012c10] 0c6e 0001 fffe            cmpi.w     #$0001,-2(a6)
[00012c16] 56c5                      sne        d5
[00012c18] 4405                      neg.b      d5
[00012c1a] 1d45 0010                 move.b     d5,16(a6)
[00012c1e] 4e5e                      unlk       a6
[00012c20] 4e75                      rts
[00012c22] 4efa 001e                 jmp        $00012C42(pc)
[00012c26] 558f                      subq.l     #2,a7
[00012c28] 3f2e 0008                 move.w     8(a6),-(a7)
[00012c2c] 4eb9 0001 1b30            jsr        AESForms.FormError
[00012c32] 548f                      addq.l     #2,a7
[00012c34] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00012c38] 1d7c 0001 0010            move.b     #$01,16(a6)
[00012c3e] 4e5e                      unlk       a6
[00012c40] 4e75                      rts

NewStreams.Error:
[00012c42] 4e56 fe6e                 link       a6,#-402
[00012c46] 4267                      clr.w      -(a7)
[00012c48] 7aff                      moveq.l    #-1,d5
[00012c4a] 2f05                      move.l     d5,-(a7)
[00012c4c] 4eb9 0001 0ca8            jsr        AESGraphics.GrafMouse
[00012c52] 5c8f                      addq.l     #6,a7
[00012c54] 49f9 0001 403e            lea.l      $0001403E,a4 '[3][An IO error has occured|whilst '
[00012c5a] 47ee ff36                 lea.l      -202(a6),a3
[00012c5e] 7a23                      moveq.l    #35,d5
[00012c60] 16dc                      move.b     (a4)+,(a3)+
[00012c62] 57cd fffc                 dbeq       d5,$00012C60
[00012c66] 4a2e 0008                 tst.b      8(a6)
[00012c6a] 6728                      beq.s      $00012C94
[00012c6c] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012c70] 486e ff36                 pea.l      -202(a6)
[00012c74] 3f3c 0006                 move.w     #$0006,-(a7)
[00012c78] 4879 0001 4062            pea.l      $00014062 'writing'
[00012c7e] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012c82] 486e fe6e                 pea.l      -402(a6)
[00012c86] 4eb9 0001 1db2            jsr        Strings.Concat
[00012c8c] 4fef 0012                 lea.l      18(a7),a7
[00012c90] 4efa 0026                 jmp        $00012CB8(pc)
[00012c94] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012c98] 486e ff36                 pea.l      -202(a6)
[00012c9c] 3f3c 0006                 move.w     #$0006,-(a7)
[00012ca0] 4879 0001 406a            pea.l      $0001406A 'reading'
[00012ca6] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012caa] 486e fe6e                 pea.l      -402(a6)
[00012cae] 4eb9 0001 1db2            jsr        Strings.Concat
[00012cb4] 4fef 0012                 lea.l      18(a7),a7
[00012cb8] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012cbc] 486e fe6e                 pea.l      -402(a6)
[00012cc0] 3f3c 000e                 move.w     #$000E,-(a7)
[00012cc4] 4879 0001 4072            pea.l      $00014072 ' the disk.][OK]'
[00012cca] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012cce] 486e ff36                 pea.l      -202(a6)
[00012cd2] 4eb9 0001 1db2            jsr        Strings.Concat
[00012cd8] 4fef 0012                 lea.l      18(a7),a7
[00012cdc] 558f                      subq.l     #2,a7
[00012cde] 3f3c 0001                 move.w     #$0001,-(a7)
[00012ce2] 3f3c 00c7                 move.w     #$00C7,-(a7)
[00012ce6] 486e ff36                 pea.l      -202(a6)
[00012cea] 4eb9 0001 1af2            jsr        AESForms.FormAlert
[00012cf0] 508f                      addq.l     #8,a7
[00012cf2] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00012cf6] 3f3c 0063                 move.w     #$0063,-(a7)
[00012cfa] 1f3c 0001                 move.b     #$01,-(a7)
[00012cfe] 4eb9 0001 245e            jsr        ExecUtil.IOError
[00012d04] 588f                      addq.l     #4,a7
[00012d06] 4e5e                      unlk       a6
[00012d08] 4e75                      rts

NewStreams.Enospace:
[00012d0a] 4e56 ffae                 link       a6,#-82
[00012d0e] 4267                      clr.w      -(a7)
[00012d10] 7aff                      moveq.l    #-1,d5
[00012d12] 2f05                      move.l     d5,-(a7)
[00012d14] 4eb9 0001 0ca8            jsr        AESGraphics.GrafMouse
[00012d1a] 5c8f                      addq.l     #6,a7
[00012d1c] 49f9 0001 4082            lea.l      $00014082,a4 '[3][The disk does not have|enough room to write|any more information.][OK] '
[00012d22] 47ee ffae                 lea.l      -82(a6),a3
[00012d26] 7a4b                      moveq.l    #75,d5
[00012d28] 16dc                      move.b     (a4)+,(a3)+
[00012d2a] 57cd fffc                 dbeq       d5,$00012D28
[00012d2e] 558f                      subq.l     #2,a7
[00012d30] 3f3c 0001                 move.w     #$0001,-(a7)
[00012d34] 3f3c 004f                 move.w     #$004F,-(a7)
[00012d38] 486e ffae                 pea.l      -82(a6)
[00012d3c] 4eb9 0001 1af2            jsr        AESForms.FormAlert
[00012d42] 508f                      addq.l     #8,a7
[00012d44] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00012d48] 3f3c 0063                 move.w     #$0063,-(a7)
[00012d4c] 1f3c 0001                 move.b     #$01,-(a7)
[00012d50] 4eb9 0001 245e            jsr        ExecUtil.IOError
[00012d56] 588f                      addq.l     #4,a7
[00012d58] 4e5e                      unlk       a6
[00012d5a] 4e75                      rts

NewStreams.Enomem:
[00012d5c] 4e56 ffae                 link       a6,#-82
[00012d60] 4267                      clr.w      -(a7)
[00012d62] 7aff                      moveq.l    #-1,d5
[00012d64] 2f05                      move.l     d5,-(a7)
[00012d66] 4eb9 0001 0ca8            jsr        AESGraphics.GrafMouse
[00012d6c] 5c8f                      addq.l     #6,a7
[00012d6e] 49f9 0001 40ce            lea.l      $000140CE,a4 '[3][Heap overflow!|No memory to open file][OK]'
[00012d74] 47ee ffae                 lea.l      -82(a6),a3
[00012d78] 7a2e                      moveq.l    #46,d5
[00012d7a] 16dc                      move.b     (a4)+,(a3)+
[00012d7c] 57cd fffc                 dbeq       d5,$00012D7A
[00012d80] 558f                      subq.l     #2,a7
[00012d82] 3f3c 0001                 move.w     #$0001,-(a7)
[00012d86] 3f3c 004f                 move.w     #$004F,-(a7)
[00012d8a] 486e ffae                 pea.l      -82(a6)
[00012d8e] 4eb9 0001 1af2            jsr        AESForms.FormAlert
[00012d94] 508f                      addq.l     #8,a7
[00012d96] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00012d9a] 3f3c 0063                 move.w     #$0063,-(a7)
[00012d9e] 1f3c 0001                 move.b     #$01,-(a7)
[00012da2] 4eb9 0001 245e            jsr        ExecUtil.IOError
[00012da8] 588f                      addq.l     #4,a7
[00012daa] 4e5e                      unlk       a6
[00012dac] 4e75                      rts

NewStreams.setExtension:
[00012dae] 4e56 fff8                 link       a6,#-8
[00012db2] 286e 0008                 movea.l    8(a6),a4
[00012db6] 2d54 fffc                 move.l     (a4),-4(a6)
[00012dba] 426e fffa                 clr.w      -6(a6)
[00012dbe] 426e fff8                 clr.w      -8(a6)
[00012dc2] 286d fffc                 movea.l    -4(a5),a4
[00012dc6] 3a2e fffa                 move.w     -6(a6),d5
[00012dca] ba6c 000e                 cmp.w      14(a4),d5
[00012dce] 6236                      bhi.s      $00012E06
[00012dd0] 286d fffc                 movea.l    -4(a5),a4
[00012dd4] 3a2e fffa                 move.w     -6(a6),d5
[00012dd8] 286c 000a                 movea.l    10(a4),a4
[00012ddc] 4a34 5000                 tst.b      0(a4,d5.w)
[00012de0] 6724                      beq.s      $00012E06
[00012de2] 286d fffc                 movea.l    -4(a5),a4
[00012de6] 3a2e fffa                 move.w     -6(a6),d5
[00012dea] 286c 000a                 movea.l    10(a4),a4
[00012dee] 0c34 005c 5000            cmpi.b     #$5C,0(a4,d5.w)
[00012df4] 660a                      bne.s      $00012E00
[00012df6] 3a2e fffa                 move.w     -6(a6),d5
[00012dfa] 5245                      addq.w     #1,d5
[00012dfc] 3d45 fff8                 move.w     d5,-8(a6)
[00012e00] 526e fffa                 addq.w     #1,-6(a6)
[00012e04] 60bc                      bra.s      $00012DC2
[00012e06] 3d6e fff8 fffa            move.w     -8(a6),-6(a6)
[00012e0c] 286d fffc                 movea.l    -4(a5),a4
[00012e10] 3a2e fffa                 move.w     -6(a6),d5
[00012e14] ba6c 000e                 cmp.w      14(a4),d5
[00012e18] 623a                      bhi.s      $00012E54
[00012e1a] 286d fffc                 movea.l    -4(a5),a4
[00012e1e] 3a2e fffa                 move.w     -6(a6),d5
[00012e22] 286c 000a                 movea.l    10(a4),a4
[00012e26] 4a34 5000                 tst.b      0(a4,d5.w)
[00012e2a] 6728                      beq.s      $00012E54
[00012e2c] 286d fffc                 movea.l    -4(a5),a4
[00012e30] 3a2e fffa                 move.w     -6(a6),d5
[00012e34] 286c 000a                 movea.l    10(a4),a4
[00012e38] 0c34 002e 5000            cmpi.b     #$2E,0(a4,d5.w)
[00012e3e] 6714                      beq.s      $00012E54
[00012e40] 3a2e fffa                 move.w     -6(a6),d5
[00012e44] 9a6e fff8                 sub.w      -8(a6),d5
[00012e48] 0c45 0008                 cmpi.w     #$0008,d5
[00012e4c] 6406                      bcc.s      $00012E54
[00012e4e] 526e fffa                 addq.w     #1,-6(a6)
[00012e52] 60b8                      bra.s      $00012E0C
[00012e54] 286d fffc                 movea.l    -4(a5),a4
[00012e58] 3a2c 000e                 move.w     14(a4),d5
[00012e5c] 5545                      subq.w     #2,d5
[00012e5e] 5545                      subq.w     #2,d5
[00012e60] ba6e fffa                 cmp.w      -6(a6),d5
[00012e64] 6404                      bcc.s      $00012E6A
[00012e66] 4e5e                      unlk       a6
[00012e68] 4e75                      rts
[00012e6a] 286d fffc                 movea.l    -4(a5),a4
[00012e6e] 3a2e fffa                 move.w     -6(a6),d5
[00012e72] 286c 000a                 movea.l    10(a4),a4
[00012e76] 0c34 002e 5000            cmpi.b     #$2E,0(a4,d5.w)
[00012e7c] 6712                      beq.s      $00012E90
[00012e7e] 286d fffc                 movea.l    -4(a5),a4
[00012e82] 3a2e fffa                 move.w     -6(a6),d5
[00012e86] 286c 000a                 movea.l    10(a4),a4
[00012e8a] 19bc 002e 5000            move.b     #$2E,0(a4,d5.w)
[00012e90] 426e fff8                 clr.w      -8(a6)
[00012e94] 526e fffa                 addq.w     #1,-6(a6)
[00012e98] 3a2e fff8                 move.w     -8(a6),d5
[00012e9c] 49ee fffc                 lea.l      -4(a6),a4
[00012ea0] 266d fffc                 movea.l    -4(a5),a3
[00012ea4] 382e fffa                 move.w     -6(a6),d4
[00012ea8] 266b 000a                 movea.l    10(a3),a3
[00012eac] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[00012eb2] 526e fff8                 addq.w     #1,-8(a6)
[00012eb6] 0c6e 0003 fff8            cmpi.w     #$0003,-8(a6)
[00012ebc] 66d6                      bne.s      $00012E94
[00012ebe] 286d fffc                 movea.l    -4(a5),a4
[00012ec2] 3a2e fffa                 move.w     -6(a6),d5
[00012ec6] ba6c 000e                 cmp.w      14(a4),d5
[00012eca] 6412                      bcc.s      $00012EDE
[00012ecc] 286d fffc                 movea.l    -4(a5),a4
[00012ed0] 3a2e fffa                 move.w     -6(a6),d5
[00012ed4] 5245                      addq.w     #1,d5
[00012ed6] 286c 000a                 movea.l    10(a4),a4
[00012eda] 4234 5000                 clr.b      0(a4,d5.w)
[00012ede] 4e5e                      unlk       a6
[00012ee0] 4e75                      rts

NewStreams.SetFileExtension:
[00012ee2] 4e56 0000                 link       a6,#0
[00012ee6] 2f2d fffc                 move.l     -4(a5),-(a7)
[00012eea] 2b4e fffc                 move.l     a6,-4(a5)
[00012eee] 7a00                      moveq.l    #0,d5
[00012ef0] 3a2e 0008                 move.w     8(a6),d5
[00012ef4] 2005                      move.l     d5,d0
[00012ef6] 4eb9 0001 000a            jsr        CASEX
casex3:
[00012efc] 0000                      dc.l 0
[00012f00] 0000 0011                 dc.l 17
[00012f04] 0000 0114                 casex3_tab-casex3
case 0:
[00012f08] 4efa 0136                 jmp        $00013040(pc)
case 1:
[00012f0c] 4879 0001 40fe            pea.l      $000140FE 'TMP'
[00012f12] 6100 fe9a                 bsr        NewStreams.setExtension
[00012f16] 588f                      addq.l     #4,a7
[00012f18] 4efa 0126                 jmp        $00013040(pc)
case 2:
[00012f1c] 4879 0001 4102            pea.l      $00014102 'MOD'
[00012f22] 6100 fe8a                 bsr        NewStreams.setExtension
[00012f26] 588f                      addq.l     #4,a7
[00012f28] 4efa 0116                 jmp        $00013040(pc)
case 3:
[00012f2c] 4879 0001 4106            pea.l      $00014106 'REF'
[00012f32] 6100 fe7a                 bsr        NewStreams.setExtension
[00012f36] 588f                      addq.l     #4,a7
[00012f38] 4efa 0106                 jmp        $00013040(pc)
case 4:
[00012f3c] 4879 0001 410a            pea.l      $0001410A 'SYM'
[00012f42] 6100 fe6a                 bsr        NewStreams.setExtension
[00012f46] 588f                      addq.l     #4,a7
[00012f48] 4efa 00f6                 jmp        $00013040(pc)
case 5:
[00012f4c] 4879 0001 410e            pea.l      $0001410E 'LNK'
[00012f52] 6100 fe5a                 bsr        NewStreams.setExtension
[00012f56] 588f                      addq.l     #4,a7
[00012f58] 4efa 00e6                 jmp        $00013040(pc)
case 6:
[00012f5c] 4879 0001 4112            pea.l      $00014112 'LST'
[00012f62] 6100 fe4a                 bsr        NewStreams.setExtension
[00012f66] 588f                      addq.l     #4,a7
[00012f68] 4efa 00d6                 jmp        $00013040(pc)
case 7:
case 8:
[00012f6c] 4879 0001 4116            pea.l      $00014116 'PRG'
[00012f72] 6100 fe3a                 bsr        NewStreams.setExtension
[00012f76] 588f                      addq.l     #4,a7
[00012f78] 4efa 00c6                 jmp        $00013040(pc)
case 9:
[00012f7c] 4879 0001 411a            pea.l      $0001411A 'MAP'
[00012f82] 6100 fe2a                 bsr        NewStreams.setExtension
[00012f86] 588f                      addq.l     #4,a7
[00012f88] 4efa 00b6                 jmp        $00013040(pc)
case 10:
[00012f8c] 4879 0001 411e            pea.l      $0001411E 'COR'
[00012f92] 6100 fe1a                 bsr        NewStreams.setExtension
[00012f96] 588f                      addq.l     #4,a7
[00012f98] 4efa 00a6                 jmp        $00013040(pc)
case 11:
[00012f9c] 4879 0001 4122            pea.l      $00014122 'ERD'
[00012fa2] 6100 fe0a                 bsr        NewStreams.setExtension
[00012fa6] 588f                      addq.l     #4,a7
[00012fa8] 4efa 0096                 jmp        $00013040(pc)
case 12:
[00012fac] 4879 0001 4126            pea.l      $00014126 'ERM'
[00012fb2] 6100 fdfa                 bsr        NewStreams.setExtension
[00012fb6] 588f                      addq.l     #4,a7
[00012fb8] 4efa 0086                 jmp        $00013040(pc)
case 13:
[00012fbc] 4879 0001 412a            pea.l      $0001412A 'XRF'
[00012fc2] 6100 fdea                 bsr        NewStreams.setExtension
[00012fc6] 588f                      addq.l     #4,a7
[00012fc8] 4efa 0076                 jmp        $00013040(pc)
case 14:
[00012fcc] 4879 0001 412e            pea.l      $0001412E 'DEC'
[00012fd2] 6100 fdda                 bsr        NewStreams.setExtension
[00012fd6] 588f                      addq.l     #4,a7
[00012fd8] 4efa 0066                 jmp        $00013040(pc)
case 15:
[00012fdc] 4879 0001 4132            pea.l      $00014132 'PRT'
[00012fe2] 6100 fdca                 bsr        NewStreams.setExtension
[00012fe6] 588f                      addq.l     #4,a7
[00012fe8] 4efa 0056                 jmp        $00013040(pc)
case 16:
[00012fec] 4879 0001 4136            pea.l      $00014136 'IND'
[00012ff2] 6100 fdba                 bsr        NewStreams.setExtension
[00012ff6] 588f                      addq.l     #4,a7
[00012ff8] 4efa 0046                 jmp        $00013040(pc)
case 17:
[00012ffc] 4879 0001 413a            pea.l      $0001413A 'RSC'
[00013002] 6100 fdaa                 bsr        NewStreams.setExtension
[00013006] 588f                      addq.l     #4,a7
[00013008] 4efa 0036                 jmp        $00013040(pc)
default:
[0001300c] 4efa 0026                 jmp        $00013034(pc)
casex3_tab:
[00013010] 000c
           0010
[00013014] 0020
           0030
[00013018] 0040
[0001301a] 0050
[0001301c] 0060
           0070
[00013020] 0070
           0080
           0090
[00013026] 00a0
           00b0
           00c0
[0001302c] 00d0
           00e0
[00013030] 00f0
           0100
[00013034] 4879                      pea.l      $0001413e '   '
[0001303a] 6100 fd72                 bsr        NewStreams.setExtension
[0001303e] 588f                      addq.l     #4,a7
[00013040] 2b5f fffc                 move.l     (a7)+,-4(a5)
[00013044] 4e5e                      unlk       a6
[00013046] 4e75                      rts

NewStreams.max:
[00013048] 4e56 0000                 link       a6,#0
[0001304c] 3a2e 000a                 move.w     10(a6),d5
[00013050] ba6e 0008                 cmp.w      8(a6),d5
[00013054] 630e                      bls.s      $00013064
[00013056] 3d6e 000a 000c            move.w     10(a6),12(a6)
[0001305c] 4e5e                      unlk       a6
[0001305e] 4e75                      rts
[00013060] 4efa 000c                 jmp        $0001306E(pc)
[00013064] 3d6e 0008 000c            move.w     8(a6),12(a6)
[0001306a] 4e5e                      unlk       a6
[0001306c] 4e75                      rts

NewStreams.allocfile:
[0001306e] 4e56 fffe                 link       a6,#-2
[00013072] 4878 023c                 pea.l      ($0000023C).w
[00013076] 286e 000e                 movea.l    14(a6),a4
[0001307a] 4854                      pea.l      (a4)
[0001307c] 4eb9 0001 09f4            jsr        GEMDOS.Alloc
[00013082] 508f                      addq.l     #8,a7
[00013084] 286e 000e                 movea.l    14(a6),a4
[00013088] 4a94                      tst.l      (a4)
[0001308a] 6604                      bne.s      $00013090
[0001308c] 6100 fcce                 bsr        NewStreams.Enomem
[00013090] 266e 000e                 movea.l    14(a6),a3
[00013094] 2853                      movea.l    (a3),a4
[00013096] 38bc ffff                 move.w     #$FFFF,(a4)
[0001309a] 426e fffe                 clr.w      -2(a6)
[0001309e] 0c6e 0027 fffe            cmpi.w     #$0027,-2(a6)
[000130a4] 6234                      bhi.s      $000130DA
[000130a6] 3a2e fffe                 move.w     -2(a6),d5
[000130aa] ba6e 000c                 cmp.w      12(a6),d5
[000130ae] 622a                      bhi.s      $000130DA
[000130b0] 3a2e fffe                 move.w     -2(a6),d5
[000130b4] 266e 0008                 movea.l    8(a6),a3
[000130b8] 4a33 5000                 tst.b      0(a3,d5.w)
[000130bc] 671c                      beq.s      $000130DA
[000130be] 3a2e fffe                 move.w     -2(a6),d5
[000130c2] 266e 0008                 movea.l    8(a6),a3
[000130c6] 382e fffe                 move.w     -2(a6),d4
[000130ca] 45ec 0002                 lea.l      2(a4),a2
[000130ce] 15b3 5000 4000            move.b     0(a3,d5.w),0(a2,d4.w)
[000130d4] 526e fffe                 addq.w     #1,-2(a6)
[000130d8] 60c4                      bra.s      $0001309E
[000130da] 0c6e 0027 fffe            cmpi.w     #$0027,-2(a6)
[000130e0] 6210                      bhi.s      $000130F2
[000130e2] 3a2e fffe                 move.w     -2(a6),d5
[000130e6] 47ec 0002                 lea.l      2(a4),a3
[000130ea] 4233 5000                 clr.b      0(a3,d5.w)
[000130ee] 4efa 0006                 jmp        $000130F6(pc)
[000130f2] 422c 0029                 clr.b      41(a4)
[000130f6] 42ac 002a                 clr.l      42(a4)
[000130fa] 7aff                      moveq.l    #-1,d5
[000130fc] 2945 002e                 move.l     d5,46(a4)
[00013100] 426c 0032                 clr.w      50(a4)
[00013104] 42ac 0034                 clr.l      52(a4)
[00013108] 422c 0038                 clr.b      56(a4)
[0001310c] 4e5e                      unlk       a6
[0001310e] 4e75                      rts

NewStreams.flush(VAR s: STREAM):
[00013110] 4e56 fffc                 link       a6,#-4
[00013114] 266e 0008                 movea.l    8(a6),a3
[00013118] 2853                      movea.l    (a3),a4
[0001311a] 4a2c 0038                 tst.b      56(a4)
[0001311e] 6768                      beq.s      $00013188
[00013120] 7a00                      moveq.l    #0,d5
[00013122] 3a2c 0032                 move.w     50(a4),d5
[00013126] 2d45 fffc                 move.l     d5,-4(a6)
[0001312a] 4aae fffc                 tst.l      -4(a6)
[0001312e] 6758                      beq.s      $00013188
[00013130] 2f0c                      move.l     a4,-(a7)
[00013132] 3f14                      move.w     (a4),-(a7)
[00013134] 486e fffc                 pea.l      -4(a6)
[00013138] 47ec 003a                 lea.l      58(a4),a3
[0001313c] 2a0b                      move.l     a3,d5
[0001313e] 2f05                      move.l     d5,-(a7)
[00013140] 4eb9 0001 097a            jsr        GEMDOS.Write
[00013146] 4fef 000a                 lea.l      10(a7),a7
[0001314a] 285f                      movea.l    (a7)+,a4
[0001314c] 4aae fffc                 tst.l      -4(a6)
[00013150] 6412                      bcc.s      $00013164 BUG in compiler? tst instruction will always clear carry
[00013152] 2f0c                      move.l     a4,-(a7)
[00013154] 1f3c 0001                 move.b     #$01,-(a7)
[00013158] 6100 fae8                 bsr        NewStreams.Error
[0001315c] 548f                      addq.l     #2,a7
[0001315e] 285f                      movea.l    (a7)+,a4
[00013160] 4efa 0016                 jmp        $00013178(pc)
[00013164] 7a00                      moveq.l    #0,d5
[00013166] 3a2c 0032                 move.w     50(a4),d5
[0001316a] baae fffc                 cmp.l      -4(a6),d5
[0001316e] 6708                      beq.s      $00013178
[00013170] 2f0c                      move.l     a4,-(a7)
[00013172] 6100 fb96                 bsr        NewStreams.Enospace
[00013176] 285f                      movea.l    (a7)+,a4
[00013178] 2a2c 0034                 move.l     52(a4),d5
[0001317c] baac 002a                 cmp.l      42(a4),d5
[00013180] 6306                      bls.s      $00013188
[00013182] 296c 0034 002a            move.l     52(a4),42(a4)
[00013188] 7aff                      moveq.l    #-1,d5
[0001318a] 2945 002e                 move.l     d5,46(a4)
[0001318e] 426c 0032                 clr.w      50(a4)
[00013192] 422c 0038                 clr.b      56(a4)
[00013196] 4e5e                      unlk       a6
[00013198] 4e75                      rts

NewStreams.readbyte(f: FilePointer; VAR ch: CHAR):
[0001319a] 4e56 fff8                 link       a6,#-8
[0001319e] 286e 000c                 movea.l    12(a6),a4
[000131a2] 2a2c 0034                 move.l     52(a4),d5
[000131a6] e28d                      lsr.l      #1,d5
[000131a8] e08d                      lsr.l      #8,d5
[000131aa] 7009                      moveq.l    #9,d0
[000131ac] e1a5                      asl.l      d0,d5
[000131ae] baac 002e                 cmp.l      46(a4),d5
[000131b2] 6702                      beq.s      $000131B6
[000131b4] 6004                      bra.s      $000131BA
[000131b6] 4efa 007e                 jmp        $00013236(pc)
[000131ba] 2f0c                      move.l     a4,-(a7)
[000131bc] 486e 000c                 pea.l      12(a6)
[000131c0] 6100 ff4e                 bsr        NewStreams.Flush
[000131c4] 588f                      addq.l     #4,a7
[000131c6] 285f                      movea.l    (a7)+,a4
[000131c8] 2a2c 0034                 move.l     52(a4),d5
[000131cc] e28d                      lsr.l      #1,d5
[000131ce] e08d                      lsr.l      #8,d5
[000131d0] 7009                      moveq.l    #9,d0
[000131d2] e1a5                      asl.l      d0,d5
[000131d4] 2945 002e                 move.l     d5,46(a4)
[000131d8] 2d6c 002e fffc            move.l     46(a4),-4(a6)
[000131de] 2f0c                      move.l     a4,-(a7)
[000131e0] 2f2e fffc                 move.l     -4(a6),-(a7)
[000131e4] 266e 000c                 movea.l    12(a6),a3
[000131e8] 3f13                      move.w     (a3),-(a7)
[000131ea] 4227                      clr.b      -(a7)
[000131ec] 486e fffc                 pea.l      -4(a6)
[000131f0] 4eb9 0001 09a4            jsr        GEMDOS.Seek
[000131f6] 4fef 000c                 lea.l      12(a7),a7
[000131fa] 285f                      movea.l    (a7)+,a4
[000131fc] 2d7c 0000 0200 fff8       move.l     #$00000200,-8(a6)
[00013204] 2f0c                      move.l     a4,-(a7)
[00013206] 266e 000c                 movea.l    12(a6),a3
[0001320a] 3f13                      move.w     (a3),-(a7)
[0001320c] 486e fff8                 pea.l      -8(a6)
[00013210] 47ec 003a                 lea.l      58(a4),a3
[00013214] 2a0b                      move.l     a3,d5
[00013216] 2f05                      move.l     d5,-(a7)
[00013218] 4eb9 0001 0950            jsr        GEMDOS.Read
[0001321e] 4fef 000a                 lea.l      10(a7),a7
[00013222] 285f                      movea.l    (a7)+,a4
[00013224] 4aae fff8                 tst.l      -8(a6)
[00013228] 640c                      bcc.s      $00013236 BUG in compiler? tst instruction will always clear carry
[0001322a] 2f0c                      move.l     a4,-(a7)
[0001322c] 4227                      clr.b      -(a7)
[0001322e] 6100 fa12                 bsr        NewStreams.Error
[00013232] 548f                      addq.l     #2,a7
[00013234] 285f                      movea.l    (a7)+,a4
[00013236] 2f0c                      move.l     a4,-(a7)
[00013238] 558f                      subq.l     #2,a7
[0001323a] 2a2c 0034                 move.l     52(a4),d5
[0001323e] 0285 0000 01ff            andi.l     #$000001FF,d5
[00013244] 5245                      addq.w     #1,d5
[00013246] 3f05                      move.w     d5,-(a7)
[00013248] 3f2c 0032                 move.w     50(a4),-(a7)
[0001324c] 6100 fdfa                 bsr        NewStreams.max
[00013250] 588f                      addq.l     #4,a7
[00013252] 3a1f                      move.w     (a7)+,d5
[00013254] 285f                      movea.l    (a7)+,a4
[00013256] 3945 0032                 move.w     d5,50(a4)
[0001325a] 2a2c 0034                 move.l     52(a4),d5
[0001325e] 0285 0000 01ff            andi.l     #$000001FF,d5
[00013264] 47ec 003a                 lea.l      58(a4),a3
[00013268] 246e 0008                 movea.l    8(a6),a2
[0001326c] 14b3 5000                 move.b     0(a3,d5.w),(a2)
[00013270] 52ac 0034                 addq.l     #1,52(a4)
[00013274] 4e5e                      unlk       a6
[00013276] 4e75                      rts

NewStreams.read16bit(f: FilePointer; VAR v: WORD)
[00013278] 4e56 fffe                 link       a6,#-2
[0001327c] 2f2e 000c                 move.l     12(a6),-(a7)
[00013280] 486e ffff                 pea.l      -1(a6)
[00013284] 6100 ff14                 bsr        NewStreams.readbyte
[00013288] 508f                      addq.l     #8,a7
[0001328a] 2f2e 000c                 move.l     12(a6),-(a7)
[0001328e] 486e fffe                 pea.l      -2(a6)
[00013292] 6100 ff06                 bsr        NewStreams.readbyte
[00013296] 508f                      addq.l     #8,a7
[00013298] 7a00                      moveq.l    #0,d5
[0001329a] 1a2e ffff                 move.b     -1(a6),d5
[0001329e] e145                      asl.w      #8,d5
[000132a0] 7800                      moveq.l    #0,d4
[000132a2] 182e fffe                 move.b     -2(a6),d4
[000132a6] da44                      add.w      d4,d5
[000132a8] 286e 0008                 movea.l    8(a6),a4
[000132ac] 3885                      move.w     d5,(a4)
[000132ae] 4e5e                      unlk       a6
[000132b0] 4e75                      rts

NewStreams.writebyte(f: FilePointer; ch: CHAR);
[000132b2] 4e56 fff8                 link       a6,#-8
[000132b6] 286e 000c                 movea.l    12(a6),a4
[000132ba] 2a2c 0034                 move.l     52(a4),d5
[000132be] e28d                      lsr.l      #1,d5
[000132c0] e08d                      lsr.l      #8,d5
[000132c2] 7009                      moveq.l    #9,d0
[000132c4] e1a5                      asl.l      d0,d5
[000132c6] baac 002e                 cmp.l      46(a4),d5
[000132ca] 6702                      beq.s      $000132CE
[000132cc] 6004                      bra.s      $000132D2
[000132ce] 4efa 0090                 jmp        $00013360(pc)
[000132d2] 2f0c                      move.l     a4,-(a7)
[000132d4] 486e 000c                 pea.l      12(a6)
[000132d8] 6100 fe36                 bsr        NewStreams.Flush
[000132dc] 588f                      addq.l     #4,a7
[000132de] 285f                      movea.l    (a7)+,a4
[000132e0] 2a2c 0034                 move.l     52(a4),d5
[000132e4] e28d                      lsr.l      #1,d5
[000132e6] e08d                      lsr.l      #8,d5
[000132e8] 7009                      moveq.l    #9,d0
[000132ea] e1a5                      asl.l      d0,d5
[000132ec] 2945 002e                 move.l     d5,46(a4)
[000132f0] 2d6c 002e fffc            move.l     46(a4),-4(a6)
[000132f6] 2f0c                      move.l     a4,-(a7)
[000132f8] 2f2e fffc                 move.l     -4(a6),-(a7)
[000132fc] 266e 000c                 movea.l    12(a6),a3
[00013300] 3f13                      move.w     (a3),-(a7)
[00013302] 4227                      clr.b      -(a7)
[00013304] 486e fffc                 pea.l      -4(a6)
[00013308] 4eb9 0001 09a4            jsr        GEMDOS.Seek
[0001330e] 4fef 000c                 lea.l      12(a7),a7
[00013312] 285f                      movea.l    (a7)+,a4
[00013314] 2d7c 0000 0200 fff8       move.l     #$00000200,-8(a6)
[0001331c] 2f0c                      move.l     a4,-(a7)
[0001331e] 266e 000c                 movea.l    12(a6),a3
[00013322] 3f13                      move.w     (a3),-(a7)
[00013324] 486e fff8                 pea.l      -8(a6)
[00013328] 47ec 003a                 lea.l      58(a4),a3
[0001332c] 2a0b                      move.l     a3,d5
[0001332e] 2f05                      move.l     d5,-(a7)
[00013330] 4eb9 0001 0950            jsr        GEMDOS.Read
[00013336] 4fef 000a                 lea.l      10(a7),a7
[0001333a] 285f                      movea.l    (a7)+,a4
[0001333c] 2d6c 002e fffc            move.l     46(a4),-4(a6)
[00013342] 2f0c                      move.l     a4,-(a7)
[00013344] 2f2e fffc                 move.l     -4(a6),-(a7)
[00013348] 266e 000c                 movea.l    12(a6),a3
[0001334c] 3f13                      move.w     (a3),-(a7)
[0001334e] 4227                      clr.b      -(a7)
[00013350] 486e fffc                 pea.l      -4(a6)
[00013354] 4eb9 0001 09a4            jsr        GEMDOS.Seek
[0001335a] 4fef 000c                 lea.l      12(a7),a7
[0001335e] 285f                      movea.l    (a7)+,a4
[00013360] 2f0c                      move.l     a4,-(a7)
[00013362] 558f                      subq.l     #2,a7
[00013364] 2a2c 0034                 move.l     52(a4),d5
[00013368] 0285 0000 01ff            andi.l     #$000001FF,d5
[0001336e] 5245                      addq.w     #1,d5
[00013370] 3f05                      move.w     d5,-(a7)
[00013372] 3f2c 0032                 move.w     50(a4),-(a7)
[00013376] 6100 fcd0                 bsr        NewStreams.max
[0001337a] 588f                      addq.l     #4,a7
[0001337c] 3a1f                      move.w     (a7)+,d5
[0001337e] 285f                      movea.l    (a7)+,a4
[00013380] 3945 0032                 move.w     d5,50(a4)
[00013384] 2a2c 0034                 move.l     52(a4),d5
[00013388] 0285 0000 01ff            andi.l     #$000001FF,d5
[0001338e] 47ec 003a                 lea.l      58(a4),a3
[00013392] 17ae 000a 5000            move.b     10(a6),0(a3,d5.w)
[00013398] 197c 0001 0038            move.b     #$01,56(a4)
[0001339e] 52ac 0034                 addq.l     #1,52(a4)
[000133a2] 4a2e 0008                 tst.b      8(a6)
[000133a6] 6606                      bne.s      $000133AE
[000133a8] 296c 0034 002a            move.l     52(a4),42(a4)
[000133ae] 2a2c 0034                 move.l     52(a4),d5
[000133b2] 0285 0000 01ff            andi.l     #$000001FF,d5
[000133b8] 4a85                      tst.l      d5
[000133ba] 6614                      bne.s      $000133D0
[000133bc] 2f0c                      move.l     a4,-(a7)
[000133be] 486e 000c                 pea.l      12(a6)
[000133c2] 6100 fd4c                 bsr        NewStreams.Flush
[000133c6] 588f                      addq.l     #4,a7
[000133c8] 285f                      movea.l    (a7)+,a4
[000133ca] 296c 0034 002e            move.l     52(a4),46(a4)
[000133d0] 4e5e                      unlk       a6
[000133d2] 4e75                      rts

NewStreams.strupr:
[000133d4] 4e56 fffe                 link       a6,#-2
[000133d8] 426e fffe                 clr.w      -2(a6)
[000133dc] 3a2e fffe                 move.w     -2(a6),d5
[000133e0] ba6e 000c                 cmp.w      12(a6),d5
[000133e4] 623c                      bhi.s      $00013422
[000133e6] 3a2e fffe                 move.w     -2(a6),d5
[000133ea] 286e 0008                 movea.l    8(a6),a4
[000133ee] 4a34 5000                 tst.b      0(a4,d5.w)
[000133f2] 672e                      beq.s      $00013422
[000133f4] 3a2e fffe                 move.w     -2(a6),d5
[000133f8] 286e 0008                 movea.l    8(a6),a4
[000133fc] 1834 5000                 move.b     0(a4,d5.w),d4
[00013400] 0c04 0061                 cmpi.b     #$61,d4
[00013404] 650a                      bcs.s      $00013410
[00013406] 0c04 007a                 cmpi.b     #$7A,d4
[0001340a] 6204                      bhi.s      $00013410
[0001340c] 0204 005f                 andi.b     #$5F,d4
[00013410] 3a2e fffe                 move.w     -2(a6),d5
[00013414] 286e 0008                 movea.l    8(a6),a4
[00013418] 1984 5000                 move.b     d4,0(a4,d5.w)
[0001341c] 526e fffe                 addq.w     #1,-2(a6)
[00013420] 60ba                      bra.s      $000133DC
[00013422] 4e5e                      unlk       a6
[00013424] 4e75                      rts

NewStreams.FileLookup:
[00013426] 4e56 ff0e                 link       a6,#-242
[0001342a] 422e ff33                 clr.b      -205(a6)
[0001342e] 4a39 0001 6ab4            tst.b      NewStreams.needfile
[00013434] 6702                      beq.s      $00013438
[00013436] 6004                      bra.s      $0001343C
[00013438] 4efa 00ae                 jmp        $000134E8(pc)
[0001343c] 4a39 0001 6ab6            tst.b      NewStreams.mainfilename
[00013442] 6602                      bne.s      $00013446
[00013444] 6004                      bra.s      $0001344A
[00013446] 4efa 007e                 jmp        $000134C6(pc)
[0001344a] 4a39 0001 6ade            tst.b      NewStreams.outfilename
[00013450] 56c5                      sne        d5
[00013452] 4405                      neg.b      d5
[00013454] 1d45 ff33                 move.b     d5,-205(a6)
[00013458] 4a2e ff33                 tst.b      -205(a6)
[0001345c] 6764                      beq.s      $000134C2
[0001345e] 3d7c 0001 ff40            move.w     #$0001,-192(a6)
[00013464] 0c6e 0027 ff40            cmpi.w     #$0027,-192(a6)
[0001346a] 6242                      bhi.s      $000134AE
[0001346c] 3a2e ff40                 move.w     -192(a6),d5
[00013470] 49f9 0001 6ade            lea.l      NewStreams.outfilename,a4
[00013476] 0c34 000d 5000            cmpi.b     #$0D,0(a4,d5.w)
[0001347c] 6730                      beq.s      $000134AE
[0001347e] 3a2e ff40                 move.w     -192(a6),d5
[00013482] 49f9 0001 6ade            lea.l      NewStreams.outfilename,a4
[00013488] 4a34 5000                 tst.b      0(a4,d5.w)
[0001348c] 6720                      beq.s      $000134AE
[0001348e] 3a2e ff40                 move.w     -192(a6),d5
[00013492] 49f9 0001 6ade            lea.l      NewStreams.outfilename,a4
[00013498] 382e ff40                 move.w     -192(a6),d4
[0001349c] 5344                      subq.w     #1,d4
[0001349e] 47ee ff42                 lea.l      -190(a6),a3
[000134a2] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[000134a8] 526e ff40                 addq.w     #1,-192(a6)
[000134ac] 60b6                      bra.s      $00013464
[000134ae] 3a2e ff40                 move.w     -192(a6),d5
[000134b2] 5345                      subq.w     #1,d5
[000134b4] 49ee ff42                 lea.l      -190(a6),a4
[000134b8] 4234 5000                 clr.b      0(a4,d5.w)
[000134bc] 4239 0001 62ac            clr.b      AppBase.xfer
[000134c2] 4efa 0024                 jmp        $000134E8(pc)
[000134c6] 3f3c 003c                 move.w     #$003C,-(a7)
[000134ca] 486e ff42                 pea.l      -190(a6)
[000134ce] 3f3c 0027                 move.w     #$0027,-(a7)
[000134d2] 4879 0001 6ab6            pea.l      NewStreams.mainfilename
[000134d8] 4eb9 0001 1c40            jsr        Strings.Assign
[000134de] 4fef 000c                 lea.l      12(a7),a7
[000134e2] 1d7c 0001 ff33            move.b     #$01,-205(a6)
[000134e8] 286e 0022                 movea.l    34(a6),a4
[000134ec] 4a14                      tst.b      (a4)
[000134ee] 6718                      beq.s      $00013508
[000134f0] 4a2e 0014                 tst.b      20(a6)
[000134f4] 660e                      bne.s      $00013504
[000134f6] 0c6e 0001 001a            cmpi.w     #$0001,26(a6)
[000134fc] 670a                      beq.s      $00013508
[000134fe] 4a6e 001a                 tst.w      26(a6)
[00013502] 6704                      beq.s      $00013508
[00013504] 7a01                      moveq.l    #1,d5
[00013506] 6002                      bra.s      $0001350A
[00013508] 7a00                      moveq.l    #0,d5
[0001350a] 1d45 ff37                 move.b     d5,-201(a6)
[0001350e] 4a2e ff37                 tst.b      -201(a6)
[00013512] 6726                      beq.s      $0001353A
[00013514] 3a2e 0026                 move.w     38(a6),d5
[00013518] 3f05                      move.w     d5,-(a7)
[0001351a] 286e 0022                 movea.l    34(a6),a4
[0001351e] 4854                      pea.l      (a4)
[00013520] 4eb9 0001 130e            jsr        AppWindow.WriteString
[00013526] 5c8f                      addq.l     #6,a7
[00013528] 3f3c 0002                 move.w     #$0002,-(a7)
[0001352c] 4879 0001 4142            pea.l      $00014142 ' : '
[00013532] 4eb9 0001 130e            jsr        AppWindow.WriteString
[00013538] 5c8f                      addq.l     #6,a7
[0001353a] 426e ff34                 clr.w      -204(a6)
[0001353e] 4a2e ff33                 tst.b      -205(a6)
[00013542] 6608                      bne.s      $0001354C
[00013544] 4a2e 0014                 tst.b      20(a6)
[00013548] 6702                      beq.s      $0001354C
[0001354a] 6004                      bra.s      $00013550
[0001354c] 4efa 0188                 jmp        $000136D6(pc)
[00013550] 4267                      clr.w      -(a7)
[00013552] 7aff                      moveq.l    #-1,d5
[00013554] 2f05                      move.l     d5,-(a7)
[00013556] 4eb9 0001 0ca8            jsr        AESGraphics.GrafMouse
[0001355c] 5c8f                      addq.l     #6,a7
[0001355e] 3f3c 003c                 move.w     #$003C,-(a7)
[00013562] 486e ffbe                 pea.l      -66(a6)
[00013566] 3f3c 0031                 move.w     #$0031,-(a7)
[0001356a] 4879 0001 6956            pea.l      NewStreams.searchpaths
[00013570] 4eb9 0001 1c40            jsr        Strings.Assign
[00013576] 4fef 000c                 lea.l      12(a7),a7
[0001357a] 558f                      subq.l     #2,a7
[0001357c] 3f3c 003c                 move.w     #$003C,-(a7)
[00013580] 486e ffbe                 pea.l      -66(a6)
[00013584] 4eb9 0001 1e98            jsr        Strings.Length
[0001358a] 5c8f                      addq.l     #6,a7
[0001358c] 3d5f ff3c                 move.w     (a7)+,-196(a6)
[00013590] 3a2e ff3c                 move.w     -196(a6),d5
[00013594] 49ee ffbe                 lea.l      -66(a6),a4
[00013598] 19bc 002a 5000            move.b     #$2A,0(a4,d5.w)
[0001359e] 3a2e ff3c                 move.w     -196(a6),d5
[000135a2] 5245                      addq.w     #1,d5
[000135a4] 49ee ffbe                 lea.l      -66(a6),a4
[000135a8] 4234 5000                 clr.b      0(a4,d5.w)
[000135ac] 3f3c 003c                 move.w     #$003C,-(a7)
[000135b0] 486e ffbe                 pea.l      -66(a6)
[000135b4] 3f2e 001a                 move.w     26(a6),-(a7)
[000135b8] 6100 f928                 bsr        NewStreams.SetFileExtension
[000135bc] 508f                      addq.l     #8,a7
[000135be] 3f3c 003c                 move.w     #$003C,-(a7)
[000135c2] 486e ff80                 pea.l      -128(a6)
[000135c6] 3a2e 0020                 move.w     32(a6),d5
[000135ca] 3f05                      move.w     d5,-(a7)
[000135cc] 286e 001c                 movea.l    28(a6),a4
[000135d0] 4854                      pea.l      (a4)
[000135d2] 4eb9 0001 1c40            jsr        Strings.Assign
[000135d8] 4fef 000c                 lea.l      12(a7),a7
[000135dc] 4a2e ff80                 tst.b      -128(a6)
[000135e0] 6712                      beq.s      $000135F4
[000135e2] 3f3c 003c                 move.w     #$003C,-(a7)
[000135e6] 486e ff80                 pea.l      -128(a6)
[000135ea] 3f2e 001a                 move.w     26(a6),-(a7)
[000135ee] 6100 f8f2                 bsr        NewStreams.SetFileExtension
[000135f2] 508f                      addq.l     #8,a7
[000135f4] 3f3c 003c                 move.w     #$003C,-(a7)
[000135f8] 486e ff80                 pea.l      -128(a6)
[000135fc] 6100 fdd6                 bsr        NewStreams.strupr
[00013600] 5c8f                      addq.l     #6,a7
[00013602] 49ee ffbe                 lea.l      -66(a6),a4
[00013606] 2a0c                      move.l     a4,d5
[00013608] 2f05                      move.l     d5,-(a7)
[0001360a] 49ee ff80                 lea.l      -128(a6),a4
[0001360e] 2a0c                      move.l     a4,d5
[00013610] 2f05                      move.l     d5,-(a7)
[00013612] 486e fffc                 pea.l      -4(a6)
[00013616] 4eb9 0001 1b60            jsr        AESForms.FileSelectorInput
[0001361c] 4fef 000c                 lea.l      12(a7),a7
[00013620] 3f3c 0002                 move.w     #$0002,-(a7)
[00013624] 7aff                      moveq.l    #-1,d5
[00013626] 2f05                      move.l     d5,-(a7)
[00013628] 4eb9 0001 0ca8            jsr        AESGraphics.GrafMouse
[0001362e] 5c8f                      addq.l     #6,a7
[00013630] 3d79 0001 5df0 fffe       move.w     $00015DF0,-2(a6)
[00013638] 2879 0001 6250            movea.l    AppBase.doUpdateWindow,a4
[0001363e] 4e94                      jsr        (a4)
[00013640] 4a6e fffe                 tst.w      -2(a6)
[00013644] 6706                      beq.s      $0001364C
[00013646] 4a6e fffc                 tst.w      -4(a6)
[0001364a] 6616                      bne.s      $00013662
[0001364c] 4a2e ff37                 tst.b      -201(a6)
[00013650] 6706                      beq.s      $00013658
[00013652] 4eb9 0001 13d8            jsr        AppWindow.WriteLn
[00013658] 286e 0008                 movea.l    8(a6),a4
[0001365c] 4214                      clr.b      (a4)
[0001365e] 4e5e                      unlk       a6
[00013660] 4e75                      rts
[00013662] 426e ff40                 clr.w      -192(a6)
[00013666] 0c6e 003c ff40            cmpi.w     #$003C,-192(a6)
[0001366c] 622a                      bhi.s      $00013698
[0001366e] 3a2e ff40                 move.w     -192(a6),d5
[00013672] 49ee ffbe                 lea.l      -66(a6),a4
[00013676] 4a34 5000                 tst.b      0(a4,d5.w)
[0001367a] 671c                      beq.s      $00013698
[0001367c] 3a2e ff40                 move.w     -192(a6),d5
[00013680] 49ee ffbe                 lea.l      -66(a6),a4
[00013684] 0c34 005c 5000            cmpi.b     #$5C,0(a4,d5.w)
[0001368a] 6606                      bne.s      $00013692
[0001368c] 3d6e ff40 ff3e            move.w     -192(a6),-194(a6)
[00013692] 526e ff40                 addq.w     #1,-192(a6)
[00013696] 60ce                      bra.s      $00013666
[00013698] 526e ff3e                 addq.w     #1,-194(a6)
[0001369c] 0c6e 003c ff3e            cmpi.w     #$003C,-194(a6)
[000136a2] 620c                      bhi.s      $000136B0
[000136a4] 3a2e ff3e                 move.w     -194(a6),d5
[000136a8] 49ee ffbe                 lea.l      -66(a6),a4
[000136ac] 4234 5000                 clr.b      0(a4,d5.w)
[000136b0] 3f3c 003c                 move.w     #$003C,-(a7)
[000136b4] 486e ffbe                 pea.l      -66(a6)
[000136b8] 3f3c 003c                 move.w     #$003C,-(a7)
[000136bc] 486e ff80                 pea.l      -128(a6)
[000136c0] 3f3c 003c                 move.w     #$003C,-(a7)
[000136c4] 486e ff42                 pea.l      -190(a6)
[000136c8] 4eb9 0001 1db2            jsr        Strings.Concat
[000136ce] 4fef 0012                 lea.l      18(a7),a7
[000136d2] 4efa 00a2                 jmp        $00013776(pc)
[000136d6] 4a2e ff33                 tst.b      -205(a6)
[000136da] 6602                      bne.s      $000136DE
[000136dc] 6004                      bra.s      $000136E2
[000136de] 4efa 0096                 jmp        $00013776(pc)
[000136e2] 4a6e 001a                 tst.w      26(a6)
[000136e6] 6770                      beq.s      $00013758
[000136e8] 3a2e ff34                 move.w     -204(a6),d5
[000136ec] cafc 0032                 mulu.w     #$0032,d5
[000136f0] 49f9 0001 6956            lea.l      NewStreams.searchpaths,a4
[000136f6] 3f3c 0031                 move.w     #$0031,-(a7)
[000136fa] 4874 5000                 pea.l      0(a4,d5.w)
[000136fe] 3a2e 0020                 move.w     32(a6),d5
[00013702] 3f05                      move.w     d5,-(a7)
[00013704] 286e 001c                 movea.l    28(a6),a4
[00013708] 4854                      pea.l      (a4)
[0001370a] 3f3c 003c                 move.w     #$003C,-(a7)
[0001370e] 486e ff42                 pea.l      -190(a6)
[00013712] 4eb9 0001 1db2            jsr        Strings.Concat
[00013718] 4fef 0012                 lea.l      18(a7),a7
[0001371c] 558f                      subq.l     #2,a7
[0001371e] 3f3c 003c                 move.w     #$003C,-(a7)
[00013722] 486e ff42                 pea.l      -190(a6)
[00013726] 4267                      clr.w      -(a7)
[00013728] 4879 0001 4146            pea.l      $00014146 '.'
[0001372e] 4267                      clr.w      -(a7)
[00013730] 486e ff40                 pea.l      -192(a6)
[00013734] 4eb9 0001 1eee            jsr        Strings.Pos
[0001373a] 4fef 0012                 lea.l      18(a7),a7
[0001373e] 4a1f                      tst.b      (a7)+
[00013740] 6612                      bne.s      $00013754
[00013742] 3f3c 003c                 move.w     #$003C,-(a7)
[00013746] 486e ff42                 pea.l      -190(a6)
[0001374a] 3f2e 001a                 move.w     26(a6),-(a7)
[0001374e] 6100 f792                 bsr        NewStreams.SetFileExtension
[00013752] 508f                      addq.l     #8,a7
[00013754] 4efa 0020                 jmp        $00013776(pc)
[00013758] 3f3c 003c                 move.w     #$003C,-(a7)
[0001375c] 486e ff42                 pea.l      -190(a6)
[00013760] 3a2e 0020                 move.w     32(a6),d5
[00013764] 3f05                      move.w     d5,-(a7)
[00013766] 286e 001c                 movea.l    28(a6),a4
[0001376a] 4854                      pea.l      (a4)
[0001376c] 4eb9 0001 1c40            jsr        Strings.Assign
[00013772] 4fef 000c                 lea.l      12(a7),a7
[00013776] 3f3c 003c                 move.w     #$003C,-(a7)
[0001377a] 486e ff42                 pea.l      -190(a6)
[0001377e] 6100 fc54                 bsr        NewStreams.strupr
[00013782] 5c8f                      addq.l     #6,a7
[00013784] 3a2e 0010                 move.w     16(a6),d5
[00013788] 3f05                      move.w     d5,-(a7)
[0001378a] 286e 000c                 movea.l    12(a6),a4
[0001378e] 4854                      pea.l      (a4)
[00013790] 3f3c 003c                 move.w     #$003C,-(a7)
[00013794] 486e ff42                 pea.l      -190(a6)
[00013798] 4eb9 0001 1c40            jsr        Strings.Assign
[0001379e] 4fef 000c                 lea.l      12(a7),a7
[000137a2] 286e 0016                 movea.l    22(a6),a4
[000137a6] 4854                      pea.l      (a4)
[000137a8] 3f3c 003c                 move.w     #$003C,-(a7)
[000137ac] 486e ff42                 pea.l      -190(a6)
[000137b0] 6100 f8bc                 bsr        NewStreams.allocfile
[000137b4] 4fef 000a                 lea.l      10(a7),a7
[000137b8] 3f3c 003c                 move.w     #$003C,-(a7)
[000137bc] 486e ff42                 pea.l      -190(a6)
[000137c0] 4267                      clr.w      -(a7)
[000137c2] 266e 0016                 movea.l    22(a6),a3
[000137c6] 2853                      movea.l    (a3),a4
[000137c8] 4854                      pea.l      (a4)
[000137ca] 4eb9 0001 0906            jsr        GEMDOS.Open
[000137d0] 4fef 000c                 lea.l      12(a7),a7
[000137d4] 266e 0016                 movea.l    22(a6),a3
[000137d8] 2853                      movea.l    (a3),a4
[000137da] 4a54                      tst.w      (a4)
[000137dc] 6c02                      bge.s      $000137E0
[000137de] 6004                      bra.s      $000137E4
[000137e0] 4efa 0086                 jmp        $00013868(pc)
[000137e4] 558f                      subq.l     #2,a7
[000137e6] 286e 0016                 movea.l    22(a6),a4
[000137ea] 2f14                      move.l     (a4),-(a7)
[000137ec] 4eb9 0001 0a12            jsr        GEMDOS.Free
[000137f2] 588f                      addq.l     #4,a7
[000137f4] 4a1f                      tst.b      (a7)+
[000137f6] 6708                      beq.s      $00013800
[000137f8] 7aff                      moveq.l    #-1,d5
[000137fa] 286e 0016                 movea.l    22(a6),a4
[000137fe] 2885                      move.l     d5,(a4)
[00013800] 4a2e 0014                 tst.b      20(a6)
[00013804] 6610                      bne.s      $00013816
[00013806] 0c6e 0006 ff34            cmpi.w     #$0006,-204(a6)
[0001380c] 6408                      bcc.s      $00013816
[0001380e] 526e ff34                 addq.w     #1,-204(a6)
[00013812] 4efa 0050                 jmp        $00013864(pc)
[00013816] 286e 0008                 movea.l    8(a6),a4
[0001381a] 4214                      clr.b      (a4)
[0001381c] 4a6e 001a                 tst.w      26(a6)
[00013820] 6728                      beq.s      $0001384A
[00013822] 0c6e 000c 001a            cmpi.w     #$000C,26(a6)
[00013828] 6720                      beq.s      $0001384A
[0001382a] 0c6e 000b 001a            cmpi.w     #$000B,26(a6)
[00013830] 6718                      beq.s      $0001384A
[00013832] 558f                      subq.l     #2,a7
[00013834] 3f3c 003c                 move.w     #$003C,-(a7)
[00013838] 486e ff42                 pea.l      -190(a6)
[0001383c] 3f3c ffdf                 move.w     #$FFDF,-(a7)
[00013840] 6100 f338                 bsr        NewStreams.FileError
[00013844] 508f                      addq.l     #8,a7
[00013846] 4a1f                      tst.b      (a7)+
[00013848] 6710                      beq.s      $0001385A
[0001384a] 4a2e ff37                 tst.b      -201(a6)
[0001384e] 6706                      beq.s      $00013856
[00013850] 4eb9 0001 13d8            jsr        AppWindow.WriteLn
[00013856] 4efa 0078                 jmp        $000138D0(pc)
[0001385a] 1d7c 0001 0014            move.b     #$01,20(a6)
[00013860] 422e ff33                 clr.b      -205(a6)
[00013864] 4efa 0066                 jmp        $000138CC(pc)
[00013868] 286e 0008                 movea.l    8(a6),a4
[0001386c] 18bc 0001                 move.b     #$01,(a4)
[00013870] 266e 0016                 movea.l    22(a6),a3
[00013874] 2853                      movea.l    (a3),a4
[00013876] 2f0c                      move.l     a4,-(a7)
[00013878] 2f2c 002a                 move.l     42(a4),-(a7)
[0001387c] 3f14                      move.w     (a4),-(a7)
[0001387e] 1f3c 0002                 move.b     #$02,-(a7)
[00013882] 486c 002a                 pea.l      42(a4)
[00013886] 4eb9 0001 09a4            jsr        GEMDOS.Seek
[0001388c] 4fef 000c                 lea.l      12(a7),a7
[00013890] 285f                      movea.l    (a7)+,a4
[00013892] 2f0c                      move.l     a4,-(a7)
[00013894] 2f2c 0034                 move.l     52(a4),-(a7)
[00013898] 3f14                      move.w     (a4),-(a7)
[0001389a] 4227                      clr.b      -(a7)
[0001389c] 486c 0034                 pea.l      52(a4)
[000138a0] 4eb9 0001 09a4            jsr        GEMDOS.Seek
[000138a6] 4fef 000c                 lea.l      12(a7),a7
[000138aa] 285f                      movea.l    (a7)+,a4
[000138ac] 4a2e ff37                 tst.b      -201(a6)
[000138b0] 6716                      beq.s      $000138C8
[000138b2] 3f3c 003c                 move.w     #$003C,-(a7)
[000138b6] 486e ff42                 pea.l      -190(a6)
[000138ba] 4eb9 0001 130e            jsr        AppWindow.WriteString
[000138c0] 5c8f                      addq.l     #6,a7
[000138c2] 4eb9 0001 13d8            jsr        AppWindow.WriteLn
[000138c8] 4efa 0006                 jmp        $000138D0(pc)
[000138cc] 6000 fc70                 bra        $0001353E
[000138d0] 4a39 0001 6ab4            tst.b      NewStreams.needfile
[000138d6] 671c                      beq.s      $000138F4
[000138d8] 3f3c 004f                 move.w     #$004F,-(a7)
[000138dc] 4879 0001 625c            pea.l      AppBase.shellTail
[000138e2] 3f3c 003c                 move.w     #$003C,-(a7)
[000138e6] 486e ff42                 pea.l      -190(a6)
[000138ea] 4eb9 0001 1c40            jsr        Strings.Assign
[000138f0] 4fef 000c                 lea.l      12(a7),a7
[000138f4] 4239 0001 6ab4            clr.b      NewStreams.needfile
[000138fa] 3a2e 001a                 move.w     26(a6),d5
[000138fe] 7000                      moveq.l    #0,d0
[00013900] 0bc0                      bset       d5,d0
[00013902] 81b9 0001 6254            or.l       d0,AppBase.openFiles
[00013908] 4e5e                      unlk       a6
[0001390a] 4e75                      rts

NewStreams.FileLookupOutput:
[0001390c] 4e56 ff3e                 link       a6,#-194
[00013910] 3f3c 003c                 move.w     #$003C,-(a7)
[00013914] 486e ffba                 pea.l      -70(a6)
[00013918] 3a2e 0020                 move.w     32(a6),d5
[0001391c] 3f05                      move.w     d5,-(a7)
[0001391e] 286e 001c                 movea.l    28(a6),a4
[00013922] 4854                      pea.l      (a4)
[00013924] 4eb9 0001 1c40            jsr        Strings.Assign
[0001392a] 4fef 000c                 lea.l      12(a7),a7
[0001392e] 3f3c 003c                 move.w     #$003C,-(a7)
[00013932] 486e ffba                 pea.l      -70(a6)
[00013936] 3f2e 001a                 move.w     26(a6),-(a7)
[0001393a] 6100 f5a6                 bsr        NewStreams.SetFileExtension
[0001393e] 508f                      addq.l     #8,a7
[00013940] 3f3c 003c                 move.w     #$003C,-(a7)
[00013944] 486e ffba                 pea.l      -70(a6)
[00013948] 6100 fa8a                 bsr        NewStreams.strupr
[0001394c] 5c8f                      addq.l     #6,a7
[0001394e] 4a2e 0014                 tst.b      20(a6)
[00013952] 6702                      beq.s      $00013956
[00013954] 6004                      bra.s      $0001395A
[00013956] 4efa 011c                 jmp        $00013A74(pc)
[0001395a] 4267                      clr.w      -(a7)
[0001395c] 7aff                      moveq.l    #-1,d5
[0001395e] 2f05                      move.l     d5,-(a7)
[00013960] 4eb9 0001 0ca8            jsr        AESGraphics.GrafMouse
[00013966] 5c8f                      addq.l     #6,a7
[00013968] 3f3c 003c                 move.w     #$003C,-(a7)
[0001396c] 486e ff3e                 pea.l      -194(a6)
[00013970] 3f3c 0031                 move.w     #$0031,-(a7)
[00013974] 4879 0001 6956            pea.l      NewStreams.searchpaths
[0001397a] 4eb9 0001 1c40            jsr        Strings.Assign
[00013980] 4fef 000c                 lea.l      12(a7),a7
[00013984] 3f3c 003c                 move.w     #$003C,-(a7)
[00013988] 486e ff3e                 pea.l      -194(a6)
[0001398c] 3f2e 001a                 move.w     26(a6),-(a7)
[00013990] 6100 f550                 bsr        NewStreams.SetFileExtension
[00013994] 508f                      addq.l     #8,a7
[00013996] 3f3c 003c                 move.w     #$003C,-(a7)
[0001399a] 486e ff7c                 pea.l      -132(a6)
[0001399e] 3f3c 003c                 move.w     #$003C,-(a7)
[000139a2] 486e ffba                 pea.l      -70(a6)
[000139a6] 4eb9 0001 1c40            jsr        Strings.Assign
[000139ac] 4fef 000c                 lea.l      12(a7),a7
[000139b0] 49ee ff3e                 lea.l      -194(a6),a4
[000139b4] 2a0c                      move.l     a4,d5
[000139b6] 2f05                      move.l     d5,-(a7)
[000139b8] 49ee ff7c                 lea.l      -132(a6),a4
[000139bc] 2a0c                      move.l     a4,d5
[000139be] 2f05                      move.l     d5,-(a7)
[000139c0] 486e fffc                 pea.l      -4(a6)
[000139c4] 4eb9 0001 1b60            jsr        AESForms.FileSelectorInput
[000139ca] 4fef 000c                 lea.l      12(a7),a7
[000139ce] 3f3c 0002                 move.w     #$0002,-(a7)
[000139d2] 7aff                      moveq.l    #-1,d5
[000139d4] 2f05                      move.l     d5,-(a7)
[000139d6] 4eb9 0001 0ca8            jsr        AESGraphics.GrafMouse
[000139dc] 5c8f                      addq.l     #6,a7
[000139de] 3d79 0001 5df0 fffe       move.w     $00015DF0,-2(a6)
[000139e6] 2879 0001 6250            movea.l    AppBase.doUpdateWindow,a4
[000139ec] 4e94                      jsr        (a4)
[000139ee] 4a6e fffe                 tst.w      -2(a6)
[000139f2] 6706                      beq.s      $000139FA
[000139f4] 4a6e fffc                 tst.w      -4(a6)
[000139f8] 660a                      bne.s      $00013A04
[000139fa] 286e 0008                 movea.l    8(a6),a4
[000139fe] 4214                      clr.b      (a4)
[00013a00] 4e5e                      unlk       a6
[00013a02] 4e75                      rts
[00013a04] 426e fffa                 clr.w      -6(a6)
[00013a08] 0c6e 003c fffa            cmpi.w     #$003C,-6(a6)
[00013a0e] 622a                      bhi.s      $00013A3A
[00013a10] 3a2e fffa                 move.w     -6(a6),d5
[00013a14] 49ee ff3e                 lea.l      -194(a6),a4
[00013a18] 4a34 5000                 tst.b      0(a4,d5.w)
[00013a1c] 671c                      beq.s      $00013A3A
[00013a1e] 3a2e fffa                 move.w     -6(a6),d5
[00013a22] 49ee ff3e                 lea.l      -194(a6),a4
[00013a26] 0c34 005c 5000            cmpi.b     #$5C,0(a4,d5.w)
[00013a2c] 6606                      bne.s      $00013A34
[00013a2e] 3d6e fffa fff8            move.w     -6(a6),-8(a6)
[00013a34] 526e fffa                 addq.w     #1,-6(a6)
[00013a38] 60ce                      bra.s      $00013A08
[00013a3a] 526e fff8                 addq.w     #1,-8(a6)
[00013a3e] 0c6e 003c fff8            cmpi.w     #$003C,-8(a6)
[00013a44] 620c                      bhi.s      $00013A52
[00013a46] 3a2e fff8                 move.w     -8(a6),d5
[00013a4a] 49ee ff3e                 lea.l      -194(a6),a4
[00013a4e] 4234 5000                 clr.b      0(a4,d5.w)
[00013a52] 3f3c 003c                 move.w     #$003C,-(a7)
[00013a56] 486e ff3e                 pea.l      -194(a6)
[00013a5a] 3f3c 003c                 move.w     #$003C,-(a7)
[00013a5e] 486e ff7c                 pea.l      -132(a6)
[00013a62] 3f3c 003c                 move.w     #$003C,-(a7)
[00013a66] 486e ffba                 pea.l      -70(a6)
[00013a6a] 4eb9 0001 1db2            jsr        Strings.Concat
[00013a70] 4fef 0012                 lea.l      18(a7),a7
[00013a74] 426e fffa                 clr.w      -6(a6)
[00013a78] 3a2e 0010                 move.w     16(a6),d5
[00013a7c] 3f05                      move.w     d5,-(a7)
[00013a7e] 286e 000c                 movea.l    12(a6),a4
[00013a82] 4854                      pea.l      (a4)
[00013a84] 3f3c 003c                 move.w     #$003C,-(a7)
[00013a88] 486e ffba                 pea.l      -70(a6)
[00013a8c] 4eb9 0001 1c40            jsr        Strings.Assign
[00013a92] 4fef 000c                 lea.l      12(a7),a7
[00013a96] 286e 0016                 movea.l    22(a6),a4
[00013a9a] 4854                      pea.l      (a4)
[00013a9c] 3f3c 003c                 move.w     #$003C,-(a7)
[00013aa0] 486e ffba                 pea.l      -70(a6)
[00013aa4] 6100 f5c8                 bsr        NewStreams.allocfile
[00013aa8] 4fef 000a                 lea.l      10(a7),a7
[00013aac] 3f3c 003c                 move.w     #$003C,-(a7)
[00013ab0] 486e ffba                 pea.l      -70(a6)
[00013ab4] 4267                      clr.w      -(a7)
[00013ab6] 266e 0016                 movea.l    22(a6),a3
[00013aba] 2853                      movea.l    (a3),a4
[00013abc] 4854                      pea.l      (a4)
[00013abe] 4eb9 0001 08de            jsr        GEMDOS.Create
[00013ac4] 4fef 000c                 lea.l      12(a7),a7
[00013ac8] 266e 0016                 movea.l    22(a6),a3
[00013acc] 2853                      movea.l    (a3),a4
[00013ace] 4a54                      tst.w      (a4)
[00013ad0] 6c26                      bge.s      $00013AF8
[00013ad2] 558f                      subq.l     #2,a7
[00013ad4] 286e 0016                 movea.l    22(a6),a4
[00013ad8] 2f14                      move.l     (a4),-(a7)
[00013ada] 4eb9 0001 0a12            jsr        GEMDOS.Free
[00013ae0] 588f                      addq.l     #4,a7
[00013ae2] 4a1f                      tst.b      (a7)+
[00013ae4] 6708                      beq.s      $00013AEE
[00013ae6] 7aff                      moveq.l    #-1,d5
[00013ae8] 286e 0016                 movea.l    22(a6),a4
[00013aec] 2885                      move.l     d5,(a4)
[00013aee] 286e 0008                 movea.l    8(a6),a4
[00013af2] 4214                      clr.b      (a4)
[00013af4] 4efa 0070                 jmp        $00013B66(pc)
[00013af8] 286e 0022                 movea.l    34(a6),a4
[00013afc] 4a14                      tst.b      (a4)
[00013afe] 6750                      beq.s      $00013B50
[00013b00] 4a2e 0014                 tst.b      20(a6)
[00013b04] 660e                      bne.s      $00013B14
[00013b06] 0c6e 0001 001a            cmpi.w     #$0001,26(a6)
[00013b0c] 6742                      beq.s      $00013B50
[00013b0e] 4a6e 001a                 tst.w      26(a6)
[00013b12] 673c                      beq.s      $00013B50
[00013b14] 3a2e 0026                 move.w     38(a6),d5
[00013b18] 3f05                      move.w     d5,-(a7)
[00013b1a] 286e 0022                 movea.l    34(a6),a4
[00013b1e] 4854                      pea.l      (a4)
[00013b20] 4eb9 0001 130e            jsr        AppWindow.WriteString
[00013b26] 5c8f                      addq.l     #6,a7
[00013b28] 3f3c 0002                 move.w     #$0002,-(a7)
[00013b2c] 4879 0001 4148            pea.l      $00014148 ' : '
[00013b32] 4eb9 0001 130e            jsr        AppWindow.WriteString
[00013b38] 5c8f                      addq.l     #6,a7
[00013b3a] 3f3c 003c                 move.w     #$003C,-(a7)
[00013b3e] 486e ffba                 pea.l      -70(a6)
[00013b42] 4eb9 0001 130e            jsr        AppWindow.WriteString
[00013b48] 5c8f                      addq.l     #6,a7
[00013b4a] 4eb9 0001 13d8            jsr        AppWindow.WriteLn
[00013b50] 286e 0008                 movea.l    8(a6),a4
[00013b54] 18bc 0001                 move.b     #$01,(a4)
[00013b58] 3a2e 001a                 move.w     26(a6),d5
[00013b5c] 7000                      moveq.l    #0,d0
[00013b5e] 0bc0                      bset       d5,d0
[00013b60] 81b9 0001 6258            or.l       d0,AppBase.openStreams
[00013b66] 4e5e                      unlk       a6
[00013b68] 4e75                      rts

NewStreams.formatLong:
[00013b6a] 4e56 fff8                 link       a6,#-8
[00013b6e] 2d7c 1000 0000 fffc       move.l     #$10000000,-4(a6)
[00013b76] 426e fff8                 clr.w      -8(a6)
[00013b7a] 4aae fffc                 tst.l      -4(a6)
[00013b7e] 6302                      bls.s      $00013B82
[00013b80] 6004                      bra.s      $00013B86
[00013b82] 4efa 0084                 jmp        $00013C08(pc)
[00013b86] 2f2e 0008                 move.l     8(a6),-(a7)
[00013b8a] 2f2e fffc                 move.l     -4(a6),-(a7)
[00013b8e] 4eb9 0001 0464            jsr        DIVU32
[00013b94] 588f                      addq.l     #4,a7
[00013b96] 2a1f                      move.l     (a7)+,d5
[00013b98] 3d45 fffa                 move.w     d5,-6(a6)
[00013b9c] 0c6e 000a fffa            cmpi.w     #$000A,-6(a6)
[00013ba2] 641e                      bcc.s      $00013BC2
[00013ba4] 7a30                      moveq.l    #48,d5
[00013ba6] da6e fffa                 add.w      -6(a6),d5
[00013baa] 286d fffc                 movea.l    -4(a5),a4
[00013bae] 286c 000c                 movea.l    12(a4),a4 
[00013bb2] 382e fff8                 move.w     -8(a6),d4
[00013bb6] 49ec 0050                 lea.l      80(a4),a4
[00013bba] 1985 4000                 move.b     d5,0(a4,d4.w)
[00013bbe] 4efa 0022                 jmp        $00013BE2(pc)
[00013bc2] 3a2e fffa                 move.w     -6(a6),d5
[00013bc6] 0445 000a                 subi.w     #$000A,d5
[00013bca] 7841                      moveq.l    #65,d4
[00013bcc] da44                      add.w      d4,d5
[00013bce] 286d fffc                 movea.l    -4(a5),a4
[00013bd2] 286c 000c                 movea.l    12(a4),a4
[00013bd6] 382e fff8                 move.w     -8(a6),d4
[00013bda] 49ec 0050                 lea.l      80(a4),a4
[00013bde] 1985 4000                 move.b     d5,0(a4,d4.w)
[00013be2] 2f2e 0008                 move.l     8(a6),-(a7)
[00013be6] 2f2e fffc                 move.l     -4(a6),-(a7)
[00013bea] 4eb9 0001 0464            jsr        DIVU32
[00013bf0] 2e9f                      move.l     (a7)+,(a7)
[00013bf2] 2d5f 0008                 move.l     (a7)+,8(a6)
[00013bf6] 2a2e fffc                 move.l     -4(a6),d5
[00013bfa] e88d                      lsr.l      #4,d5
[00013bfc] 2d45 fffc                 move.l     d5,-4(a6)
[00013c00] 526e fff8                 addq.w     #1,-8(a6)
[00013c04] 6000 ff74                 bra        $00013B7A
[00013c08] 286d fffc                 movea.l    -4(a5),a4
[00013c0c] 286c 000c                 movea.l    12(a4),a4
[00013c10] 3a2e fff8                 move.w     -8(a6),d5
[00013c14] 49ec 0050                 lea.l      80(a4),a4
[00013c18] 19bc 0048 5000            move.b     #$48,0(a4,d5.w)
[00013c1e] 286d fffc                 movea.l    -4(a5),a4
[00013c22] 286c 000c                 movea.l    12(a4),a4
[00013c26] 3a2e fff8                 move.w     -8(a6),d5
[00013c2a] 5245                      addq.w     #1,d5
[00013c2c] 49ec 0050                 lea.l      80(a4),a4
[00013c30] 4234 5000                 clr.b      0(a4,d5.w)
[00013c34] 4e5e                      unlk       a6
[00013c36] 4e75                      rts

NewStreams.GetOptionInfo:
[00013c38] 4e56 0000                 link       a6,#0
[00013c3c] 2f2d fffc                 move.l     -4(a5),-(a7)
[00013c40] 2b4e fffc                 move.l     a6,-4(a5)
[00013c44] 286e 000c                 movea.l    12(a6),a4
[00013c48] 266e 0008                 movea.l    8(a6),a3
[00013c4c] 16bc 0001                 move.b     #$01,(a3)
[00013c50] 47f9 0001 414c            lea.l      $0001414C,a3 ''
[00013c56] 45ec 0050                 lea.l      80(a4),a2
[00013c5a] 7a00                      moveq.l    #0,d5
[00013c5c] 14db                      move.b     (a3)+,(a2)+
[00013c5e] 57cd fffc                 dbeq       d5,$00013C5C
[00013c62] 7a00                      moveq.l    #0,d5
[00013c64] 1a39 0001 6b06            move.b     NewStreams.currInfoType,d5
[00013c6a] 2005                      move.l     d5,d0
[00013c6c] 4eb9 0001 000a            jsr        CASEX
casex4:
[00013c72] 0000                      dc.l       0
[00013c76] 0000 0008                 dc.l       8
[00013c7a] 0000 0146                 dc.l casex4_tab-casex4
case 0:
[00013c7e] 4a79 0001 6b12            tst.w      NewStreams.heapsize
[00013c84] 6728                      beq.s      $00013CAE
[00013c86] 47f9 0001 414e            lea.l      $0001414E,a3 'HEAP'
[00013c8c] 45d4                      lea.l      (a4),a2
[00013c8e] 7a04                      moveq.l    #4,d5
[00013c90] 14db                      move.b     (a3)+,(a2)+
[00013c92] 57cd fffc                 dbeq       d5,$00013C90
[00013c96] 2f0c                      move.l     a4,-(a7)
[00013c98] 7a00                      moveq.l    #0,d5
[00013c9a] 3a39 0001 6b12            move.w     NewStreams.heapsize,d5
[00013ca0] 2f05                      move.l     d5,-(a7)
[00013ca2] 6100 fec6                 bsr        NewStreams.formatLong
[00013ca6] 588f                      addq.l     #4,a7
[00013ca8] 285f                      movea.l    (a7)+,a4
[00013caa] 4efa 0128                 jmp        $00013DD4(pc)
[00013cae] 4efa 011a                 jmp        $00013DCA(pc)
case 1:
[00013cb2] 4a39 0001 6b08            tst.b      NewStreams.queryfiles
[00013cb8] 6714                      beq.s      $00013CCE
[00013cba] 47f9 0001 4154            lea.l      $00014154,a3 'QUERY'
[00013cc0] 45d4                      lea.l      (a4),a2
[00013cc2] 7a05                      moveq.l    #5,d5
[00013cc4] 14db                      move.b     (a3)+,(a2)+
[00013cc6] 57cd fffc                 dbeq       d5,$00013CC4
[00013cca] 4efa 0108                 jmp        $00013DD4(pc)
[00013cce] 4efa 00fa                 jmp        $00013DCA(pc)
case 2:
[00013cd2] 4a39 0001 6b09            tst.b      NewStreams.reffiles
[00013cd8] 6714                      beq.s      $00013CEE
[00013cda] 47f9 0001 415a            lea.l      $0001415A,a3 'REF'
[00013ce0] 45d4                      lea.l      (a4),a2
[00013ce2] 7a03                      moveq.l    #3,d5
[00013ce4] 14db                      move.b     (a3)+,(a2)+
[00013ce6] 57cd fffc                 dbeq       d5,$00013CE4
[00013cea] 4efa 00e8                 jmp        $00013DD4(pc)
[00013cee] 4efa 00da                 jmp        $00013DCA(pc)
case 3:
[00013cf2] 4a39 0001 6b0a            tst.b      NewStreams.listing
[00013cf8] 6714                      beq.s      $00013D0E
[00013cfa] 47f9 0001 415e            lea.l      $0001415E,a3 'LIST'
[00013d00] 45d4                      lea.l      (a4),a2
[00013d02] 7a04                      moveq.l    #4,d5
[00013d04] 14db                      move.b     (a3)+,(a2)+
[00013d06] 57cd fffc                 dbeq       d5,$00013D04
[00013d0a] 4efa 00c8                 jmp        $00013DD4(pc)
[00013d0e] 4efa 00ba                 jmp        $00013DCA(pc)
case 4:
[00013d12] 4ab9 0001 6b0e            tst.l      NewStreams.stacksize
[00013d18] 6724                      beq.s      $00013D3E
[00013d1a] 47f9 0001 4164            lea.l      $00014164,a3 'STACK'
[00013d20] 45d4                      lea.l      (a4),a2
[00013d22] 7a05                      moveq.l    #5,d5
[00013d24] 14db                      move.b     (a3)+,(a2)+
[00013d26] 57cd fffc                 dbeq       d5,$00013D24
[00013d2a] 2f0c                      move.l     a4,-(a7)
[00013d2c] 2f39 0001 6b0e            move.l     NewStreams.stacksize,-(a7)
[00013d32] 6100 fe36                 bsr        $00013B6A
[00013d36] 588f                      addq.l     #4,a7
[00013d38] 285f                      movea.l    (a7)+,a4
[00013d3a] 4efa 0098                 jmp        $00013DD4(pc)
[00013d3e] 4efa 008a                 jmp        $00013DCA(pc)
case 5:
[00013d42] 4a39 0001 6b0b            tst.b      NewStreams.linkmap
[00013d48] 6714                      beq.s      $00013D5E
[00013d4a] 47f9 0001 416a            lea.l      $0001416A,a3 'MAP'
[00013d50] 45d4                      lea.l      (a4),a2
[00013d52] 7a03                      moveq.l    #3,d5
[00013d54] 14db                      move.b     (a3)+,(a2)+
[00013d56] 57cd fffc                 dbeq       d5,$00013D54
[00013d5a] 4efa 0078                 jmp        $00013DD4(pc)
[00013d5e] 4efa 006a                 jmp        $00013DCA(pc)
case 6:
[00013d62] 4a39 0001 6b0d            tst.b      NewStreams.debugtable
[00013d68] 6714                      beq.s      $00013D7E
[00013d6a] 47f9 0001 416e            lea.l      $0001416E,a3 'DTABLE'
[00013d70] 45d4                      lea.l      (a4),a2
[00013d72] 7a06                      moveq.l    #6,d5
[00013d74] 14db                      move.b     (a3)+,(a2)+
[00013d76] 57cd fffc                 dbeq       d5,$00013D74
[00013d7a] 4efa 0058                 jmp        $00013DD4(pc)
[00013d7e] 4efa 004a                 jmp        $00013DCA(pc)
case 7:
[00013d82] 4a39 0001 6b0c            tst.b      NewStreams.linkopt
[00013d88] 6714                      beq.s      $00013D9E
[00013d8a] 47f9 0001 4176            lea.l      $00014176,a3 'OPTIMISE'
[00013d90] 45d4                      lea.l      (a4),a2
[00013d92] 7a08                      moveq.l    #8,d5
[00013d94] 14db                      move.b     (a3)+,(a2)+
[00013d96] 57cd fffc                 dbeq       d5,$00013D94
[00013d9a] 4efa 0038                 jmp        $00013DD4(pc)
[00013d9e] 4efa 002a                 jmp        $00013DCA(pc)
case 8:
[00013da2] 266e 0008                 movea.l    8(a6),a3
[00013da6] 4213                      clr.b      (a3)
[00013da8] 2b5f fffc                 move.l     (a7)+,-4(a5)
[00013dac] 4e5e                      unlk       a6
[00013dae] 4e75                      rts
[00013db0] 4efa 0018                 jmp        $00013DCA(pc)
default:
[00013db4] 4efa 0014                 jmp        $00013DCA(pc)
casex4_tab
[00013db8] 000c
           0040
[00013dbc] 0060
           0080
[00013dc0] 00a0
           00d0
           00f0
[00013dc6] 0110
[00013dc8] 0130
default:
[00013dca] 5239 0001 6b06            addq.b     #1,NewStreams.currInfoType
[00013dd0] 6000 fe90                 bra        $00013C62
[00013dd4] 5239 0001 6b06            addq.b     #1,NewStreams.currInfoType
[00013dda] 2b5f fffc                 move.l     (a7)+,-4(a5)
[00013dde] 4e5e                      unlk       a6
[00013de0] 4e75                      rts

NewStreams.Close(VAR s: BufferedStream; VAR success: BOOLEAN);
[00013de2] 4e56 fffe                 link       a6,#-2
[00013de6] 7aff                      moveq.l    #-1,d5
[00013de8] 286e 000c                 movea.l    12(a6),a4
[00013dec] ba94                      cmp.l      (a4),d5
[00013dee] 6744                      beq.s      $00013E34
[00013df0] 286e 000c                 movea.l    12(a6),a4
[00013df4] 4854                      pea.l      (a4)
[00013df6] 6100 f318                 bsr        NewStreams.flush
[00013dfa] 588f                      addq.l     #4,a7
[00013dfc] 558f                      subq.l     #2,a7
[00013dfe] 266e 000c                 movea.l    12(a6),a3
[00013e02] 2853                      movea.l    (a3),a4
[00013e04] 3f14                      move.w     (a4),-(a7)
[00013e06] 4eb9 0001 092e            jsr        GEMDOS.Close
[00013e0c] 548f                      addq.l     #2,a7
[00013e0e] 286e 0008                 movea.l    8(a6),a4
[00013e12] 189f                      move.b     (a7)+,(a4)
[00013e14] 558f                      subq.l     #2,a7
[00013e16] 286e 000c                 movea.l    12(a6),a4
[00013e1a] 2f14                      move.l     (a4),-(a7)
[00013e1c] 4eb9 0001 0a12            jsr        GEMDOS.Free
[00013e22] 588f                      addq.l     #4,a7
[00013e24] 4a1f                      tst.b      (a7)+
[00013e26] 6708                      beq.s      $00013E30
[00013e28] 7aff                      moveq.l    #-1,d5
[00013e2a] 286e 000c                 movea.l    12(a6),a4
[00013e2e] 2885                      move.l     d5,(a4)
[00013e30] 4efa 000a                 jmp        $00013E3C(pc)
[00013e34] 286e 0008                 movea.l    8(a6),a4
[00013e38] 18bc 0001                 move.b     #$01,(a4)
[00013e3c] 4e5e                      unlk       a6
[00013e3e] 4e75                      rts

NewStreams.ReadChar(VAR s: BufferedStream; VAR ch: CHAR)
[00013e40] 4e56 0000                 link       a6,#0
[00013e44] 286e 000c                 movea.l    12(a6),a4
[00013e48] 2f14                      move.l     (a4),-(a7)
[00013e4a] 286e 0008                 movea.l    8(a6),a4
[00013e4e] 4854                      pea.l      (a4)
[00013e50] 6100 f348                 bsr        NewStreams.readbyte
[00013e54] 508f                      addq.l     #8,a7
[00013e56] 286e 0008                 movea.l    8(a6),a4
[00013e5a] 0c14 000d                 cmpi.b     #$0D,(a4)
[00013e5e] 6602                      bne.s      $00013E62
[00013e60] 60e2                      bra.s      $00013E44
[00013e62] 286e 0008                 movea.l    8(a6),a4
[00013e66] 0c14 000a                 cmpi.b     #$0A,(a4)
[00013e6a] 6608                      bne.s      $00013E74
[00013e6c] 286e 0008                 movea.l    8(a6),a4
[00013e70] 18bc 000d                 move.b     #$0D,(a4)
[00013e74] 4e5e                      unlk       a6
[00013e76] 4e75                      rts

NewStreams.ReadByte(VAR s: BufferedStream; VAR b: BYTE)
[00013e78] 4e56 fffe                 link       a6,#-2
[00013e7c] 286e 000c                 movea.l    12(a6),a4
[00013e80] 2f14                      move.l     (a4),-(a7)
[00013e82] 486e ffff                 pea.l      -1(a6)
[00013e86] 6100 f312                 bsr        NewStreams.readbyte
[00013e8a] 508f                      addq.l     #8,a7
[00013e8c] 286e 0008                 movea.l    8(a6),a4
[00013e90] 18ae ffff                 move.b     -1(a6),(a4)
[00013e94] 4e5e                      unlk       a6
[00013e96] 4e75                      rts

NewStreams.WriteChar(VAR s: BufferedStream; ch: CHAR)
[00013e98] 4e56 0000                 link       a6,#0
[00013e9c] 0c2e 000d 0008            cmpi.b     #$0D,8(a6)
[00013ea2] 661e                      bne.s      $00013EC2
[00013ea4] 1d7c 000d 0008            move.b     #$0D,8(a6)
[00013eaa] 286e 000a                 movea.l    10(a6),a4
[00013eae] 2f14                      move.l     (a4),-(a7)
[00013eb0] 1f2e 0008                 move.b     8(a6),-(a7)
[00013eb4] 4227                      clr.b      -(a7)
[00013eb6] 6100 f3fa                 bsr        NewStreams.writebyte
[00013eba] 508f                      addq.l     #8,a7
[00013ebc] 1d7c 000a 0008            move.b     #$0A,8(a6)
[00013ec2] 286e 000a                 movea.l    10(a6),a4
[00013ec6] 2f14                      move.l     (a4),-(a7)
[00013ec8] 1f2e 0008                 move.b     8(a6),-(a7)
[00013ecc] 4227                      clr.b      -(a7)
[00013ece] 6100 f3e2                 bsr        NewStreams.writebyte
[00013ed2] 508f                      addq.l     #8,a7
[00013ed4] 4e5e                      unlk       a6
[00013ed6] 4e75                      rts

NewStreams.Read16Bit(VAR s: BufferedStream; VAR v: WORD)
[00013ed8] 4e56 0000                 link       a6,#0
[00013edc] 286e 000c                 movea.l    12(a6),a4
[00013ee0] 2f14                      move.l     (a4),-(a7)
[00013ee2] 286e 0008                 movea.l    8(a6),a4
[00013ee6] 4854                      pea.l      (a4)
[00013ee8] 6100 f38e                 bsr        NewStreams.read16bit
[00013eec] 508f                      addq.l     #8,a7
[00013eee] 4e5e                      unlk       a6
[00013ef0] 4e75                      rts

NewStreams.initfilenames:
[00013ef2] 4e56 ff00                 link       a6,#-256
[00013ef6] 4239 0001 6ab6            clr.b      NewStreams.mainfilename
[00013efc] 422e ff80                 clr.b      -128(a6)
[00013f00] 422e ff00                 clr.b      -256(a6)
[00013f04] 49ee ff80                 lea.l      -128(a6),a4
[00013f08] 2a0c                      move.l     a4,d5
[00013f0a] 2f05                      move.l     d5,-(a7)
[00013f0c] 49ee ff00                 lea.l      -256(a6),a4
[00013f10] 2a0c                      move.l     a4,d5
[00013f12] 2f05                      move.l     d5,-(a7)
[00013f14] 4eb9 0001 1ba4            jsr        AESShells.ShellRead
[00013f1a] 508f                      addq.l     #8,a7
[00013f1c] 3f3c 0027                 move.w     #$0027,-(a7)
[00013f20] 4879 0001 6ab6            pea.l      NewStreams.mainfilename
[00013f26] 3f3c 007f                 move.w     #$007F,-(a7)
[00013f2a] 486e ff00                 pea.l      -256(a6)
[00013f2e] 4eb9 0001 1c40            jsr        Strings.Assign
[00013f34] 4fef 000c                 lea.l      12(a7),a7
[00013f38] 4e5e                      unlk       a6
[00013f3a] 4e75                      rts

NewStreams.init:
[00013f3c] 4ef9 0001 2b3c            jmp        M2Option.init

[00013f42] 4e56 0000                 link       a6,#0
[00013f46] 42b9 0001 6258            clr.l      AppBase.openStreams
[00013f4c] 42b9 0001 6254            clr.l      AppBase.openFiles
[00013f52] 4879 0001 6b07            pea.l      NewStreams.dump
[00013f58] 4879 0001 6b08            pea.l      NewStreams.queryfiles
[00013f5e] 4879 0001 62ac            pea.l      AppBase.xfer
[00013f64] 4879 0001 6956            pea.l      NewStreams.searchpaths
[00013f6a] 4eb9 0001 27c4            jsr        M2Option.GetSystemOptions
[00013f70] 4fef 0010                 lea.l      16(a7),a7
[00013f74] 4879 0001 6b09            pea.l      NewStreams.reffiles
[00013f7a] 4879 0001 6b0a            pea.l      NewStreams.listing
[00013f80] 4879 0001 6b12            pea.l      NewStreams.heapsize
[00013f86] 4eb9 0001 2a66            jsr        M2Option.GetCompilerOptions
[00013f8c] 4fef 000c                 lea.l      12(a7),a7
[00013f90] 4879 0001 6b0b            pea.l      NewStreams.linkmap
[00013f96] 4879 0001 6b0c            pea.l      NewStreams.linkopt
[00013f9c] 4879 0001 6b0d            pea.l      NewStreams.debugtable
[00013fa2] 4879 0001 6b0e            pea.l      NewStreams.stacksize
[00013fa8] 4eb9 0001 2abe            jsr        M2Option.GetLinkerOptions
[00013fae] 4fef 0010                 lea.l      16(a7),a7
[00013fb2] 13fc 0001 0001 6ab4       move.b     #$01,NewStreams.needfile
[00013fba] 4239 0001 6b06            clr.b      NewStreams.currInfoType
[00013fc0] 6100 ff30                 bsr        NewStreams.initfilenames
[00013fc4] 2879 0001 5caa            movea.l    BasePageAddress,a4
[00013fca] 23ec 0020 0001 6b14       move.l     32(a4),NewStreams.DtaPtr _base->p_dta
[00013fd2] 3f3c 0027                 move.w     #$0027,-(a7)
[00013fd6] 4879 0001 6ade            pea.l      NewStreams.outfilename
[00013fdc] 2879 0001 6b14            movea.l    NewStreams.DtaPtr,a4
[00013fe2] 3f3c 0027                 move.w     #$0027,-(a7)
[00013fe6] 4854                      pea.l      (a4)
[00013fe8] 4eb9 0001 1c40            jsr        Strings.Assign
[00013fee] 4fef 000c                 lea.l      12(a7),a7
[00013ff2] 4e5e                      unlk       a6
[00013ff4] 4ef9 0001 41cc            jmp        Filepool.init+6

[00013ffa] 5b31 5d5b 5468 6520       .asciiz '[1][The following file could|not be found:|'
[00014026] 5d5b                      .asciiz '][ENTER NAME|CONTINUE]'
[0001403e] 5b33                      .asciiz '[3][An IO error has occured|whilst '
[00014062] 7772                      .asciiz 'writing'
[0001406a] 7265                      .asciiz 'reading'
[00014072] 2074                      .asciiz ' the disk.][OK]'
[00014082] 5b33 5d5b 5468 6520       .asciiz '[3][The disk does not have|enough room to write|any more information.][OK] '
[000140ce] 5b33 5d5b 4865 6170       .asciiz '[3][Heap overflow!|No memory to open file][OK]'
[000140fe] 544d                      .asciiz 'TMP'
[00014102] 4d4f                      .asciiz 'MOD'
[00014106] 5245                      .asciiz 'REF'
[0001410a] 5359                      .asciiz 'SYM'
[0001410e] 4c4e 4b00                 .asciiz 'LNK'
[00014112] 4c53 5400                 .asciiz 'LST'
[00014116] 5052                      .asciiz 'PRG'
[0001411a] 4d41                      .asciiz 'MAP'
[0001411e] 434f                      .asciiz 'COR'
[00014122] 4552                      .asciiz 'ERD'
[00014126] 4552                      .asciiz 'ERM'
[0001412a] 5852                      .asciiz 'XRF'
[0001412e] 4445                      .asciiz 'DEC'
[00014132] 5052                      .asciiz 'PRT'
[00014136] 494e                      .asciiz 'IND'
[0001413a] 5253                      .asciiz 'RSC'
[0001413e] 2020                      .asciiz '   '
[00014142] 203a 2000                 .asciiz ' : '

[00014146] 2e00                      .asciiz '.'

[00014148] 203a 2000                 .asciiz ' : '
[0001414c] 0000                      .asciiz ''
[0001414e] 4845                      .asciiz 'HEAP'
[00014154] 5155                      .asciiz 'QUERY'
[0001415a] 5245                      .asciiz 'REF'
[0001415e] 4c49 5354                 .asciiz 'LIST'
[00014164] 5354                      .asciiz 'STACK'
[0001416a] 4d41                      .asciiz 'MAP'
[0001416e] 4454                      .asciiz 'DTABLE'
[00014176] 4f50                      .asciiz 'OPTIMISE'

***
* MODULE Filepool
***

[00014180] 4e56 ffb0                 link       a6,#-80
[00014184] 286e 0008                 movea.l    8(a6),a4
[00014188] 47ee ffb0                 lea.l      -80(a6),a3
[0001418c] 7a13                      moveq.l    #19,d5
[0001418e] 26dc                      move.l     (a4)+,(a3)+
[00014190] 51cd fffc                 dbf        d5,$0001418E
[00014194] 5279 0001 6b18            addq.w     #1,FilePool.fileid
[0001419a] 3a39 0001 6b18            move.w     FilePool.fileid,d5
[000141a0] cafc 0050                 mulu.w     #$0050,d5
[000141a4] 49f9 0001 6b1a            lea.l      FilePool.names,a4
[000141aa] 47ee ffb0                 lea.l      -80(a6),a3
[000141ae] 49f4 5000                 lea.l      0(a4,d5.w),a4
[000141b2] 7a13                      moveq.l    #19,d5
[000141b4] 28db                      move.l     (a3)+,(a4)+
[000141b6] 51cd fffc                 dbf        d5,$000141B4
[000141ba] 3d79 0001 6b18 000c       move.w     FilePool.fileid,12(a6)
[000141c2] 4e5e                      unlk       a6
[000141c4] 4e75                      rts

Filepool.init:
[000141c6] 4ef9 0001 3f3c            jmp        NewStreams.init

[000141cc] 4e56 0000                 link       a6,#0
[000141d0] 4279 0001 6b18            clr.w      FilePool.fileid
[000141d6] 4e5e                      unlk       a6
[000141d8] 4ef9 0001 5926            jmp        DecSym.init+6

***
* MODULE StrUtil
***

StrUtil.FormatCard:
[000141de] 4e56 0000                 link       a6,#0
[000141e2] 4279 0001 6e3a            clr.w      StrUtil.conv
[000141e8] 33ee 0010 0001 6e3c       move.w     16(a6),StrUtil.conv+2
[000141f0] 2f39 0001 6e3a            move.l     StrUtil.conv,-(a7)
[000141f6] 3f2e 000e                 move.w     14(a6),-(a7)
[000141fa] 1f3c 0001                 move.b     #$01,-(a7)
[000141fe] 1f3c 0020                 move.b     #$20,-(a7)
[00014202] 4227                      clr.b      -(a7)
[00014204] 3a2e 000c                 move.w     12(a6),d5
[00014208] 3f05                      move.w     d5,-(a7)
[0001420a] 286e 0008                 movea.l    8(a6),a4
[0001420e] 4854                      pea.l      (a4)
[00014210] 6100 0076                 bsr.w      StrUtil.FormatVal
[00014214] 4fef 0012                 lea.l      18(a7),a7
[00014218] 4e5e                      unlk       a6
[0001421a] 4e75                      rts

StrUtil.FormatHexCard(val: CARDINAL; len: CARDINAL; VAR result: ARRAY OF CHAR)
[0001421c] 4e56 0000                 link       a6,#0
[00014220] 4279 0001 6e3a            clr.w      StrUtil.conv
[00014226] 33ee 0010 0001 6e3c       move.w     16(a6),StrUtil.conv+2
[0001422e] 2f39 0001 6e3a            move.l     StrUtil.conv,-(a7)
[00014234] 3f2e 000e                 move.w     14(a6),-(a7)
[00014238] 1f3c 0002                 move.b     #$02,-(a7)
[0001423c] 1f3c 0020                 move.b     #$20,-(a7)
[00014240] 4227                      clr.b      -(a7)
[00014242] 3a2e 000c                 move.w     12(a6),d5
[00014246] 3f05                      move.w     d5,-(a7)
[00014248] 286e 0008                 movea.l    8(a6),a4
[0001424c] 4854                      pea.l      (a4)
[0001424e] 6100 0038                 bsr.w      StrUtil.FormatVal
[00014252] 4fef 0012                 lea.l      18(a7),a7
[00014256] 4e5e                      unlk       a6
[00014258] 4e75                      rts

StrUtil.FormatHexLong(val: LONGCARD; len: CARDINAL; VAR result: ARRAY OF CHAR)
[0001425a] 4e56 0000                 link       a6,#0
[0001425e] 2f2e 0010                 move.l     16(a6),-(a7)
[00014262] 3f2e 000e                 move.w     14(a6),-(a7)
[00014266] 1f3c 0002                 move.b     #$02,-(a7)
[0001426a] 1f3c 0020                 move.b     #$20,-(a7)
[0001426e] 4227                      clr.b      -(a7)
[00014270] 3a2e 000c                 move.w     12(a6),d5
[00014274] 3f05                      move.w     d5,-(a7)
[00014276] 286e 0008                 movea.l    8(a6),a4
[0001427a] 4854                      pea.l      (a4)
[0001427c] 6100 000a                 bsr.w      StrUtil.FormatVal
[00014280] 4fef 0012                 lea.l      18(a7),a7
[00014284] 4e5e                      unlk       a6
[00014286] 4e75                      rts

StrUtil.FormatVal(val: LONGCARD; len: CARDINAL; type: basetype; fill: CHAR; f: BOOLEAN; VAR result: ARRAY OF CHAR)
[00014288] 4e56 ffe6                 link       a6,#-26
[0001428c] 426e fff2                 clr.w      -14(a6)
[00014290] 7a00                      moveq.l    #0,d5
[00014292] 1a2e 0012                 move.b     18(a6),d5
[00014296] 2005                      move.l     d5,d0
[00014298] 4eb9 0001 000a            jsr        CASEX
casex5:
[0001429e] 0000                      dc.l 0
[000142a2] 0000 0002                 dc.l 2
[000142a6] 0000 0052                 casex5_tab-casex5
case 0:
[000142aa] 7a08                      moveq.l    #8,d5
[000142ac] 2d45 ffea                 move.l     d5,-22(a6)
[000142b0] 526e fff2                 addq.w     #1,-14(a6)
[000142b4] 3a2e fff2                 move.w     -14(a6),d5
[000142b8] 49ee fff3                 lea.l      -13(a6),a4
[000142bc] 19bc 0042 5000            move.b     #$42,0(a4,d5.w)
[000142c2] 4efa 0032                 jmp        $000142F6(pc)
case 2:
[000142c6] 7a10                      moveq.l    #16,d5
[000142c8] 2d45 ffea                 move.l     d5,-22(a6)
[000142cc] 526e fff2                 addq.w     #1,-14(a6)
[000142d0] 3a2e fff2                 move.w     -14(a6),d5
[000142d4] 49ee fff3                 lea.l      -13(a6),a4
[000142d8] 19bc 0048 5000            move.b     #$48,0(a4,d5.w)
[000142de] 4efa 0016                 jmp        $000142F6(pc)
case 1:
[000142e2] 7a0a                      moveq.l    #10,d5
[000142e4] 2d45 ffea                 move.l     d5,-22(a6)
[000142e8] 4efa 000c                 jmp        $000142F6(pc)
default:
[000142ec] 4efa 0008                 jmp        $000142F6(pc)
casex5_tab:
[000142f0] 000c
           0044
[000142f4] 0028
[000142f6] 526e fff2                 addq.w     #1,-14(a6)
[000142fa] 2f2e 0016                 move.l     22(a6),-(a7)
[000142fe] 2f2e ffea                 move.l     -22(a6),-(a7)
[00014302] 4eb9 0001 0464            jsr        DIVU32
[00014308] 2e9f                      move.l     (a7)+,(a7)
[0001430a] 2d5f ffe6                 move.l     (a7)+,-26(a6)
[0001430e] 7a0a                      moveq.l    #10,d5
[00014310] baae ffe6                 cmp.l      -26(a6),d5
[00014314] 6316                      bls.s      $0001432C
[00014316] 7a30                      moveq.l    #48,d5
[00014318] daae ffe6                 add.l      -26(a6),d5
[0001431c] 382e fff2                 move.w     -14(a6),d4
[00014320] 49ee fff3                 lea.l      -13(a6),a4
[00014324] 1985 4000                 move.b     d5,0(a4,d4.w)
[00014328] 4efa 0014                 jmp        $0001433E(pc)
[0001432c] 7a37                      moveq.l    #55,d5
[0001432e] daae ffe6                 add.l      -26(a6),d5
[00014332] 382e fff2                 move.w     -14(a6),d4
[00014336] 49ee fff3                 lea.l      -13(a6),a4
[0001433a] 1985 4000                 move.b     d5,0(a4,d4.w)
[0001433e] 2f2e 0016                 move.l     22(a6),-(a7)
[00014342] 2f2e ffea                 move.l     -22(a6),-(a7)
[00014346] 4eb9 0001 0464            jsr        DIVU32
[0001434c] 588f                      addq.l     #4,a7
[0001434e] 2d5f 0016                 move.l     (a7)+,22(a6)
[00014352] 4aae 0016                 tst.l      22(a6)
[00014356] 6702                      beq.s      $0001435A
[00014358] 609c                      bra.s      $000142F6

[0001435a] 4a2e 000e                 tst.b      14(a6)
[0001435e] 6712                      beq.s      $00014372
[00014360] 526e fff2                 addq.w     #1,-14(a6)
[00014364] 3a2e fff2                 move.w     -14(a6),d5
[00014368] 49ee fff3                 lea.l      -13(a6),a4
[0001436c] 19bc 002d 5000            move.b     #$2D,0(a4,d5.w)
[00014372] 3a2e 0014                 move.w     20(a6),d5
[00014376] ba6e fff2                 cmp.w      -14(a6),d5
[0001437a] 6408                      bcc.s      $00014384
[0001437c] 426e ffee                 clr.w      -18(a6)
[00014380] 4efa 000e                 jmp        $00014390(pc)
[00014384] 3a2e 0014                 move.w     20(a6),d5
[00014388] 9a6e fff2                 sub.w      -14(a6),d5
[0001438c] 3d45 ffee                 move.w     d5,-18(a6)
[00014390] 426e fff0                 clr.w      -16(a6)
[00014394] 3a2e fff0                 move.w     -16(a6),d5
[00014398] ba6e ffee                 cmp.w      -18(a6),d5
[0001439c] 6412                      bcc.s      $000143B0
[0001439e] 3a2e fff0                 move.w     -16(a6),d5
[000143a2] 286e 0008                 movea.l    8(a6),a4
[000143a6] 19ae 0010 5000            move.b     16(a6),0(a4,d5.w)
[000143ac] 4efa 001c                 jmp        $000143CA(pc)
[000143b0] 3a2e fff2                 move.w     -14(a6),d5
[000143b4] 49ee fff3                 lea.l      -13(a6),a4
[000143b8] 382e fff0                 move.w     -16(a6),d4
[000143bc] 266e 0008                 movea.l    8(a6),a3
[000143c0] 17b4 5000 4000            move.b     0(a4,d5.w),0(a3,d4.w)
[000143c6] 536e fff2                 subq.w     #1,-14(a6)
[000143ca] 526e fff0                 addq.w     #1,-16(a6)
[000143ce] 4a6e fff2                 tst.w      -14(a6)
[000143d2] 6702                      beq.s      $000143D6
[000143d4] 60be                      bra.s      $00014394
[000143d6] 3a2e fff0                 move.w     -16(a6),d5
[000143da] ba6e 000c                 cmp.w      12(a6),d5
[000143de] 620c                      bhi.s      $000143EC
[000143e0] 3a2e fff0                 move.w     -16(a6),d5
[000143e4] 286e 0008                 movea.l    8(a6),a4
[000143e8] 4234 5000                 clr.b      0(a4,d5.w)
[000143ec] 4e5e                      unlk       a6
[000143ee] 4e75                      rts

***
* MODULE Symfile
***

decsym.OpenFiles:
[000143f0] 4e56 fef6                 link       a6,#-266
[000143f4] 3f3c 000a                 move.w     #$000A,-(a7)
[000143f8] 4879 0001 59a6            pea.l      $000159A6 "Symbol file"
[000143fe] 4267                      clr.w      -(a7)
[00014400] 4879 0001 59b2            pea.l      $000159B2 ''
[00014406] 3f3c 0004                 move.w     #$0004,-(a7)
[0001440a] 4879 0001 6e40            pea.l      decsym.symFile
[00014410] 1f3c 0001                 move.b     #$01,-(a7)
[00014414] 4227                      clr.b      -(a7)
[00014416] 3f3c 0031                 move.w     #$0031,-(a7)
[0001441a] 486e ffc8                 pea.l      -56(a6)
[0001441e] 486e ffff                 pea.l      -1(a6)
[00014422] 4eb9 0001 3426            jsr        NewStreams.FileLookup
[00014428] 4fef 0020                 lea.l      32(a7),a7
[0001442c] 4a2e ffff                 tst.b      -1(a6)
[00014430] 675a                      beq.s      $0001448C
[00014432] 558f                      subq.l     #2,a7
[00014434] 4879 0001 59b4            pea.l      $000159B4 "List"
[0001443a] 4eb9 0001 4180            jsr        $00014180
[00014440] 588f                      addq.l     #4,a7
[00014442] 3d5f fffc                 move.w     (a7)+,-4(a6)
[00014446] 486e fef6                 pea.l      -266(a6)
[0001444a] 486e fffe                 pea.l      -2(a6)
[0001444e] 4eb9 0001 3c38            jsr        NewStreams.GetOptionInfo
[00014454] 508f                      addq.l     #8,a7
[00014456] 3f3c 000a                 move.w     #$000A,-(a7)
[0001445a] 4879 0001 59ba            pea.l      $000159BA "Decode file"
[00014460] 3f3c 0031                 move.w     #$0031,-(a7)
[00014464] 486e ffc8                 pea.l      -56(a6)
[00014468] 3f3c 000e                 move.w     #$000E,-(a7)
[0001446c] 4879 0001 6e44            pea.l      decsym.decFile
[00014472] 4227                      clr.b      -(a7)
[00014474] 4227                      clr.b      -(a7)
[00014476] 3f3c 0031                 move.w     #$0031,-(a7)
[0001447a] 486e ff96                 pea.l      -106(a6)
[0001447e] 486e ffff                 pea.l      -1(a6)
[00014482] 4eb9 0001 390c            jsr        NewStreams.FileLookupOutput
[00014488] 4fef 0020                 lea.l      32(a7),a7
[0001448c] 4a2e ffff                 tst.b      -1(a6)
[00014490] 57c5                      seq        d5
[00014492] 4405                      neg.b      d5
[00014494] 13c5 0001 6e3e            move.b     d5,Symfile.outputFailed
[0001449a] 4e5e                      unlk       a6
[0001449c] 4e75                      rts

CloseFiles:
[0001449e] 4e56 fffe                 link       a6,#-2
[000144a2] 4879 0001 6e40            pea.l      decsym.symFile
[000144a8] 486e ffff                 pea.l      -1(a6)
[000144ac] 4eb9 0001 3de2            jsr        NewStreams.Close
[000144b2] 508f                      addq.l     #8,a7
[000144b4] 4879 0001 6e44            pea.l      decsym.decFile
[000144ba] 486e ffff                 pea.l      -1(a6)
[000144be] 4eb9 0001 3de2            jsr        NewStreams.Close
[000144c4] 508f                      addq.l     #8,a7
[000144c6] 4e5e                      unlk       a6
[000144c8] 4e75                      rts

Symfile.Error(VAR s: ARRAY OF CHAR; 
[000144ca] 4e56 0000                 link       a6,#0
[000144ce] 3a2e 000c                 move.w     12(a6),d5
[000144d2] 3f05                      move.w     d5,-(a7)
[000144d4] 286e 0008                 movea.l    8(a6),a4
[000144d8] 4854                      pea.l      (a4)
[000144da] 4eb9 0001 130e            jsr        AppWindow.WriteString
[000144e0] 5c8f                      addq.l     #6,a7
[000144e2] 4eb9 0001 13d8            jsr        AppWindow.WriteLn
[000144e8] 3f3c 0013                 move.w     #$0013,-(a7)
[000144ec] 4879 0001 59c6            pea.l      $000159C6 " Error in SymbolFile"
[000144f2] 4eb9 0001 130e            jsr        AppWindow.WriteString
[000144f8] 5c8f                      addq.l     #6,a7
[000144fa] 4eb9 0001 13d8            jsr        AppWindow.WriteLn
[00014500] 4eb9 0001 449e            jsr        CloseFiles
[00014506] 3f3c 0004                 move.w     #$0004,-(a7)
[0001450a] 1f3c 0001                 move.b     #$01,-(a7)
[0001450e] 4eb9 0001 245e            jsr        ExecUtil.IOError
[00014514] 588f                      addq.l     #4,a7
[00014516] 4e5e                      unlk       a6
[00014518] 4e75                      rts

Symfile.WriteLn:
[0001451a] 4e56 0000                 link       a6,#0
[0001451e] 4879 0001 6e44            pea.l      decsym.decFile
[00014524] 1f3c 000d                 move.b     #$0D,-(a7)
[00014528] 4eb9 0001 3e98            jsr        NewStreams.WriteChar
[0001452e] 5c8f                      addq.l     #6,a7
[00014530] 4279 0001 6e4a            clr.w      outputX
[00014536] 4e5e                      unlk       a6
[00014538] 4e75                      rts

Symfile.Write:
[0001453a] 4e56 0000                 link       a6,#0
[0001453e] 0c79 004b 0001 6e4a       cmpi.w     #$004B,outputX
[00014546] 6306                      bls.s      $0001454E
[00014548] 4eb9 0001 451a            jsr        Symfile.WriteLn
[0001454e] 4879 0001 6e44            pea.l      decsym.decFile
[00014554] 1f2e 0008                 move.b     8(a6),-(a7)
[00014558] 4eb9 0001 3e98            jsr        NewStreams.WriteChar
[0001455e] 5c8f                      addq.l     #6,a7
[00014560] 5279 0001 6e4a            addq.w     #1,outputX
[00014566] 4e5e                      unlk       a6
[00014568] 4e75                      rts

Symfile.WriteString:
[0001456a] 4e56 fffe                 link       a6,#-2
[0001456e] 426e fffe                 clr.w      -2(a6)
[00014572] 3a2e fffe                 move.w     -2(a6),d5
[00014576] ba6e 000c                 cmp.w      12(a6),d5
[0001457a] 6228                      bhi.s      $000145A4
[0001457c] 3a2e fffe                 move.w     -2(a6),d5
[00014580] 286e 0008                 movea.l    8(a6),a4
[00014584] 4a34 5000                 tst.b      0(a4,d5.w)
[00014588] 671a                      beq.s      $000145A4
[0001458a] 3a2e fffe                 move.w     -2(a6),d5
[0001458e] 286e 0008                 movea.l    8(a6),a4
[00014592] 1f34 5000                 move.b     0(a4,d5.w),-(a7)
[00014596] 4eb9 0001 453a            jsr        Symfile.Write
[0001459c] 548f                      addq.l     #2,a7
[0001459e] 526e fffe                 addq.w     #1,-2(a6)
[000145a2] 60ce                      bra.s      $00014572
[000145a4] 4e5e                      unlk       a6
[000145a6] 4e75                      rts

Symfile.WriteCard:
[000145a8] 4e56 fff6                 link       a6,#-10
[000145ac] 3f2e 000a                 move.w     10(a6),-(a7)
[000145b0] 3f2e 0008                 move.w     8(a6),-(a7)
[000145b4] 3f3c 0009                 move.w     #$0009,-(a7)
[000145b8] 486e fff6                 pea.l      -10(a6)
[000145bc] 4eb9 0001 41de            jsr        StrUtil.FormatCard
[000145c2] 4fef 000a                 lea.l      10(a7),a7
[000145c6] 3f3c 0009                 move.w     #$0009,-(a7)
[000145ca] 486e fff6                 pea.l      -10(a6)
[000145ce] 4eb9 0001 456a            jsr        Symfile.WriteString
[000145d4] 5c8f                      addq.l     #6,a7
[000145d6] 4e5e                      unlk       a6
[000145d8] 4e75                      rts

Symfile.WriteHexCard:
[000145da] 4e56 fff6                 link       a6,#-10
[000145de] 3f2e 000a                 move.w     10(a6),-(a7)
[000145e2] 3f2e 0008                 move.w     8(a6),-(a7)
[000145e6] 3f3c 0009                 move.w     #$0009,-(a7)
[000145ea] 486e fff6                 pea.l      -10(a6)
[000145ee] 4eb9 0001 421c            jsr        StrUtil.FormatHexCard
[000145f4] 4fef 000a                 lea.l      10(a7),a7
[000145f8] 3f3c 0009                 move.w     #$0009,-(a7)
[000145fc] 486e fff6                 pea.l      -10(a6)
[00014600] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014606] 5c8f                      addq.l     #6,a7
[00014608] 4e5e                      unlk       a6
[0001460a] 4e75                      rts

Symfile.WriteLong:
[0001460c] 4e56 ffec                 link       a6,#-20
[00014610] 2f2e 000a                 move.l     10(a6),-(a7)
[00014614] 3f2e 0008                 move.w     8(a6),-(a7)
[00014618] 3f3c 0013                 move.w     #$0013,-(a7)
[0001461c] 486e ffec                 pea.l      -20(a6)
[00014620] 4eb9 0001 425a            jsr        StrUtil.FormatHexLong
[00014626] 4fef 000c                 lea.l      12(a7),a7
[0001462a] 3f3c 0013                 move.w     #$0013,-(a7)
[0001462e] 486e ffec                 pea.l      -20(a6)
[00014632] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014638] 5c8f                      addq.l     #6,a7
[0001463a] 4e5e                      unlk       a6
[0001463c] 4e75                      rts

Symfile.WriteSpaces(n: CARDINAL)
[0001463e] 4e56 0000                 link       a6,#0
[00014642] 4eb9 0001 451a            jsr        Symfile.xWriteLn
[00014648] 4a6e 0008                 tst.w      8(a6)
[0001464c] 6312                      bls.s      $00014660
[0001464e] 1f3c 0020                 move.b     #$20,-(a7)
[00014652] 4eb9 0001 453a            jsr        Symfile.Write
[00014658] 548f                      addq.l     #2,a7
[0001465a] 536e 0008                 subq.w     #1,8(a6)
[0001465e] 60e8                      bra.s      $00014648
[00014660] 4e5e                      unlk       a6
[00014662] 4e75                      rts

Symfile.ReadByte():
[00014664] 4e56 fffe                 link       a6,#-2
[00014668] 4879 0001 6e40            pea.l      decsym.symFile
[0001466e] 486e ffff                 pea.l      -1(a6)
[00014672] 4eb9 0001 3e78            jsr        NewStreams.ReadByte
[00014678] 508f                      addq.l     #8,a7
[0001467a] 7a00                      moveq.l    #0,d5
[0001467c] 1a2e ffff                 move.b     -1(a6),d5
[00014680] 13c5 0001 6e48            move.b     d5,Symfile.lastByte
[00014686] 4e5e                      unlk       a6
[00014688] 4e75                      rts

Symfile.ReadString():
[0001468a] 4e56 fffc                 link       a6,#-4
[0001468e] 426e fffc                 clr.w      -4(a6)
[00014692] 4879 0001 6e40            pea.l      decsym.symFile
[00014698] 486e ffff                 pea.l      -1(a6)
[0001469c] 4eb9 0001 3e40            jsr        NewStreams.ReadChar
[000146a2] 508f                      addq.l     #8,a7
[000146a4] 3a2e fffc                 move.w     -4(a6),d5
[000146a8] ba6e 000c                 cmp.w      12(a6),d5
[000146ac] 6212                      bhi.s      $000146C0
[000146ae] 3a2e fffc                 move.w     -4(a6),d5
[000146b2] 286e 0008                 movea.l    8(a6),a4
[000146b6] 19ae ffff 5000            move.b     -1(a6),0(a4,d5.w)
[000146bc] 526e fffc                 addq.w     #1,-4(a6)
[000146c0] 4a2e ffff                 tst.b      -1(a6)
[000146c4] 6702                      beq.s      $000146C8
[000146c6] 60ca                      bra.s      $00014692
[000146c8] 4e5e                      unlk       a6
[000146ca] 4e75                      rts

Symfile.Read16Bit(VAR v: WORD):
[000146cc] 4e56 0000                 link       a6,#0
[000146d0] 4879 0001 6e40            pea.l      decsym.symFile
[000146d6] 286e 0008                 movea.l    8(a6),a4
[000146da] 4854                      pea.l      (a4)
[000146dc] 4eb9 0001 3ed8            jsr        NewStreams.Read16Bit
[000146e2] 508f                      addq.l     #8,a7
[000146e4] 4e5e                      unlk       a6
[000146e6] 4e75                      rts

Symfile.Read32Bit(VAR l: LONGCARD)
[000146e8] 4e56 fffc                 link       a6,#-4
[000146ec] 486e fffe                 pea.l      -2(a6)
[000146f0] 4eb9 0001 46cc            jsr        Symfile.Read16Bit
[000146f6] 588f                      addq.l     #4,a7
[000146f8] 486e fffc                 pea.l      -4(a6)
[000146fc] 4eb9 0001 46cc            jsr        Symfile.Read16Bit
[00014702] 588f                      addq.l     #4,a7
[00014704] 7a00                      moveq.l    #0,d5
[00014706] 3a2e fffe                 move.w     -2(a6),d5
[0001470a] 7010                      moveq.l    #16,d0
[0001470c] e1a5                      asl.l      d0,d5
[0001470e] 7800                      moveq.l    #0,d4
[00014710] 382e fffc                 move.w     -4(a6),d4
[00014714] da84                      add.l      d4,d5
[00014716] 286e 0008                 movea.l    8(a6),a4
[0001471a] 2885                      move.l     d5,(a4)
[0001471c] 4e5e                      unlk       a6
[0001471e] 4e75                      rts

Symfile.Expect(b: BYTE);
[00014720] 4e56 0000                 link       a6,#0
[00014724] 1a39 0001 6e48            move.b     Symfile.lastByte,d5
[0001472a] ba2e 0008                 cmp.b      8(a6),d5
[0001472e] 6722                      beq.s      $00014752
[00014730] 3f3c 001e                 move.w     #$001E,-(a7)
[00014734] 4879 0001 59dc            pea.l      $000159DC "incorrect symbol on symbol file"
[0001473a] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014740] 5c8f                      addq.l     #6,a7
[00014742] 4267                      clr.w      -(a7)
[00014744] 4879 0001 59fc            pea.l      $000159FC ''
[0001474a] 4eb9 0001 44ca            jsr        Symfile.Error
[00014750] 5c8f                      addq.l     #6,a7
[00014752] 4e5e                      unlk       a6
[00014754] 4e75                      rts

Symfile.NextIf(b: BYTE);
[00014756] 4e56 0000                 link       a6,#0
[0001475a] 1f2e 0008                 move.b     8(a6),-(a7)
[0001475e] 4eb9 0001 4720            jsr        Symfile.Expect
[00014764] 548f                      addq.l     #2,a7
[00014766] 4eb9 0001 4664            jsr        Symfile.ReadByte
[0001476c] 4e5e                      unlk       a6
[0001476e] 4e75                      rts

IndentUp:
[00014770] 4e56 0000                 link       a6,#0
[00014774] 3a39 0001 6e4a            move.w     outputX,d5
[0001477a] 5445                      addq.w     #2,d5
[0001477c] 33c5 0001 6e64            move.w     d5,indentLevel
[00014782] 3a2e 000c                 move.w     12(a6),d5
[00014786] 3f05                      move.w     d5,-(a7)
[00014788] 286e 0008                 movea.l    8(a6),a4
[0001478c] 4854                      pea.l      (a4)
[0001478e] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014794] 5c8f                      addq.l     #6,a7
[00014796] 4e5e                      unlk       a6
[00014798] 4e75                      rts

IndentDown:
[0001479a] 4e56 0000                 link       a6,#0
[0001479e] 5579 0001 6e64            subq.w     #2,indentLevel
[000147a4] 3f39 0001 6e64            move.w     indentLevel,-(a7)
[000147aa] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[000147b0] 548f                      addq.l     #2,a7
[000147b2] 3a2e 000c                 move.w     12(a6),d5
[000147b6] 3f05                      move.w     d5,-(a7)
[000147b8] 286e 0008                 movea.l    8(a6),a4
[000147bc] 4854                      pea.l      (a4)
[000147be] 4eb9 0001 456a            jsr        Symfile.WriteString
[000147c4] 5c8f                      addq.l     #6,a7
[000147c6] 4e5e                      unlk       a6
[000147c8] 4e75                      rts

DecodeShortConst:
[000147ca] 4e56 fffe                 link       a6,#-2
[000147ce] 1f3c 0007                 move.b     #$07,-(a7)
[000147d2] 4eb9 0001 4720            jsr        Symfile.Expect
[000147d8] 548f                      addq.l     #2,a7
[000147da] 486e fffe                 pea.l      -2(a6)
[000147de] 4eb9 0001 46cc            jsr        Symfile.Read16Bit
[000147e4] 588f                      addq.l     #4,a7
[000147e6] 4eb9 0001 4664            jsr        Symfile.ReadByte
[000147ec] 3d6e fffe 0008            move.w     -2(a6),8(a6)
[000147f2] 4e5e                      unlk       a6
[000147f4] 4e75                      rts

DecodeLongConst:
[000147f6] 4e56 fffc                 link       a6,#-4
[000147fa] 1f3c 0006                 move.b     #$06,-(a7)
[000147fe] 4eb9 0001 4720            jsr        Symfile.Expect
[00014804] 548f                      addq.l     #2,a7
[00014806] 486e fffc                 pea.l      -4(a6)
[0001480a] 4eb9 0001 46e8            jsr        Symfile.Read32Bit
[00014810] 588f                      addq.l     #4,a7
[00014812] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00014818] 2d6e fffc 0008            move.l     -4(a6),8(a6)
[0001481e] 4e5e                      unlk       a6
[00014820] 4e75                      rts

DecodeIdent:
[00014822] 4e56 ffae                 link       a6,#-82
[00014826] 1f3c 0014                 move.b     #$14,-(a7)
[0001482a] 4eb9 0001 4720            jsr        Symfile.Expect
[00014830] 548f                      addq.l     #2,a7
[00014832] 3f3c 0050                 move.w     #$0050,-(a7)
[00014836] 486e ffae                 pea.l      -82(a6)
[0001483a] 4eb9 0001 468a            jsr        Symfile.ReadString
[00014840] 5c8f                      addq.l     #6,a7
[00014842] 3f3c 0050                 move.w     #$0050,-(a7)
[00014846] 486e ffae                 pea.l      -82(a6)
[0001484a] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014850] 5c8f                      addq.l     #6,a7
[00014852] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00014858] 4e5e                      unlk       a6
[0001485a] 4e75                      rts

SkipIdent:
[0001485c] 4e56 ffae                 link       a6,#-82
[00014860] 1f3c 0014                 move.b     #$14,-(a7)
[00014864] 4eb9 0001 4720            jsr        Symfile.Expect
[0001486a] 548f                      addq.l     #2,a7
[0001486c] 3f3c 0050                 move.w     #$0050,-(a7)
[00014870] 486e ffae                 pea.l      -82(a6)
[00014874] 4eb9 0001 468a            jsr        Symfile.ReadString
[0001487a] 5c8f                      addq.l     #6,a7
[0001487c] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00014882] 4e5e                      unlk       a6
[00014884] 4e75                      rts

DecodeModuleKey:
[00014886] 4e56 0000                 link       a6,#0
[0001488a] 4eb9 0001 451a            jsr        Symfile.WriteLn
[00014890] 3f39 0001 6e64            move.w     indentLevel,-(a7)
[00014896] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[0001489c] 548f                      addq.l     #2,a7
[0001489e] 3f3c 000e                 move.w     #$000E,-(a7)
[000148a2] 4879 0001 59fe            pea.l      $000159FE '(*module key = '
[000148a8] 4eb9 0001 456a            jsr        Symfile.WriteString
[000148ae] 5c8f                      addq.l     #6,a7
[000148b0] 558f                      subq.l     #2,a7
[000148b2] 4eb9 0001 47ca            jsr        DecodeShortConst
[000148b8] 3f3c 0005                 move.w     #$0005,-(a7)
[000148bc] 4eb9 0001 45da            jsr        Symfile.WriteHexCard
[000148c2] 588f                      addq.l     #4,a7
[000148c4] 558f                      subq.l     #2,a7
[000148c6] 4eb9 0001 47ca            jsr        DecodeShortConst
[000148cc] 3f3c 0005                 move.w     #$0005,-(a7)
[000148d0] 4eb9 0001 45da            jsr        Symfile.WriteHexCard
[000148d6] 588f                      addq.l     #4,a7
[000148d8] 558f                      subq.l     #2,a7
[000148da] 4eb9 0001 47ca            jsr        DecodeShortConst
[000148e0] 3f3c 0005                 move.w     #$0005,-(a7)
[000148e4] 4eb9 0001 45da            jsr        Symfile.WriteHexCard
[000148ea] 588f                      addq.l     #4,a7
[000148ec] 3f3c 0001                 move.w     #$0001,-(a7)
[000148f0] 4879 0001 5a0e            pea.l      $00015A0E '*)'
[000148f6] 4eb9 0001 456a            jsr        Symfile.WriteString
[000148fc] 5c8f                      addq.l     #6,a7
[000148fe] 4e5e                      unlk       a6
[00014900] 4e75                      rts

DecodeFileKey:
[00014902] 4e56 fffe                 link       a6,#-2
[00014906] 558f                      subq.l     #2,a7
[00014908] 4eb9 0001 47ca            jsr        DecodeShortConst
[0001490e] 3d5f fffe                 move.w     (a7)+,-2(a6)
[00014912] 3f3c 0012                 move.w     #$0012,-(a7)
[00014916] 4879 0001 5a12            pea.l      $00015A12 '(*syntax version = '
[0001491c] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014922] 5c8f                      addq.l     #6,a7
[00014924] 3f2e fffe                 move.w     -2(a6),-(a7)
[00014928] 3f3c 0005                 move.w     #$0005,-(a7)
[0001492c] 4eb9 0001 45da            jsr        Symfile.WriteHexCard
[00014932] 588f                      addq.l     #4,a7
[00014934] 3f3c 0001                 move.w     #$0001,-(a7)
[00014938] 4879 0001 5a26            pea.l      $00015A26 '*)'
[0001493e] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014944] 5c8f                      addq.l     #6,a7
[00014946] 0c6e 0004 fffe            cmpi.w     #$0004,-2(a6)
[0001494c] 6738                      beq.s      $00014986
[0001494e] 3f3c 0023                 move.w     #$0023,-(a7)
[00014952] 4879 0001 5a2a            pea.l      $00015A2A 'error: SymFileSyntaxVersion must be '
[00014958] 4eb9 0001 456a            jsr        Symfile.WriteString
[0001495e] 5c8f                      addq.l     #6,a7
[00014960] 3f3c 0004                 move.w     #$0004,-(a7)
[00014964] 3f3c 0001                 move.w     #$0001,-(a7)
[00014968] 4eb9 0001 45a8            jsr        Symfile.WriteCard
[0001496e] 588f                      addq.l     #4,a7
[00014970] 4eb9 0001 451a            jsr        Symfile.WriteLn
[00014976] 4267                      clr.w      -(a7)
[00014978] 4879 0001 5a50            pea.l      $00015A50 ''
[0001497e] 4eb9 0001 44ca            jsr        Symfile.Error
[00014984] 5c8f                      addq.l     #6,a7
[00014986] 4e5e                      unlk       a6
[00014988] 4e75                      rts

DecodeModuleIdent:
[0001498a] 4e56 0000                 link       a6,#0
[0001498e] 1f3c 0014                 move.b     #$14,-(a7)
[00014992] 4eb9 0001 4720            jsr        Symfile.Expect
[00014998] 548f                      addq.l     #2,a7
[0001499a] 3f3c 0017                 move.w     #$0017,-(a7)
[0001499e] 4879 0001 6e4c            pea.l      ident
[000149a4] 4eb9 0001 468a            jsr        Symfile.ReadString
[000149aa] 5c8f                      addq.l     #6,a7
[000149ac] 4eb9 0001 451a            jsr        Symfile.WriteLn
[000149b2] 3f3c 0011                 move.w     #$0011,-(a7)
[000149b6] 4879 0001 5a52            pea.l      $00015A52 'DEFINITION MODULE '
[000149bc] 4eb9 0001 456a            jsr        Symfile.WriteString
[000149c2] 5c8f                      addq.l     #6,a7
[000149c4] 3f3c 0017                 move.w     #$0017,-(a7)
[000149c8] 4879 0001 6e4c            pea.l      ident
[000149ce] 4eb9 0001 456a            jsr        Symfile.WriteString
[000149d4] 5c8f                      addq.l     #6,a7
[000149d6] 1f3c 003b                 move.b     #$3B,-(a7)
[000149da] 4eb9 0001 453a            jsr        Symfile.Write
[000149e0] 548f                      addq.l     #2,a7
[000149e2] 4eb9 0001 451a            jsr        Symfile.WriteLn
[000149e8] 4eb9 0001 4664            jsr        Symfile.ReadByte
[000149ee] 4e5e                      unlk       a6
[000149f0] 4e75                      rts

DecodeModuleHeader:
[000149f2] 4e56 0000                 link       a6,#0
[000149f6] 4eb9 0001 4902            jsr        DecodeFileKey
[000149fc] 4eb9 0001 4886            jsr        DecodeModuleKey
[00014a02] 4eb9 0001 498a            jsr        DecodeModuleIdent
[00014a08] 4e5e                      unlk       a6
[00014a0a] 4e75                      rts

DecodeSubModuleIdent:
[00014a0c] 4e56 0000                 link       a6,#0
[00014a10] 1f3c 0014                 move.b     #$14,-(a7)
[00014a14] 4eb9 0001 4720            jsr        Symfile.Expect
[00014a1a] 548f                      addq.l     #2,a7
[00014a1c] 3a2e 000c                 move.w     12(a6),d5
[00014a20] 3f05                      move.w     d5,-(a7)
[00014a22] 286e 0008                 movea.l    8(a6),a4
[00014a26] 4854                      pea.l      (a4)
[00014a28] 4eb9 0001 468a            jsr        Symfile.ReadString
[00014a2e] 5c8f                      addq.l     #6,a7
[00014a30] 3f39 0001 6e64            move.w     indentLevel,-(a7)
[00014a36] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[00014a3c] 548f                      addq.l     #2,a7
[00014a3e] 3f3c 0006                 move.w     #$0006,-(a7)
[00014a42] 4879 0001 5a66            pea.l      $00015A66 'MODULE '
[00014a48] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014a4e] 5c8f                      addq.l     #6,a7
[00014a50] 3a2e 000c                 move.w     12(a6),d5
[00014a54] 3f05                      move.w     d5,-(a7)
[00014a56] 286e 0008                 movea.l    8(a6),a4
[00014a5a] 4854                      pea.l      (a4)
[00014a5c] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014a62] 5c8f                      addq.l     #6,a7
[00014a64] 1f3c 003b                 move.b     #$3B,-(a7)
[00014a68] 4eb9 0001 453a            jsr        Symfile.Write
[00014a6e] 548f                      addq.l     #2,a7
[00014a70] 4eb9 0001 451a            jsr        Symfile.WriteLn
[00014a76] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00014a7c] 4e5e                      unlk       a6
[00014a7e] 4e75                      rts

DecodeMember:
[00014a80] 4e56 0000                 link       a6,#0
[00014a84] 4eb9 0001 4822            jsr        DecodeIdent
[00014a8a] 0c39 0015 0001 6e48       cmpi.b     #$15,Symfile.lastByte
[00014a92] 661a                      bne.s      $00014AAE
[00014a94] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00014a9a] 1f3c 002e                 move.b     #$2E,-(a7)
[00014a9e] 4eb9 0001 453a            jsr        Symfile.Write
[00014aa4] 548f                      addq.l     #2,a7
[00014aa6] 4eb9 0001 4822            jsr        DecodeIdent
[00014aac] 60dc                      bra.s      $00014A8A
[00014aae] 4e5e                      unlk       a6
[00014ab0] 4e75                      rts

DecodeRealHi:
[00014ab2] 4e56 fffe                 link       a6,#-2
[00014ab6] 486e fffe                 pea.l      -2(a6)
[00014aba] 4eb9 0001 46cc            jsr        Symfile.Read16Bit
[00014ac0] 588f                      addq.l     #4,a7
[00014ac2] 3f2e fffe                 move.w     -2(a6),-(a7)
[00014ac6] 3f3c 0004                 move.w     #$0004,-(a7)
[00014aca] 4eb9 0001 45da            jsr        Symfile.WriteHexCard
[00014ad0] 588f                      addq.l     #4,a7
[00014ad2] 4e5e                      unlk       a6
[00014ad4] 4e75                      rts

DecodeRealLo:
[00014ad6] 4e56 fffe                 link       a6,#-2
[00014ada] 486e fffe                 pea.l      -2(a6)
[00014ade] 4eb9 0001 46cc            jsr        Symfile.Read16Bit
[00014ae4] 588f                      addq.l     #4,a7
[00014ae6] 3f2e fffe                 move.w     -2(a6),-(a7)
[00014aea] 3f3c 0004                 move.w     #$0004,-(a7)
[00014aee] 4eb9 0001 45da            jsr        Symfile.WriteHexCard
[00014af4] 588f                      addq.l     #4,a7
[00014af6] 4e5e                      unlk       a6
[00014af8] 4e75                      rts

DecodeReal:
[00014afa] 4e56 0000                 link       a6,#0
[00014afe] 4eb9 0001 4ab2            jsr        $00014AB2
[00014b04] 4eb9 0001 4ad6            jsr        $00014AD6
[00014b0a] 3f3c 001b                 move.w     #$001B,-(a7)
[00014b0e] 4879 0001 5a6e            pea.l      $00015A6E '(*Real-not yet implemented*)'
[00014b14] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014b1a] 5c8f                      addq.l     #6,a7
[00014b1c] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00014b22] 4e5e                      unlk       a6
[00014b24] 4e75                      rts

DecodeString:
[00014b26] 4e56 ffae                 link       a6,#-82
[00014b2a] 3f3c 0050                 move.w     #$0050,-(a7)
[00014b2e] 486e ffae                 pea.l      -82(a6)
[00014b32] 4eb9 0001 468a            jsr        Symfile.ReadString
[00014b38] 5c8f                      addq.l     #6,a7
[00014b3a] 1f3c 0022                 move.b     #$22,-(a7)
[00014b3e] 4eb9 0001 453a            jsr        Symfile.Write
[00014b44] 548f                      addq.l     #2,a7
[00014b46] 3f3c 0050                 move.w     #$0050,-(a7)
[00014b4a] 486e ffae                 pea.l      -82(a6)
[00014b4e] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014b54] 5c8f                      addq.l     #6,a7
[00014b56] 1f3c 0022                 move.b     #$22,-(a7)
[00014b5a] 4eb9 0001 453a            jsr        Symfile.Write
[00014b60] 548f                      addq.l     #2,a7
[00014b62] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00014b68] 4e5e                      unlk       a6
[00014b6a] 4e75                      rts

DecodeConst:
[00014b6c] 4e56 0000                 link       a6,#0
[00014b70] 7a00                      moveq.l    #0,d5
[00014b72] 1a39 0001 6e48            move.b     Symfile.lastByte,d5
[00014b78] 2005                      move.l     d5,d0
[00014b7a] 4eb9 0001 000a            jsr        CASEX
casex6:
[00014b80] 0000 0006                 dc.l 6
[00014b84] 0000 0004                 dc.l 4
[00014b88] 0000 00a8                 dc.l casex6_tab-casex6
case 7:
[00014b8c] 558f                      subq.l     #2,a7
[00014b8e] 4eb9 0001 47ca            jsr        DecodeShortConst
[00014b94] 3f3c 0001                 move.w     #$0001,-(a7)
[00014b98] 4eb9 0001 45a8            jsr        Symfile.WriteCard
[00014b9e] 588f                      addq.l     #4,a7
[00014ba0] 3f3c 0001                 move.w     #$0001,-(a7)
[00014ba4] 4879 0001 5a8c            pea.l      $00015A8C '(*'
[00014baa] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014bb0] 5c8f                      addq.l     #6,a7
[00014bb2] 4eb9 0001 4a80            jsr        DecodeMember
[00014bb8] 3f3c 0001                 move.w     #$0001,-(a7)
[00014bbc] 4879 0001 5a90            pea.l      $00015A90 '*)'
[00014bc2] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014bc8] 5c8f                      addq.l     #6,a7
[00014bca] 4efa 0078                 jmp        $00014C44(pc)
case 6:
[00014bce] 598f                      subq.l     #4,a7
[00014bd0] 4eb9 0001 47f6            jsr        DecodeLongConst
[00014bd6] 3f3c 0001                 move.w     #$0001,-(a7)
[00014bda] 4eb9 0001 460c            jsr        Symfile.WriteLong
[00014be0] 5c8f                      addq.l     #6,a7
[00014be2] 3f3c 0001                 move.w     #$0001,-(a7)
[00014be6] 4879 0001 5a94            pea.l      $00015A94 '(*'
[00014bec] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014bf2] 5c8f                      addq.l     #6,a7
[00014bf4] 4eb9 0001 4a80            jsr        DecodeMember
[00014bfa] 3f3c 0001                 move.w     #$0001,-(a7)
[00014bfe] 4879 0001 5a98            pea.l      $00015A98 '*)'
[00014c04] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014c0a] 5c8f                      addq.l     #6,a7
[00014c0c] 4efa 0036                 jmp        $00014C44(pc)
case 8:
[00014c10] 4eb9 0001 4afa            jsr        DecodeReal
[00014c16] 4efa 002c                 jmp        $00014C44(pc)
case 10:
[00014c1a] 4eb9 0001 4b26            jsr        DecodeString
[00014c20] 4efa 0022                 jmp        $00014C44(pc)
case 9:
default:
[00014c24] 4efa 000c                 jmp        $00014C32(pc)
casex6:
[00014c28] 004e
           000c
[00014c2c] 0090
           00a4
           009a
[00014c32] 3f3c 0024                 move.w     #$0024,-(a7)
[00014c36] 4879 0001 5a9c            pea.l      $00015A9C ' illegal symbol in CONST-Declaration '
[00014c3c] 4eb9 0001 44ca            jsr        Symfile.Error
[00014c42] 5c8f                      addq.l     #6,a7
[00014c44] 4e5e                      unlk       a6
[00014c46] 4e75                      rts

DecodeList:
[00014c48] 4e56 fffe                 link       a6,#-2
[00014c4c] 1f3c 0018                 move.b     #$18,-(a7)
[00014c50] 4eb9 0001 4756            jsr        Symfile.NextIf
[00014c56] 548f                      addq.l     #2,a7
[00014c58] 1f3c 0028                 move.b     #$28,-(a7)
[00014c5c] 4eb9 0001 453a            jsr        Symfile.Write
[00014c62] 548f                      addq.l     #2,a7
[00014c64] 3d79 0001 6e64 fffe       move.w     indentLevel,-2(a6)
[00014c6c] 0c39 0014 0001 6e48       cmpi.b     #$14,Symfile.lastByte
[00014c74] 6662                      bne.s      $00014CD8
[00014c76] 4eb9 0001 4822            jsr        DecodeIdent
[00014c7c] 3f3c 0001                 move.w     #$0001,-(a7)
[00014c80] 4879 0001 5ac2            pea.l      $00015AC2 '(*'
[00014c86] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014c8c] 5c8f                      addq.l     #6,a7
[00014c8e] 558f                      subq.l     #2,a7
[00014c90] 4eb9 0001 47ca            jsr        DecodeShortConst
[00014c96] 3f3c 0001                 move.w     #$0001,-(a7)
[00014c9a] 4eb9 0001 45a8            jsr        Symfile.WriteCard
[00014ca0] 588f                      addq.l     #4,a7
[00014ca2] 3f3c 0001                 move.w     #$0001,-(a7)
[00014ca6] 4879 0001 5ac6            pea.l      $00015AC6 '*)'
[00014cac] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014cb2] 5c8f                      addq.l     #6,a7
[00014cb4] 0c39 0014 0001 6e48       cmpi.b     #$14,Symfile.lastByte
[00014cbc] 6618                      bne.s      $00014CD6
[00014cbe] 1f3c 002c                 move.b     #$2C,-(a7)
[00014cc2] 4eb9 0001 453a            jsr        Symfile.Write
[00014cc8] 548f                      addq.l     #2,a7
[00014cca] 3f2e fffe                 move.w     -2(a6),-(a7)
[00014cce] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[00014cd4] 548f                      addq.l     #2,a7
[00014cd6] 6094                      bra.s      $00014C6C
[00014cd8] 1f3c 0019                 move.b     #$19,-(a7)
[00014cdc] 4eb9 0001 4756            jsr        Symfile.NextIf
[00014ce2] 548f                      addq.l     #2,a7
[00014ce4] 1f3c 0029                 move.b     #$29,-(a7)
[00014ce8] 4eb9 0001 453a            jsr        Symfile.Write
[00014cee] 548f                      addq.l     #2,a7
[00014cf0] 4e5e                      unlk       a6
[00014cf2] 4e75                      rts

DecodeRange:
[00014cf4] 4e56 0000                 link       a6,#0
[00014cf8] 1f3c 001a                 move.b     #$1A,-(a7)
[00014cfc] 4eb9 0001 4756            jsr        Symfile.NextIf
[00014d02] 548f                      addq.l     #2,a7
[00014d04] 1f3c 005b                 move.b     #$5B,-(a7)
[00014d08] 4eb9 0001 453a            jsr        Symfile.Write
[00014d0e] 548f                      addq.l     #2,a7
[00014d10] 4eb9 0001 4b6c            jsr        DecodeConst
[00014d16] 1f3c 0017                 move.b     #$17,-(a7)
[00014d1a] 4eb9 0001 4756            jsr        Symfile.NextIf
[00014d20] 548f                      addq.l     #2,a7
[00014d22] 3f3c 0001                 move.w     #$0001,-(a7)
[00014d26] 4879 0001 5aca            pea.l      $00015ACA '..'
[00014d2c] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014d32] 5c8f                      addq.l     #6,a7
[00014d34] 4eb9 0001 4b6c            jsr        DecodeConst
[00014d3a] 1f3c 001b                 move.b     #$1B,-(a7)
[00014d3e] 4eb9 0001 4756            jsr        Symfile.NextIf
[00014d44] 548f                      addq.l     #2,a7
[00014d46] 1f3c 005d                 move.b     #$5D,-(a7)
[00014d4a] 4eb9 0001 453a            jsr        Symfile.Write
[00014d50] 548f                      addq.l     #2,a7
[00014d52] 4e5e                      unlk       a6
[00014d54] 4e75                      rts

DecodeSimpleType:
[00014d56] 4e56 0000                 link       a6,#0
[00014d5a] 7a00                      moveq.l    #0,d5
[00014d5c] 1a39 0001 6e48            move.b     Symfile.lastByte,d5
[00014d62] 2005                      move.l     d5,d0
[00014d64] 4eb9 0001 000a            jsr        CASEX
casex7:
[00014d6a] 0000 0014                 dc.l 20
[00014d6e] 0000 0006                 dc.l 6
[00014d72] 0000 002e                 dc.l casex7_tab-casex7
case 20:
[00014d76] 4eb9 0001 4a80            jsr        DecodeMember
[00014d7c] 4efa 003a                 jmp        $00014DB8(pc)
case 24:
[00014d80] 4eb9 0001 4c48            jsr        DecodeList
[00014d86] 4efa 0030                 jmp        $00014DB8(pc)
case 26:
[00014d8a] 4eb9 0001 4cf4            jsr        DecodeRange
[00014d90] 4efa 0026                 jmp        $00014DB8(pc)
case 21:
case 22:
case 23:
case 25:
default:
[00014d94] 4efa 0010                 jmp        $00014DA6(pc)
casex7_tab:
[00014d98] 000c
           002a
[00014d9c] 002a
           002a
           0016            ori.b      #$2A,22(a2)
[00014da2] 002a
           0020
[00014da6] 3f3c                      move.w     #$001e,-(a7)
[00014da8] 4879 0001 5ace            pea.l      $00015ACE ' illegal symbol in Simple Type '
[00014db0] 4eb9 0001 44ca            jsr        Symfile.Error
[00014db6] 5c8f                      addq.l     #6,a7
[00014db8] 4e5e                      unlk       a6
[00014dba] 4e75                      rts

DecodeArrayType:
[00014dbc] 4e56 0000                 link       a6,#0
[00014dc0] 1f3c 000c                 move.b     #$0C,-(a7)
[00014dc4] 4eb9 0001 4756            jsr        Symfile.NextIf
[00014dca] 548f                      addq.l     #2,a7
[00014dcc] 3f3c 0005                 move.w     #$0005,-(a7)
[00014dd0] 4879 0001 5aee            pea.l      $00015AEE 'ARRAY '
[00014dd6] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014ddc] 5c8f                      addq.l     #6,a7
[00014dde] 4eb9 0001 4d56            jsr        DecodeSimpleType
[00014de4] 1f3c 001d                 move.b     #$1D,-(a7)
[00014de8] 4eb9 0001 4756            jsr        Symfile.NextIf
[00014dee] 548f                      addq.l     #2,a7
[00014df0] 3f3c 0003                 move.w     #$0003,-(a7)
[00014df4] 4879 0001 5af6            pea.l      $00015AF6 ' OF '
[00014dfa] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014e00] 5c8f                      addq.l     #6,a7
[00014e02] 4eb9 0001 5256            jsr        DeocdeType
[00014e08] 4e5e                      unlk       a6
[00014e0a] 4e75                      rts

DecodeSize:
[00014e0c] 4e56 0000                 link       a6,#0
[00014e10] 3f3c 0007                 move.w     #$0007,-(a7)
[00014e14] 4879 0001 5afc            pea.l      $00015AFC '(*size: '
[00014e1a] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014e20] 5c8f                      addq.l     #6,a7
[00014e22] 598f                      subq.l     #4,a7
[00014e24] 4eb9 0001 47f6            jsr        DecodeLongConst
[00014e2a] 3f3c 0001                 move.w     #$0001,-(a7)
[00014e2e] 4eb9 0001 460c            jsr        Symfile.WriteLong
[00014e34] 5c8f                      addq.l     #6,a7
[00014e36] 3f3c 0001                 move.w     #$0001,-(a7)
[00014e3a] 4879 0001 5b06            pea.l      $00015B06 '*)'
[00014e40] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014e46] 5c8f                      addq.l     #6,a7
[00014e48] 4e5e                      unlk       a6
[00014e4a] 4e75                      rts

DecodeOffset:
[00014e4c] 4e56 0000                 link       a6,#0
[00014e50] 3f3c 0009                 move.w     #$0009,-(a7)
[00014e54] 4879 0001 5b0a            pea.l      $00015B0A '(*offset: '
[00014e5a] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014e60] 5c8f                      addq.l     #6,a7
[00014e62] 598f                      subq.l     #4,a7
[00014e64] 4eb9 0001 47f6            jsr        DecodeLongConst
[00014e6a] 3f3c 0001                 move.w     #$0001,-(a7)
[00014e6e] 4eb9 0001 460c            jsr        Symfile.WriteLong
[00014e74] 5c8f                      addq.l     #6,a7
[00014e76] 3f3c 0002                 move.w     #$0002,-(a7)
[00014e7a] 4879 0001 5b16            pea.l      $00015B16 '*) '
[00014e80] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014e86] 5c8f                      addq.l     #6,a7
[00014e88] 4e5e                      unlk       a6
[00014e8a] 4e75                      rts

DecodeRecordIdent:
[00014e8c] 4e56 0000                 link       a6,#0
[00014e90] 3f39 0001 6e64            move.w     indentLevel,-(a7)
[00014e96] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[00014e9c] 548f                      addq.l     #2,a7
[00014e9e] 4eb9 0001 4822            jsr        DecodeIdent
[00014ea4] 4eb9 0001 4e4c            jsr        DecodeOffset
[00014eaa] 1f3c 0016                 move.b     #$16,-(a7)
[00014eae] 4eb9 0001 4756            jsr        Symfile.NextIf
[00014eb4] 548f                      addq.l     #2,a7
[00014eb6] 3f3c 0002                 move.w     #$0002,-(a7)
[00014eba] 4879 0001 5b1a            pea.l      $00015B1A ' : '
[00014ec0] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014ec6] 5c8f                      addq.l     #6,a7
[00014ec8] 4eb9 0001 5256            jsr        DeocdeType
[00014ece] 1f3c 003b                 move.b     #$3B,-(a7)
[00014ed2] 4eb9 0001 453a            jsr        Symfile.Write
[00014ed8] 548f                      addq.l     #2,a7
[00014eda] 4e5e                      unlk       a6
[00014edc] 4e75                      rts

DecodeVariantVal:
[00014ede] 4e56 0000                 link       a6,#0
[00014ee2] 558f                      subq.l     #2,a7
[00014ee4] 4eb9 0001 47ca            jsr        DecodeShortConst
[00014eea] 3f3c 0002                 move.w     #$0002,-(a7)
[00014eee] 4eb9 0001 45a8            jsr        Symfile.WriteCard
[00014ef4] 588f                      addq.l     #4,a7
[00014ef6] 4e5e                      unlk       a6
[00014ef8] 4e75                      rts

DecodeVariant:
[00014efa] 4e56 0000                 link       a6,#0
[00014efe] 3f39 0001 6e64            move.w     indentLevel,-(a7)
[00014f04] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[00014f0a] 548f                      addq.l     #2,a7
[00014f0c] 1f3c 001c                 move.b     #$1C,-(a7)
[00014f10] 4eb9 0001 4756            jsr        Symfile.NextIf
[00014f16] 548f                      addq.l     #2,a7
[00014f18] 3f3c 0003                 move.w     #$0003,-(a7)
[00014f1c] 4879 0001 5b1e            pea.l      $00015B1E 'CASE'
[00014f22] 4eb9 0001 4770            jsr        IndentUp
[00014f28] 5c8f                      addq.l     #6,a7
[00014f2a] 1f3c 0016                 move.b     #$16,-(a7)
[00014f2e] 4eb9 0001 4756            jsr        Symfile.NextIf
[00014f34] 548f                      addq.l     #2,a7
[00014f36] 3f3c 0002                 move.w     #$0002,-(a7)
[00014f3a] 4879 0001 5b24            pea.l      $00015B24 ' : '
[00014f40] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014f46] 5c8f                      addq.l     #6,a7
[00014f48] 4eb9 0001 4a80            jsr        DecodeMember
[00014f4e] 3f3c 0003                 move.w     #$0003,-(a7)
[00014f52] 4879 0001 5b28            pea.l      $00015B28 ' OF '
[00014f58] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014f5e] 5c8f                      addq.l     #6,a7
[00014f60] 3f39 0001 6e64            move.w     indentLevel,-(a7)
[00014f66] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[00014f6c] 548f                      addq.l     #2,a7
[00014f6e] 0c39 001d 0001 6e48       cmpi.b     #$1D,Symfile.lastByte
[00014f76] 6602                      bne.s      $00014F7A
[00014f78] 6004                      bra.s      $00014F7E
[00014f7a] 4efa 009c                 jmp        $00015018(pc)
[00014f7e] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00014f84] 0c39 0007 0001 6e48       cmpi.b     #$07,Symfile.lastByte
[00014f8c] 6624                      bne.s      $00014FB2
[00014f8e] 4eb9 0001 4ede            jsr        DecodeVariantVal
[00014f94] 0c39 0007 0001 6e48       cmpi.b     #$07,Symfile.lastByte
[00014f9c] 6612                      bne.s      $00014FB0
[00014f9e] 3f3c 0001                 move.w     #$0001,-(a7)
[00014fa2] 4879 0001 5b2e            pea.l      $00015B2E ', '
[00014fa8] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014fae] 5c8f                      addq.l     #6,a7
[00014fb0] 60d2                      bra.s      $00014F84
[00014fb2] 1f3c 0016                 move.b     #$16,-(a7)
[00014fb6] 4eb9 0001 4756            jsr        Symfile.NextIf
[00014fbc] 548f                      addq.l     #2,a7
[00014fbe] 3f3c 0002                 move.w     #$0002,-(a7)
[00014fc2] 4879 0001 5b32            pea.l      $00015B32 ' : '
[00014fc8] 4eb9 0001 456a            jsr        Symfile.WriteString
[00014fce] 5c8f                      addq.l     #6,a7
[00014fd0] 0c39 001c 0001 6e48       cmpi.b     #$1C,Symfile.lastByte
[00014fd8] 6606                      bne.s      $00014FE0
[00014fda] 4eb9 0001 4efa            jsr        DecodeVariant
[00014fe0] 4eb9 0001 4e0c            jsr        DecodeSize
[00014fe6] 0c39 001d 0001 6e48       cmpi.b     #$1D,Symfile.lastByte
[00014fee] 6624                      bne.s      $00015014
[00014ff0] 3a39 0001 6e64            move.w     indentLevel,d5
[00014ff6] 5545                      subq.w     #2,d5
[00014ff8] 3f05                      move.w     d5,-(a7)
[00014ffa] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[00015000] 548f                      addq.l     #2,a7
[00015002] 3f3c 0001                 move.w     #$0001,-(a7)
[00015006] 4879 0001 5b36            pea.l      $00015B36 '| '
[0001500c] 4eb9 0001 456a            jsr        Symfile.WriteString
[00015012] 5c8f                      addq.l     #6,a7
[00015014] 6000 ff58                 bra        $00014F6E
[00015018] 0c39 001e 0001 6e48       cmpi.b     #$1E,Symfile.lastByte
[00015020] 6642                      bne.s      $00015064
[00015022] 1f3c 001e                 move.b     #$1E,-(a7)
[00015026] 4eb9 0001 4756            jsr        Symfile.NextIf
[0001502c] 548f                      addq.l     #2,a7
[0001502e] 3f39 0001 6e64            move.w     indentLevel,-(a7)
[00015034] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[0001503a] 548f                      addq.l     #2,a7
[0001503c] 3f3c 0004                 move.w     #$0004,-(a7)
[00015040] 4879 0001 5b3a            pea.l      $00015B3A 'ELSE '
[00015046] 4eb9 0001 456a            jsr        Symfile.WriteString
[0001504c] 5c8f                      addq.l     #6,a7
[0001504e] 0c39 001c 0001 6e48       cmpi.b     #$1C,Symfile.lastByte
[00015056] 660c                      bne.s      $00015064
[00015058] 4eb9 0001 4efa            jsr        DecodeVariant
[0001505e] 4eb9 0001 4e0c            jsr        DecodeSize
[00015064] 1f3c 001f                 move.b     #$1F,-(a7)
[00015068] 4eb9 0001 4756            jsr        Symfile.NextIf
[0001506e] 548f                      addq.l     #2,a7
[00015070] 3f3c 0003                 move.w     #$0003,-(a7)
[00015074] 4879 0001 5b40            pea.l      $00015B40 'END;'
[0001507a] 4eb9 0001 479a            jsr        IndentDown
[00015080] 5c8f                      addq.l     #6,a7
[00015082] 4e5e                      unlk       a6
[00015084] 4e75                      rts

DecodeRecord:
[00015086] 4e56 0000                 link       a6,#0
[0001508a] 1f3c 000d                 move.b     #$0D,-(a7)
[0001508e] 4eb9 0001 4756            jsr        Symfile.NextIf
[00015094] 548f                      addq.l     #2,a7
[00015096] 3f3c 0005                 move.w     #$0005,-(a7)
[0001509a] 4879 0001 5b46            pea.l      $00015B46 'RECORD'
[000150a0] 4eb9 0001 4770            jsr        IndentUp
[000150a6] 5c8f                      addq.l     #6,a7
[000150a8] 0c39 0014 0001 6e48       cmpi.b     #$14,Symfile.lastByte
[000150b0] 6608                      bne.s      $000150BA
[000150b2] 4eb9 0001 4e8c            jsr        DecodeRecordIdent
[000150b8] 60ee                      bra.s      $000150A8
[000150ba] 0c39 001c 0001 6e48       cmpi.b     #$1C,Symfile.lastByte
[000150c2] 6606                      bne.s      $000150CA
[000150c4] 4eb9 0001 4efa            jsr        DecodeVariant
[000150ca] 1f3c 001f                 move.b     #$1F,-(a7)
[000150ce] 4eb9 0001 4756            jsr        Symfile.NextIf
[000150d4] 548f                      addq.l     #2,a7
[000150d6] 3f3c 0003                 move.w     #$0003,-(a7)
[000150da] 4879 0001 5b4e            pea.l      $00015B4E 'END;'
[000150e0] 4eb9 0001 479a            jsr        IndentDown
[000150e6] 5c8f                      addq.l     #6,a7
[000150e8] 4eb9 0001 4e0c            jsr        DecodeSize
[000150ee] 4e5e                      unlk       a6
[000150f0] 4e75                      rts

DecodeSetType:
[000150f2] 4e56 0000                 link       a6,#0
[000150f6] 1f3c 000e                 move.b     #$0E,-(a7)
[000150fa] 4eb9 0001 4756            jsr        Symfile.NextIf
[00015100] 548f                      addq.l     #2,a7
[00015102] 3f3c 0006                 move.w     #$0006,-(a7)
[00015106] 4879 0001 5b54            pea.l      $00015B54 'SET OF '
[0001510c] 4eb9 0001 456a            jsr        Symfile.WriteString
[00015112] 5c8f                      addq.l     #6,a7
[00015114] 4eb9 0001 4d56            jsr        DecodeSimpleType
[0001511a] 4e5e                      unlk       a6
[0001511c] 4e75                      rts

DecodePointerType:
[0001511e] 4e56 0000                 link       a6,#0
[00015122] 1f3c 000f                 move.b     #$0F,-(a7)
[00015126] 4eb9 0001 4756            jsr        Symfile.NextIf
[0001512c] 548f                      addq.l     #2,a7
[0001512e] 3f3c 000a                 move.w     #$000A,-(a7)
[00015132] 4879 0001 5b5c            pea.l      $00015B5C 'POINTER TO '
[00015138] 4eb9 0001 456a            jsr        Symfile.WriteString
[0001513e] 5c8f                      addq.l     #6,a7
[00015140] 4eb9 0001 5256            jsr        DeocdeType
[00015146] 4e5e                      unlk       a6
[00015148] 4e75                      rts

DecodeProcedureType:
[0001514a] 4e56 0000                 link       a6,#0
[0001514e] 1f3c 0012                 move.b     #$12,-(a7)
[00015152] 4eb9 0001 4756            jsr        Symfile.NextIf
[00015158] 548f                      addq.l     #2,a7
[0001515a] 3f3c 0009                 move.w     #$0009,-(a7)
[0001515e] 4879 0001 5b68            pea.l      $00015B68 'PROCEDURE '
[00015164] 4eb9 0001 456a            jsr        Symfile.WriteString
[0001516a] 5c8f                      addq.l     #6,a7
[0001516c] 1f3c 0018                 move.b     #$18,-(a7)
[00015170] 4eb9 0001 4756            jsr        Symfile.NextIf
[00015176] 548f                      addq.l     #2,a7
[00015178] 1f3c 0028                 move.b     #$28,-(a7)
[0001517c] 4eb9 0001 453a            jsr        Symfile.Write
[00015182] 548f                      addq.l     #2,a7
[00015184] 0c39 0011 0001 6e48       cmpi.b     #$11,Symfile.lastByte
[0001518c] 6714                      beq.s      $000151A2
[0001518e] 0c39 000c 0001 6e48       cmpi.b     #$0C,Symfile.lastByte
[00015196] 670a                      beq.s      $000151A2
[00015198] 0c39 0014 0001 6e48       cmpi.b     #$14,Symfile.lastByte
[000151a0] 6602                      bne.s      $000151A4
[000151a2] 6004                      bra.s      $000151A8
[000151a4] 4efa 006c                 jmp        $00015212(pc)
[000151a8] 0c39 0011 0001 6e48       cmpi.b     #$11,Symfile.lastByte
[000151b0] 6618                      bne.s      $000151CA
[000151b2] 3f3c 0003                 move.w     #$0003,-(a7)
[000151b6] 4879 0001 5b74            pea.l      $00015B74 'VAR '
[000151bc] 4eb9 0001 456a            jsr        Symfile.WriteString
[000151c2] 5c8f                      addq.l     #6,a7
[000151c4] 4eb9 0001 4664            jsr        Symfile.ReadByte
[000151ca] 0c39 000c 0001 6e48       cmpi.b     #$0C,Symfile.lastByte
[000151d2] 6618                      bne.s      $000151EC
[000151d4] 3f3c 0005                 move.w     #$0005,-(a7)
[000151d8] 4879 0001 5b7a            pea.l      $00015B7A 'ARRAY '
[000151de] 4eb9 0001 456a            jsr        Symfile.WriteString
[000151e4] 5c8f                      addq.l     #6,a7
[000151e6] 4eb9 0001 4664            jsr        Symfile.ReadByte
[000151ec] 4eb9 0001 4a80            jsr        DecodeMember
[000151f2] 0c39 0019 0001 6e48       cmpi.b     #$19,Symfile.lastByte
[000151fa] 6712                      beq.s      $0001520E
[000151fc] 3f3c 0001                 move.w     #$0001,-(a7)
[00015200] 4879 0001 5b82            pea.l      $00015B82 '; '
[00015206] 4eb9 0001 456a            jsr        Symfile.WriteString
[0001520c] 5c8f                      addq.l     #6,a7
[0001520e] 6000 ff74                 bra        $00015184
[00015212] 1f3c 0019                 move.b     #$19,-(a7)
[00015216] 4eb9 0001 4756            jsr        Symfile.NextIf
[0001521c] 548f                      addq.l     #2,a7
[0001521e] 1f3c 0029                 move.b     #$29,-(a7)
[00015222] 4eb9 0001 453a            jsr        Symfile.Write
[00015228] 548f                      addq.l     #2,a7
[0001522a] 0c39 0016 0001 6e48       cmpi.b     #$16,Symfile.lastByte
[00015232] 661e                      bne.s      $00015252
[00015234] 4eb9 0001 4664            jsr        Symfile.ReadByte
[0001523a] 3f3c 0002                 move.w     #$0002,-(a7)
[0001523e] 4879 0001 5b86            pea.l      $00015B86 ' : '
[00015244] 4eb9 0001 456a            jsr        Symfile.WriteString
[0001524a] 5c8f                      addq.l     #6,a7
[0001524c] 4eb9 0001 4a80            jsr        DecodeMember
[00015252] 4e5e                      unlk       a6
[00015254] 4e75                      rts

DeocdeType:
[00015256] 4e56 0000                 link       a6,#0
[0001525a] 7a00                      moveq.l    #0,d5
[0001525c] 1a39 0001 6e48            move.b     Symfile.lastByte,d5
[00015262] 2005                      move.l     d5,d0
[00015264] 4eb9 0001 000a            jsr        CASEX
casex8:
[0001526a] 0000 000c                 dc.l 12
[0001526e] 0000 000e                 dc.l 14
[00015272] 0000 0068                 dc.l casex8_tab-casex8
case 20:
case 24:
case 26:
[00015276] 4eb9 0001 4d56            jsr        DecodeSimpleType
[0001527c] 4efa 0084                 jmp        $00015302(pc)
case 16:
[00015280] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00015286] 3f3c 0010                 move.w     #$0010,-(a7)
[0001528a] 4879 0001 5b8a            pea.l      $00015B8A ' (*hidden type*) '
[00015290] 4eb9 0001 456a            jsr        Symfile.WriteString
[00015296] 5c8f                      addq.l     #6,a7
[00015298] 4efa 0068                 jmp        $00015302(pc)
case 12:
[0001529c] 4eb9 0001 4dbc            jsr        DecodeArrayType
[000152a2] 4efa 005e                 jmp        $00015302(pc)
case 13:
[000152a6] 4eb9 0001 5086            jsr        DecodeRecordType
[000152ac] 4efa 0054                 jmp        $00015302(pc)
case 14:
[000152b0] 4eb9 0001 50f2            jsr        DecodeSetType
[000152b6] 4efa 004a                 jmp        $00015302(pc)
case 15:
[000152ba] 4eb9 0001 511e            jsr        DecodePointerType
[000152c0] 4efa 0040                 jmp        $00015302(pc)
case 18:
[000152c4] 4eb9 0001 514a            jsr        DecodeProcedureType
[000152ca] 4efa 0036                 jmp        $00015302(pc)
case 17:
case 19:
case 21:
case 22:
case 23:
case 25:
default:
[000152ce] 4efa 0020                 jmp        $000152F0(pc)
casex8_tab:
[000152d2] 0032
           003c
           0046
[000152d8] 0050
           0016
[000152dc] 0064
           005a
[000152e0] 0064
           000c
[000152e4] 0064
           0064
[000152e8] 0064
           000c
[000152ec] 0064
           000c
[000152f0] 3f3c 0023                 move.w     #$0023,-(a7)
[000152f4] 4879 0001 5b9c            pea.l      $00015B9C ' illegal symbol in TYPE-Declaration '
[000152fa] 4eb9 0001 44ca            jsr        Symfile.Error
[00015300] 5c8f                      addq.l     #6,a7
[00015302] 4e5e                      unlk       a6
[00015304] 4e75                      rts

DecodeConstDecl:
[00015306] 4e56 0000                 link       a6,#0
[0001530a] 3f39 0001 6e64            move.w     indentLevel,-(a7)
[00015310] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[00015316] 548f                      addq.l     #2,a7
[00015318] 4eb9 0001 4822            jsr        DecodeIdent
[0001531e] 3f3c 0002                 move.w     #$0002,-(a7)
[00015322] 4879 0001 5bc2            pea.l      $00015BC2 ' = '
[00015328] 4eb9 0001 456a            jsr        Symfile.WriteString
[0001532e] 5c8f                      addq.l     #6,a7
[00015330] 4eb9 0001 4b6c            jsr        DecodeConst
[00015336] 1f3c 003b                 move.b     #$3B,-(a7)
[0001533a] 4eb9 0001 453a            jsr        Symfile.Write
[00015340] 548f                      addq.l     #2,a7
[00015342] 4e5e                      unlk       a6
[00015344] 4e75                      rts

DecodeTypeDecl:
[00015346] 4e56 0000                 link       a6,#0
[0001534a] 3f39 0001 6e64            move.w     indentLevel,-(a7)
[00015350] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[00015356] 548f                      addq.l     #2,a7
[00015358] 4eb9 0001 4822            jsr        DecodeIdent
[0001535e] 3f3c 0002                 move.w     #$0002,-(a7)
[00015362] 4879 0001 5bc6            pea.l      $00015BC6 ' = '
[00015368] 4eb9 0001 456a            jsr        Symfile.WriteString
[0001536e] 5c8f                      addq.l     #6,a7
[00015370] 4eb9 0001 5256            jsr        DeocdeType
[00015376] 1f3c 003b                 move.b     #$3B,-(a7)
[0001537a] 4eb9 0001 453a            jsr        Symfile.Write
[00015380] 548f                      addq.l     #2,a7
[00015382] 4e5e                      unlk       a6
[00015384] 4e75                      rts

DecodeProcnum:
[00015386] 4e56 0000                 link       a6,#0
[0001538a] 3f3c 000a                 move.w     #$000A,-(a7)
[0001538e] 4879 0001 5bca            pea.l      $00015BCA '(* ProcNum:'
[00015394] 4eb9 0001 456a            jsr        Symfile.WriteString
[0001539a] 5c8f                      addq.l     #6,a7
[0001539c] 558f                      subq.l     #2,a7
[0001539e] 4eb9 0001 47ca            jsr        DecodeShortConst
[000153a4] 3f3c 0001                 move.w     #$0001,-(a7)
[000153a8] 4eb9 0001 45a8            jsr        Symfile.WriteCard
[000153ae] 588f                      addq.l     #4,a7
[000153b0] 3f3c 0002                 move.w     #$0002,-(a7)
[000153b4] 4879 0001 5bd6            pea.l      $00015BD6 ' *)'
[000153ba] 4eb9 0001 456a            jsr        Symfile.WriteString
[000153c0] 5c8f                      addq.l     #6,a7
[000153c2] 4e5e                      unlk       a6
[000153c4] 4e75                      rts

DecodeProcParams:
[000153c6] 4e56 0000                 link       a6,#0
[000153ca] 1f3c 0012                 move.b     #$12,-(a7)
[000153ce] 4eb9 0001 4756            jsr        Symfile.NextIf
[000153d4] 548f                      addq.l     #2,a7
[000153d6] 1f3c 0018                 move.b     #$18,-(a7)
[000153da] 4eb9 0001 4756            jsr        Symfile.NextIf
[000153e0] 548f                      addq.l     #2,a7
[000153e2] 1f3c 0028                 move.b     #$28,-(a7)
[000153e6] 4eb9 0001 453a            jsr        Symfile.Write
[000153ec] 548f                      addq.l     #2,a7
[000153ee] 0c39 0011 0001 6e48       cmpi.b     #$11,Symfile.lastByte
[000153f6] 6714                      beq.s      $0001540C
[000153f8] 0c39 000c 0001 6e48       cmpi.b     #$0C,Symfile.lastByte
[00015400] 670a                      beq.s      $0001540C
[00015402] 0c39 0014 0001 6e48       cmpi.b     #$14,Symfile.lastByte
[0001540a] 6602                      bne.s      $0001540E
[0001540c] 6004                      bra.s      $00015412
[0001540e] 4efa 006c                 jmp        $0001547C(pc)
[00015412] 0c39 0011 0001 6e48       cmpi.b     #$11,Symfile.lastByte
[0001541a] 6618                      bne.s      $00015434
[0001541c] 3f3c 0003                 move.w     #$0003,-(a7)
[00015420] 4879 0001 5bda            pea.l      $00015BDA 'VAR '
[00015426] 4eb9 0001 456a            jsr        Symfile.WriteString
[0001542c] 5c8f                      addq.l     #6,a7
[0001542e] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00015434] 0c39 000c 0001 6e48       cmpi.b     #$0C,Symfile.lastByte
[0001543c] 6618                      bne.s      $00015456
[0001543e] 3f3c 0005                 move.w     #$0005,-(a7)
[00015442] 4879 0001 5be0            pea.l      $00015BE0 'ARRAY '
[00015448] 4eb9 0001 456a            jsr        Symfile.WriteString
[0001544e] 5c8f                      addq.l     #6,a7
[00015450] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00015456] 4eb9 0001 4a80            jsr        DecodeMember
[0001545c] 0c39 0019 0001 6e48       cmpi.b     #$19,Symfile.lastByte
[00015464] 6712                      beq.s      $00015478
[00015466] 3f3c 0001                 move.w     #$0001,-(a7)
[0001546a] 4879 0001 5be8            pea.l      $00015BE8 '; '
[00015470] 4eb9 0001 456a            jsr        Symfile.WriteString
[00015476] 5c8f                      addq.l     #6,a7
[00015478] 6000 ff74                 bra        $000153EE
[0001547c] 1f3c 0019                 move.b     #$19,-(a7)
[00015480] 4eb9 0001 4756            jsr        Symfile.NextIf
[00015486] 548f                      addq.l     #2,a7
[00015488] 1f3c 0029                 move.b     #$29,-(a7)
[0001548c] 4eb9 0001 453a            jsr        Symfile.Write
[00015492] 548f                      addq.l     #2,a7
[00015494] 0c39 0016 0001 6e48       cmpi.b     #$16,Symfile.lastByte
[0001549c] 661e                      bne.s      $000154BC
[0001549e] 4eb9 0001 4664            jsr        Symfile.ReadByte
[000154a4] 3f3c 0002                 move.w     #$0002,-(a7)
[000154a8] 4879 0001 5bec            pea.l      $00015BEC ' : '
[000154ae] 4eb9 0001 456a            jsr        Symfile.WriteString
[000154b4] 5c8f                      addq.l     #6,a7
[000154b6] 4eb9 0001 4a80            jsr        DecodeMember
[000154bc] 4e5e                      unlk       a6
[000154be] 4e75                      rts

DecodeProcDecl:
[000154c0] 4e56 0000                 link       a6,#0
[000154c4] 4eb9 0001 4822            jsr        DecodeIdent
[000154ca] 4eb9 0001 5386            jsr        DecodeProcnum
[000154d0] 4eb9 0001 53c6            jsr        DecodeProcParams
[000154d6] 1f3c 003b                 move.b     #$3B,-(a7)
[000154da] 4eb9 0001 453a            jsr        Symfile.Write
[000154e0] 548f                      addq.l     #2,a7
[000154e2] 4e5e                      unlk       a6
[000154e4] 4e75                      rts

DecodeVarAddr:
[000154e6] 4e56 0000                 link       a6,#0
[000154ea] 3f3c 0003                 move.w     #$0003,-(a7)
[000154ee] 4879 0001 5bf0            pea.l      $00015BF0 ' (* '
[000154f4] 4eb9 0001 456a            jsr        Symfile.WriteString
[000154fa] 5c8f                      addq.l     #6,a7
[000154fc] 0c39 001a 0001 6e48       cmpi.b     #$1A,Symfile.lastByte
[00015504] 6642                      bne.s      $00015548
[00015506] 3f3c 0008                 move.w     #$0008,-(a7)
[0001550a] 4879 0001 5bf6            pea.l      $00015BF6 'absaddr: '
[00015510] 4eb9 0001 456a            jsr        Symfile.WriteString
[00015516] 5c8f                      addq.l     #6,a7
[00015518] 1f3c 001a                 move.b     #$1A,-(a7)
[0001551c] 4eb9 0001 4756            jsr        Symfile.NextIf
[00015522] 548f                      addq.l     #2,a7
[00015524] 598f                      subq.l     #4,a7
[00015526] 4eb9 0001 47f6            jsr        DecodeLongConst
[0001552c] 3f3c 0001                 move.w     #$0001,-(a7)
[00015530] 4eb9 0001 460c            jsr        Symfile.WriteLong
[00015536] 5c8f                      addq.l     #6,a7
[00015538] 1f3c 001b                 move.b     #$1B,-(a7)
[0001553c] 4eb9 0001 4756            jsr        Symfile.NextIf
[00015542] 548f                      addq.l     #2,a7
[00015544] 4efa 0028                 jmp        $0001556E(pc)
[00015548] 3f3c 0008                 move.w     #$0008,-(a7)
[0001554c] 4879 0001 5c00            pea.l      $00015C00 'reladdr: '
[00015552] 4eb9 0001 456a            jsr        Symfile.WriteString
[00015558] 5c8f                      addq.l     #6,a7
[0001555a] 598f                      subq.l     #4,a7
[0001555c] 4eb9 0001 47f6            jsr        DecodeLongConst
[00015562] 3f3c 0001                 move.w     #$0001,-(a7)
[00015566] 4eb9 0001 460c            jsr        Symfile.WriteLong
[0001556c] 5c8f                      addq.l     #6,a7
[0001556e] 3f3c 0002                 move.w     #$0002,-(a7)
[00015572] 4879 0001 5c0a            pea.l      $00015C0A '*) '
[00015578] 4eb9 0001 456a            jsr        Symfile.WriteString
[0001557e] 5c8f                      addq.l     #6,a7
[00015580] 4e5e                      unlk       a6
[00015582] 4e75                      rts

DecodeVarDecl:
[00015584] 4e56 0000                 link       a6,#0
[00015588] 3f39 0001 6e64            move.w     indentLevel,-(a7)
[0001558e] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[00015594] 548f                      addq.l     #2,a7
[00015596] 4eb9 0001 4822            jsr        DecodeIdent
[0001559c] 4eb9 0001 54e6            jsr        DecodeVarAddr
[000155a2] 1f3c 0016                 move.b     #$16,-(a7)
[000155a6] 4eb9 0001 4756            jsr        Symfile.NextIf
[000155ac] 548f                      addq.l     #2,a7
[000155ae] 3f3c 0002                 move.w     #$0002,-(a7)
[000155b2] 4879 0001 5c0e            pea.l      $00015C0E ' : '
[000155b8] 4eb9 0001 456a            jsr        Symfile.WriteString
[000155be] 5c8f                      addq.l     #6,a7
[000155c0] 4eb9 0001 5256            jsr        DeocdeType
[000155c6] 1f3c 003b                 move.b     #$3B,-(a7)
[000155ca] 4eb9 0001 453a            jsr        Symfile.Write
[000155d0] 548f                      addq.l     #2,a7
[000155d2] 4e5e                      unlk       a6
[000155d4] 4e75                      rts

DecodeDecl:
[000155d6] 4e56 0000                 link       a6,#0
[000155da] 33fc 0004 0001 6e64       move.w     #$0004,indentLevel
[000155e2] 3f39 0001 6e64            move.w     indentLevel,-(a7)
[000155e8] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[000155ee] 548f                      addq.l     #2,a7
[000155f0] 7a00                      moveq.l    #0,d5
[000155f2] 1a39 0001 6e48            move.b     Symfile.lastByte,d5
[000155f8] 2005                      move.l     d5,d0
[000155fa] 4eb9 0001 000a            jsr        CASEX
casex9:
[00015600] 0000 0005                 dc.l 5
[00015604] 0000 000d                 dc.l 13
[00015608] 0000 00bc                 dc.l casex9_tab-casex9
case 5:
[0001560c] 3f3c 0004                 move.w     #$0004,-(a7)
[00015610] 4879 0001 5c12            pea.l      $00015C12 'CONST'
[00015616] 4eb9 0001 4770            jsr        IndentUp
[0001561c] 5c8f                      addq.l     #6,a7
[0001561e] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00015624] 0c39 0014 0001 6e48       cmpi.b     #$14,Symfile.lastByte
[0001562c] 6608                      bne.s      $00015636
[0001562e] 4eb9 0001 5306            jsr        DecodeConstDecl
[00015634] 60ee                      bra.s      $00015624
[00015636] 4efa 00b2                 jmp        $000156EA(pc)
case 11:
[0001563a] 3f3c 0003                 move.w     #$0003,-(a7)
[0001563e] 4879 0001 5c18            pea.l      $00015C18 'TYPE'
[00015644] 4eb9 0001 4770            jsr        IndentUp
[0001564a] 5c8f                      addq.l     #6,a7
[0001564c] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00015652] 0c39 0014 0001 6e48       cmpi.b     #$14,Symfile.lastByte
[0001565a] 6608                      bne.s      $00015664
[0001565c] 4eb9 0001 5346            jsr        DecodeTypeDecl
[00015662] 60ee                      bra.s      $00015652
[00015664] 4efa 0084                 jmp        $000156EA(pc)
case 18:
[00015668] 3f3c 0009                 move.w     #$0009,-(a7)
[0001566c] 4879 0001 5c1e            pea.l      $00015C1E 'PROCEDURE '
[00015672] 4eb9 0001 4770            jsr        IndentUp
[00015678] 5c8f                      addq.l     #6,a7
[0001567a] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00015680] 4eb9 0001 54c0            jsr        DecodeProcDecl
[00015686] 4efa 0062                 jmp        $000156EA(pc)
case 17:
[0001568a] 3f3c 0002                 move.w     #$0002,-(a7)
[0001568e] 4879 0001 5c2a            pea.l      $00015C2A 'VAR'
[00015694] 4eb9 0001 4770            jsr        IndentUp
[0001569a] 5c8f                      addq.l     #6,a7
[0001569c] 4eb9 0001 4664            jsr        Symfile.ReadByte
[000156a2] 0c39 0014 0001 6e48       cmpi.b     #$14,Symfile.lastByte
[000156aa] 6608                      bne.s      $000156B4
[000156ac] 4eb9 0001 5584            jsr        DecodeVarDecl
[000156b2] 60ee                      bra.s      $000156A2
[000156b4] 4efa 0034                 jmp        $000156EA(pc)
case 6:
case 7:
case 8:
case 9:
case 10:
case 12:
case 13:
case 14:
case 15:
case 16:
default:
[000156b8] 4efa 001e                 jmp        $000156D8(pc)
casex9_tab:
[000156bc] 000c
           00b8
[000156c0] 00b8
           00b8
           00b8
           00b8
[000156c8] 003a
           00b8
           00b8
[000156ce] 00b8
           00b8
           00b8
           008a
[000156d6] 0068
[000156d8] 3f3c 0016                 move.w     #$0016,-(a7)
[000156dc] 4879 0001 5c2e            pea.l      $00015C2E ' illegal SymFileSymbol '
[000156e2] 4eb9 0001 44ca            jsr        Symfile.Error
[000156e8] 5c8f                      addq.l     #6,a7
[000156ea] 4267                      clr.w      -(a7)
[000156ec] 4879 0001 5c46            pea.l      $00015C46 ''
[000156f2] 4eb9 0001 479a            jsr        IndentDown
[000156f8] 5c8f                      addq.l     #6,a7
[000156fa] 4e5e                      unlk       a6
[000156fc] 4e75                      rts

DecodeUnit:
[000156fe] 4e56 ffae                 link       a6,#-82
[00015702] 1f3c 0001                 move.b     #$01,-(a7)
[00015706] 4eb9 0001 4756            jsr        Symfile.NextIf
[0001570c] 548f                      addq.l     #2,a7
[0001570e] 33fc 0002 0001 6e64       move.w     #$0002,indentLevel
[00015716] 4eb9 0001 4886            jsr        DecodeModuleKey
[0001571c] 3f3c 0050                 move.w     #$0050,-(a7)
[00015720] 486e ffae                 pea.l      -82(a6)
[00015724] 4eb9 0001 4a0c            jsr        DecodeSubModuleIdent
[0001572a] 5c8f                      addq.l     #6,a7
[0001572c] 0c39 0003 0001 6e48       cmpi.b     #$03,Symfile.lastByte
[00015734] 6668                      bne.s      $0001579E
[00015736] 4eb9 0001 4664            jsr        Symfile.ReadByte
[0001573c] 3f3c 0004                 move.w     #$0004,-(a7)
[00015740] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[00015746] 548f                      addq.l     #2,a7
[00015748] 3f3c 0006                 move.w     #$0006,-(a7)
[0001574c] 4879 0001 5c48            pea.l      $00015C48 'IMPORT '
[00015752] 4eb9 0001 456a            jsr        Symfile.WriteString
[00015758] 5c8f                      addq.l     #6,a7
[0001575a] 0c39 0014 0001 6e48       cmpi.b     #$14,Symfile.lastByte
[00015762] 663a                      bne.s      $0001579E
[00015764] 4eb9 0001 4822            jsr        DecodeIdent
[0001576a] 0c39 0014 0001 6e48       cmpi.b     #$14,Symfile.lastByte
[00015772] 6616                      bne.s      $0001578A
[00015774] 3f3c 0001                 move.w     #$0001,-(a7)
[00015778] 4879 0001 5c50            pea.l      $00015C50 ', '
[0001577e] 4eb9 0001 456a            jsr        Symfile.WriteString
[00015784] 5c8f                      addq.l     #6,a7
[00015786] 4efa 0014                 jmp        $0001579C(pc)
[0001578a] 1f3c 003b                 move.b     #$3B,-(a7)
[0001578e] 4eb9 0001 453a            jsr        Symfile.Write
[00015794] 548f                      addq.l     #2,a7
[00015796] 4eb9 0001 451a            jsr        Symfile.WriteLn
[0001579c] 60bc                      bra.s      $0001575A
[0001579e] 0c39 0004 0001 6e48       cmpi.b     #$04,Symfile.lastByte
[000157a6] 6602                      bne.s      $000157AA
[000157a8] 6004                      bra.s      $000157AE
[000157aa] 4efa 0088                 jmp        $00015834(pc)
[000157ae] 4eb9 0001 4664            jsr        Symfile.ReadByte
[000157b4] 4a39 0001 6e3f            tst.b      printExports
[000157ba] 6766                      beq.s      $00015822
[000157bc] 3f3c 0004                 move.w     #$0004,-(a7)
[000157c0] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[000157c6] 548f                      addq.l     #2,a7
[000157c8] 3f3c 0010                 move.w     #$0010,-(a7)
[000157cc] 4879 0001 5c54            pea.l      $00015C54 'EXPORT QUALIFIED '
[000157d2] 4eb9 0001 456a            jsr        Symfile.WriteString
[000157d8] 5c8f                      addq.l     #6,a7
[000157da] 0c39 0014 0001 6e48       cmpi.b     #$14,Symfile.lastByte
[000157e2] 663a                      bne.s      $0001581E
[000157e4] 4eb9 0001 4822            jsr        DecodeIdent
[000157ea] 0c39 0014 0001 6e48       cmpi.b     #$14,Symfile.lastByte
[000157f2] 6616                      bne.s      $0001580A
[000157f4] 3f3c 0001                 move.w     #$0001,-(a7)
[000157f8] 4879 0001 5c66            pea.l      $00015C66 ', '
[000157fe] 4eb9 0001 456a            jsr        Symfile.WriteString
[00015804] 5c8f                      addq.l     #6,a7
[00015806] 4efa 0014                 jmp        $0001581C(pc)
[0001580a] 1f3c 003b                 move.b     #$3B,-(a7)
[0001580e] 4eb9 0001 453a            jsr        Symfile.Write
[00015814] 548f                      addq.l     #2,a7
[00015816] 4eb9 0001 451a            jsr        Symfile.WriteLn
[0001581c] 60bc                      bra.s      $000157DA
[0001581e] 4efa 0014                 jmp        $00015834(pc)
[00015822] 0c39 0014 0001 6e48       cmpi.b     #$14,Symfile.lastByte
[0001582a] 6608                      bne.s      $00015834
[0001582c] 4eb9 0001 485c            jsr        SkipIdent
[00015832] 60ee                      bra.s      $00015822
[00015834] 0c39 0005 0001 6e48       cmpi.b     #$05,Symfile.lastByte
[0001583c] 671e                      beq.s      $0001585C
[0001583e] 0c39 000b 0001 6e48       cmpi.b     #$0B,Symfile.lastByte
[00015846] 6714                      beq.s      $0001585C
[00015848] 0c39 0012 0001 6e48       cmpi.b     #$12,Symfile.lastByte
[00015850] 670a                      beq.s      $0001585C
[00015852] 0c39 0011 0001 6e48       cmpi.b     #$11,Symfile.lastByte
[0001585a] 6608                      bne.s      $00015864
[0001585c] 4eb9 0001 55d6            jsr        DecodeDecl
[00015862] 60d0                      bra.s      $00015834
[00015864] 1f3c 0002                 move.b     #$02,-(a7)
[00015868] 4eb9 0001 4756            jsr        Symfile.NextIf
[0001586e] 548f                      addq.l     #2,a7
[00015870] 3f3c 0002                 move.w     #$0002,-(a7)
[00015874] 4eb9 0001 463e            jsr        Symfile.WriteSpaces
[0001587a] 548f                      addq.l     #2,a7
[0001587c] 3f3c 0003                 move.w     #$0003,-(a7)
[00015880] 4879 0001 5c6a            pea.l      $00015C6A 'END '
[00015886] 4eb9 0001 456a            jsr        Symfile.WriteString
[0001588c] 5c8f                      addq.l     #6,a7
[0001588e] 3f3c 0050                 move.w     #$0050,-(a7)
[00015892] 486e ffae                 pea.l      -82(a6)
[00015896] 4eb9 0001 456a            jsr        Symfile.WriteString
[0001589c] 5c8f                      addq.l     #6,a7
[0001589e] 1f3c 003b                 move.b     #$3B,-(a7)
[000158a2] 4eb9 0001 453a            jsr        Symfile.Write
[000158a8] 548f                      addq.l     #2,a7
[000158aa] 4e5e                      unlk       a6
[000158ac] 4e75                      rts

Decode:
[000158ae] 4e56 0000                 link       a6,#0
[000158b2] 4eb9 0001 49f2            jsr        DecodeModuleHeader
[000158b8] 0c39 0001 0001 6e48       cmpi.b     #$01,Symfile.lastByte
[000158c0] 6608                      bne.s      $000158CA
[000158c2] 4eb9 0001 56fe            jsr        DecodeUnit
[000158c8] 60ee                      bra.s      $000158B8
[000158ca] 4227                      clr.b      -(a7)
[000158cc] 4eb9 0001 4720            jsr        Symfile.Expect
[000158d2] 548f                      addq.l     #2,a7
[000158d4] 4eb9 0001 451a            jsr        Symfile.WriteLn
[000158da] 4eb9 0001 451a            jsr        Symfile.WriteLn
[000158e0] 3f3c 0003                 move.w     #$0003,-(a7)
[000158e4] 4879 0001 5c70            pea.l      $00015C70 'END '
[000158ea] 4eb9 0001 456a            jsr        Symfile.WriteString
[000158f0] 5c8f                      addq.l     #6,a7
[000158f2] 3f3c 0017                 move.w     #$0017,-(a7)
[000158f6] 4879 0001 6e4c            pea.l      ident
[000158fc] 4eb9 0001 456a            jsr        Symfile.WriteString
[00015902] 5c8f                      addq.l     #6,a7
[00015904] 1f3c 002e                 move.b     #$2E,-(a7)
[00015908] 4eb9 0001 453a            jsr        Symfile.Write
[0001590e] 548f                      addq.l     #2,a7
[00015910] 4eb9 0001 451a            jsr        Symfile.WriteLn
[00015916] 4eb9 0001 451a            jsr        Symfile.WriteLn
[0001591c] 4e5e                      unlk       a6
[0001591e] 4e75                      rts

***
* MODULE DecSym
***

DecSym.init:
[00015920] 4ef9 0001 41c6            jmp        Filepool.init

[00015926] 4e56 0000                 link       a6,#0
[0001592a] 3f3c 0023                 move.w     #$0023,-(a7)
[0001592e] 4879 0001 5c76            pea.l      $00015C76 'Symbol file decoder   Version  3.00a'
[00015934] 4eb9 0001 130e            jsr        AppWindow.WriteString
[0001593a] 5c8f                      addq.l     #6,a7
[0001593c] 4eb9 0001 13d8            jsr        AppWindow.WriteLn
[00015942] 4eb9 0001 13d8            jsr        AppWindow.WriteLn
[00015948] 4239 0001 6e3e            clr.b      Symfile.outputFailed
[0001594e] 4eb9 0001 43f0            jsr        decsym.OpenFiles
[00015954] 4a39 0001 6e3e            tst.b      Symfile.outputFailed
[0001595a] 6618                      bne.s      $00015974
[0001595c] 4279 0001 6e64            clr.w      indentLevel
[00015962] 4eb9 0001 4664            jsr        Symfile.ReadByte
[00015968] 4eb9 0001 58ae            jsr        Decode
[0001596e] 4eb9 0001 449e            jsr        CloseFiles
[00015974] 4eb9 0001 13d8            jsr        AppWindow.WriteLn
[0001597a] 3f3c 000c                 move.w     #$000C,-(a7)
[0001597e] 4879 0001 5c9c            pea.l      $00015C9C 'End of decode'
[00015984] 4eb9 0001 130e            jsr        AppWindow.WriteString
[0001598a] 5c8f                      addq.l     #6,a7
[0001598c] 4eb9 0001 13d8            jsr        AppWindow.WriteLn
[00015992] 4267                      clr.w      -(a7)
[00015994] 4227                      clr.b      -(a7)
[00015996] 4eb9 0001 245e            jsr        ExecUtil.IOError
[0001599c] 588f                      addq.l     #4,a7
[0001599e] 4e5e                      unlk       a6
[000159a0] 4e75                      rts

[000159a2] 0000                      dc.w       $0000
[000159a4] 0000
[000159a6] .asciiz "Symbol file"
[000159b2] .asciiz ''
[000159b4] .asciiz "List"
[000159ba] .asciiz "Decode file"
[000159c6] .asciiz " Error in SymbolFile"
[000159dc] .asciiz "incorrect symbol on symbol file"
[000159fc] 0000                      .asciiz ''
[000159fe] 282a 6d6f                 .asciiz '(*module key = '
[00015a0e] 2a29 0000                 .asciiz '*)'
[00015a12] 282a 7379                 .asciiz '(*syntax version = '
[00015a26] 2a29 0000                 .asciiz '*)'
[00015a2a] 6572                      .asciiz 'error: SymFileSyntaxVersion must be '
[00015a4e] 0000                      .asciiz ''
[00015a50] 0000                      .asciiz ''
[00015a52] 4445                      .asciiz 'DEFINITION MODULE '
[00015a66] 4d4f                      .asciiz 'MODULE '
[00015a6e] 282a 5265                 .asciiz '(*Real-not yet implemented*)'
[00015a8c] 282a 0000                 .asciiz '(*'
[00015a90] 2a29 0000                 .asciiz '*)'
[00015a94] 282a 0000                 .asciiz '(*'
[00015a98] 2a29 0000                 .asciiz '*)'
[00015a9c] 2069 6c6c                 .asciiz ' illegal symbol in CONST-Declaration '
[00015ac2] 282a 0000                 .asciiz '(*'
[00015ac6] 2a29 0000                 .asciiz '*)'
[00015aca] 2e2e 0000                 .asciiz '..'
[00015ace] 2069 6c6c                 .asciiz ' illegal symbol in Simple Type '
[00015aee] 4152                      .asciiz 'ARRAY '
[00015af6] 204f                      .asciiz ' OF '
[00015afc] 282a                      .asciiz '(*size: '
[00015b06] 2a29                      .asciiz '*)'
[00015b0a] 282a                      .asciiz '(*offset: '
[00015b16] 2a29                      .asciiz '*) '
[00015b1a] 203a 2000                 .asciiz ' : '
[00015b1e] 4341                      .asciiz 'CASE'
[00015b24] 203a                      .asciiz ' : '
[00015b28] 204f                      .asciiz ' OF '
[00015b2e] 2c20                      .asciiz ', '
[00015b32] 203a                      .asciiz ' : '
[00015b36] 7c20                      .asciiz '| '
[00015b3a] 454c                      .asciiz 'ELSE '
[00015b40] 454e                      .asciiz 'END;'
[00015b46] 5245                      .asciiz 'RECORD'
[00015b4e] 454e                      .asciiz 'END;'
[00015b54] 5345                      .asciiz 'SET OF '
[00015b5c] 504f                      .asciiz 'POINTER TO '
[00015b68] 5052                      .asciiz 'PROCEDURE '
[00015b74] 5641                      .asciiz 'VAR '
[00015b7a] 4152                      .asciiz 'ARRAY '
[00015b82] 3b20                      .asciiz '; '
[00015b86] 203a                      .asciiz ' : '
[00015b8a] 2028 2a68                 .asciiz ' (*hidden type*) '
[00015b9c] 2069 6c6c                 .asciiz ' illegal symbol in TYPE-Declaration '
[00015bc2] 203d                      .asciiz ' = '
[00015bc6] 203d                      .asciiz ' = '
[00015bca] 282a 2050                 .asciiz '(* ProcNum:'
[00015bd6] 202a 2900                 .asciiz ' *)'
[00015bda] 5641                      .asciiz 'VAR '
[00015be0] 4152                      .asciiz 'ARRAY '
[00015be8] 3b20                      .asciiz '; '
[00015bec] 203a                      .asciiz ' : '
[00015bf0] 2028 2a20                 .asciiz ' (* '
[00015bf6] 6162                      .asciiz 'absaddr: '
[00015c00] 7265                      .asciiz 'reladdr: '
[00015c0a] 2a29 2000                 .asciiz '*) '
[00015c0e] 203a 2000                 .asciiz ' : '
[00015c12] 434f                      .asciiz 'CONST'
[00015c18] 5459                      .asciiz 'TYPE'
[00015c1e] 5052                      .asciiz 'PROCEDURE '
[00015c2a] 5641                      .asciiz 'VAR'
[00015c2e] 2069 6c6c                 .asciiz ' illegal SymFileSymbol '
[00015c46] 0000                      .asciiz ''
[00015c48] 494d                      .asciiz 'IMPORT '
[00015c50] 2c20                      .asciiz ', '
[00015c54] 4558                      .asciiz 'EXPORT QUALIFIED '
[00015c66] 2c20                      .asciiz ', '
[00015c6a] 454e                      .asciiz 'END '
[00015c70] 454e                      .asciiz 'END '
[00015c76] 5379                      .asciiz 'Symbol file decoder   Version  3.00a'
[00015c9c] 456e                      .asciiz 'End of decode'

15caa: BasePageAddress
15cae: ErrorProcessor
15ce6: textbase
15cea: PgmSize
15cee: ExceptionVecs1 ds.l 12
15d1e: ExceptionVecs2 ds.l
1624a: AppBase.apId
1624c: AppBase.wdwHandle
1624e: AppBase.vdiHandle
16250: AppBase.doUpdateWindow
16254: AppBase.openFiles
16258: AppBase.openStreams
1625c: AppBase.shellTail
162ac: AppBase.xfer
162ae: AppWindow.wchar
162b0: AppWindow.hchar
162b2: AppWindow.wbox
162b4: AppWindow.hbox
162b6: AppWindow.workx
162b8: AppWindow.worky
162ba: AppWindow.workw
162bc: AppWindow.workh
162be: AppWindow.cursorX
162c0: AppWindow.cursorY
162c2: AppWindow.winrows
162c4: AppWindow.screenBuffer
16774: AppWindow.lineLength
167a4: AppWindow.windowtitle
167cc: Strings.terminator
167ce: Buffers.bufptr
167d2: Buffers.count
167d4: Buffers.buffers
167fc: Executil.
16800: Executil.
16804: Executil.
16806: Executil.terminated
16808: M2Option.accId
1680a: M2Option.msgbuf
1682a: M2Option.replybuf
1684a-16954: M2Option.options
16956-16ab4: NewStreams.searchpaths
16ab4: NewStreams.needfile
16ab6-16ade: NewStreams.mainfilename
16ade-16b06: NewStreams.outfilename
16b06: NewStreams.currInfoType
16b07: NewStreams.dump
16b08: NewStreams.queryfiles
16b09: NewStreams.reffiles
16b0a: NewStreams.listing
16b0b: NewStreams.linkmap
16b0c: NewStreams.linkopt
16b0d: NewStreams.debugtable
16b0e: NewStreams.stacksize
16b12: NewStreams.heapsize
16b14: NewStreams.DtaPtr
16b18: FilePool.fileid
16b1a: FilePool.names
16e3a: StrUtil.conv
16e3e: Symfile.outputFailed
16e3f: Symfile.printExports
16e40: Symfile.symFile
16e44: Symfile.decFile
16e48: Symfile.lastByte
16e4a: outputX
16e4c: ident
16e64: indentLevel
