
goal2:-read(A), read(B), sum(A, B, 0).
sum(A, B, S):-A @> B, writeln(S), !.
sum(A, B, S):-S1 is S + A, A1 is A + 1, sum(A1, B, S1).
%1
swap(A, B):-(A @> B -> nechet(B, A); nechet(A, B)).
goal1:-read(A), read(B), swap(A, B).
nechet(A, B):-A @> B, !.
nechet(A, B):-B mod 2 =\= 0, writeln(B), B1 is B - 1, nechet(A, B1).
nechet(A, B):-B mod 2 =:= 0, B1 is B - 1, nechet(A, B1).

goal3:-read(X), find_min(X, 10, 9).
find_min(X, MIN, NUMB):-X =:= 0, NUMB =< MIN, writeln(NUMB).
find_min(X, MIN, NUMB):-X =:= 0, NUMB > MIN, writeln(MIN).
find_min(X, MIN, NUMB):-NUMB < MIN, NUMB1 is X mod 10, X1 is X // 10, find_min(X1, NUMB, NUMB1).
find_min(X, MIN, NUMB):-NUMB1 is X mod 10, X1 is X // 10, find_min(X1, MIN, NUMB1).
   %4
input:-repeat, read(X), fib(X, NUMB), writeln(NUMB), !.
fib(0, 1):-!.
fib(1, 1):-!.
fib(X, NUMB):-X1 is X - 1, X2 is X - 2, fib(X1, A), fib(X2, B), NUMB is A + B.