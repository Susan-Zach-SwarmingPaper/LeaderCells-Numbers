function NumberofLeaders 
clear all; close all; clc;

cmap = cbrewer('qual','Set1',3)
leaders = nan(12,3);
counter = 1;
desiredwell = 3;
loadname = strcat('Z:\ENG_BBCancer_Shared\group\0Zach\LeaderCombinedData\EGF(E6)_w',...
    num2str(desiredwell),'totalcelldata.mat');
load(loadname);
meanmat = nan(12,1);
stdmat = nan(12,1);

for frame = 1:12
       u = ~isnan(totalcell{1,frame});
       v = ~isnan(totalcell{3,frame});
       w = ~isnan(totalcell{5,frame});
       u = u(:,1);
       v = v(:,1);
       w = w(:,1);
       tempmat = [sum(u),sum(v),sum(w)];
       meanmat(frame) = mean(tempmat,2);

       leaders(frame,:) = tempmat;   
end

plot(5:5:60,leaders(:,1),'linewidth',2,'color',cmap(:,1))
hold on
plot(5:5:60,leaders(:,2),'linewidth',2,'color',cmap(:,2))
plot(5:5:60,leaders(:,3),'linewidth',2,'color',cmap(:,3))
xlabel('Time (hours)');
ylabel('Number of Leaders Identified')
legend('User 1','User 2','User 3')
titlename = strcat({'Well '},num2str(desiredwell),{' Identified Leaders'});
title(titlename);


end