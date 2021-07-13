function [D0,Rrad,prad,M1] = dipoleRad (T,U,current,nelem)


semicircle = sin(T(1:181)); %semicircle is a vector of sin(theta) from 0 to pi
prad1 = U(181,1:181); %at this point, prad1 sweeps through the ?? Field from theta = 0:pi
prad1 = prad1.*(pi/180).*semicircle; %now prad is U*sin(theta)*dtheta
prad = sum(prad1)*2*pi; %prad is the "area" under prad1 rotated 2*pi around phi.

M=4*pi*U./prad;
M1=M(91,:); %pluck out the graph that sweeps theta while phi=90
M2=M(:,91); %pluck out the graph that sweeps  phi  while theta=90

D0 = max(max(M));
Rrad = max(current)*nelem; %add the parrallel currents of all array elements
Rrad = abs(2*prad/Rrad^2);

end
