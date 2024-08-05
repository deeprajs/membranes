%Make figures for fig2
%% Read data for figure 2
Var=readtable("Fig_2_3.xlsx");
A=table2array(Var(1:17,2:4));
%% Fig 2 and 3
%2a
figure;

c=bar((A(1:3,1:3)./A(1,1))');
c(1).FaceColor = [0 0 1];
c(2).FaceColor = [1 0 0];
c(3).FaceColor = [0 1 0];

ylim([0,1.05]);
legend("Total Capsids(ELISA)","Full Capsids(qPCR)","Empty Capsids(ELISA-qPCR)");
ticks={sprintf('Original Feed');
        sprintf('Permeate');
        sprintf('Retentate')};
set(gca, 'XTickLabel', ticks,'FontSize', 10.5);
title("Illustration-Perfect Separation (Normalized)");
ylabel("Normalized Number of Capsids");
res = 100;
set(gcf,'paperunits','inches','PaperPosition',[0 0 4 3.1]);
print('2a.tiff','-dtiff',['-r' num2str(res)]);
% 2c
figure;
c=bar((A(6:8,1:3)./A(6,1))');
c(1).FaceColor = [0 0 1];
c(2).FaceColor = [1 0 0];
c(3).FaceColor = [0 1 0];

ylim([0,1.05]);
legend("Total Capsids(ELISA)","Full Capsids(qPCR)","Empty Capsids(ELISA-qPCR)");
ticks={sprintf('Original Feed');
        sprintf('Permeate');
        sprintf('Retentate')};
set(gca, 'XTickLabel', ticks,'FontSize', 10.5);
title("Illustration-No Separation (Normalized)");
ylabel("Normalized Number of Capsids");
res = 100;
set(gcf,'paperunits','inches','PaperPosition',[0 0 4 3.1]);
print('2b.tiff','-dtiff',['-r' num2str(res)]);
%3b
figure;
c=bar((A(11:13,1:3)./A(11,1))');
c(1).FaceColor = [0 0 1];
c(2).FaceColor = [1 0 0];
c(3).FaceColor = [0 1 0];

ylim([0,1.05]);
legend("Total Capsids(ELISA)","Full Capsids(qPCR)","Empty Capsids(ELISA-qPCR)");
ticks={sprintf('Original Feed');
        sprintf('Permeate');
        sprintf('Retentate')};
set(gca, 'XTickLabel', ticks,'FontSize', 10.5);
title("80 nm PCTE Results");
ylabel("Normalized Number of Capsids");
res = 100;
set(gcf,'paperunits','inches','PaperPosition',[0 0 4 3.1]);
print('3b.tiff','-dtiff',['-r' num2str(res)]);

%3a
figure;
c=bar((A(15:17,1:3)./A(15,1))');
c(1).FaceColor = [0 0 1];
c(2).FaceColor = [1 0 0];
c(3).FaceColor = [0 1 0];

ylim([0,1.05]);
legend("Total Capsids(ELISA)","Full Capsids(qPCR)","Empty Capsids(ELISA-qPCR)");
ticks={sprintf('Original Feed');
        sprintf('Permeate');
        sprintf('Retentate')};
set(gca, 'XTickLabel', ticks,'FontSize', 10.5);
title("50 nm PCTE Results");
ylabel("Normalized Number of Capsids");
res = 100;
set(gcf,'paperunits','inches','PaperPosition',[0 0 4 3.1]);
print('3a.tiff','-dtiff',['-r' num2str(res)]);
