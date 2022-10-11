%{
#include <iostream>
#include <string>
using namespace std;

#include "Lexer.hpp"
#undef YY_DECL
#define YY_DECL int Lexer::yylex()

%}

%option c++
%option outfile="Lexer.cpp"
%option yyclass="Lexer"


digito [0-9]
letra [a-zA-Z]
espacio [ \t\r\v]
espacios {espacio}+
id ({letra}|_)({letra}|_|{digito})*

%%

{espacios}  {/* Ignorar los espacios en blanco*/}
{digito}+   { cout<<"Se encontro un número "<<yytext<<endl; return 1; }
float   { cout<<"Se encontro palabra reservada "<<yytext<<endl; return 2;}
int    { cout<<"Se encontro palabra reservada "<<yytext<<endl; return 2;}
double   { cout<<"Se encontro palabra reservada "<<yytext<<endl; return 2;}
char     { cout<<"Se encontro palabra reservada "<<yytext<<endl; return 2;}
{id}    { cout<<"Se encontro un id "<<yytext<<endl; return 2;}

\n          { line++; }
.           { cout<<"Error lexíco: "<<yytext<<" en la  línea "<<yylineno<<endl; return -1;}

%%
/*Sección de código de usuario*/
int yyFlexLexer::yywrap(){
    return 1;
}

int Lexer::getLine(){
    return line;
}

string Lexer::getTokVal(){
    return yytext;
}
