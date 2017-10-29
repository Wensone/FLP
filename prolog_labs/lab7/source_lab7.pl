goal:-open('q.txt', read, IN), set_input(IN),
tell('res.txt'), quest(IN), close(IN), told.

quest(IN):-read_stream_to_codes(IN, L), parse(L), !.

parse([]):- write("\n"), !.
parse([I, N, G, S|T]):- I =:= 105, N =:= 110, G =:= 103 , (S < 61 ; S > 122), write("ed"), char_code(C, S), write(C), parse(T).
parse([H|T]):-char_code(C, H), write(C), parse(T).
