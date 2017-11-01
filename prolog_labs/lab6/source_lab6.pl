splitl(M, M2, [H|T], [H|T1], L2, L3):-H < M, splitl(M, M2, T, T1, L2, L3).
splitl(M, M2, [H|T], L1, [H|T2], L3):-splitl(M, M2, T, L1, T2, L3), H>=M, H=<M2.
splitl(M, M2, [H|T], L1, L2, [H|T3]):-splitl(M, M2, T, L1, L2, T3), H>M2.
splitl(_,_,[],[],[],[]).
goal1:-writeln('Spisok. Delitel.:'), read(S), read(R1), read(R2), swap(R1, R2, S).

swap(A, B, S):- A > B, splitl(B, A, S, S1, S2, S3), writeln(S), writeln(S1), writeln(S2), writeln(S3).
swap(A, B, S):- A < B, splitl(A, B, S, S1, S2, S3), writeln(S), writeln(S1), writeln(S2), writeln(S3).
swap(A, B, S):- A =:= B, writeln("Incorrect"), !.

max(A,B,A) :- B<A.
max(A,B,B) :- A=<B.
min_elt([X],X).
min_elt([H|T],M) :- min_elt(T,M1),max(H,M1,M).
num_elt([],_,_,[]).
num_elt([P|T],P,N,[N|R]) :- N1 is N+1,num_elt(T,P,N1,R).
num_elt([P|T],Q,N,R)     :- N1 is N+1,num_elt(T,Q,N1,R).
goal2 :-writeln('Vvedite spisok:'), read(X), min_elt(X,M), num_elt(X,M,1,R), writeln(R).

goal3 :- writeln('Vash spisok:'), read(S), maxh(S,COUNT), print(S, COUNT, R), writeln(R).

hertz([], _, 0).
hertz([H|T], X, COUNT):- X =:= H, hertz(T, X, COUNT1), COUNT is COUNT1 + 1.
hertz([H|T], X, COUNT):- X =\= H, hertz(T, X, COUNT).

maxh([], 0).
maxh([H|T],MAX):-maxh(T, MAX1), hertz([H|T], H, COUNT), max(COUNT, MAX1, MAX).

print([], _, []).
print([H|T], MAXH, [H|R1]):- hertz([H|T], H, COUNT), COUNT =:= MAXH, print(T, MAXH, R1).
print([H|T], MAXH, R1):- hertz([H|T], H, COUNT), COUNT =\= MAXH, print(T, MAXH, R1).
