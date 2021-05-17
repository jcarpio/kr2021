
Bubble Sort
--------------

1, 5, 3, 9, 4, 10, 2,


Mathematic Induction

1) P(n0)

2) n > n0, P(n-1) -> P(n)


% bubble_sort(+List, -Result)
% it is true if Result unify with a list 
% with same elements in List but sorted 
% from less to high.


bubble_sort(List, List) :- sort_list(List).

bubble_sort(List, R2):-
 append(L1, [E1,E2|L2], List),
 E2 < E1,
 append(L1, [E2,E1|L2], R), % R is one step nearest
 bubble_sort(R, R2).                           % to the solution
 


1, 5, 3, 9, 4, 10, 2

1, 3, 5, 9, 4, 10, 2 <- this is not the solution
 
 
 







