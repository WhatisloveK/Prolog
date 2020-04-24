divisible(X,Y) :- 0 is X mod Y, !.

divisible(X,Y) :- X > Y+1, divisible(X, Y+1).

isPrime(2) :- true,!.
isPrime(X) :- X < 2,!,false.
isPrime(X) :- not(divisible(X, 2)).

% next_prime(X, Res) :- 
%     not(X==Res),
%     isPrime(Res), !,
%     next_prime(X, Res1),
%     Res1 is Res + 1.
% next_prime(X, Res) :- Res.

prime_generator(Current,Max,[]):-
    Current > Max,!.
prime_generator(Current, Max, [Current | R]):-
    isPrime(Current),
    Next is Current + 1,
    prime_generator(Next, Max, R),!.
prime_generator(Current, Max,  R):-
    Next is Current + 1,
    prime_generator(Next, Max, R),!.

iterator([H|T]):-
    write(H),
    iterator(T).
    

