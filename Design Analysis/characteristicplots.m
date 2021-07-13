%Endfire
De5 = [7.7815, 9.0309, 10];
De6 = [8.5733,9.8227, 10.7918 ];
De7 = [9.2428,10.4922, 11.4613 ];
DT5 = [6.4255, 6.8907,5.2688];
DT6 = [7.0382,7.5182,5.8503];
DT7 = [7.5348, 8.0616, 6.3533 ];

PT5 = [1.9793e-09,1.3787e-09,1.6337e-09];
PT6 = [1.4566e-09, 1.0054e-09,1.1990e-09 ];
PT7 = [1.1280e-09, 7.6613e-10,9.2100e-10 ];

%Broadside
Db_5 = [4.7712, 6.0206, 6.9897];
Db_6 = [5.5630,6.8124, 7.7815];
Db_7 = [6.2325,7.4819, 8.4510 ];
DbT_5 = [5.3419, 6.3885,7.2444];
DbT_6 = [6.0247, 7.1232,7.9877];
DbT_7 = [6.6229,7.7444,8.6302]; 

PbT_5 = [9.2335e-09,7.2562e-09,5.9583e-09];
PbT_6 = [7.8902e-09,6.1269e-09,5.0210e-09];
PbT_7 = [6.8749e-09,5.3103e-09,4.3306e-09];

dist = [0.3 0.4 0.5];

figure('DefaultAxesFontSize',12); 
yyaxis left
plot (dist,DT5,'-ok',dist,DT6,'--+k',dist,DT7,'-.+k');
ylabel ('Directivity of AF (DB)'); xlabel ('Inter-element spacing');
yyaxis right
plot (dist,De5,'-or',dist,De6,'--+r',dist,De7,'-.+r');
title('Directivity of Endfire Array'); legend ({'N=5','N=6','N=7'},'location','best','FontSize',15)
ylabel ('Directivity of Total Element (DB)'); 


figure('DefaultAxesFontSize',12); 
yyaxis left
plot (dist,DbT_5,'-ok',dist,DbT_6,'--+k',dist,DbT_7,'-.+k');
ylabel ('Directivity of Total Element (DB)'); xlabel ('Inter-element spacing');
yyaxis right
plot (dist,Db_5,'-or',dist,Db_6,'--+r',dist,Db_7,'-.+r');
title('Directivity of Broadside Array'); legend ({'N=5','N=6','N=7'},'location','best','FontSize',15)
ylabel ('Directivity of AF (DB)'); 







