;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.2.2 #13350 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _setUpPlayer
	.globl _interruptLCD
	.globl _moverObjeto
	.globl _font_set
	.globl _font_load
	.globl _font_init
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _joypad
	.globl _delay
	.globl _NewShipTiles
	.globl _Fighter
	.globl _WindowMap
	.globl _BackgroundMap
	.globl _BackgroundTiles
	.globl _scrollY
	.globl _scrollX
	.globl _player
	.globl _playerDirY
	.globl _playerDirX
	.globl _playerY
	.globl _playerX
	.globl _oldPlayerY
	.globl _oldPlayerX
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_oldPlayerX::
	.ds 1
_oldPlayerY::
	.ds 1
_playerX::
	.ds 1
_playerY::
	.ds 1
_playerDirX::
	.ds 1
_playerDirY::
	.ds 1
_player::
	.ds 6
_scrollX::
	.ds 1
_scrollY::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_BackgroundTiles::
	.ds 80
_BackgroundMap::
	.ds 720
_WindowMap::
	.ds 14
_Fighter::
	.ds 32
_NewShipTiles::
	.ds 64
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:21: void moverObjeto(struct Objeto* obj, UINT8 x, UINT8 y)
;	---------------------------------
; Function moverObjeto
; ---------------------------------
_moverObjeto::
	add	sp, #-4
	ldhl	sp,	#3
	ld	(hl), a
;main.c:23: move_sprite(obj->spitids[0],x,y);
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (de)
;./gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;./gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;main.c:24: move_sprite(obj->spitids[1],x+8,y);    
	ld	a, (hl-)
	dec	hl
	add	a, #0x08
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl), a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
;./gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	ld	c, l
	ld	b, h
;./gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	ld	(bc), a
	inc	bc
;main.c:25: move_sprite(obj->spitids[2],x,y+8);    
	ld	a, (hl-)
	dec	hl
	ld	(bc), a
	ld	a, (hl+)
	inc	hl
	add	a, #0x08
	ld	(hl), a
	ld	c, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
;./gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;./gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;main.c:26: move_sprite(obj->spitids[3],x+8,y+8);    
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	e, a
;./gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;./gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ldhl	sp,	#2
	ld	a, (hl-)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:26: move_sprite(obj->spitids[3],x+8,y+8);    
;main.c:27: }
	add	sp, #4
	pop	hl
	inc	sp
	jp	(hl)
;main.c:31: void interruptLCD() {
;	---------------------------------
; Function interruptLCD
; ---------------------------------
_interruptLCD::
;main.c:32: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;main.c:33: }
	ret
;main.c:35: void setUpPlayer(){
;	---------------------------------
; Function setUpPlayer
; ---------------------------------
_setUpPlayer::
;main.c:36: player.x = playerX;
	ld	de, #(_player + 4)
	ld	a, (#_playerX)
	ld	(de), a
;main.c:37: player.y = playerY;
	ld	de, #(_player + 5)
	ld	a, (#_playerY)
	ld	(de), a
;./gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x04
;main.c:40: player.spitids[0]=4;
	ld	hl, #_player
	ld	(hl), #0x04
;./gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), #0x05
;main.c:42: player.spitids[1]=5;
	ld	hl, #(_player + 1)
	ld	(hl), #0x05
;./gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x03
;main.c:44: player.spitids[2]=3;
	ld	hl, #(_player + 2)
	ld	(hl), #0x03
;./gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x02
;main.c:46: player.spitids[3]=2;
	ld	hl, #(_player + 3)
	ld	(hl), #0x02
;main.c:47: }
	ret
;main.c:50: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-3
;main.c:53: VBK_REG = (unsigned char)0;
	xor	a, a
	ldh	(#0xff4f), a
;main.c:54: playerX=88;
	ld	hl, #_playerX
	ld	(hl), #0x58
;main.c:55: playerY=16;
	ld	hl, #_playerY
	ld	(hl), #0x10
;main.c:56: oldPlayerX=playerX;
	ld	hl, #_oldPlayerX
	ld	(hl), #0x58
;main.c:57: oldPlayerY=playerY;
	ld	hl, #_oldPlayerY
	ld	(hl), #0x10
;main.c:59: set_sprite_data(0, 2, Fighter);
	ld	de, #_Fighter
	push	de
	ld	hl, #0x200
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:60: set_sprite_data(2, 4, NewShipTiles);
	ld	de, #_NewShipTiles
	push	de
	ld	hl, #0x402
	push	hl
	call	_set_sprite_data
	add	sp, #4
;./gbdk/include/gb/gb.h:1602: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
;main.c:63: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:65: setUpPlayer();
	call	_setUpPlayer
;main.c:70: font_init();
	call	_font_init
;main.c:72: min_font = font_load(font_min);
	ld	de, #_font_min
	push	de
	call	_font_load
	pop	hl
;main.c:73: font_set(min_font);
	push	de
	call	_font_set
	pop	hl
;main.c:75: set_bkg_data(37, 4, BackgroundTiles);
	ld	de, #_BackgroundTiles
	push	de
	ld	hl, #0x425
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:77: VBK_REG = 0;
	xor	a, a
	ldh	(#0xff4f), a
;main.c:78: set_bkg_tiles(0, 2, 20, 36, BackgroundMap);
	ld	de, #_BackgroundMap
	push	de
	ld	hl, #0x2414
	push	hl
	ld	hl, #0x200
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;main.c:80: VBK_REG = 1;
	ld	a, #0x01
	ldh	(#0xff4f), a
;main.c:81: move_sprite(0, playerX, playerY);
	ld	hl, #_playerY
	ld	b, (hl)
	ld	hl, #_playerX
	ld	c, (hl)
;./gbdk/include/gb/gb.h:1675: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;./gbdk/include/gb/gb.h:1676: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:84: set_win_tiles(0, 0, 14, 1, WindowMap);
	ld	de, #_WindowMap
	push	de
	ld	hl, #0x10e
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;./gbdk/include/gb/gb.h:1468: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x87
	ldh	(_WY_REG + 0), a
;main.c:86: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:89: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:98: while(1){
00126$:
;main.c:99: player.x = playerX;
	ld	de, #(_player + 4)
	ld	a, (#_playerX)
	ld	(de), a
;main.c:100: player.y = playerY;
	ld	de, #(_player + 5)
	ld	a, (#_playerY)
	ld	(de), a
;main.c:101: UINT8 joypad_state = joypad();
	call	_joypad
	ld	c, a
;main.c:102: delay(50);
	push	bc
	ld	de, #0x0032
	call	_delay
	pop	bc
;main.c:103: switch (joypad_state){
	ld	a, c
	dec	a
	jr	Z, 00104$
	ld	a,c
	cp	a,#0x02
	jr	Z, 00101$
	cp	a,#0x04
	jr	Z, 00107$
	sub	a, #0x08
	jr	Z, 00110$
	jr	00111$
;main.c:104: case J_LEFT:
00101$:
;main.c:105: if(playerX>8)
	ld	a, #0x08
	ld	hl, #_playerX
	sub	a, (hl)
	jr	NC, 00103$
;main.c:106: --playerX;
	dec	(hl)
00103$:
;main.c:107: playerDirX=0;
	ld	hl, #_playerDirX
	ld	(hl), #0x00
;main.c:108: break;
	jr	00111$
;main.c:110: case J_RIGHT:
00104$:
;main.c:111: if(playerX<153)
	ld	hl, #_playerX
	ld	a, (hl)
	sub	a, #0x99
	jr	NC, 00106$
;main.c:112: ++playerX;
	inc	(hl)
00106$:
;main.c:113: playerDirX=1;
	ld	hl, #_playerDirX
	ld	(hl), #0x01
;main.c:114: break;
	jr	00111$
;main.c:115: case J_UP:
00107$:
;main.c:116: if(playerY>14)
	ld	a, #0x0e
	ld	hl, #_playerY
	sub	a, (hl)
	jr	NC, 00109$
;main.c:117: --playerY;
	dec	(hl)
00109$:
;main.c:118: playerDirY=0;
	ld	hl, #_playerDirY
	ld	(hl), #0x00
;main.c:119: break;
	jr	00111$
;main.c:120: case J_DOWN:
00110$:
;main.c:122: ++playerY;
	ld	hl, #_playerY
	inc	(hl)
;main.c:123: playerDirY=1;   
	ld	hl, #_playerDirY
	ld	(hl), #0x01
;main.c:125: }
00111$:
;main.c:81: move_sprite(0, playerX, playerY);
	ld	hl, #_playerY
	ld	c, (hl)
;main.c:140: if(oldPlayerY<playerY){scrollY=-1; oldPlayerY=playerY; }
	ld	a, (#_oldPlayerY)
	ld	hl, #_playerY
	sub	a, (hl)
	jr	NC, 00113$
	ld	hl, #_scrollY
	ld	(hl), #0xff
	ld	hl, #_oldPlayerY
	ld	(hl), c
00113$:
;main.c:141: if(oldPlayerY>playerY){scrollY=1; oldPlayerY=playerY;  }
	ld	a, (#_playerY)
	ld	hl, #_oldPlayerY
	sub	a, (hl)
	jr	NC, 00115$
	ld	hl, #_scrollY
	ld	(hl), #0x01
	ld	hl, #_oldPlayerY
	ld	(hl), c
00115$:
;main.c:143: if(playerY>=72-!oldPlayerY){
	ld	a, (#_oldPlayerY)
	sub	a,#0x01
	ld	a, #0x00
	rla
	ld	c, a
	ld	b, #0x00
	ld	a, #0x48
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
	ld	a, (#_playerY)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:145: scroll_bkg(0, -scrollY);
	xor	a, a
	ld	hl, #_scrollY
	sub	a, (hl)
	ldhl	sp,	#2
;main.c:143: if(playerY>=72-!oldPlayerY){
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00209$
	bit	7, d
	jr	NZ, 00210$
	cp	a, a
	jr	00210$
00209$:
	bit	7, d
	jr	Z, 00210$
	scf
00210$:
	jr	C, 00121$
;main.c:145: scroll_bkg(0, -scrollY);
	ldhl	sp,	#2
	ld	c, (hl)
;./gbdk/include/gb/gb.h:1222: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCY_REG + 0)
	add	a, c
	ldh	(_SCY_REG + 0), a
;main.c:146: moverObjeto(&player, playerX, 72);
	ld	a, #0x48
	push	af
	inc	sp
	ld	a, (#_playerX)
	ld	de, #_player
	call	_moverObjeto
	jr	00122$
00121$:
;main.c:149: if(playerY<=72-!oldPlayerY && !playerDirY){
	ldhl	sp,	#0
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	ld	a, b
	ld	d, a
	bit	7, (hl)
	jr	Z, 00211$
	bit	7, d
	jr	NZ, 00212$
	cp	a, a
	jr	00212$
00211$:
	bit	7, d
	jr	Z, 00212$
	scf
00212$:
	jr	C, 00117$
	ld	a, (#_playerDirY)
	or	a, a
	jr	NZ, 00117$
;main.c:150: scroll_bkg(0, -scrollY);
	ldhl	sp,	#2
	ld	c, (hl)
;./gbdk/include/gb/gb.h:1222: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCY_REG + 0)
	add	a, c
	ldh	(_SCY_REG + 0), a
;main.c:151: moverObjeto(&player, playerX, playerY);
	ld	a, (#_playerY)
	push	af
	inc	sp
	ld	a, (#_playerX)
	ld	de, #_player
	call	_moverObjeto
	jr	00122$
00117$:
;main.c:153: moverObjeto(&player, playerX, playerY);
	ld	a, (#_playerY)
	push	af
	inc	sp
	ld	a, (#_playerX)
	ld	de, #_player
	call	_moverObjeto
00122$:
;main.c:156: if(oldPlayerY==playerY){ scrollY=0; }
	ld	a, (#_oldPlayerY)
	ld	hl, #_playerY
	sub	a, (hl)
	jr	NZ, 00124$
	ld	hl, #_scrollY
	ld	(hl), #0x00
00124$:
;main.c:173: delay(10);
	ld	de, #0x000a
	call	_delay
	jp	00126$
;main.c:175: }
	add	sp, #3
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__BackgroundTiles:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfd	; 253
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbf	; 191
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0xdf	; 223
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0xff	; 255
__xinit__BackgroundMap:
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x27	; 39
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
	.db #0x25	; 37
	.db #0x28	; 40
	.db #0x25	; 37
__xinit__WindowMap:
	.db #0x1d	; 29
	.db #0x0d	; 13
	.db #0x19	; 25
	.db #0x1c	; 28
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x16	; 22
	.db #0x13	; 19
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x04	; 4
__xinit__Fighter:
	.db #0xdb	; 219
	.db #0x66	; 102	'f'
	.db #0xe7	; 231
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0x66	; 102	'f'
	.db #0x5a	; 90	'Z'
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5a	; 90	'Z'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x5a	; 90	'Z'
	.db #0x66	; 102	'f'
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__NewShipTiles:
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xf1	; 241
	.db #0xfc	; 252
	.db #0xf2	; 242
	.db #0xf0	; 240
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0x28	; 40
	.db #0x80	; 128
	.db #0x48	; 72	'H'
	.db #0x00	; 0
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x8f	; 143
	.db #0x3f	; 63
	.db #0x4f	; 79	'O'
	.db #0x0f	; 15
	.db #0x30	; 48	'0'
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x14	; 20
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x11	; 17
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xff	; 255
	.area _CABS (ABS)
