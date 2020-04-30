searcher(0, Counter, Counter).


searcher(Number, Counter ,R) :-
        Current is Number div 2,
        IncrementedCounter is Counter + 1,
        searcher(Current, IncrementedCounter, R),!.

main(Number, NumberOfSignificantDigits) :-
    searcher(Number, 0, NumberOfSignificantDigits),!.
    