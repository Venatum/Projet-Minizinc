include "alldifferent.mzn";

int: n;
array[1..n] of var 1..n:q;

constraint alldifferent(q);
constraint alldifferent([q[i] + i | i in 1..n]);
constraint alldifferent([q[i] - i | i in 1..n]);

constraint q[1] < q[n];

solve satisfy;

output [ if fix(q[j]) == i then "|Q" else "| " endif ++
         if j == n then "|\n" else "" endif | i, j in 1..n];