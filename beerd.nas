[FORMAT "BIN"]
[INSTRSET "i386"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 16]

	ORG	0x0100 ; .COMは必ずORG 0x0100で始まる

service:
	MOV	AX,0x0003
	INT	0x10
	MOV	AH,0x01
	MOV	CH,0x20
	INT	0x10

	MOV		CX,17
	MOV		DX,0x0001
	MOV		BP,serv1
	CALL	putstring
	MOV		byte [settime],18
	CALL	wait
	MOV		CX,7
	MOV		DX,0x0016
	MOV		BP,serv2
	mov		BX,0x000a
	MOV		AX,0x1300
	INT		0x10
	MOV		byte [settime],4
	CALL	wait
	MOV		byte [settime],36

initbeer:
	MOV	AX,0x0003
	INT	0x10
	MOV	AH,0x01
	MOV	CH,0x20
	INT	0x10

	MOV		CX,63
	MOV		DX,0x0000
	MOV		BP,boot
	CALL	putstring
	CALL	wait

	MOV		DH,6
	MOV     BP,srv1
	CALL    putsrv
	MOV		DH,7
	MOV     BP,srv2
	CALL    putsrv
	MOV		DH,8
	MOV     BP,srv3
	CALL    putsrv
	MOV		DH,9
	MOV     BP,srv4
	CALL    putsrv

	MOV byte [height],10
lop1:
	MOV		DH,[height]
	MOV     BP,srv5
	CALL    putsrv
	INC	byte [height]
	CMP	byte [height],15
	JBE	lop1

	MOV		DH,16
	MOV     BP,srv6
	CALL    putsrv
	MOV		DH,17
	MOV     BP,srv7
	CALL    putsrv
	MOV		DH,18
	MOV     BP,srv8
	CALL    putsrv

	MOV		CX,3
	MOV		DL,33
	MOV		DH,10
	MOV     BP,rebar1
	CALL    putstring
	MOV		CX,3
	MOV		DL,33
	MOV		DH,11
	MOV     BP,rebar2
	CALL    putstring
	MOV		CX,3
	MOV		DL,33
	MOV		DH,12
	MOV     BP,rebar3
	CALL    putstring
	MOV		CX,3
	MOV		DL,33
	MOV		DH,13
	MOV     BP,rebar4
	CALL    putstring

	CALL	wait

putglass:
	MOV		CX,5
	MOV		DL,32
	MOV		DH,14
	MOV     BP,glass1
	CALL    putstring

	MOV		CX,5
	MOV		DL,32
	MOV		DH,15
	MOV     BP,glass2
	CALL    putstring

	MOV		CX,5
	MOV		DL,32
	MOV		DH,16
	MOV     BP,glass3
	CALL    putstring

	MOV		CX,5
	MOV		DL,32
	MOV		DH,17
	MOV     BP,glass1
	CALL    putstring

	MOV		CH,0
	CALL	wait

setrebar:
	MOV		CX,3
	MOV		DL,32
	MOV		DH,10
	MOV     BP,rebar1
	CALL    putstring
	MOV		CX,3
	MOV		DL,32
	MOV		DH,11
	MOV     BP,rebar2
	CALL    putstring

putawa1:
	MOV		CX,3
	MOV		DL,33
	MOV		DH,16
	MOV     BP,awa2
	CALL    putstring
	CALL	wait

putawa2:
	MOV		CX,3
	MOV		DL,33
	MOV		DH,16
	MOV     BP,awa1
	CALL    putstring
	CALL	wait

freerebar:
	MOV		CX,3
	MOV		DL,33
	MOV		DH,10
	MOV     BP,rebar1
	CALL    putstring
	MOV		CX,3
	MOV		DL,33
	MOV		DH,11
	MOV     BP,rebar2
	CALL    putstring

putawa3:
	MOV		CX,3
	MOV		DL,33
	MOV		DH,15
	MOV     BP,awa1
	CALL    putstring
	CALL	wait

putawa4:
	MOV		CX,3
	MOV		DL,33
	MOV		DH,14
	MOV     BP,awa1
	CALL    putstring
	MOV		CX,3
	MOV		DL,33
	MOV		DH,16
	MOV     BP,awa0
	CALL    putstring
	CALL	wait

putawa5:
	MOV		CX,3
	MOV		DL,33
	MOV		DH,15
	MOV     BP,awa0
	CALL    putstring
	CALL	wait

getglass:
	; サーバから消す
	MOV		CX,5
	MOV		DL,32
	MOV		DH,14
	MOV     BP,glass4
	CALL    putstring
	MOV		CX,5
	MOV		DL,32
	MOV		DH,15
	MOV     BP,glass4
	CALL    putstring
	MOV		CX,5
	MOV		DL,32
	MOV		DH,16
	MOV     BP,glass4
	CALL    putstring
	MOV		CX,5
	MOV		DL,32
	MOV		DH,17
	MOV     BP,glass4
	CALL    putstring

	; 横に移動
	MOV		CX,5
	MOV		DL,60
	MOV		DH,14
	MOV     BP,glass1
	CALL    putstring
	MOV		CX,5
	MOV		DL,60
	MOV		DH,15
	MOV     BP,glass2
	CALL    putstring
	MOV		CX,5
	MOV		DL,60
	MOV		DH,16
	MOV     BP,glass3
	CALL    putstring
	MOV		CX,5
	MOV		DL,60
	MOV		DH,17
	MOV     BP,glass1
	CALL    putstring
	MOV		CX,3
	MOV		DL,61
	MOV		DH,14
	MOV     BP,awa1
	CALL    putstring
	MOV		CX,3
	MOV		DL,61
	MOV		DH,15
	MOV     BP,awa0
	CALL    putstring
	MOV		CX,3
	MOV		DL,61
	MOV		DH,16
	MOV     BP,awa0
	CALL    putstring
	CALL	wait

letsbeer:
	MOV		CX,22
	MOV		DL,50
	MOV		DH,10
	MOV     BP,lbeer1
	CALL    putstring
	MOV		CX,22
	MOV		DL,50
	MOV		DH,11
	MOV     BP,lbeer2
	CALL    putstring
	CALL	wait
	CALL	wait
	CALL	wait

	JMP		initbeer		; 最初に戻る

putsrv:
	MOV	CX,21
	MOV	DL,25
	; ↓に続く
putstring:
	mov	BL,7
	MOV	AX,0x1300
	MOV	BH,0
	INT	0x10
	RET


wait:
	MOV		AH,0x00				;クロックカウント読み出し
	INT		0x1a				;実行！
	MOV		[time0],DX			;DXをtime0にいれる
wait_loop:
	MOV		AH,0x00				;もう一回クロックカウント読み出し
	INT		0x1a				;実行！
	HLT
	SUB		DX,[time0]			;DX-=time0
	CMP		DL, byte [settime]	;DXと[settime]を比較
	JB		wait_loop			;[settime]より小さかったらループ
	RET


boot	DB	" |>        <~",0x0a,0x0d," |> e e r  _> e r v e r     (C) 2007 Akira Ouchi",0
srv1	DB	"   +----------------+",0	; 21
srv2	DB	"  /                /|",0
srv3	DB	" /                / |",0
srv4	DB	"+----------------+  |",0
srv5	DB	"|                |  |",0   ; 6 loops
srv6	DB	"|                |  /",0
srv7	DB	"|=====       ====| /",0
srv8	DB	"+----------------+/",0
rebar1	DB	" O ",0
rebar2	DB	" | ",0
rebar3	DB	"==",0
rebar4	DB	"||",0
glass1	DB	"+---+",0
glass2	DB	"|   P",0
glass3	DB	"|   |",0
glass4	DB	"     ",0
awa2	DB	"---",0
awa1	DB	"~~~",0
awa0	DB	"===",0
lbeer1	DB	"|     '   |>       | |",0
lbeer2	DB	"|_ e t s  |> e e r * *",0

serv1	DB	"Starting beerd...",0
serv2	DB	"[ O K ]",0

settime	dw	0
time0	dw	0
height	dw	0
