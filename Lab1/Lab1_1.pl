bubblesort(InputList,SortList) :-
    swap(InputList,List) , ! ,
    bubblesort(List,SortList).
bubblesort(SortList,SortList).

swap([X,Y|List],[Y,X|List]) :- X > Y.
swap([Z|List],[Z|List1]) :- swap(List,List1).


take_first_n(N, [Head|Tail], [Head|FirstNElem]) :-  
    Z is N-1,
    Z>=0,
    take_first_n(Z, Tail, FirstNElem).
take_first_n(0, _, []).


filter([Head|Tail], ForDeletion, List) :- 
    member(Head, ForDeletion), 
    select(Head, ForDeletion, NewForDeletion),!,
    filter(Tail, NewForDeletion, List).

filter([Head|Tail], ForDeletion, [Head|List]) :- 
    not(member(Head, ForDeletion)), !,
    filter(Tail, ForDeletion, List).

filter(_,[],[]).


custom_filter(List,ForDeletion, Result):- 
    ((length(ForDeletion, Length), Length is 0)->
        Result is List;
        filter(List, ForDeletion, Result)).

start(List, N, Result) :- 
    bubblesort(List ,SortList),
    take_first_n(N, SortList, SortedNElem),
    custom_filter(List,SortedNElem, Result).