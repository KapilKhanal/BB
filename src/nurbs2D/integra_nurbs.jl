# Boundary element method implementation for the Laplace equation using NURBS bidimensional elements
# Author: Álvaro Campos Ferreira - alvaro.campos.ferreira@gmail.com
# Necessary Modules: SpecialFunctions.jl
using SpecialFunctions
using PyPlot
include("dep.jl") # Includes the dependencies
include("dad_1.jl") # Includes the data file containing the geometry and physical boundary conditions of the problem
# Characteristics of the problem: Square domain with imposed temperature in two opposite faces and imposed null temperature flux at the other two faces. 
k=1	# wavenumber
raio = 0.5 # radius of the cylinder
collocCoord,nnos,crv,dcrv,CDC,E = dad_iso(raio)# Geometric and physical information of the problem

#Building the problems matrices
H, G = calcula_iso(collocCoord,nnos,crv,dcrv,E,k) # Influence matrices
A,b= aplica_CDCiso(G,H,CDC,E);	# Applying boundary conditions
x=A\b; # Evaluating unknown values
Tc,qc=monta_Teqiso(CDC,x); # Separating temperature from flux
# Applying NURBS basis functions to the values of temperature and flux
T=E*Tc;
q=E*qc;

# Domain points
n_pint = 50;
PONTOS_int = zeros(n_pint,3);
delta = 0.5;
passo = (10-2*delta)/(n_pint-1);
phi_analytical = complex(zeros(size(PONTOS_int,1),1));
for i = 1:n_pint
	PONTOS_int[i,:] = [i (i-1)*passo+delta 0]
	bh1 = SpecialFunctions.besselh(1,2,(k)*raio);
	bh0 = SpecialFunctions.besselh(0,2,(k)*PONTOS_int[i,2]);
	phi_analytical[i,1] = k.*(bh0./bh1);		#solucao anali­tica pela separacao de variaveis em coordenadas cilindricas da equacao de Helmholtz
end
fc = 0; finc = 0;
Hp,Gp,phi_pint = calc_phi_pint_nurbs(PONTOS_int,collocCoord,nnos,crv,dcrv,k,Tc,qc);

# Graphics
close("all")
mostra_geo(crv)
plot(collocCoord[:,1],collocCoord[:,2],marker="s",markersize=10,linestyle="none",color="blue",label = "Physical points (Nodes)")
axis("equal")
grid(1)
PyPlot.xlabel("x",fontsize="12.0")
PyPlot.ylabel("y",fontsize="12.0")
title("NURBS model",fontsize="16.0")
legend(fontsize="14.0",loc="best")
# Plot domain point solution and analytical solution
figure()
plot(PONTOS_int[:,2],real(phi_analytical),label="Analytical")
plot(PONTOS_int[:,2],real(phi_pint),label="IGA BEM")
legend()
