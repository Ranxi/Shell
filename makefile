user-sh : bison.tab.o execute.o
	cc -o user-sh bison.tab.o execute.o lex.yy.o -lfl
bison.tab.o : bison.tab.c global.h lex.yy.c
	cc -c bison.tab.c lex.yy.c
execute.o : execute.c global.h
	cc -c execute.c
bison.tab.c:bison.y
	bison -d bison.y
lex.yy.c:req1.l
	flex req1.l

clean :
	rm user-sh bison.tab.o execute.o bison.tab.c lex.yy.o lex.yy.c
