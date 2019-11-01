% lines from bottom left to top right

% 1st line
var 0..9: x00;
string: o10;
var 0..9: x20;
var 0..9: x40;
var 0..9: x80;
string: o90;
var 0..9: x100;
var 0..9: x120;

% 2nd line
var 1..9: x01;
var 1..9: x41;
var 1..9: x81;
var 1..9: x121;

% 3rd line : nothing

% 4th line
var 0..9: x03;
var 0..9: x43;
string: o53;
var 0..9: x63;
var 0..9: x83;
var 0..9: x123;

% 5th line
string: o04;
string: o44;
string: o84;
string: o124;

% 6th line
var 0..9: x05;
string: o15;
var 0..9: x25;
var 0..9: x45;
var 0..9: x85;
string: o95;
var 0..9: x105;
var 0..9: x125;

% 7th line : nothing

% 8th line
var 0..9: x27;
var 0..9: x107;

% 9th line
string: o28;
string: o108;

% 10th line
var 0..9: x09;
string: o19;
var 0..9: x29;
var 0..9: x49;
var 0..9: x89;
string: o99;
var 0..9: x109;
var 0..9: x129;

% 11th line
var 1..9: x010;
var 1..9: x410;
var 1..9: x810;
var 1..9: x1210;

% 12th line : nothing

% 13th line
var 0..9: x012;
var 0..9: x412;
string: o512;
var 0..9: x612;
var 0..9: x812;
var 0..9: x1212;

% 14th line
string: o013;
string: o413;
string: o813;
string: o1213;

% 15th line
var 0..9: x014;
string: o114;
var 0..9: x214;
var 0..9: x414;
var 0..9: x814;
string: o914;
var 0..9: x1014;
var 0..9: x1214;

% equation on (3,0)
constraint o10 = "+" -> x00 + x20 = x40;
constraint o10 = "-" -> x00 - x20 = x40;
constraint o10 = "*" -> x00 * x20 = x40;
constraint o10 = "/" -> x00 / x20 = x40;

% equation on (11,0)
constraint o90 = "+" -> x80 + x100 = x120;
constraint o90 = "-" -> x80 - x100 = x120;
constraint o90 = "*" -> x80 * x100 = x120;
constraint o90 = "/" -> x80 / x100 = x120;

% equation on (0,2)
constraint o04 = "+" -> x05 + x03 = x01 * 10 + x00;
constraint o04 = "-" -> x05 - x03 = x01 * 10 + x00;
constraint o04 = "*" -> x05 * x03 = x01 * 10 + x00;
constraint o04 = "/" -> x05 / x03 = x01 * 10 + x00;

% equation on (4,2)
constraint o44 = "+" -> x45 + x43 = x41 * 10 + x40;
constraint o44 = "-" -> x45 - x43 = x41 * 10 + x40;
constraint o44 = "*" -> x45 * x43 = x41 * 10 + x40;
constraint o44 = "/" -> x45 / x43 = x41 * 10 + x40;

% equation on (8,2)
constraint o84 = "+" -> x85 + x83 = x81 * 10 + x80;
constraint o84 = "-" -> x85 - x83 = x81 * 10 + x80;
constraint o84 = "*" -> x85 * x83 = x81 * 10 + x80;
constraint o84 = "/" -> x85 / x83 = x81 * 10 + x80;

% equation on (12,2)
constraint o124 = "+" -> x125 + x123 = x121 * 10 + x120;
constraint o124 = "-" -> x125 - x123 = x121 * 10 + x120;
constraint o124 = "*" -> x125 * x123 = x121 * 10 + x120;
constraint o124 = "/" -> x125 / x123 = x121 * 10 + x120;

% equation on (7,3)
constraint o53 = "+" -> x43 + x63 = x83;
constraint o53 = "-" -> x43 - x63 = x83;
constraint o53 = "*" -> x43 * x63 = x83;
constraint o53 = "/" -> x43 / x63 = x83;

% equation on (3,4)
constraint o15 = "+" -> x05 + x25 = x45;
constraint o15 = "-" -> x05 - x25 = x45;
constraint o15 = "*" -> x05 * x25 = x45;
constraint o15 = "/" -> x05 / x25 = x45;

% equation on (11,4)
constraint o95 = "+" -> x85 + x105 = x125;
constraint o95 = "-" -> x85 - x105 = x125;
constraint o95 = "*" -> x85 * x105 = x125;
constraint o95 = "/" -> x85 / x105 = x125;

% equation on (2,5)
constraint o28 = "+" -> x29 + x27 = x25;
constraint o28 = "-" -> x29 - x27 = x25;
constraint o28 = "*" -> x29 * x27 = x25;
constraint o28 = "/" -> x29 / x27 = x25;

% equation on (10,5)
constraint o108 = "+" -> x109 + x107 = x105;
constraint o108 = "-" -> x109 - x107 = x105;
constraint o108 = "*" -> x109 * x107 = x105;
constraint o108 = "/" -> x109 / x107 = x105;

% equation on (3,9)
constraint o19 = "+" -> x09 + x29 = x49;
constraint o19 = "-" -> x09 - x29 = x49;
constraint o19 = "*" -> x09 * x29 = x49;
constraint o19 = "/" -> x09 / x29 = x49;

% equation on (11,9)
constraint o99 = "+" -> x89 + x109 = x129;
constraint o99 = "-" -> x89 - x109 = x129;
constraint o99 = "*" -> x89 * x109 = x129;
constraint o99 = "/" -> x89 / x109 = x129;

% equation on (0,11)
constraint o013 = "+" -> x014 + x012 = x010 * 10 + x09;
constraint o013 = "-" -> x014 - x012 = x010 * 10 + x09;
constraint o013 = "*" -> x014 * x012 = x010 * 10 + x09;
constraint o013 = "/" -> x014 / x012 = x010 * 10 + x09;

% equation on (4,11)
constraint o413 = "+" -> x414 + x412 = x410 * 10 + x49;
constraint o413 = "-" -> x414 - x412 = x410 * 10 + x49;
constraint o413 = "*" -> x414 * x412 = x410 * 10 + x49;
constraint o413 = "/" -> x414 / x412 = x410 * 10 + x49;

% equation on (8,11)
constraint o813 = "+" -> x814 + x812 = x810 * 10 + x89;
constraint o813 = "-" -> x814 - x812 = x810 * 10 + x89;
constraint o813 = "*" -> x814 * x812 = x810 * 10 + x89;
constraint o813 = "/" -> x814 / x812 = x810 * 10 + x89;

% equation on (12,11)
constraint o1213 = "+" -> x1214 + x1212 = x1210 * 10 + x129;
constraint o1213 = "-" -> x1214 - x1212 = x1210 * 10 + x129;
constraint o1213 = "*" -> x1214 * x1212 = x1210 * 10 + x129;
constraint o1213 = "/" -> x1214 / x1212 = x1210 * 10 + x129;

% equation on (7,12)
constraint o512 = "+" -> x412 + x612 = x812;
constraint o512 = "-" -> x412 - x612 = x812;
constraint o512 = "*" -> x412 * x612 = x812;
constraint o512 = "/" -> x412 / x612 = x812;

% equation on (3,14)
constraint o114 = "+" -> x014 + x214 = x414;
constraint o114 = "-" -> x014 - x214 = x414;
constraint o114 = "*" -> x014 * x214 = x414;
constraint o114 = "/" -> x014 / x214 = x414;

% equation on (11,14)
constraint o914 = "+" -> x814 + x1014 = x1214;
constraint o914 = "-" -> x814 - x1014 = x1214;
constraint o914 = "*" -> x814 * x1014 = x1214;
constraint o914 = "/" -> x814 / x1014 = x1214;

solve satisfy;
output [ 
    show(x014) ++ o114 ++ show(x214) ++ "=" ++ show(x414) ++ "   " ++ show(x814) ++ o914 ++ show(x1014) ++ "=" ++ show(x1214) ++ "\n" ++
    o013 ++ "   " ++ o413 ++ "   " ++ o813 ++ "   " ++ o1213 ++ "\n" ++
    show(x012) ++ "   " ++ show(x412) ++ o512 ++ show(x612) ++ "=" ++ show(x812) ++ "   " ++ show(x1212) ++ "\n" ++
    "=   =   =   =\n" ++
    show(x010) ++ "   " ++ show(x410) ++ "   " ++ show(x810) ++ "   " ++ show(x1210) ++ "\n" ++
    show(x09) ++ o19 ++ show(x29) ++ "=" ++ show(x49) ++ "   " ++ show(x89) ++ o99 ++ show(x109) ++ "=" ++ show(x129) ++ "\n" ++
    "  " ++ o28 ++ "       " ++ o108 ++ "  \n" ++
    "  " ++ show(x27) ++ "       " ++ show(x107) ++ "  \n" ++
    "  =       =  \n" ++
    show(x05) ++ o15 ++ show(x25) ++ "=" ++ show(x45) ++ "   " ++ show(x85) ++ o95 ++ show(x105) ++ "=" ++ show(x125) ++ "\n" ++
    o04 ++ "   " ++ o44 ++ "   " ++ o84 ++ "   " ++ o124 ++ "\n" ++
    show(x03) ++ "   " ++ show(x43) ++ o53 ++ show(x63) ++ "=" ++ show(x83) ++ "   " ++ show(x123) ++ "\n" ++
    "=   =   =   =\n" ++
    show(x01) ++ "   " ++ show(x41) ++ "   " ++ show(x81) ++ "   " ++ show(x121) ++ "\n" ++
    show(x00) ++ o10 ++ show(x20) ++ "=" ++ show(x40) ++ "   " ++ show(x80) ++ o90 ++ show(x100) ++ "=" ++ show(x120)
]