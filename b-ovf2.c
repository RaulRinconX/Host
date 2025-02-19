#include <stdio.h>
#include <string.h>

char c[]= { [16] = 0xb8, 0x0f, 0x00, 0x00, 0x00, 0x68, 0x0c, 0x16, 0x40, 0x00, 0xc3, 0x00,
            0xc8, 0xfe, 0x22, 0x00,
            0x8c, 0xfe, 0x22, 0x00 };    //LINEA A

int g ( int n ){
	

  char s[16];         //LINEA B
  int * p = &n;       //LINEA C
  
  printf("a = %08x\n", &n );         //LINEA D
  printf("b = %08x\n", s );          //LINEA E
  printf("c = %08x\n", *(p-1) );     //LINEA F
  printf("d = %08x\n", *(p-2) );     //LINEA G
  
  memcpy( s, c, NNNNNNN );         //LINEA H
  
  return n+1;
}

int main ( int argc, char *argv[ ] ){

  int i;
  
  printf ("Teclee un numero: ");
  scanf ("%d", &c[17]);
  i = g( 7 );
  printf ("Despues = %d\n", i);
  
  system( "pause" );
  
  return 0;
}


