%---------------------------------------------
% my_reverse(+List, -ListR) which is true when 
% ListR unifies with a list containing the
% same elements as List but in reverse order.
%
% What we want to do with this program?
% 
% ? my_reverse([1,2,3,4,5], R).
% R = [5,4,3,2,1]
%
% 1) P(n0)
% 2) n>n0, P(n-1) -> P(n)
%---------------------------------------------

% 1) P(n0)
my_reverse([], []).

% 2) n > n0, P(n-1)->P(n)
my_reverse([Head|Tail], R2):- my_reverse(Tail, R),
  append(R, [Head], R2).
  

