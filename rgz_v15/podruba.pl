% Автор:
% Дата: 26.11.2017
:- dynamic(base1/6).

file(base1, csv, 'D:/flp-labs-master/prolog_labs/lab7/baza.txt').
file(base1, base, 'D:/flp-labs-master/prolog_labs/lab7/b1.txt').

perform_vse([]).
perform_vse([row(N1, N2, N3, N4, N5,N6)|T]):-
       assert(base1(N1,N2,N3,N4, N5, N6)),
       !,
       perform_vse(T).


perform_vstav:-
       writeln("izdanie:"),read(N1),writeln("avtor:"),read(N2),writeln("god:"),read(N3), writeln("god:"),read(N4),   writeln("god:"),read(N5),writeln("god:"),read(N6),
       assert(base1(N1,N2,N3,N4,N5,N6)).




importbase:-
file(base1, csv, File),
csv_read_file(File, RowList, [ separator(0';)]),
abolish(base1/6),
perform_vse(RowList),!.




load_base:-
    file(base1, base, File),
    consult(File).



 prosmotr:-
    forall( base1(N1,N2,N3,N4,N5,N6),
        (write(N1),write(" "),write(N2),write(" "),write(N3),write(" "),write(N4),write(" "),write(N5),write(" "),writeln(N6))
        ).

 dobavlenie:- perform_vstav,writeln("eshe? y/n"),read(X),char_code(X, S),S=:=121,dobavlenie.

 prosmotrcrit:- lol.
 lol:- base1(X,Y,Z,X1,Y1,Z1),hertz([Y,Z,X1,Y1,Z1],5,COUNT),Y>3,Z>3,X1>3,Y1>3,Z1>3,COUNT>2,
 write('kniga'),writeln(X),fail.


countl([],_,Res, Res1).
countl([Head|Tail], Num, Res, Result) :-
    Head = Num,
    NewRes is Res + 1,
    countl(Tail, Num, NewRes, Result);

    countl(Tail, Num, Res, Result).
    
    
hertz([], _, 0).
hertz([H|T], X, COUNT):- X =:= H, hertz(T, X, COUNT1), COUNT is COUNT1 + 1.
hertz([H|T], X, COUNT):- X =\= H, hertz(T, X, COUNT).
    



 save_base:-
    file(base1, base, F),
    tell(F),
    forall( base1(N1,N2,N3,N4,N5,N6),
        (writeq( base1(N1,N2,N3,N4,N5,N6)), write('.'), nl)
        ),
    told.

del_elt:- writeln("izdatelstvo:"),read(X),
writeln("autor:"),read(Y),
writeln("god:"),read(Z),
writeln("god:"),read(X1),
writeln("god:"),read(Y1),
writeln("god:"),read(Z1),
       file(base1, base, F),
    tell(F),
    forall( base1(N1,N2,N3,N4,N5,N6),
        (
        lolee(N1,N2,N3,N4,N5,N6,X,Y,Z,X1,Y1,Z1)
        )
        ),told,load_base.

 lolee(N1,N2,N3,N4,N5,N6,X,Y,Z,X1,Y1,Z1):- Z==N3,X==N1,Y==N2,Z1==N6,X1==N4,Y1==N5 ,!.
 lolee(N1,N2,N3,N4,N5,N6,X,Y,Z,X1,Y1,Z1):-
 (writeq( base1(N1,N2,N3,N4,N5,N6)), write('.'), nl).

mainMenu(prosmotr)  :- prosmotr .
mainMenu(dobavlenie)  :- dobavlenie .
mainMenu(save_base) :- save_base.
mainMenu(del_elt) :- del_elt .
mainMenu(prosmotrcrit) :- prosmotrcrit .
mainMenu :-
        write('Enter action: '),
        read(Action),
        mainMenu(Action),
        mainMenu.
