% Predicado para calcular el mínimo de dos números
minimo(A, B, Minimo) :-
    Minimo is min(A, B).

% Predicado para calcular el área de un círculo
area_circulo(Radio, Area) :-
    Area is pi * Radio ** 2.

% Predicado para calcular el área de un trapecio
area_trapecio(BaseMayor, BaseMenor, Altura, Area) :-
    Area is ((BaseMayor + BaseMenor) * Altura) / 2.

% Predicado para calcular el producto de los números comprendidos entre dos dados
producto_entre_numeros(A, B, Producto) :-
    calcular_producto(A, B, Producto).

% Caso base: si A es mayor que B, el producto es 1
calcular_producto(A, B, 1) :-
    A > B.
% Caso base: si A y B son iguales, el producto es A (o B)
calcular_producto(A, B, A) :-
    A =:= B.
% Caso recursivo: calcula el producto desde A hasta B
calcular_producto(A, B, Producto) :-
    A < B,
    A1 is A + 1,
    calcular_producto(A1, B, ProductoParcial),
    Producto is A * ProductoParcial.

% Consultas de ejemplo
/*
?- minimo(5, 8, Minimo).
Minimo = 5.

?- area_circulo(3, Area).
Area = 28.274333882308138.

?- area_trapecio(4, 7, 5, Area).
Area = 27.5.

?- producto_entre_numeros(2, 5, Producto).
Producto = 120.
*/
