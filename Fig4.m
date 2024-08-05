%Make figures for fig3
%% Read data for figure 3a
Var=readmatrix('Fig4.xlsx','Sheet','30 nm');
A=Var(2:47,4:6);
%% Fig 4a
figure;
for i=1:7
    j=1+7*(i-1);
    B{i}=A(j:j+2,1:3)./A(j,1);%data
    SC(i,:)=2*B{i}(2,:)./(0.5*B{i}(1,:)+B{i}(3,:));%seiving coefficient
    REC(i,:)=(B{i}(2,:)+B{i}(3,:))./B{i}(1,:);%recovery
    C{i}=A(j:j+2,1:3);
end
% normalized mean and std deviation
avgCellnorm =cell2mat({mean(cat(3,B{:}),3)});
stdCellnorm=cell2mat({std(cat(3,B{:}),[],3)});

%std dev for 1st datapoint
avgCell =cell2mat({mean(cat(3,C{:}),3)});
stdCell=cell2mat({std(cat(3,C{:}),[],3)});
stdCellnorm(1,1)=stdCell(1,1)/avgCell(1,1);

%seiving coefficient mean and std deviation
avgSC=mean(SC,1);
stdSC=std(SC,1);

%recovery mean and std deviation
avgREC=mean(REC,1);
stdREC=std(REC,1);
% bar plot of normalized data
c=bar(avgCellnorm);
c(1).FaceColor = [0 0 1];
c(2).FaceColor = [1 0 0];
c(3).FaceColor = [0 1 0];
hold on
[ngroups, nbars] = size(avgCellnorm);

% Calculating the width for each bar group
groupwidth = min(0.8, nbars/(nbars + 1.5));
for i = 1:nbars
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, avgCellnorm(:,i), stdCellnorm(:,i), 'k.');
end
hold off
ylim([0,1.2]);
legend("Total Capsids(ELISA)","Full Capsids(qPCR)","Empty Capsids(ELISA-qPCR)");
ticks={sprintf('Original Feed');
        sprintf('Permeate');
        sprintf('Retentate')};
set(gca, 'XTickLabel', ticks,'FontSize', 10.5);
title("30 nm PCTE Results");
ylabel("Normalized Number of Capsids");
res = 100;
set(gcf,'paperunits','inches','PaperPosition',[0 0 4 3]);
print('4a.tiff','-dtiff',['-r' num2str(res)]);
avgSC(3)./avgSC(2)

%% 4B seiving coefficients
c=bar(avgSC,'FaceColor','flat');
c.CData(1,:) = [0 0 1];
c.CData(2,:) = [1 0 0];
c.CData(3,:) = [0 1 0];
hold on
errorbar(avgSC,stdSC, 'k.');
hold off
axis tight
ylim([0,1.5]);
ticks={sprintf('Total Capsids\\newline   (ELISA)');
        sprintf('FullCapsids\\newline    (qPCR)');
        sprintf('Empty Capsids\\newline(ELISA-qPCR)')};
set(gca, 'XTickLabel', ticks,'FontSize', 10.5);
title("Seiving Coefficients-30 nm PCTE");
ylabel("Seiving Coefficients");
res = 100;
set(gcf,'paperunits','inches','PaperPosition',[0 0 4 3]);
print('4b.tiff','-dtiff',['-r' num2str(res)]);

%% 4c recoveries
c=bar(avgREC,'FaceColor','flat');
c.CData(1,:) = [0 0 1];
c.CData(2,:) = [1 0 0];
c.CData(3,:) = [0 1 0];
hold on
errorbar(avgREC,stdREC, 'k.');
hold off
axis tight
ylim([0,1.5]);
ticks={sprintf('Total Capsids\\newline   (ELISA)');
        sprintf('FullCapsids\\newline    (qPCR)');
        sprintf('Empty Capsids\\newline(ELISA-qPCR)')};
set(gca, 'XTickLabel', ticks,'FontSize', 10.5);
title("Recovery-30 nm PCTE");
ylabel("Recovery");
res = 100;
set(gcf,'paperunits','inches','PaperPosition',[0 0 4 3]);
print('4c.tiff','-dtiff',['-r' num2str(res)]);
