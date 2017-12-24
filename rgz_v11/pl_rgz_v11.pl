% Автор:
% Дата: 10.12.2017

split1([],CHET,NECHET):-  print(CHET), print(NECHET), !.
split1([H|T], CHET, NECHET):- D is H mod 2, (D =:= 0) -> split1(T, [H|CHET], NECHET); split1(T, CHET, [H|NECHET]).

goal:- writeln('Vvedite spisok'), read(L), split1(L, [], []).