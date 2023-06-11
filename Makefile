all: a.out

lex.yy.c: analizador_lexico.l
	flex analizador_lexico.l

a.out: lex.yy.c
	gcc -o a.out lex.yy.c

clear:
	rm -f *.o *.out lex.yy.c
