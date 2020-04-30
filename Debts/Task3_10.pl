evaluateExpression(Element, Result) :-
    Result is (Element*Element*Element + 3*Element*Element + 2*Element) / 6.

fillList(N, N, []).

fillList(N, Current, [H|Result]) :-
    evaluateExpression(Current, H),
    NextCurrent is Current + 1,
    fillList(N, NextCurrent, Result),!.

main(N, Result) :-
    Next is N + 1,
    fillList(Next, 1, Result).