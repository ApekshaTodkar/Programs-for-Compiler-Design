/*
NAME:Apeksha J.Todkar
Roll No:63	Div:B
Program Name:Implement a lexical analyzer for a subset of C using LEX Implementation.
*/

%{
#include<math.h>
FILE *fp;
%}


plus "+"
minus "-"
multiplication "*"
division "/"
digit [0-9]+
datatype [\t]*"int"[\t]*|[\t]*"char"[\t]*|[\t]*"float"[\t]*|[\t]*"long"[\t]*
variable [a-zA-Z][a-zA-Z0-9]*
garbage [0-9][a-zA-Z0-9]*
loop "if("|"for("|"while("|"do"[\t]*"{"|"do{"
main "void main()"
header "#include<"[a-z]+".h>"
brackets "("|"{"|")"|"}"
keyword "printf("|"scanf("|"goto"|"clrscr()"
terminator ");"

%%
{main} 			printf("\nMain function: %s\n",yytext);
{digit} 		printf("Number: %s\n",yytext);
{plus}			printf(" Plus operator: %s\n",yytext);
{minus} 		printf(" Minus operator: %s\n",yytext);
{multiplication}	printf(" Multiplication operator: %s\n",yytext);
{division} 		printf(" Division operator: %s\n",yytext);
{datatype} 		printf("Datatype: %s\n",yytext);
{garbage} 		printf("Garbage value: %s\n",yytext);
{variable}		printf("Variable: %s\n",yytext);
{loop} 			printf("Loop: %s\n",yytext);
{header}		printf("Header file: %s\n",yytext);
{brackets} 		printf("Brackets: %s\n",yytext);
{keyword} 		printf("Keyword: %s\n",yytext);
{terminator} 		printf("Terminator: %s\n",yytext);
%%


int main(int argc, char *argv[])
{
	fp=fopen(argv[1],"r");
	yyin=fp;
	yylex();
}


/*
OUTPUT:
student@student-ThinkCentre-M72e:~$ cc lex.yy.c -ll
student@student-ThinkCentre-M72e:~$ ./a.out addi.c
Header file: #include<stdio.h>



Main function: void main()

Brackets: {

Datatype: 	int
 Variable: a
,Variable: b
;
Datatype: 	int
 Variable: c
;
	Keyword: printf(
"\Variable: n
 Variable: Enter
 Variable: the
 Variable: two
 Variable: integers
:"Terminator: );

	Variable: scanf
Brackets: (
"%Variable: d
%Variable: d
",&Variable: a
,&Variable: b
Terminator: );

	Variable: c
=Variable: a
 Plus operator: +
Variable: b
;
	Keyword: printf(
"\Variable: n
 Variable: Addition
:%Variable: d
",Variable: c
Terminator: );
	

Brackets: }



*/
