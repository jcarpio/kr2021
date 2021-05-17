/*
State Problem Solving
--------------------------
1. Define the state

First approach:
state(ML, CL, MR, CR, Boat).

Initial State:
state(0,0,3,3,rigt).

Final State:
state(3,3,0,0,left).

  |   |
  |   | MMM
  |  _| CCC 
  |   |
  
Second approach

state(ML, CL, Boat).

Intial state:
state(0,0,right).

Final state:
final(3,3,_)

--------------------

Chess example

state([[t, h, ...],
       [p,p, ...]
	   
	    ...
	   [t, h, ...]]).

-----
  
2. Define the movements

   1. Move one missionaire from left to right  
   2. Move one cannibal from left to right
   3. Move one missionaire and one cannibal from left to right      
   4. Move two missionaire from left to right
   5. Move two cannibals from left to right     
   6. Move one missionaire from right to left  
   7. Move one cannibal from right to left
   8. Move one missionaire and one cannibal from right to left      
   9. Move two missionaire from right to left
   10. Move two cannibals from right to left     
*/
   
   
% mov(+Name, +StateBefore, +StateAfter)   

mov(one_mis_to_right, state(ML, CL, left), state(ML2, CL, right)):-
   ML > 0,
   ML2 is ML - 1.
mov(one_can_to_right, state(ML, CL, left), state(ML2, CL, right)):-
   ML > 0,
   ML2 is ML - 1.   
mov(two_mis_to_right, state(ML, CL, left), state(ML2, CL, right)):-
   ML > 1,
   ML2 is ML - 2.
mov(two_can_to_right, state(ML, CL, left), state(ML2, CL, right)):-
   ML > 1,
   ML2 is ML - 2.   
mov(one_mis_one_can_to_right, state(ML, CL, left), state(ML2, CL2, right)):-
   ML > 0, CL > 0,
   ML2 is ML - 1,
   CL2 is CL - 1.   

mov(one_mis_to_left, state(ML, CL, right), state(ML2, CL, left)):-
   ML < 3,
   ML2 is ML + 1.
mov(one_can_to_left, state(ML, CL, right), state(ML2, CL, left)):-
   ML < 3,
   ML2 is ML + 1.   
mov(two_mis_to_left, state(ML, CL, right), state(ML2, CL, left)):-
   ML < 2,
   ML2 is ML + 2.
mov(two_can_to_left, state(ML, CL, right), state(ML2, CL, left)):-
   ML < 2,
   ML2 is ML + 2.   
mov(one_mis_one_can_to_left, state(ML, CL, right), state(ML2, CL2, left)):-
   ML < 3, CL < 3,
   ML2 is ML + 1,
   CL2 is CL + 1. 

/*   

3. Implementation of the path

                       Path
IntialState -----------------------------------> FinalState
 
               Movement             Path 
IntitalState ------------> INT ----------------> FinalState

*/


% not_valid(+state(M,C,B)).

not_valid(state(2,3, _)).
not_valid(state(1,3, _)).
not_valid(state(1,2, _)).
not_valid(state(2,1, _)). 
not_valid(state(1,0, _)).
not_valid(state(2,0, _)).


% path(+InitialState, +FinalState, +Visited, -Path).
%  it is true if Path unify with the list of name movements to
%  go from IntiatState to FinalState without visiting
%  states that are in Visited list.


path(FinalState, FinalState, _, []).

path(InitialState, FinalState, Visited, [MovName|Path]):-
  mov(MovName, InitialState, Int),
  \+ not_valid(Int),
  \+ member(Int, Visited),
  path(Int, FinalState, [Int|Visited], Path).
  
% 4. Solution predicate

solution(Path):- path(state(0,0,right), state(3,3,left), [] ,Path).

 
   