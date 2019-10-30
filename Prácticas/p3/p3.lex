car [a-zA-Z]
digito  [0-9]
signo (\-|\+)
suc ({digito}+)
enter ({signo}?{suc})
real1 ({enter}\.{digito}*)
real2 ({signo}?\.{suc})
dni ({digito}{8}\-{car}{1})
nie ({car}{1}\-{digito}{7}\-{car}{1})
matricula ({digito}{4}\-{car}{3})
matricula_old ({car}{2}\-{digito}{4}\-{car}{2})
matricula_ciclomotor ({car}{1}{digito}{1}\-{digito}{3}\-{car}{3})
ss  ({digito}{2}[\-|\/]{digito}{10})
receta ("papicas"|"huevicos"|"cebollica")
  int ent=0,real=0,sumaent=0,numdni=0,numnie=0,nummat=0,
  nummatold=0,nummatc=0,numss=0,numings=0;
%%
  int i;
{enter} {ent++;sscanf(yytext,"%d",&i);sumaent += i; printf("Entero -> %s\n",yytext);}
({real1}|{real2}) {real++;printf("Real -> %s\n",yytext);}
{dni} {numdni++;printf("DNI -> %s\n",yytext);}
{nie} {numnie++;printf("NIE -> %s\n",yytext);}
{matricula} {nummat++;printf("Matricula -> %s\n",yytext);}
{matricula_old} {nummatold++;printf("Matricula provincial -> %s\n",yytext);}
{matricula_ciclomotor} {nummatc++;printf("Matricula de ciclomotor -> %s\n",yytext);}
{ss} {numss++;printf("Numero de Seguridad Social -> %s\n",yytext);}
{receta}  {numings++;printf("Ingrediente para la tortilla de patatas -> %s.\n",yytext);}
.|\n  {;}
%%
yywrap()
  {printf("******************************************\n \
          Numeros enteros -> %d\n \
          Numeros reales -> %d\n \
          Suma de enteros -> %d\n \
          DNI -> %d\n \
          NIE -> %d\n \
          Matriculas -> %d\n \
          Matriculas provinciales -> %d\n \
          Matriculas de ciclomotor -> %d\n \
          Numeros de Seguridad Social -> %d\n \
          Ingredientes para la tortilla de patatas -> %d", \
          ent,real,sumaent,numdni,numnie,nummat,nummatold,nummatc,numss,numings);\
          return 1;}
