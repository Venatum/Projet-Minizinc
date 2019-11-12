include "alldifferent.mzn";

int: n;
array[1..n, 1..n] of var bool: q;

%constraint
%forall(i in 1..n)(
%    forall(j in 1..n)(
%        % lines
%        (q[i,j] = true /\ (sum(k in 0..n where k != i)(bool2int(q[k,j])) = 0)) \/
%        (q[i,j] = false /\ (sum(k in 0..n where k != i)(bool2int(q[k,j])) = 1)) \/
%        % columns
%        (q[i,j] = true /\ (sum(k in 0..n where k != i)(bool2int(q[j,k])) = 0)) \/
%        (q[i,j] = false /\ (sum(k in 0..n where k != i)(bool2int(q[j,k])) = 1)) \/
%        % diagonales increasing right
%        (q[i,j] = true /\ (sum(k in 0..n where k != i)(bool2int(q[i + k,j + k])) = 0)) \/
%        (q[i,j] = false /\ (sum(k in 0..n where k != i)(bool2int(q[i + k,j + k])) = 1)) \/
%        % diagonales decreasing right
%        (q[i,j] = true /\ (sum(k in 0..n where k != i)(bool2int(q[i - k,j - k])) = 0)) \/
%        (q[i,j] = false /\ (sum(k in 0..n where k != i)(bool2int(q[i - k,j - k])) = 1))
%    )
%);

% lines
constraint forall(i in 1..n)(
    sum(k in 1..n)(bool2int(q[k,i])) = 1
);
% columns
constraint forall(i in 1..n)(
    sum(k in 1..n)(bool2int(q[i,k])) = 1
);


% first half decreasing diagonales
constraint forall(i in 1..n)(
    sum(k in 1..i)(bool2int(q[i - k + 1, k])) < 2
);
% second half decreasing diagonales
%constraint forall(i in 1..n)(
%    sum(k in 1..i)(bool2int(q[n - k + 1, n - i - k + 2])) < 2
%);


% first half increasing diagonales
constraint forall(i in 1..n)(
    sum(k in 1..(n-i+1))(bool2int(q[k,i])) < 2
);
% second half increasing diagonales
%constraint forall(i in 1..n)(
%    sum(k in 1..(n-i+1))(bool2int(q[i,k])) < 2
%);

% one queen pe line and column
%constraint
%forall(i in 1..n)(
%    forall(j in 1..n)(
%        % lines
%        q[i,j] != orall(k in 1..n)(q[k,j] /\ k != i) /\
%        % columns
%        q[i,j] != orall(k in 1..n)(q[i,k] /\ k != j) /\
%        % diagonales increasing right
%        q[i,j] != orall(k in 1..n)(q[i + k,j + k] /\ k != j) /\
%        % diagonales decreasing right
%        q[i,j] != orall(k in 1..n)(q[i - k,j - k] /\ k != j)
%    );
%);

solve satisfy;

output [
    if(fix(q[i,j]) = true) then "|Q" else "| " endif ++
    if(j = n) then "|\n" else "" endif
    | i, j in 1..n];