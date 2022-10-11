#ifndef __LEXER_HPP__
#define __LEXER_HPP__

#if !defined(yyFlexLexerOnce)
#include <FlexLexer.h>
#endif

#include <string>
using namespace std;

class Lexer : public yyFlexLexer
{
public:
    Lexer(std::istream *in) : yyFlexLexer(in){
        yylineno = 1;
    }
    ~Lexer() = default;
    using FlexLexer::yylex;
    virtual int yylex();

    int getLine();
    string getTokVal();
private:
    int line=1;

};

#endif // !__LEXER_HPP__
