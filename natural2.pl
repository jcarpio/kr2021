
% natural(N)
% it is true if N is a nutural number.

% 1) P(n0) 
% Fact
natural(1).

% 2) n > n0, P(n-1) -> P(n)
% a -> c  In Logic
% c :- a. In Prolog

% natural(n-1) -> natural(n)

natural(N) :- N > 1, N2 is N-1, natural(N2).

