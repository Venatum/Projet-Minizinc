include "globals.mzn";
include "alldifferent.mzn";

int: n;
array[1..n, 1..n] of var bool: q;

% lines
constraint forall(i in 1..n)(
    sum(k in 1..n)(bool2int(q[k,i])) = 1
);
% columns
constraint forall(i in 1..n)(
    sum(k in 1..n)(bool2int(q[i,k])) = 1
);

% decreasing diagonales
constraint forall(i in 1..(2 * n - 1))(
    sum(k in 1..n)(
        if((i - k + 1 > n) \/ (i - k + 1 < 1)) then 0
        else bool2int(q[i - k + 1, k])
        endif
    ) < 2
);

% increasing diagonales
constraint forall(i in (2 - n)..n)(
    sum(k in 1..n)(
        if((i + k - 1 > n) \/ (i + k - 1 < 1)) then 0
        else bool2int(q[i + k - 1, k])
        endif
    ) < 2
);

solve satisfy;

output [
    if(fix(q[i,j]) = true) then "|Q" else "| " endif ++
    if(j = n) then "|\n" else "" endif
    | i, j in 1..n];