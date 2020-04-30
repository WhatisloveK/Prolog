fillList(SquareN, Previous, Current, [Current | Result]) :-
    Next is Previous + Current,
    Current < SquareN,
    fillList(SquareN, Current, Next, Result),!.

fillList(_,_,_,[]).

main(N, Result) :-
    SquareN is N * N,
    fillList(SquareN, 0, 1, Result).