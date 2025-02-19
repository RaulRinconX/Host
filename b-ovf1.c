#include <stdio.h>

char c[]= { 0xb8,0x0f,0x00,0x00,0x00,0xc3 };  //LINEA A

int main ( int argc, char *argv[ ] ){

  int (*f)();            //LINEA B
  int i;
  
  f = (int (*)()) c;     //LINEA C

  printf ("Teclee un numero: ");
  scanf ("%d", &c[1]);   //LINEA D
  i = f();               //LINEA E
  printf ("Despues = %d\n", i);
  
  return 0;
}


