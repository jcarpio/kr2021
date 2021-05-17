/*
Sort by insertion
------------------------

[5,2,9,2,8,3,1]

[2,9,2,8,3,1] -> sort_by_insertion([2,9,2,8,3,1], 
                                   [1,2,2,3,8,9])
								   
Insert the Head (5) in a sorted list (result of the Tail).
*/

% insert_in_sorted(+Elem, +List, -Result)
% it is true if Result unify with a sorted list
% with Elem inserted in the right position.

