function [Ip,zp,cp] = dipolecurrent (L,a)

%L = 0.5; a = 0.005; 
M = 30; ker = 'e'; basis = 'd';

if basis=='d'
   D = L/(2*M);
else
    D = L/(2*M+1); 
end
E = zeros(2*M+1,1); 
E(M+1) = 1/D;
[Ip,zp,cp] = hfield(L,a,E,ker,basis); % Hallen

current=Ip; zprime = zp;
end