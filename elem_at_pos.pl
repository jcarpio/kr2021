
/* elem_at_pos(+List, +Pos, -Elem)
   it is true if Elem unify with the
   element is Pos postition of the List
   starting with 1.
   
   ? elem_at_pos([a,b,c,d,e], 3, Elem).
   Elem = c
   
   1) P(n0)
   
   2) n > n0, P(n-1) -> P(n)
*/

elem_at_pos([Elem|_], 1, Elem).

elem_at_pos([_|Tail], N, Elem) :-
  N > 1, N2 is N-1,
  elem_at_pos(Tail, N2, Elem).
