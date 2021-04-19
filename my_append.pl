%-----------------------------------------------------
% my_append(+List1, +List2, -ListR).
% true when ListR unites with a list 
% containing the elements 
% of the list List1 in the same order
% and followed by the elements 
% of the list List2 in the same order.
%
% my_append([1,2,3], [4,5,6], R).
% R = [1,2,3,4,5,6]
%-----------------------------------------------------

my_append([], L2, L2).

my_append([Head|Tail], L2, [Head|R]):-
  my_append(Tail, L2, R).