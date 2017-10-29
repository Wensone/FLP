main:-read(L), read(M), rgz(L, M).


rgz([], _, _):- !.
rgz(L, M):- del(L, M, M, R, K), rgz(R, M, K).
rgz(L, M, I):- del(L, I, M, R, K), rgz(R, M, K).


del([], I, MM, [], I):- !.
del([H|T], I, M, [H|R], II):- I =\= 1, I1 is I - 1, del(T, I1, M, R, II), !.
del([H|T], I, M, R, II):- I =:= 1, I1 is M, writeln(H), del(T, I1, M, R, II), !.