function [AFbs,D0bsdB,D0bs] = arraybs (theta, lambda, Nelem, dist)

% theta=[0:2*pi/360:2*pi];
% lambda = 500;
% Nelem = 5;
% dist = 0.5;
     mu0 = 4*pi*10^-7;         % permeability (in newtons/amp^2)
	 epsilon0 = 8.854187817*10^-12; % permittivity (in Farads/meter )
     k = (2*pi)/lambda;        % wave number (in radians/meter)
     d = dist*lambda;          % distance between antennas
  beta=0;
  psi=k*d*cos(theta)+beta;
  
  AFbs=sinc((Nelem.*psi./2)/pi)./sinc((psi./2)/pi);
  D0bs = 2*Nelem*d/lambda;
  D0bsdB=10.*log10(D0bs);
 