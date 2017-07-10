GEOFILE=heatsink.geo
MSHFILE=heatsink.msh
PROFILE=heatsink.pro
POSFILE=heatsink.pos
GETDP=../getdp

mesh:
	gmsh -3 $(GEOFILE)

refine:
	gmsh -refine $(MSHFILE)

remesh:
	gmsh -3 $(MSHFILE)

optimize:
	gmsh -3 -optimize $(MSHFILE)


solve:
	$(GETDP) -solve 'Resolution1' $(PROFILE)


.PHONY=mesh refine remesh optimize solve
