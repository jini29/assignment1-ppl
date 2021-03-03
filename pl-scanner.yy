%{ 
//name, ID; 

#include "tokens.h"
# undef yywrap
# define yywrap() 1



#undef YY_DECL
#define YY_DECL int yylex()
YY_DECL;


// Code run each time a pattern is matched.
#undef  YY_USER_ACTION  
# define YY_USER_ACTION  {}



%}

%option yylineno
%option noyywrap 

DIGIT [0-9] 
ALPHA [a-zA-Z]
FLOAT ("+"|"-")*{DIGIT}+"."{DIGIT}+

%%


\/\/.*$    { }

[ \t]+						
[\n]+				

"+"                           {
                                        return OP_ADD;
                  }
"-"                           {
                                         return OP_SUB;
                   }
"*"                           {
                                        return OP_MUL;
                  }
"/"                           {
                                        return OP_DIV;
                  }
"++"                           {
                                        return OP_PLUSPLUS;
                  }
"+="                           {
                                        return OP_ADDINC;
                  }
"<="                           {
                                        return OP_LEQ ;
                  }
">="                           {
                                        return OP_GEQ;
                  }
"=="                           {
                                        return OP_EQ;
                  }
"~="                           {
                                        return OP_DIFF;
                  }
"<"                           {
                                        return OP_LT;
                  }
">"                           {
                                        return OP_GT;
                  }
";"							  {
										return ';'; 
                  }

"="							  { 
										return OP_ASSIGN; 
                  }
s
{DIGIT}+					{ 
										return L_INTEGER;
									}

"@"{ALPHA}("_"|{ALPHA}|{DIGIT})*        {
                                                                return T_ID;
                                                          }     

{FLOAT}           {
                    return L_FLOAT;
                  } 

"foreach"                           {
                                        return K_FOREACH;
                  }	

"print"                           {
                                        return K_PRINT;
                  }

"while"                           {
                                        return K_WHILE;
                  }

"repeat"                           {
                                        return K_REPEAT;
                  }

"until"                           {
                                        return K_UNTIL;
                  }

"begin"                           {
                                        return K_BEGIN;
                  }

"end"                           {
                                        return K_END;
                  }

"main"            {
                    return K_MAIN;
                  }

"declare"                           {
                                        return K_DECLARE;
                  }

"if"                           {
                                        return K_IF;
                  }

"then"                           {
                                        return K_THEN;
                  }

"integer"                           {
                                        return K_INTEGER;
                  }
"float"                           {
                                        return K_FLOAT;
                  }
<<EOF>>						{ return T_EOF ; }
.									{ return yytext[0]; }



%%

int dummy_function(){

  return 1;
}
