## Test cases for geometry problems
# This script tests the BEM models against
#known problems for which analytical solutions
#are readily obtained.
########## Test case number ##########
### Problem description
### Analytical solution
### BEM model
### return error
module geo_tests

########## Test case 1 ##########
# Let a domain be a square of length L [m];
L = 1; # length of the square
k = 1; # heat conductivity of the material
#The points and segments which describe this
#geometry are
POINTS = [1 0 0
	  2 L 0
	  3 L L
	  4 0 L];
SEGMENTS = [1 1 2 0
	    2 2 3 0
	    3 3 4 0
	    4 4 1 0];
# Each segment will be meshed by ne elements
ne = 1;
MESH = [1 ne
	2 ne
	3 ne
	4 ne];
### Analytical solution
P = 4.*L; # Square perimeter
A = L.^2; # Square surface area
### BEM modules test
function test_modules(ϵ=10^(-6))
# Each module will be tested in this function.
    ## TODO: automate module search and testing.
    # Constant elements
    include("../src/const2D/const2D.jl")
    using const2D
    NOS_GEO,NOS,ELEM,CDC,normal = const2D.format_dad(POINTS,SEGMENTS,MESH,BCSeg) # Apply the discretization technique and builds the problems matrices for the geometrical points, physical nodes, elements' connectivity and boundary conditions
    nnos = size(NOS,1)  # Number of physical nodes, same as elements when using constant elements
    G,H=const2D.cal_GeHgeo(NOS,NOS_GEO,ELEM,qsi,w);
    A,b = const2D.aplica_CDC(G,H,CDC);
    x = A\b # Solves the linear system
    T,q = const2D.monta_phieq(CDC,x) # Applies the boundary conditions to return the velocity potential and flux

    # NURBS elements
    include("../src/nurbs2D/nurbs2D.jl")
    using nurbs2D
    
    return error
end
end
