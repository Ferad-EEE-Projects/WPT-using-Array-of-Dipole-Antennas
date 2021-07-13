function [F,Farray]=dipoleint_array(theta, phi, lamda, current, zprime, AF)

     mu0 = 4*pi*10^-7;         % permeability (in newtons/amp^2)
	epsilon0 = 8.854187817*10^-12; % permittivity (in Farads/meter )
     eta = sqrt(mu0/epsilon0); % intrinsic impedance (in ohms)
     beta = (2*pi)/lamda;       %wave number (in radians/meter)

     P1 = ones(size(phi));
     MT = theta*P1';       %Create a 361x361 array that varies in theta, but not phi.
     % could also use meshgrid to fill up MT
%integrate E-theta over the whole length of the antenna for each theta 
% using equation 4-58a on page 152 of Balanis.     

n1=j*eta*beta/(4*pi); % constant in front of the integral
L1=size(theta');   L1 = ceil(L1(1)/2);
dz=zprime(2)-zprime(1);

for jj=1:L1 % for each value of theta from 0 to pi
   
%integrate the effects of the entire current distribution along the antenna.
int1=sum(current.*exp(j*beta*zprime*cos(theta(jj))))*dz;
 
 eTheta(1:361,jj) = (n1*sin(theta(jj))*int1);
 eTheta(1:361,362-jj) = (n1*sin(theta(jj))*int1); % fill in the full circle so that
 % we can make nice looking elevation-plane plots of the field.
end


t=ones(size(AF));
tt = t'*AF; % make AF fill 3-space so we can multiply eTheta;


eTheta=tt.*eTheta;
eThetaArray = tt;

ePhi = 0;

% calculate the radiation intensity using equation 2-12a on page 38
F = (abs(eTheta).^2 + abs(ePhi).^2)/(2*eta);
Farray = (abs(eThetaArray).^2 + abs(ePhi).^2)/(2*eta);