isInteger(X,M) :- between(0,M,X).

is_square(N) :-
    isInteger(X, N),
    N is X * X, !.

getPerfectSquareIndexList(LengthOfList, [H|Tail], [H|Result]) :-
    length(Tail, Length), 
    T is LengthOfList - Length - 1,
    LengthOfList \= T,
    is_square(T),!,
    getPerfectSquareIndexList(LengthOfList, Tail, Result).

getPerfectSquareIndexList(LengthOfList, [_|Tail], Result) :-
    length(Tail, Length), 
    T is LengthOfList - Length - 1,
    LengthOfList \= T,
    not(is_square(T)),!,
    getPerfectSquareIndexList(LengthOfList, Tail, Result).

getPerfectSquareIndexList(_,_,[]).


main(List,Result):-
    length(List, Int),
    getPerfectSquareIndexList(Int, List, Result).

    
