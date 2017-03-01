Group {
	Steel = Region[20];
}

Function {
	f[]=5*X[]*Y[];
}

Jacobian {
	{
		Name JVol;
		Case {
			{
				Region All;
				Jacobian Vol;
			}
		}
	}
	
	{
		Name JSur;
		Case {
			{
				Region All;
				Jacobian Sur;
			}
		
		}
	}
	{
		Name JLin;
		Case {
			{
				Region All;
				Jacobian Lin;
			}
		}
	}
}

Integration {
	{
		Name I1;
		Case {
			{
				Type Gauss;
				Case {
					{
						GeoElement Point;
						NumberOfPoints 1;
					}
					{
						GeoElement Line;
						NumberOfPoints 4;
					}
					{
						GeoElement Triangle;
						NumberOfPoints 6;
					}
					{
						GeoElement Quadrangle;
						NumberOfPoints 7;
					}
					{
						GeoElement Tetrahedron;
						NumberOfPoints 15;
					}
				}
			}
		}
	}
}

//Constraint

FunctionSpace{
	{
		Name Vh;
		Type Form0;
		BasisFunction {
			{
				Name wn;
				NameOfCoef vn;
				Function BF_Node;
				Support Steel;
				Entity NodesOf[All];
			}
		}
	}
}

Formulation{
	{
		Name Formulation1;
		Type FemEquation;
		Quantity {
			{
				Name u;
				Type Local;
				NameOfSpace Vh;
			}
		}
		Equation {
			Galerkin {
				[Dof{Grad u}, {Grad u}];
				In Steel;
				Jacobian JVol;
				Integration I1;
			}
			Galerkin {
				[Dof{u}, {u}];
				In Steel;
				Jacobian JVol;
				Integration I1;
			}
			Galerkin {
				[-f[],{u}];
				In Steel;
				Jacobian JVol;
				Integration I1;
			}
		}
	}
}





Resolution {
	{
		Name Resolution1;
		System {
			{
				Name Syst;
				NameOfFormulation Formulation1;
			}
		}
		Operation{
			Generate[Syst];
			Solve[Syst];
			SaveSolution[Syst];
		}
	}
}
PostProcessing{
	{
		Name PostProc1;
		NameOfFormulation Formulation1;
		Quantity {
			{
				Name u;
				Value {
					Local{
						[{u}];
						In Steel;
						Jacobian JVol;
					}
				}
			}
		}
	}
}

PostOperation {
	{
		Name Map_u;
		NameOfPostProcessing PostProc1;
		Operation {
			Print[u, OnElementsOf Steel, File "outfile.pos"];
		}
	}
}
