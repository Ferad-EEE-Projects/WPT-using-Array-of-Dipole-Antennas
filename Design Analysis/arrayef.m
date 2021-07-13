function [AFef,D0efdB, D0ef] = arrayef (theta, lambda, Nelem, dist)

% theta=[0:2*pi/360:2*pi];
% lambda = 500;
% Nelem = 5;
% dist = 0.5;
% AF = array_factor(theta, lamda, nelem)
%calculate the broadside array factor of a linear array of antennas using equation
% 6-10a on page 259 of Balanis.

     mu0 = 4*pi*10^-7;         % permeability (in newtons/amp^2)
	 epsilon0 = 8.854187817*10^-12; % permittivity (in Farads/meter )
     k = (2*pi)/lambda;        % wave number (in radians/meter)
     d = dist*lambda;          % distance between antennas

    beta=-k*d;
    psi=k*d*cos(theta)+beta;
    AFef=sinc((Nelem.*psi./2)/pi)./sinc((psi./2)/pi);   
    D0ef = 4*Nelem*d/lambda;
    D0efdB=10.*log10(D0ef);