hombre(guillermo)
hombre(jose)
hombre(manuel)
hombre(ramon)
hombre(jesus)
hombre(matias)
hombre(luis)
hombre(alejandro)
hombre(gerardo)
hombre(andre)

mujer(xochitl)
mujer(diana)
mujer(jimena)
mujer(rosa)
mujer(amelia)
mujer(ilda)
mujer(daniela)


progenitor(rosa,guillermo)
progenitor(rosa,ramon)
progenitor(rosa,manuel)
progenitor(rosa,jesus)
progenitor(jose,guillermo)
progenitor(jose,ramon)
progenitor(jose,manuel)
progenitor(jose,jesus)
progenitor(xochitl,matias)
progenitor(xochitl,luis)
progenitor(xochitl,diana)
progenitor(xochitl,jimena)
progenitor(guillermo,matias)
progenitor(guillermo,luis)
progenitor(guillermo,diana)
progenitor(guillermo,jimena)
progenitor(ramon,gerardo)
progenitor(ilda,gerardo)
progenitor(jesus,alejandro)
progenitor(jesus,daniela)
progenitor(jesus,andre)
progenitor(amelia,daniela)
progenitor(amelia,alejandro)
progenitor(amelia,andre)

pareja(rosa,jose)
pareja(guillermo,xochitl)
pareja(amelia,jesus)
pareja(ramon,ilda)

padre(X,Y):-hombre(X),progenitor(X,Y).
madre(X,Y):-mujer(X),progenitor(X,Y).
hermanos(X,Y):-progenitor(Z,X),progenitor(Z,Y), not(X==Y).
hermano(X,Y):-hombre(X),hermanos(X,Y).
hermana(X,Y):-mujer(X),hermanos(X,Y).
esposo(X,Y):-pareja(X,Y),hombre(X).
esposa(X,Y):-pareja(X,Y),mujer(X).
suegro(X,Y):-padre(X,Z),pareja(Y,Z).
suegra(X,Y):-madre(X,Z),esposos(Y,Z).
yerno(X,Y):-suegro(Y,X);suegra(Y,X),hombre(X).
nuera(X,Y):-suegro(Y,X);suegra(Y,X),mujer(X).
cuñados(X,Y):-((pareja(X,Z),hermanos(Z,Y));(pareja(Y,Z),hermanos(Z,X))).
cuñado(X,Y):-cuñados(X,Y),hombre(X).
cuñada(X,Y):-cuñados(X,Y),mujer(X).
abuelo(X,Y):-progenitor(Z,Y),padre(X,Z).
abuela(X,Y):-progenitor(Z,Y),madre(X,Z).
nieto(X,Y):-progenitor(Y,Z),progenitor(Z,X),hombre(X).
nieta(X,Y):-progenitor(Y,Z),progenitor(Z,X),mujer(X).
tio(X,Y):-progenitor(Z,Y),(hermano(X,Z);cuñado(X,Z)).
tia(X,Y):-progenitor(Z,Y),(hermana(X,Z);cuñada(X,Z)).
primo(X,Y):-progenitor(Z,X),progenitor(W,Y),hermanos(Z,W),hombre(X).
prima(X,Y):-progenitor(Z,X),progenitor(W,Y),hermanos(Z,W),mujer(X).