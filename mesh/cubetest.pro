Group {
	Metal=Region[1];
	D=Region[{Metal}];
	nodes=NodesOf[D];
	edgesOfSpanningTree = EdgesOfTreeIn[D, StartingOn D];	
}

FunctionSpace {
    { 
      Name H1; 
      Type Form0; 
      BasisFunction {
        { Name sn; 
	  NameOfCoef vn;
	  Function BF_Node; 
	  Support D;
	  Entity NodesOf[All]; }
      }
    }
  }
Jacobian {
	{Name V;
	Case {
		{Region D;Jacobian Vol;}
	}
	}
}
Integration {
	{Name I;
	Case {
		{Type Gauss;
		Case {
			{GeoElement Triangle; NumberOfPoints 3;}
			{GeoElement Tetrahedron; NumberOfPoints 3;}
		}
		}
	
	{Type Analytic;}
	}

}

Formulation{
      { Name Poisson; Type FemEquation;
      	Quantity { 
		{ Name v; Type Local; NameOfSpace H1; }
	}
	Equation {
		Galerkin { [ Dof{d v}, {d v} ] ; In D; Jacobian V; Integration I; }
		Galerkin { [ f[], {v} ] ; In D; Jacobian V; Integration I; }
	}
}
} 

