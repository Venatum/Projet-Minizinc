% Reine 1 à 4
var 1..4: R1;
var 1..4: R2;
var 1..4: R3;
var 1..4: R4;

% Pas même ligne
constraint R1 != R2;
constraint R1 != R3;
constraint R1 != R4;
constraint R2 != R3;
constraint R2 != R4;
constraint R3 != R4;
% ou
% global "global.mzn"
% constraint alldifferent([R1, R2, R3, R4]);

% Pas plus d'une reine sur la meme diago
constraint R1 != R2 + 1;
constraint R1 != R2 - 1;
constraint R1 != R3 + 2;
constraint R1 != R3 - 2;
constraint R1 != R4 + 3;
constraint R1 != R4 - 3;
constraint R2 != R3 + 1;
constraint R2 != R3 - 1;
constraint R2 != R4 + 2;
constraint R2 != R4 - 2;
constraint R3 != R4 + 1;
constraint R3 != R4 - 1;

solve satisfy;