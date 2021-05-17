
/* Hard Die 3 Problem

  |      |
  |      |   |      |
  |------|   |------|
     5L         3L
	 
	 
  1. Define the sate
     state(L5, L3). 
	 
	 Initial State:
	 state(0, 0).
	 
	 Final State:
	 state(4, _).
	 
 3. Define movements
    - fill L5
    - fill L3
    - drop L5
   	- drop L3
	- put L3 in L5
	- put L5 in L3
	
*/


% Luca Code
mov(fill_l5, state(_, L3), state(5, L3)).
mov(fill_l3, state(L5, _), state(L5, 3)).
mov(drop_l5, state(_, L3), state(0, L3)).
mov(drop_l3, state(L5, _), state(L5, 0)).
mov(put_l3_in_l5, state(L5, L3), state(L5_2,0)):- L5_2 is L3+L5, L5_2 =< 5.
mov(put_l3_in_l5, state(L5, L3), state(5, L3_2)):- L5_2 is L3+L5, L5_2 > 5, L3_2 is L5_2-5.

mov(put_l5_in_l3, state(L5, L3), state(0, L3_2)):- L3_2 is L3+L5, L3_2 =< 3.
mov(put_l5_in_l3, state(L5, L3), state(L5_2, 3)):- L3_2 is L3+L5, L3_2 > 3, L5_2 is L3_2 - 3.
	
	
% 3. Path definition
%                 path(n)
% Ini ----------------------------> Fin
%       Mov            path(n-1)
% Ini -------> Aux ---------------> Fin

path(Ini, Ini, _, []).

path(Ini, Fin, Visited, [MovName|Path]):-
  mov(MovName, Ini, Aux),
  \+ member(Aux, Visited),
  path(Aux, Fin, [Aux|Visited], Path).
  
  
  
  
	

	
	
	
	
	