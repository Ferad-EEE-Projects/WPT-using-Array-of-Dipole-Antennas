clc; 
clear all;
%% Array Parameters
nelem = 7;
lambda = 500;
dist = [0.3,0.4,0.5];

multiplier = 0.5; 		ant_length = multiplier*lambda;
multiplier2 = 0.005; 	wire_radius = multiplier2*lambda;

k=2*pi/lambda;%k is the wave number
T=[0:2*pi/360:2*pi];
P=[0:2*pi/360:2*pi];

AFef = zeros(3,length(T));
AFbs = zeros(3,length(T));
U = zeros(3,length(T));

for n = 1:3
    AFef (n,:) = arrayef (T, lambda, nelem, dist(n));
    AFbs (n,:) = arraybs (T, lambda, nelem, dist(n));
end

%{
%AFef = abs(AFef);
figure('DefaultAxesFontSize',12); 
plot(T,AFef(1,:),'-k'); hold on; plot(T,AFef(2,:),'-r'); hold on; plot(T,AFef(3,:),'-b')
title(['Array Factor of Endfire,  N = ', num2str(nelem)]);legend ({'d=0.3','d=0.4','d=0.5'},'location','best')
ylabel ('Array Factor (Ordinary End Fire)'); xlabel ('Angle (rad)');
%}
%
%AFbs = abs(AFbs);
figure('DefaultAxesFontSize',12); 
plot(T,AFbs(1,:),'-k'); hold on; plot(T,AFbs(2,:),'-r'); hold on; plot(T,AFbs(3,:),'-b')
title(['Array Factor of Broadside, N = ', num2str(nelem)]);legend ({'d=0.3','d=0.4','d=0.5'},'location','best')
ylabel ('Array Factor (Broadside End Fire)'); xlabel ('Angle (rad)');
%}


%figure('DefaultAxesFontSize',12); polar(P,AFef(1,:),'-.r');  title('Array Factor of Endfire');