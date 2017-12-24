% Автоr:
% Дата: 10.12.2017

goal:- writeln('Enter list:'), read(L), writeln('Enter number:'), read(N), v(L, N, []).

if([H|T],N,I):-(H =:= N ) -> I is 1; I is 0.

if1([H|T],N,I1):- (H =\= N) -> I1 is 1; I1 is 0.

v([],_,L1):-reverse(L1, L2), print(L2).
v([H|T],N,L1):- if(T,N,I),if1([H|T],N,I1), (I =:= 1, I1 =:= 1) -> v(T,N,L1); v(T,N,[H|L1]).
