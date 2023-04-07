#include <gb/gb.h>
#include <gbdk/font.h>
#include <stdio.h>
#include "backgroundSprites.c"
#include "backgroundMapSpace.c"
#include "windowMap.c"
#include "Export.c"
#include "NewShipTiles.c"
#define VBK_REG (*(volatile unsigned char*)0xFF4F)

struct Objeto
{
    UBYTE spitids[4];
    UINT8 x, y;
};

unsigned char oldPlayerX, oldPlayerY, playerX, playerY, playerDirX, playerDirY;
struct Objeto player;
signed char scrollX, scrollY;

void moverObjeto(struct Objeto* obj, UINT8 x, UINT8 y)
{
    move_sprite(obj->spitids[0],x,y);
    move_sprite(obj->spitids[1],x+8,y);    
    move_sprite(obj->spitids[2],x,y+8);    
    move_sprite(obj->spitids[3],x+8,y+8);    
}



void interruptLCD() {
    HIDE_WIN;
}

void setUpPlayer(){
    player.x = playerX;
    player.y = playerY;

    set_sprite_tile(4, 4);
    player.spitids[0]=4;
    set_sprite_tile(5, 5);
    player.spitids[1]=5;
    set_sprite_tile(3, 3);
    player.spitids[2]=3;
    set_sprite_tile(2, 2);
    player.spitids[3]=2;
}


void main() {
    // setea en cual spite esta el character fighter
    UINT8 currentCharacterIndex = 0;
    VBK_REG = (unsigned char)0;
    playerX=88;
    playerY=16;
    oldPlayerX=playerX;
    oldPlayerY=playerY;

set_sprite_data(0, 2, Fighter);
set_sprite_data(2, 4, NewShipTiles);
set_sprite_tile(0, 0);

    SHOW_SPRITES;

    setUpPlayer();

    //setea cual es el font
    font_t min_font;
    // inicia el font
    font_init();
    // carga el font
    min_font = font_load(font_min);
    font_set(min_font);
    // de donde tiene que cargar el background data
    set_bkg_data(37, 4, BackgroundTiles);
    // setea de donde empieza y el largo y ancho del backgroundMap
    VBK_REG = 0;
    set_bkg_tiles(0, 2, 20, 36, BackgroundMap);
    // Setea los spites del character fighter y cuantos sprites tiene
    VBK_REG = 1;
    move_sprite(0, playerX, playerY);

    // ventana de puntaje, primera capa de la pantalla de la gameboy
    set_win_tiles(0, 0, 14, 1, WindowMap);
    move_win(7, 135);
    SHOW_WIN;

    // activa el background map
    DISPLAY_ON;

    //enable LCD interrupt
   /*  STAT_REG = 0x45;
    LYC_REG = 0x08;  //  Fire LCD Interupt on the 8th scan line
    add_LCD(interruptLCD);
    enable_interrupts();
    set_interrupts(VBL_IFLAG | LCD_IFLAG); */

    while(1){
         player.x = playerX;
         player.y = playerY;
        UINT8 joypad_state = joypad();
        delay(50);
        switch (joypad_state){
            case J_LEFT:
            if(playerX>8)
                --playerX;
                playerDirX=0;
                break;

            case J_RIGHT:
            if(playerX<153)
                ++playerX;
                playerDirX=1;
                break;
            case J_UP:
             if(playerY>14)
                --playerY;
                playerDirY=0;
                break;
            case J_DOWN:
            if(playerY<135)
                ++playerY;
                playerDirY=1;   
                break;
        }
/* 
      if(playerY<56 && playerY>8){
        moverObjeto(&player, playerX, 56);
        scroll_bkg(-scrollY, 0);
      }
      else if(playerY>=56)
            moverObjeto(&player, playerX, playerY-48);
      else
            moverObjeto(&player, playerX, playerY);

    if(oldPlayerY<playerY){scrollY=-1; oldPlayerY=playerY;}
    if(oldPlayerY>playerY){scrollY=+1; oldPlayerY=playerY;}
    if(oldPlayerY==playerY){scrollY=0;} */

       if(oldPlayerY<playerY){scrollY=-1; oldPlayerY=playerY; }
       if(oldPlayerY>playerY){scrollY=1; oldPlayerY=playerY;  }

       if(playerY>=72-!oldPlayerY && playerY<135+playerY){
   /*      moverObjeto(&player, playerX, 14); */
        scroll_bkg(0, -scrollY);
       }
       else
       if(playerY<=72-!oldPlayerY && !playerDirY){
        scroll_bkg(0, -scrollY);
       }
       moverObjeto(&player, playerX, playerY);

       if(oldPlayerY==playerY){ scrollY=0; }

/*        if(oldPlayerX<playerX){scrollX=-1; oldPlayerX=playerX;}
       if(oldPlayerX>playerX){scrollX=1; oldPlayerX=playerX;}

       if(playerX>=80-!playerDirX && playerX<256-80+playerDirX){
        moverObjeto(&player, 80, playerY);
        scroll_bkg(-scrollX, 0);
       }
       else
       if(playerX>=256-80+playerDirX)
       moverObjeto(&player, playerX-256-80+playerDirX-16, playerY);
       else
       moverObjeto(&player, playerX, playerY);

       if(oldPlayerX==playerX){ scrollX=0;}  */

        delay(10);
    }
}

