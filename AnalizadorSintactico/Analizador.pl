% Autor:  Daniel Lopez Moreno 03217279Q
%         Alvaro de las Heras Fernandez 03146833L
%         Samuel Garcia Gonzalez 09085497Z
% Fecha: 14/03/2019

:-consult('draw.pl').
:-consult('Diccionario.pl').
:-consult('Gramatica.pl').

%Prueba de oraciones
test1:-  main(X,[el,hombre,come,una,manzana],[]),draw(X).
test2:-  main(X,[la,mujer,come,manzanas],[]),draw(X).
test3:-  main(X,['maría',come,una,manzana,roja],[]), draw(X).
test4:-  main(X,[juan,ama,a,'maría'],[]), draw(X).
test5:-  main(X,[el,gato,grande,come,un,'ratón',gris],[]), draw(X).
test6:-  main(X,[juan,estudia,en,la,universidad],[]), draw(X).
test7:-  main(X,[el,alumno,ama,la,universidad],[]), draw(X).
test8:-  main(X,[el,gato,come,ratones],[]), draw(X).
test9:-  main(X,[el,'ratón',que,'cazó',el,gato,era,gris],[]), draw(X).
test10:-  main(X,[la,universidad,es,grande],[]), draw(X).
test11:-  main(X,[el,hombre,grande,come,la,manzana,roja],[]), draw(X).
test12:-  main(X,[el,hombre,con,un,tenedor,grande,come,la,manzana,roja],[]), draw(X).
test13:-  main(X,[juan,y,'maría',comen,la,manzana,roja,con,un,tenedor,y,un,cuchillo],[]), draw(X).
test14:-  main(X,[ella,hace,la,'práctica',de,juan],[]), draw(X).
test15:-  main(X,[el,canario,de,juan,y,'maría',canta],[]), draw(X).
test16:-  main(X,[la,blanca,paloma,'alzó',el,vuelo],[]), draw(X).
test17:-  main(X,['está',muy,lejos,de,madrid],[]), draw(X).
test18:-  main(X,['él',es,lento,de,reflejos],[]), draw(X).
test19:-  main(X,[juan,habla,muy,claramente],[]), draw(X).
test20:-  main(X,[la,esperanza,de,vida,de,un,'niño',depende,de,su,lugar,de,nacimiento],[]), draw(X).
test21:-  main(X,[el,hombre,que,vimos,en,la,universidad,era,mi,profesor],[]), draw(X).
test22:-  main(X,[juan,que,es,muy,delicado,come,solamente,manzanas,rojas],[]), draw(X).
test23:-  main(X,[el,procesador,de,textos,que,es,una,herramienta,muy,potente,sirve,para,escribir,documentos],[]), draw(X).
test24:-  main(X,[juan,es,moreno,y,'maría',es,alta],[]), draw(X).
test25:-  main(X,[juan,recoge,la,mesa,mientras,'maría',toma,'café'],[]), draw(X).
test26:-  main(X,['compré',un,'pantalón',y,una,corbata,negros],[]), draw(X).
test27:-  main(X,[juan,y,hector,comen,patatas,fritas,y,beben,cerveza],[]), draw(X).
test28:-  main(X,[irene,canta,y,salta,mientras,juan,estudia],[]), draw(X).
test29:-  main(X,[irene,canta,y,salta,y,sonrie,alegre],[]), draw(X).
test30:-  main(X,[el,procesador,de,textos,es,una,herramienta,muy,potente,que,sirve,para,escribir,documentos,pero,es,bastante,lento],[]), draw(X).