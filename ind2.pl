write_list([]):-!.
write_list([H|T]):-write(H),write(" "),write_list(T).


read_list(A,N):-r(A,[],0,N).
r(A,A,N,N):-!.
r(A,B,X,N):-X1 is X+1,read(D),append(B,[D],B1),r(A,B1,X1,N).


find_repeat([],_,0):-!.
find_repeat([H|T],El,K):-find_repeat(T,El,K1),H=El,K is K1+1.
find_repeat([_|T],El,K):-find_repeat(T,El,K).


delete([],B,B,_):-!.
delete([H|T],C,B,El):-H\=El,append(C,[H],C1),delete(T,C1,B,El),!.
delete([_|T],C,B,El):-delete(T,C,B,El).


ind2:-read(L),pred(L,[],L1,[],L2),write("\nL1: "),write(L1),write("\nL2: "),write(L2).

pred([],FL1,FL1,FL2,FL2):-!.
pred([H|T],L1,FL1,L2,FL2):-
    find_repeat([H|T],H,K),delete([H|T],[],NL,H),
    append(L1,[H],NL1),append(L2,[K],NL2),pred(NL,NL1,FL1,NL2,FL2).



