split([],X,Y,Z,[X,Y,Z]).

split([A|Tail],X,Y,Z,[XAndA,Y,Z]) :-
    length(Tail,Int),
    Int is 0,
    append(X, [A], XAndA),!.

split([A,B|Tail],X,Y,Z,[XAndA,YAndB,Z]) :-
    length(Tail,Int),
    Int is 0,
    append(X, [A], XAndA),
    append(Y, [B], YAndB),!.

split([A,B,C|Tail],X,Y,Z,Result) :-
    length(Tail,Int),
    Int>0,
    append(X, [A], XAndA),
    append(Y, [B], YAndB),
    append(Z, [C], ZAndC),
    split(Tail, XAndA, YAndB, ZAndC, Result),!.
    
main(List,Result) :-
    split(List,[],[],[],Result).