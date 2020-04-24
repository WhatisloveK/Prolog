find_indexes(CurrentIndex,LengthOfList, List,[CurrentIndex]) :-
    CurrentIndex is LengthOfList,   
    Previous is CurrentIndex-1,
    nth0(Previous, List, PreviousElement),
    nth0(CurrentIndex, List, CurrentElement),
    PreviousElement < CurrentElement.

find_indexes(LengthOfList,LengthOfList, _,[]).

find_indexes(CurrentIndex,LengthOfList, List,[CurrentIndex|Tail]) :-
    CurrentIndex is 0,
    Next is CurrentIndex+1,
    nth0(Next, List, NextElement),
    nth0(CurrentIndex, List, CurrentElement),
    NextElement < CurrentElement,
    find_indexes(Next, LengthOfList, List,Tail),!.

find_indexes(CurrentIndex,LengthOfList, List,[CurrentIndex|Tail]) :-
    Previous is CurrentIndex - 1,
    nth0(Previous, List, PreviousElement),
    nth0(CurrentIndex, List, CurrentElement),
    PreviousElement < CurrentElement,
    Next is CurrentIndex + 1,
    nth0(Next, List, NextElement),
    nth0(CurrentIndex, List, CurrentElement),
    NextElement < CurrentElement,
    find_indexes(Next, LengthOfList, List,Tail),!.


find_indexes(CurrentIndex,LengthOfList,List, Indexes) :-
    NextElem is CurrentIndex + 1,
    find_indexes(NextElem, LengthOfList,List, Indexes),!. 


get_list(List, Indexes, Current, LengthOfList, [(CurrentElement,CurrentIndex)|Tail]) :-
    Current < LengthOfList,
    nth0(Current, Indexes, CurrentIndex),
    nth0(CurrentIndex, List, CurrentElement),
    Next is Current+1,
    get_list(List, Indexes, Next, LengthOfList, Tail),!.

get_list(List, Indexes, Current, LengthOfList, [(CurrentElement,CurrentIndex)]) :-
    Current is LengthOfList,
    nth0(Current, Indexes, CurrentIndex),
    nth0(CurrentIndex, List, CurrentElement).

main(List,Result):-
    length(List, Int),
    ListLength is Int - 1,
    find_indexes(0, ListLength, List, Indexes),
    length(Indexes, Int2),
    IndexesLength is Int2 - 1,
    get_list(List, Indexes, 0, IndexesLength, Result).

    