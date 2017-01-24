/*
NAME:Apeksha J.Todkar
Roll No:63	Div:B
Program Name:Implement a lexical analyzer of identification of numbers
*/

%{
#include<math.h>
FILE *fp;
%}


binary [0-1]+
octal [0-7]+
digit [0-9]+
hexadecimal [0-9A-F]+
float [-+]?[0-9]*\.?[0-9]*
exponential([-+][0-9]+)?\.[0-9]+([eE][0-9]+)?

%%


{binary} printf("Binary: %s\n",yytext);
{octal} printf("Octal: %s\n",yytext);
{digit} printf("Decimal: %s\n",yytext);
{hexadecimal} printf("Hexadecimal: %s\n",yytext);
{float} printf("Float: %s\n",yytext);
{exponential} printf("Exponential: %s\n",yytext);
%%


int main(int argc, char *argv[])
{
	fp=fopen(argv[1],"r");
	yyin=fp;
	yylex();
}


/*

OUTPUT:

student@student-ThinkCentre-M72e:~$ lex pr2.l
student@student-ThinkCentre-M72e:~$ cc lex.yy.c -ll
student@student-ThinkCentre-M72e:~$ ./a.out num.txt
Binary: 1010
 
Octal: 154

Decimal: 87
 
Hexadecimal: AF123F

Float: 0.99

Float: -0.99

Exponential: -1.2e56


*/
