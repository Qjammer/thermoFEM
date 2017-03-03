Merge "heatsink.stl";
Surface Loop(2) = {1};
//+
Volume(3) = {2};
//+
Physical Volume("Steel", 20) = {3};
//+
Point(1) = {13, 0, 60, 0.01};
//+
Point{1} In Surface{1};
//+
Physical Surface("Surf",21) = {1};
