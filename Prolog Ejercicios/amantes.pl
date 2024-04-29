% Hechos
ama(juan,ana).
ama(ana,miguel).
ama(luis,isabel).
ama(miguel,ana).
ama(laura,juan).
ama(isabel,luis).

% Regla para determinar si dos personas se aman mutuamente
amantes(X, Y) :- ama(X, Y), ama(Y, X).

% Consultas y respuestas
% ¿A quién ama "Juan"?
?- ama(juan, X).
% Respuesta: X = ana.

% ¿Quién ama a "Ana"?
?- ama(X, ana).
% Respuesta: X = juan ;
%            X = miguel.

% ¿Quién ama a alguien?
?- ama(X, _).
% Respuesta: X = juan ;
%            X = ana ;
%            X = luis ;
%            X = miguel ;
%            X = laura ;
%            X = isabel.

% ¿Quién es amado por alguien?
?- ama(_, X).
% Respuesta: X = ana ;
%            X = miguel ;
%            X = isabel ;
%            X = ana ;
%            X = juan ;
%            X = luis.

% ¿Quiénes se aman mutuamente?
?- amantes(X, Y).
% Respuesta: X = ana, Y = miguel ;
%            X = miguel, Y = ana.

% ¿Quién ama sin ser correspondido?
?- ama(X, Y), \+ ama(Y,X).
% Respuesta: X = juan, Y = ana ;
%            X = ana, Y = miguel ;
%            X = luis, Y = isabel ;
%            X = laura, Y = juan ;
%            X = isabel, Y = luis.

