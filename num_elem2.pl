num_elem([], 0).
num_elem([_|Tail], N2):- num_elem(Tail, N),
   N2 is N + 1.