:- use_module(library(clpfd)).

/*
    A [1,2,3,   4,5,6,   7,8,9] 
    B [1,2,3,   4,5,6,   7,8,9]
    C [1,2,3,   4,5,6,   7,8,9]
	
	D [1,2,3,   4,5,6,   7,8,9]
	E [1,2,3,   4,5,6,   7,8,9]
	F [1,2,3,   4,5,6,   7,8,9]
	
	G [1,2,3,   4,5,6,   7,8,9]
 	H [1,2,3,   4,5,6,   7,8,9]
	I [1,2,3,   4,5,6,   7,8,9]

*/


%  X = 1.
%  =(X,1).

my_sudoku(Rows) :-
        length(Rows, 9),
        maplist(same_length(Rows), Rows),
        append(Rows, Vs), Vs ins 1..9,
        maplist(all_distinct, Rows),
        transpose(Rows, Columns),
        maplist(all_distinct, Columns),
        Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
        distinct_blocks(As, Bs, Cs),
        distinct_blocks(Ds, Es, Fs),
        distinct_blocks(Gs, Hs, Is).


% distinct_blocks(L1, L2, L2)
% it is true if blocks that create the rows have distinct elements
%    L1 [1,2,3,   1,2,3,   1,2,3] 
%    L2 [4,5,6,   4,5,6,   4,5,6]
%    L3 [7,8,9,   7,8,9,   7,8,9]


distinct_blocks([],[],[]).

distinct_blocks([E1, E2, E3|Tail1], [E4,E5,E6|Tail2], [E7,E8,E9|Tail3]):-
 all_distinct([E1,E2,E3,E4,E5,E6,E7,E8,E9]),
 distinct_blocks(Tail1, Tail2, Tail3).
 

sudoku(1,S):- S=[
[1, _, _, _, 5, 6, 7, _, 9],
[4, 5, 6, 7, _, 9, 1, _, 3],
[7, _, 9, _, 2, 3, 4, 5, 6],
[2, _, 4, 3, 6, 5, 8, _, 7],
[3, _, 5, 8, _, 7, 2, 1, 4],
[8, 9, _, 2, 1, _, 3, 6, 5],
[5, 3, 1, 6, 4, _, 9, 7, 8],
[6, _, 2, 9, 7, 8, 5, 3, 1],
[9, 7, _, 5, 3, 1, _, 4, 2]].


