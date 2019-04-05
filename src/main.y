%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token BRACO BRACF KEY DOUBLEPOINT EOL NUMBER EOP LISTO LISTC ERROR

%%

FILE:
  OBJETO { printf("VALIDO\n");}
  ;

OBJETO:
  BRACO CONTEUDO BRACF {
    $$ = $2;
  }
  ;

CONTEUDO:
  CONTEUDO EOP KEY DOUBLEPOINT VALUE {
    //printf("Conteudo com mais de uma linha!\n");
    $$ = $1;
  }
  | KEY DOUBLEPOINT VALUE {
    //printf("Linha com chave/valor!\n");
  }
  ;

VALUE:
  KEY {
    //printf("Valor tipo string!\n");
  }
  | NUMBER {
    //printf("Valor tipo numerico!\n");
  }
  | OBJETO {
    //printf("Valor tipo Objeto!\n");
    $$ = $1;
  }
  | LIST {
    $$ = $1;
  }
  ;

LIST:
  LISTO LISTC {
    //printf("Lista vazia!\n");
  }
  | LISTO LISTELEMENT LISTC {
    //printf("Lista reconhecida!\n");
    $$ = $2;
  }
  ;

LISTELEMENT:
  LISTELEMENT EOP VALUE { 
    //printf("Lista com mais de um valor\n");
    $$ = $1;
  }
  | VALUE {
    $$ = $1;
  }
  ;

%%

void yyerror(char *s) {
  printf("INVALIDO\n");
}

int main() {
  yyparse();
  return 0;
}
