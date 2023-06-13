%{
#include <stdio.h>
#include <string.h>

#include <unistd.h>
#ifdef WIN32
#include <io.h>
#define F_OK 0
#define access _access
#endif

int file_exists(char *filename) {
    if (access(filename, F_OK) == 0) return 0;
    return 1;
};
%}

%option noyywrap

%s PI
%s MOD
%s SQR
%s CUR
%s EXP
%s LN
%s LOG
%s SGN
%s INT
%s FIX
%s FRAC
%s ROUND
%s CHARX

SIMBOLOS     "+"|"-"|":"|"/"|"^"|"|"|"!"|"("|")"|"="
IGNORE_CHAR  \n|\t|.

%%
"x"[0-9]                               {fprintf(yyout, "x\n");unput(yytext[1]);}
"x"                                    {BEGIN(CHARX);}
<CHARX>[a-zA-Z][a-zA-Z0-9]*            {fprintf(yyout, "IDENTIFICADOR\n");BEGIN(INITIAL);}
<CHARX>({SIMBOLOS})                    {fprintf(yyout, "x\n%s\n", yytext);BEGIN(INITIAL);}
<CHARX>[0-9]                           {fprintf(yyout, "x\n");BEGIN(INITIAL);unput(yytext[0]);}
<CHARX>({IGNORE_CHAR})                 {fprintf(yyout, "x\n");BEGIN(INITIAL);}
<CHARX><<EOF>>                         {fprintf(yyout, "x\n");BEGIN(INITIAL);}
<INITIAL>"PI"                          {BEGIN(PI);}
<PI>[a-zA-Z0-9]+                       {fprintf(yyout, "IDENTIFICADOR\n");BEGIN(INITIAL);}
<PI>({SIMBOLOS})                       {fprintf(yyout, "PI\n%s\n", yytext);BEGIN(INITIAL);}
<PI>({IGNORE_CHAR})                    {fprintf(yyout, "PI\n");BEGIN(INITIAL);}
<PI><<EOF>>                            {fprintf(yyout, "PI\n");BEGIN(INITIAL);}
<INITIAL>"MOD"                         {BEGIN(MOD);}
<MOD>[a-zA-Z0-9]+                      {fprintf(yyout, "IDENTIFICADOR\n");BEGIN(INITIAL);}
<MOD>({SIMBOLOS})                      {fprintf(yyout, "MOD\n%s\n", yytext);BEGIN(INITIAL);}
<MOD>({IGNORE_CHAR})                   {fprintf(yyout, "MOD\n");BEGIN(INITIAL);}
<MOD><<EOF>>                           {fprintf(yyout, "MOD\n");BEGIN(INITIAL);}
<INITIAL>"SQR"                         {BEGIN(SQR);}
<SQR>[a-zA-Z0-9]+                      {fprintf(yyout, "IDENTIFICADOR\n");BEGIN(INITIAL);}
<SQR>({SIMBOLOS})                      {fprintf(yyout, "SQR\n%s\n", yytext);BEGIN(INITIAL);}
<SQR>({IGNORE_CHAR})                   {fprintf(yyout, "SQR\n");BEGIN(INITIAL);}
<SQR><<EOF>>                           {fprintf(yyout, "SQR\n");BEGIN(INITIAL);}
<INITIAL>"CUR"                         {BEGIN(CUR);}
<CUR>[a-zA-Z0-9]+                      {fprintf(yyout, "IDENTIFICADOR\n");BEGIN(INITIAL);}
<CUR>({SIMBOLOS})                      {fprintf(yyout, "CUR\n%s\n", yytext);BEGIN(INITIAL);}
<CUR>({IGNORE_CHAR})                   {fprintf(yyout, "CUR\n");BEGIN(INITIAL);}
<CUR><<EOF>>                           {fprintf(yyout, "CUR\n");BEGIN(INITIAL);}
<INITIAL>"EXP"                         {BEGIN(EXP);}
<EXP>[a-zA-Z0-9]+                      {fprintf(yyout, "IDENTIFICADOR\n");BEGIN(INITIAL);}
<EXP>({SIMBOLOS})                      {fprintf(yyout, "EXP\n%s\n", yytext);BEGIN(INITIAL);}
<EXP>({IGNORE_CHAR})                   {fprintf(yyout, "EXP\n");BEGIN(INITIAL);}
<EXP><<EOF>>                           {fprintf(yyout, "EXP\n");BEGIN(INITIAL);}
<INITIAL>"LN"                          {BEGIN(LN);}
<LN>[a-zA-Z0-9]+                       {fprintf(yyout, "IDENTIFICADOR\n");BEGIN(INITIAL);}
<LN>({SIMBOLOS})                       {fprintf(yyout, "LN\n%s\n", yytext);BEGIN(INITIAL);}
<LN>({IGNORE_CHAR})                    {fprintf(yyout, "LN\n");BEGIN(INITIAL);}
<LN><<EOF>>                            {fprintf(yyout, "LN\n");BEGIN(INITIAL);}
<INITIAL>"LOG"                         {BEGIN(LOG);}
<LOG>[a-zA-Z0-9]+                      {fprintf(yyout, "IDENTIFICADOR\n");BEGIN(INITIAL);}
<LOG>({SIMBOLOS})                      {fprintf(yyout, "LOG\n%s\n", yytext);BEGIN(INITIAL);}
<LOG>({IGNORE_CHAR})                   {fprintf(yyout, "LOG\n");BEGIN(INITIAL);}
<LOG><<EOF>>                           {fprintf(yyout, "LOG\n");BEGIN(INITIAL);}
<INITIAL>"SGN"                         {BEGIN(SGN);}
<SGN>[a-zA-Z0-9]+                      {fprintf(yyout, "IDENTIFICADOR\n");BEGIN(INITIAL);}
<SGN>({SIMBOLOS})                      {fprintf(yyout, "SGN\n%s\n", yytext);BEGIN(INITIAL);}
<SGN>({IGNORE_CHAR})                   {fprintf(yyout, "SGN\n");BEGIN(INITIAL);}
<SGN><<EOF>>                           {fprintf(yyout, "SGN\n");BEGIN(INITIAL);}
<INITIAL>"INT"                         {BEGIN(INT);}
<INT>[a-zA-Z0-9]+                      {fprintf(yyout, "IDENTIFICADOR\n");BEGIN(INITIAL);}
<INT>({SIMBOLOS})                      {fprintf(yyout, "INT\n%s\n", yytext);BEGIN(INITIAL);}
<INT>({IGNORE_CHAR})                   {fprintf(yyout, "INT\n");BEGIN(INITIAL);}
<INT><<EOF>>                           {fprintf(yyout, "INT\n");BEGIN(INITIAL);}
<INITIAL>"FIX"                         {BEGIN(FIX);}
<FIX>[a-zA-Z0-9]+                      {fprintf(yyout, "IDENTIFICADOR\n");BEGIN(INITIAL);}
<FIX>({SIMBOLOS})                      {fprintf(yyout, "FIX\n%s\n", yytext);BEGIN(INITIAL);}
<FIX>({IGNORE_CHAR})                   {fprintf(yyout, "FIX\n");BEGIN(INITIAL);}
<FIX><<EOF>>                           {fprintf(yyout, "FIX\n");BEGIN(INITIAL);}
<INITIAL>"FRAC"                        {BEGIN(FRAC);}
<FRAC>[a-zA-Z0-9]+                     {fprintf(yyout, "IDENTIFICADOR\n");BEGIN(INITIAL);}
<FRAC>({SIMBOLOS})                     {fprintf(yyout, "FRAC\n%s\n", yytext);BEGIN(INITIAL);}
<FRAC>({IGNORE_CHAR})                  {fprintf(yyout, "FRAC\n");BEGIN(INITIAL);}
<FRAC><<EOF>>                          {fprintf(yyout, "FRAC\n");BEGIN(INITIAL);}
<INITIAL>"ROUND"                       {BEGIN(ROUND);}
<ROUND>[a-zA-Z0-9]+                    {fprintf(yyout, "IDENTIFICADOR\n");BEGIN(INITIAL);}
<ROUND>({SIMBOLOS})                    {fprintf(yyout, "ROUND\n%s\n", yytext);BEGIN(INITIAL);}
<ROUND>({IGNORE_CHAR})                 {fprintf(yyout, "ROUND\n");BEGIN(INITIAL);}
<ROUND><<EOF>>                         {fprintf(yyout, "ROUND\n");BEGIN(INITIAL);}
[a-zA-Z][a-zA-Z0-9]*                   {fprintf(yyout, "IDENTIFICADOR\n");}
[0-9]+(","[0-9]+)?"E"("+"|"-")?[0-9]+  {fprintf(yyout, "EXPONENCIAL\n");}
[0-9]+","[0-9]+                        {fprintf(yyout, "DECIMAL\n");}
[0-9]+                                 {fprintf(yyout, "ENTERO\n");}
({SIMBOLOS})                           {fprintf(yyout, "%s\n", yytext);}
({IGNORE_CHAR})                        {}
%%

int main(int argc, char *argv[])
{
    if(argc == 1){
        printf("Error: Faltan par metros.\n");
        printf("Uso: %s archivo_entrada archivo_salida\n", argv[0]);
        return 1;
    }
    else if(argc == 2){
        printf("Error: Falta par metro.\n");
        printf("Uso: %s archivo_entrada archivo_salida\n", argv[0]);
        return 1;
    }
    else if(argc > 3){
        printf("Error: Demasiados par metros.\n");
        printf("Uso: %s archivo_entrada archivo_salida\n", argv[0]);
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if(yyin == NULL){
        printf("Error: El archivo de entrada no existe.\n");
        return 1;
    }

    if (file_exists(argv[2]) == 0) {
        printf("Error: El archivo de salida ya existe.\n");
        return 1;
    }

    yyout = fopen(argv[2], "w");
    if(yyout == NULL){
        printf("Error: No se pudo crear el archivo de salida.\n");
        return 1;
    }

    yylex();
    fclose(yyin);
    fclose(yyout);

    return 0;
}
