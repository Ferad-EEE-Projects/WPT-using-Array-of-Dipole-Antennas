clc
clear all;

nelem = 5;
lambda = 500;
dist = 0.3;
multiplier = 0.5; 		ant_length = multiplier*lambda;
multiplier2 = 0.005; 	wire_radius = multiplier2*lambda;
current_steps=199;
feed_voltage = .01*j;

k=2*pi/lambda;
T=[0:2*pi/360:2*pi];
P=[0:2*pi/360:2*pi];

%[AFbs,D0bsdB,D0bs]=arraybs(P,lambda,nelem,dist);
[AFef,D0efdB, D0ef]=arrayef(P,lambda,nelem,dist);

%Current Distribution
[Ip,zp,cp] = dipolecurrent (multiplier,multiplier2);
%figure; plot(zp, real(Ip), '-',zp, imag(Ip), '-');
%title('Current Distribution (Mag and Phase)'); xlabel('Current (amps)'); ylabel('Z Location (m)');

% Iapprox=1*sin(k*(ant_length/2-abs(zprime)));
% figure; plot(zp,abs(Iapprox));  title('Current Distribution (Magnitude)');
% xlabel('Current (amps)'); ylabel('Z Location (m)');

prad = 0; zprime = zp;
%get the Radiation Intensity
%Ubs = dipoleint_array(T, P, lambda, Ip, zprime, AFbs);
[U,Farray] = dipoleint_array(T, P, lambda, Ip, zprime, AFef);

%U = Farray;
%total power radiated
semicircle = sin(T(1:181)); %semicircle is a vector of sin(theta) from 0 to pi
prad1 = U(181,1:181); %at this point, prad1 sweeps through the ?? Field from theta = 0:pi
prad1 = prad1.*(pi/180).*semicircle; %now prad is U*sin(theta)*dtheta
prad = sum(prad1)*2*pi; %prad is the "area" under prad1 rotated 2*pi around phi.


M=4*pi*U./prad;
M1=M(91,:); %pluck out the graph that sweeps theta while phi=90
M2=M(:,91); %pluck out the graph that sweeps phi while theta=90

%figure; polar(T,M1);title('Elevation Plane');
%hold on; polar (T,AFbs,'-r')
%figure; polar(P,M2);title('Azmuthal Plane');

D0 = max(max(M));
Rrad = max(Ip)*nelem; %add the parrallel currents of all array elements
Rrad = abs(2*prad/Rrad^2);
D0dB=10.*log10(D0);

 AFDB = D0efdB
 TEDB = D0dB
% D0dB
% prad
% Rrad;
