uniq_el(Ref,Res):-uniq_el(Ref,Res,[]).
uniq_el([],Res,Res):-!.
uniq_el([H|T],Res,Buf):-check(H,Buf,Buf,R), uniq_el(T,Res,R).%список,буфер используемый,буфер, рез
check(El,[El|_],Res,Res):-!. %элемент,голова равна элементу в хвосте не важно какой,
check(E1,[],Ref,Res):-append(Ref,[E1],Res),!.%если в списке не встрет эл добавляем в рез элемент
check(El,[_|T],Ref,Res):-check(El,T,Ref,Res).%Если элемент в голове не совпадает с элементом который мы ищем то мы рекурсивно перебираем дальше

count_el(El,List,Count):-count_el(El,List,Count,0).
count_el(_,[],Count,Count):-!.
count_el(El,[El|T],Count,Iter):-Iter1 is Iter+1, count_el(El,T,Count,Iter1),!.
count_el(El,[_|T],Count,Cur):-count_el(El,T,Count,Cur).

writeList([]):-!.
writeList([H|T]):-write(H),write(" "),writeList(T).

read_list(A,N):-r(A,[],0,N).% cписок, пустой список , счетчик , количество элементов
r(A,A,N,N):-!.
r(A,B,X,N):-X1 is X+1,read(D),append(B,[D],B1),r(A,B1,X1,N).

main:- read(N),
    read_list(L,N),
uniq_el(L,L1), write("Uniq:"), writeList(L1),nl, kolinit(L,L1,L2), write("Kolv:"), writeList(L2).
kolinit(L,L1,L2):-kol(L,L1,L2,[]).
kol(_,[],L2,L2):-!.
kol(L,[H|T],L2,Tmp):-count_el(H,L,C), append(Tmp,[C],L2new), kol(L,T,L2,L2new).
