
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

%%

[{] {
    return BRACO;
  }

[}] {
    return BRACF;
  }

(\"[a-zA-Z0-9\ ]+\") {
    return KEY;
}

[0-9]+(.[0-9]+)? {
    return NUMBER;
}

[:] {
    return DOUBLEPOINT;
}

[\[] {
    return LISTO; 
}

[\]] {
    return LISTC; 
}

[,] {
    return EOP;
}

[\n] ;
[[:space:]]+ ;
[[:^space]]]+ ;

%%

int yywrap() {
  return 1;
}
