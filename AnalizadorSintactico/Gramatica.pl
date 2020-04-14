% Author:
% Date: 28/03/2019

% Autor:  Daniel Lopez Moreno 03217279Q
%         Alvaro de las Heras Fernandez 03146833L
%         Samuel Garcia Gonzalez 09085497Z
% Fecha: 14/03/2019

%Main
main(X,Y,Z):- comprobarDiccionario(Y,0,R),(R>=2 ->
        %Si hay mas de dos verbos te lleva a la compuesta, si falla sera concordancia
        (oracion_c(X,Y,Z) ->true ; write('Fallo De Concordancia'),false);
        %Si hay menos de dos verbos te lleva a la simple, si falla sera concordancia
        (oracion(X,Y,Z) -> true ; write('Fallo De Concordancia'),false)).

%Comprobar Diccionario
%Todas las categorias que puede tener una palabra unidas por OR
palabra(X):-adv(X);adj(X,_,_);con(X);prep(X);v(X,_,_);pron(X,_,_,_);n(X,_,_);nprop(X,_,_);det(X,_,_).
%Metodo para contar verbos y comprobar el diccionario
contarVerbos(X,Y,P,R):- v(X,_,_)->succ(P,P2),comprobarDiccionario(Y,P2,R);comprobarDiccionario(Y,P,R).
comprobarDiccionario([],T,T).
%Comprueba la palabra y cuenta el verbo si no esta imprime falso
comprobarDiccionario([X|Y],T,R):-palabra(X)->contarVerbos(X,Y,T,R);
                            write('Hay palabras que no estan presentes en el diccionario: '),write(X),false.

%Oracion
oracion(O)-->oracion_aux(O,_,_).
%Las oraciones siempre contendran un grupo verbal o seran compuestas
oracion_aux(o(GN,GV),_,_) --> g_nominalP(GN,NUM1,PER1,GEN1), g_verbal(GV,NUM2,PER2,GEN2),{conc_Num(NUM1,NUM2)},{conc_Per(PER1,PER2)},{conc_Gen(GEN1,GEN2)},!.
oracion_aux(o(GV),NUM,PER) --> g_verbal(GV,NUM,PER,_),!.
oracion_aux(OC,NUM,PER) --> oracion_comp(OC,NUM,PER).

%Oracion Compuesta
oracion_c(O) --> oracion_comp(O,_,_).
%Las oraciones compuestas podran ser subordinadas, con todas sus variantes
oracion_comp(ocomp(OS,O),NUM2,PER2) --> oracion_sub(OS,NUM1,PER1),oracion_aux(O,NUM2,PER2),{conc_Num(NUM1,NUM2)},{conc_Per(PER1,PER2)},!.
oracion_comp(ocomp(GV,OS),NUM1,PER1) -->  g_verbal(GV,NUM1,PER1,_),oracion_sub(OS,_,_),!.
oracion_comp(ocomp(o(GN,GV),OS),NUM1,PER1) -->  g_nominalP(GN,NUM1,PER1,_),g_verbal(GV,NUM2,PER2,_),{conc_Num(NUM1,NUM2)},{conc_Per(PER1,PER2)},oracion_sub(OS,_,_),!.
%Tambien podran ser coordinadas
oracion_comp(ocomp(OC),NUM,PER) --> oracion_coor(OC,NUM,PER),!.

%Oracion Coordinada
%Podran tener grupo nominal y verbal o grupo verbal más una oracion
oracion_coor(ocoor(o(GN,GV),C,O2),NUM1,PER1) --> g_nominalP(GN,NUM1,PER1,GEN1),g_verbal(GV,NUM2,PER2,GEN2),conjuncion(C),{conc_Num(NUM1,NUM2)},{conc_Per(PER1,PER2)},{conc_Gen(GEN1,GEN2)},oracion_aux(O2,NUM2,PER2).
oracion_coor(ocoor(o(GV),C,O2),NUM1,PER1) --> g_verbal(GV,NUM1,PER1,_),conjuncion(C),oracion_aux(O2,NUM2,PER2),{conc_Num(NUM1,NUM2)},{conc_Per(PER1,PER2)}.

%Oracion Subordinada
%La subordinada de relativo estan indicadas por el pronombre que
oracion_sub(osub(GN,P,GV),NUM1,PER1) --> g_nominalP(GN,NUM1,PER1,GEN1),pronombre(P,_,_,_),g_verbal(GV,_,_,GEN2),{conc_Gen(GEN1,GEN2)}.
oracion_sub(osub(P,O),NUM,PER) --> pronombre(P,_,_,_),oracion_aux(O,NUM,PER).
%Las subordinadas adverbiales por un adverbio
oracion_sub(osub(A,GN,GV),NUM1,PER1) --> adverbio(A),g_nominalP(GN,NUM1,PER1,_),g_verbal(GV,NUM2,PER2,_),{conc_Num(NUM1,NUM2)},{conc_Per(PER1,PER2)}.

%Grupo Nominal
%Grupo nominal compuesto por una coordinacion
g_nominalP(gncomp(GN,C,GN2,A),'plural','tercera',GEN1) --> g_nominal(GN,_,_,GEN1),conjuncion(C),g_nominal(GN2,_,_,_),adjetivo(A,_,NUM3),{conc_Num('plural',NUM3)}.
g_nominalP(gncomp(GN,C,GN2),'plural','tercera',GEN1) --> g_nominal(GN,_,_,GEN1),conjuncion(C),g_nominal(GN2,_,_,_).
g_nominalP(GN,NUM,PER,GEN) --> g_nominal(GN,NUM,PER,GEN).
%El grupo nominal podra tener una gran variacion de posiciones combinadas con diferentes grupos que tendran que concordar en algunos casos
g_nominal(gn(N,A),NUM2,'tercera',GEN1) --> nombre(N,GEN1,NUM1), g_adjetival(A,GEN2,NUM2),{conc_Gen(GEN1,GEN2)},{conc_Num(NUM1,NUM2)}.
g_nominal(gn(N,N2),NUM2,'tercera',GEN2) --> nombre(N,_,_),nombre(N2,GEN2,NUM2).
g_nominal(gn(D,N,GP),NUM2,'tercera',GEN2) --> determinante(D,GEN1,NUM1), nombre(N,GEN2,NUM2),g_preposicional(GP),{conc_Gen(GEN1,GEN2)},{conc_Num(NUM1,NUM2)}.
g_nominal(gn(N,GP),NUM,'tercera',GEN) --> nombre(N,GEN,NUM),g_preposicional(GP).
g_nominal(gn(N),NUM,'tercera',GEN) --> nombre(N,GEN,NUM).
g_nominal(gn(N),NUM,'tercera',GEN) --> nombre_prop(N,GEN,NUM).
g_nominal(gn(N),NUM,PER,GEN) --> pronombre(N,GEN,NUM,PER).
g_nominal(gn(D,N,A),NUM2,'tercera',_) --> determinante(D,GEN1,NUM1),nombre(N,GEN2,NUM2), g_adjetival(A,GEN3,NUM3),{conc_Gen(GEN1,GEN2)},{conc_Gen(GEN2,GEN3)},{conc_Num(NUM1,NUM2)},{conc_Num(NUM2,NUM3)}.
g_nominal(gn(D,N,A,GP),NUM2,'tercera',GEN2) --> determinante(D,GEN1,NUM1),nombre(N,GEN2,NUM2), adjetivo(A,GEN3,NUM3),g_preposicional(GP),{conc_Gen(GEN1,GEN2)},{conc_Gen(GEN2,GEN3)},{conc_Num(NUM1,NUM2)},{conc_Num(NUM2,NUM3)}.
g_nominal(gn(A,N),NUM2,'tercera',GEN2) --> adjetivo(A,GEN1,NUM1),nombre(N,GEN2,NUM2),{conc_Gen(GEN1,GEN2)},{conc_Num(NUM1,NUM2)}.
g_nominal(gn(D,A,N),NUM3,'tercera',GEN3) --> determinante(D,GEN1,NUM1),adjetivo(A,GEN2,NUM2),nombre(N,GEN3,NUM3),{conc_Gen(GEN1,GEN2)},{conc_Gen(GEN2,GEN3)},{conc_Num(NUM1,NUM2)},{conc_Num(NUM2,NUM3)}.
g_nominal(gn(D,N),NUM2,'tercera',GEN2) --> determinante(D,GEN1,NUM1), nombre(N,GEN2,NUM2),{conc_Gen(GEN1,GEN2)},{conc_Num(NUM1,NUM2)}.

%Grupo Adjetival
%Posibles combinaciones del grupo adjetival
g_adjetival(gadj(ADV,A),GEN,NUM)-->adverbio(ADV),adjetivo(A,GEN,NUM).
g_adjetival(gadj(A,GP),GEN,NUM)--> adjetivo(A,GEN,NUM),g_preposicional(GP).
g_adjetival(gadj(A),GEN,NUM)--> adjetivo(A,GEN,NUM).

%Grupo Adverbial
%Posibles combinaciones del grupo adverbial
g_adverbial(gadv(AD,GN)) -->adverbio(AD),g_nominalP(GN,_,_,_).
g_adverbial(gadv(AD,GP)) -->adverbio(AD),g_preposicional(GP).
g_adverbial(gadv(AD,AD2,GP)) -->adverbio(AD),adverbio(AD2),g_preposicional(GP).
g_adverbial(gadv(AD,AD2)) -->adverbio(AD),adverbio(AD2).
g_adverbial(gadv(AD)) -->adverbio(AD).

%Grupo Proposicional
g_preposicional(gprep(P,GN)) --> preposicion(P),g_nominalP(GN,_,_,_).

%Grupo Verbal
%Posibles combinaciones del grupo verbal
g_verbal(gv(V,GP),NUM,PER,'neutro') --> verbo(V,NUM,PER),g_preposicional(GP).
g_verbal(gv(V,GN),NUM1,PER1,'neutro') --> verbo(V,NUM1,PER1),g_nominalP(GN,_,_,_),!.
g_verbal(gv(V,A),NUM1,PER1,GEN2) --> verbo(V,NUM1,PER1),g_adjetival(A,GEN2,NUM2),{conc_Num(NUM1,NUM2)}.
g_verbal(gv(V,A),NUM,PER,'neutro') --> verbo(V,NUM,PER),g_adverbial(A).
g_verbal(gv(V),NUM,PER,'neutro') --> verbo(V,NUM,PER).

%Concordancia de genero y numero
conc_Gen(GEN1,GEN2):- GEN1='neutro';GEN2='neutro';GEN1=GEN2.
conc_Num(NUM1,NUM2):- NUM1='neutro';NUM2='neutro';NUM1=NUM2.
conc_Per(PER1,PER2):- PER1='neutro';PER2='neutro';PER1=PER2.
