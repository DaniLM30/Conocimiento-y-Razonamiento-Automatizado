% Autor:  Daniel Lopez Moreno 03217279Q
%         Alvaro de las Heras Fernandez 03146833L
%         Samuel Garcia Gonzalez 09085497Z
% Fecha: 14/03/2019

%Determinantes
determinante(det(X),Y,Z) --> [X],{det(X,Y,Z)}.
det(el,masculino,singular).
det(la,femenino,singular).
det(un,masculino,singular).
det(una,femenino,singular).
det(su,neutro,singular).
det(mi,neutro,singular).

%Nombres
nombre(n(X),Y,Z) --> [X],{n(X,Y,Z)}.
n(hombre,masculino,singular).
n(mujer,femenino,singular).
n(manzana,femenino,singular).
n(gato,masculino,singular).
n('ratón',masculino,singular).
n(ratones,masculino,plural).
n(alumno,masculino,singular).
n(universidad,femenino,singular).
n(tenedor,masculino,singular).
n(cuchillo,masculino,singular).
n('práctica',femenino,singular).
n(canario,masculino,singular).
n(paloma,femenino,singular).
n(vuelo,masculino,singular).
n(reflejos,masculino,singular).
n(esperanza,femenino,singular).
n(vida,femenino,singular).
n('niño',masculino,singular).
n(lugar,masculino,singular).
n(nacimiento,masculino,singular).
n(profesor,masculino,singular).
n(manzanas,femenino,plural).
n(procesador,masculino,singular).
n(textos,masculino,plural).
n(herramienta,femenino,singular).
n(documentos,masculino,plural).
n(mesa,femenino,singular).
n('café',masculino,singular).
n('pantalón',masculino,singular).
n(corbata,femenino,singular).
n(patatas,femenino,plural).
n(cerveza,femenino,singular).
n(escribir,masculino,singular).

%Nombres propios
nombre_prop(nprop(X),Y,Z) --> [X],{nprop(X,Y,Z)}.
nprop(juan,masculino,singular).
nprop('maría',femenino,singular).
nprop(madrid,neutro,singular).
nprop(hector,masculino,singular).
nprop(irene,femenino,singular).

%Pronombres
pronombre(pron(X),Y,Z,W) --> [X],{pron(X,Y,Z,W)}.
pron(yo,neutro,singular,primera).
pron(ella,femenino,singular,tercera).
pron('él',masculino,singular,tercera).
%Pronombre que
pron(que,neutro,neutro,neutro).

%Verbos
verbo(v(X),Y,Z) --> [X], {v(X,Y,Z)}.
v(ama,singular,tercera).
v(comen,plural,tercera).
v(come,singular,tercera).
v(estudia,singular,tercera).
v(hace,singular,tercera).
v(canta,singular,tercera).
v('alzó',singular,tercera).
v('está',singular,tercera).
v(es,singular,tercera).
v(habla,singular,tercera).
v(depende,singular,tercera).
v(vimos,plural,primera).
v(era,singular,tercera).
v(sirve,singular,tercera).
v(recoge,singular,tercera).
v(toma,singular,tercera).
v('compré',singular,primera).
v(beben,plural,tercera).
v(canta,singular,tercera).
v(salta,singular,tercera).
v(sonrie,singular,tercera).
v('cazó',singular,tercera).

%Adjetivos
adjetivo(adj(X),Y,Z) --> [X],{adj(X,Y,Z)}.
adj(roja,femenino,singular).
adj(negro,masculino,singular).
adj(grande,neutro,singular).
adj(gris,neutro,singular).
adj(pequeno,masculino,singular).
adj(blanca,femenino,singular).
adj(lento,masculino,singular).
adj(delicado,masculino,singular).
adj(rojas,femenino,plural).
adj(potente,neutro,singular).
adj(moreno,masculino,singular).
adj(alta,femenino,singular).
adj(negros,masculino,plural).
adj(fritas,femenino,plural).
adj(alegre,neutro,singular).

%Adverbios
adverbio(adv(X)) --> [X],{adv(X)}.
adv(muy).
adv(lejos).
adv(claramente).
adv(solamente).
adv(mientras).
adv(bastante).

%Conjunciones
conjuncion(con(X)) --> [X],{con(X)}.
con(y).
con(pero).

%Preposiciones
preposicion(prep(X)) --> [X],{prep(X)}.
prep(a).
prep(ante).
prep(bajo).
prep(cabe).
prep(con).
prep(contra).
prep(de).
prep(desde).
prep(durante).
prep(en).
prep(entre).
prep(hacia).
prep(hasta).
prep(mediante).
prep(para).
prep(por).
prep('según').
prep(sin).
prep(sobre).
prep(tras).
prep(versus).
prep('vía').
