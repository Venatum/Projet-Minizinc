include "globals.mzn";
include "alldifferent.mzn";

int: n;
array[1..n, 1..n] of var bool: q;

function var bool: orall(array[int] of var bool: tab) =
    if length(tab) = 1
    then tab[1]
    else tab[1] \/ orall([tab[i] | i in 1..length(tab) where i > 1])
    endif;

% lines
constraint forall(i in 1..n) (
    forall(j in 1..n) (
        orall([q[i, k] | k in 1..n where k != j]) != q[i, j]
    )
);

% columns
constraint forall(i in 1..n) (
    forall(j in 1..n) (
        orall([q[k, j] | k in 1..n where k != i]) != q[i, j]
    )
);

% decreasing diagonales
constraint forall(i in 1..n) (
    forall(j in 1..n) (
        if q[i, j] = true /\ length([q[i + k, j + k] | k in (-n)..n where i + k > 0 /\ i + k < n /\ j + k > 0 /\ j + k < n /\ k != 0]) != 0
        then orall([q[i + k, j + k] | k in (-n)..n where i + k > 0 /\ i + k < n /\ j + k > 0 /\ j + k < n /\ k != 0]) != true
        else true
        endif
    )
);

% increasing diagonales
constraint forall(i in 1..n) (
    forall(j in 1..n) (
        if q[i, j] = true /\ length([q[i - k, j + k] | k in (-n)..n where i - k > 0 /\ i - k < n /\ j + k > 0 /\ j + k < n /\ k != 0]) != 0
        then orall([q[i - k, j + k] | k in (-n)..n where i - k > 0 /\ i - k < n /\ j + k > 0 /\ j + k < n /\ k != 0]) != true
        else true
        endif
    )
);

solve satisfy;

output [
    if(fix(q[i,j]) = true) then "|Q" else "| " endif ++
    if(j = n) then "|\n" else "" endif
    | i, j in 1..n];