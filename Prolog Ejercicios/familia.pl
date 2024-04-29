% Hechos
hombre(antonio).
hombre(juan).
hombre(luis).
hombre(rodrigo).
hombre(ricardo).

mujer(isabel).
mujer(ana).
mujer(marta).
mujer(carmen).
mujer(laura).
mujer(alicia).

matrimonio(antonio, ana).
matrimonio(juan, carmen).
matrimonio(luis, isabel).
matrimonio(rodrigo, laura).

hijo(juan, antonio).
hijo(juan, ana).
hijo(rodrigo, antonio).
hijo(rodrigo, ana).
hijo(marta, antonio).
hijo(marta, ana).
hija(carmen, luis).
hija(carmen, isabel).
hijo(ricardo, juan).
hijo(ricardo, carmen).
hija(alicia, rodrigo).
hija(alicia, isabel).

% Regla para matrimonio reflexivo
matrimonio_reflexivo(X, Y) :- matrimonio(X, Y); matrimonio(Y, X).

% Reglas para obtener los nietos de una persona
nieto(Nieto, Abuelo) :- hijo(Nieto, Padre), hijo(Padre, Abuelo).
nieta(Nieta, Abuelo) :- hija(Nieta, Padre), hijo(Padre, Abuelo).

% Reglas para obtener los abuelos de una persona
abuelo(Abuelo, Nieto) :- nieto(Nieto, Abuelo).
abuela(Abuela, Nieto) :- nieta(Nieta, Abuela).

% Reglas para obtener los hermanos de una persona
hermano(Hermano, Persona) :-
    hombre(Hermano),
    hombre(Persona),
    padre(Padre, Hermano),
    padre(Padre, Persona),
    Hermano \= Persona.
hermana(Hermana, Persona) :-
    mujer(Hermana),
    hombre(Persona),
    padre(Padre, Hermana),
    padre(Padre, Persona),
    Hermana \= Persona.

% Reglas para obtener los tíos de una persona
tio(Tio, Sobrino) :-
    hermano(Tio, Padre),
    padre(Padre, Sobrino).
tia(Tia, Sobrino) :-
    hermana(Tia, Padre),
    padre(Padre, Sobrino).

% Reglas para obtener los primos de una persona
primo(Primo, Persona) :-
    hombre(Primo),
    padre(Padre1, Primo),
    tio(Padre1, Persona).
prima(Prima, Persona) :-
    mujer(Prima),
    padre(Padre1, Prima),
    tio(Padre1, Persona).

% Reglas para obtener los suegros de una persona
suegro(Suegro, Persona) :-
    matrimonio(Suegro, Hijo),
    hijo(Persona, Hijo).
suegra(Suegra, Persona) :-
    matrimonio(Suegra, Hijo),
    hijo(Persona, Hijo).

% Consultas y resultados
/*
?- nieto(Nieto, antonio).
Nieto = juan ;
Nieto = rodrigo ;
Nieto = marta.

?- abuelo(antonio, Nieto).
Nieto = juan ;
Nieto = rodrigo ;
Nieto = marta.

?- hermano(juan, Hermano).
Hermano = rodrigo ;
Hermano = marta.

?- tio(Tio, carmen).
Tio = juan ;
Tio = rodrigo ;
Tio = marta.

?- primo(Primo, carmen).
Primo = ricardo ;
Primo = alicia.

?- suegro(Suegro, alicia).
Suegro = juan.
*/
