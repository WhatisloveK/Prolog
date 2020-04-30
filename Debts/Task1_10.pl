searcher([], Reached,Reached).

searcher([ H | T ], Reached, R) :-
    (
        member(H, Reached); 
        H < 0 
    ),
    searcher(T, Reached,R),!.

searcher([ H | T ], Reached,R) :-
        append([H], Reached, NewReached),
        searcher(T,NewReached,R),!.

main(List, Count) :-
    searcher(List,[], UniqueElements),
    length(UniqueElements, Count).
    