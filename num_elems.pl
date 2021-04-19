%-------------------------------
% num_elements(+List, -Number)
% it is true if Number unify with the number
% of elements in List
%
% 1) P(n0)
% 2) n>n0, P(n-1) -> P(n)
% 
% - What is the equivalent of n0 in lists?
%   Empty list == []
%-------------------------------

% 1) P(n0)


% 2) n>n0, P(n-1) -> P(n)
%    p(n) :- p(n-1).
%    num_elem(List, ) :- num_elem(List - 1, N).
%    
%    we are going to use a trick
%
%    num_elem([Head|Tail],  ):- num_elem(Tail, N).
% 
%   If P(n-1) is true == if num_elem(Tail, N) is 
%    true what we have in N?

% num_elem([1,2,3,4,5], 5) 
% num_elem([2,3,4,5], 4)

num_elem([], 0).
num_elem([_|Tail], N2):- num_elem(Tail, N),
   N2 is N + 1.
   
 






