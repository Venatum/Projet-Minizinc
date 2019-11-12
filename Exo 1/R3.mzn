include "alldifferent.mzn";

int: n = 5;
array[1..n, 1..n] of var bool:q;

% one queen pe line and column
constraint
forall(i in 1..n)(
    forall(j in 1..n)(
        % lines
        q[i,j] != orall(k in 1..n)(q[k,j] /\ k != i) /\
        % columns
        q[i,j] != orall(k in 1..n)(q[i,k] /\ k != j) /\
        % diagonales increasing right
        q[i,j] != orall(k in 1..n)(q[i + k,j + k] /\ k != j) /\
        % diagonales decreasing right
        q[i,j] != orall(k in 1..n)(q[i - k,j - k] /\ k != j) /\
        % diagonales increasing left
        q[i,j] != orall(k in 1..n)(q[i + k,j + k] /\ k != j) /\
        % diagonales decreasing left
        q[i,j] != orall(k in 1..n)(q[i - k,j - k] /\ k != j)
    );
);

solve satisfy;

output [ if q[i,j] == true then "|Q" else "|_" endif ++
         if j == n then "|\n" else "" endif | i, j in 1..n];