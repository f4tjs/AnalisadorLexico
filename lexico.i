%{
    #include <stdio.h>
    #include <stdlib.h>
    int qtdMinusculo = 0, qtdMaisculo = 0;
    int qtdReservadas = 0;
    int qtdOpAritmetico = 0;
    int qtdOpRelacionais = 0;
    int qtdOpLogicos = 0;
    int qtdDelimitadores = 0;
    int qtdComentario = 0;
    int qtdEspacoEmBranco = 0;
%}

COMENTARIO[^*/]*
WHITESPACE[ ]

%%

[a-z] {qtdMinusculo++;} 
[A-Z] {qtdMaisculo++;} 

var {qtdReservadas++;}
const {qtdReservadas++;}
if {qtdReservadas++;}
else {qtdReservadas++;}
then {qtdReservadas++;}
for {qtdReservadas++;}
print {qtdReservadas++;}
printf {qtdReservadas++;}
scanf {qtdReservadas++;}
while {qtdReservadas++;}
do {qtdReservadas++;}

"+" {qtdOpRelacionais++;}
"-" {qtdOpRelacionais++;}
"*" {qtdOpRelacionais++;}
"/" {qtdOpRelacionais++;}
"%" {qtdOpRelacionais++;}
"++" {qtdOpRelacionais++;}
"--" {qtdOpRelacionais++;}

"==" {qtdOpAritmetico++;}
"!=" {qtdOpAritmetico++;}
">" {qtdOpAritmetico++;}
"<" {qtdOpAritmetico++;}
">=" {qtdOpAritmetico++;}
"<=" {qtdOpAritmetico++;}

"&&" {qtdOpLogicos++;}
"||" {qtdOpLogicos++;}
"!" {qtdOpLogicos++;}

"(" {qtdDelimitadores++;}
")" {qtdDelimitadores++;}
"[" {qtdDelimitadores++;}
"]" {qtdDelimitadores++;}
";" {qtdDelimitadores++;}

{WHITESPACE}
"/*"{COMENTARIO}"*/" {qtdComentario++;}

"///" {Finish();}

%%

void displayInfo(){
    printf("===============================================\n");
    printf("=                INDENTIFICADO                =\n");
    printf("===============================================\n");
    printf("= Quantidade de Palavras Maiusculas: %i        =\n", qtdMaisculo);
    printf("= Quantidade de Palavras Minusculas: %i        =\n", qtdMinusculo);
    printf("= Quantidade de Palavras Reservadas: %i        =\n", qtdReservadas);
    printf("= Quantidade de Operadores Aritmeticos: %i     =\n", qtdOpAritmetico);
    printf("= Quantidade de Operadores Relacionais: %i     =\n", qtdOpRelacionais);
    printf("= Quantidade de Operadores Logicos: %i         =\n", qtdOpLogicos);
    printf("= Quantidade de Delimitadores: %i              =\n", qtdDelimitadores);
    printf("= Quantidade de Comentarios: %i                =\n", qtdComentario);
    printf("===============================================\n");
}

void Stop(){
    system("pause");
}

void Clear(){
    system("cls");
}

void Finish(){
    displayInfo();
    printf("\n\nAnalisador foi finalizado!\n\n");
    Stop();
}

int yywrap()
{
    return 1;
}

int yywrap();


main()
{
    printf("\n|INDENTIFICADOR LEXICO|\n\nAguardando entrada...\n\n");
    yylex();
}