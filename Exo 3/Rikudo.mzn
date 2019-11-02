include "alldifferent.mzn";

int: size = 36;
%array[1..7, 1..13] of var -1..size: myMap;
array[1..7, 1..13] of int: myMap;

%output [ if myMap[i, j] == -1 then "  " else show(myMap[i, j]) endif | i, j in myMap];
output [ show(myMap[i, 1..13]) ++ "\n" | i in 1..7];
