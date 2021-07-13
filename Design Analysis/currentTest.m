clear all;
lambda = 500;
multiplier = 0.5; ant_length = multiplier*lambda;
multiplier2 = 0.005;wire_radius = multiplier2*lambda;

current_steps=199;
feed_voltage = .01*j;
k=2*pi/lambda;
zprime=linspace(-multiplier/2,multiplier/2,current_steps);
current=1*sin(2*pi*(multiplier/2-abs(zprime)));

%%
L = 0.5; a = 0.005; M = 99; ker = 'e'; basis = 't';
if basis=='t'
    D = L/(2*M); 
else
    D = L/(2*M+1);
end
E = zeros(2*M+1,1); E(M+1) = 1/D;
[If,zf,cf] = hfield(L,a,E,ker,basis); % Hall´en
% figure; plot(zf,real(If*10e1),'k--');ylabel('Current (mA)');
%  hold on
%  plot(zprime,abs(current));  title('Current Distribution (Magnitude)');
%%
prad = 0;
T=[0:2*pi/360:2*pi];
P=[0:2*pi/360:2*pi];
F = dipoleint2(T, P, lambda, If', zprime);

semicircle = sin(T(1:181)); %semicircle is a vector of sin(theta) from 0 to pi
prad1 = F(181,1:181); %at this point, prad1 sweeps through the ?? Field from theta = 0:pi
prad1 = prad1.*(pi/180).*semicircle; %now prad is F*sin(theta)*dtheta
prad = sum(prad1)*2*pi; %prad is the "area" under prad1 rotated 2*pi around phi.

M=4*pi*F./prad;

M1=M(91,:); %pluck out the graph that sweeps theta while phi=90
M2=M(:,91); %pluck out the graph that sweeps  phi  while theta=90
figure; polar(T,M1);title('Elevation Plane                                                                                               ');
figure; polar(P,M2');title('Azmuthal Plane                                                                                               ');
