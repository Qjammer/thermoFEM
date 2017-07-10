Geometry.HideCompounds = 0;
Mesh.RemeshAlgorithm=1;
Mesh.CharacteristicLengthFactor=0.1;
Merge "bottom.stl";
Merge "fins.stl";
CreateTopology;
Compound Surface(100)={1};
Compound Surface(101)={2};
Surface Loop(300)={1,2};
Volume(250)= {300};
Physical Volume("Steel", 20) = {250};
Physical Surface("Bottom",21) = {100};
Physical Surface("Fins",22)= {101};