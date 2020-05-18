%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
  #define END -1
 int numlin=1;
 void error(char*);
%}

digito [0-9]
letra [a-zA-Z]
arroba [@]
mayor [>]
menor [<]
igual [=]
dosp  [:]

%%
{arroba}{letra}+                                       {printf("ID: %s\n", yytext);}
"-"|"+"|"/"|"*"                                        {printf("Operador Aritmetico: %s\n", yytext);}
{mayor}|{menor}|{mayor}{igual}|{menor}{igual}|{igual}  {printf("Operador relacional: %s\n", yytext);}
"&"|"|"|"~"                                            {printf("Operadores Logicos: %s\n", yytext);}
"("|")"|";"|","|{dosp}{igual}                          {printf("Caracter Especial: %s\n", yytext);} 
{digito}+                                              {printf("Numero: %s\n", yytext);}
"Program"                                              {printf("Palabra reservada: %s\n", yytext);}
"begin"                                                {printf("Palabra reservada: %s\n", yytext);}
"end"                                                  {printf("Palabra reservada: %s\n", yytext);}
"input"                                                {printf("Palabra reservada: %s\n", yytext);}
"output"                                               {printf("Palabra reservada: %s\n", yytext);}
"integer"                                              {printf("Palabra reservada: %s\n", yytext);}
"real"                                                 {printf("Palabra reservada: %s\n", yytext);}
"char"                                                 {printf("Palabra reservada: %s\n", yytext);}
"string"                                               {printf("Palabra reservada: %s\n", yytext);}
"boolean"                                              {printf("Palabra reservada: %s\n", yytext);}
"if"                                                   {printf("Palabra reservada: %s\n", yytext);}
"else"                                                 {printf("Palabra reservada: %s\n", yytext);}
"then"                                                 {printf("Palabra reservada: %s\n", yytext);}
"while"                                                {printf("Palabra reservada: %s\n", yytext);}
"do"                                                   {printf("Palabra reservada: %s\n", yytext);}
"repeat"                                               {printf("Palabra reservada: %s\n", yytext);}
"until"                                                {printf("Palabra reservada: %s\n", yytext);}
"var"                                                  {printf("Palabra reservada: %s\n", yytext);}
"true"                                                 {printf("Palabra reservada: %s\n", yytext);}
"false"                                                {printf("Palabra reservada: %s\n", yytext);}
"//".*"//"                                              {printf("Comentario: %s\n", yytext);}
\n                                                     {numlin++; /*continúa leyendo */}
[ \t] |                                                {/* se come los espacios en blanco */}
^#.*                                                   {/* ignora */}
.                                                      {printf("Error: %s\n", yytext);}
<<EOF>>                                                {return 0; /* por defecto */}


%%

int yywrap(){}
int main(int argc, char** argv)
{
  int s;
  if(argc>1) yyin=fopen(argv[1],"r");
  do printf("%i ",s=yylex()); while(s !=0); 
}
 void error(char* mens){
 printf("Error lexico en linea %i: %s\n",numlin,mens);
}