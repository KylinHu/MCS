%--time series of MCS number
%--three parts:fig1--global&global_anom+runm;
%--fig2--anom+runm,land,sea,NH,SH;fig3--anom+runm,seven regions
clear 
clc
data_path='/Users/hcq/workspace/MCS/data/';
% data_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
%data_name3= 'record_num_exp3.txt';
data_name= 'record_num_init_exp3_region.txt';
record_num = load (fullfile(data_path, data_name));

% [xt,i] = sort(record_num(:,1));

yn = zeros(240,12);
yanom = zeros(240,12);
ymv= zeros(240,12);
per= zeros(240,12);
% perall= zeros(12);
%k = {'gb','ld','oc','NH','SH','Af','In','WP','CP','EP','SA','At'}
%q = strcat('ynn',k);
for j = 1:12
    yn(:,j) = record_num(:,j+1);
%    disp(j)
%   disp(yn)
%% remove seasonal cycle
   yanom(:,j) = anom(yn(:,j)); 
%% running mean
   ymv(:,j) = runm(yanom(:,j)); 
%% percent relative deviation
% yf3= yanom/ymon

% calculate percentage of each partens
   per(:,j) = yn(:,j)./yn(:,1)*100;
end
   perall= squeeze(sum(yn,1))./squeeze(sum(yn(:,1),1))*100;
   %disp(per)
   %disp(perall)
% plot global&global_anom+runm time series
figure(1)
subplot(2,1,1)
plot_num_ts(yn(:,1))
title('Global MCS number Time series');

subplot(2,1,2)
plot_num_ts_anom_runm(yanom(:,1),ymv(:,1))
legend('Numanom','run11');
title('Global MCS number Time series removing seasonal cycle');
xlabel('Time(year)');  
ylabel('Number anomaly');
saveas(gcf,'../fig/num_init_ts_exp8_global','pdf')

figure(2)
subplot(2,2,1)
plot_num_ts_anom_runm(yanom(:,2),ymv(:,2))
title(strcat('Land',32,num2str(perall(2),'%4.2f'),'%'));

subplot(2,2,2)
plot_num_ts_anom_runm(yanom(:,3),ymv(:,3))
title(strcat('Ocean',32,num2str(perall(3),'%4.2f'),'%'));
subplot(2,2,3)
plot_num_ts_anom_runm(yanom(:,4),ymv(:,4))
title(strcat('North Hemisphere',32,num2str(perall(4),'%4.2f'),'%'));
xlabel('Time(year)');  
subplot(2,2,4)
plot_num_ts_anom_runm(yanom(:,5),ymv(:,5))
title(strcat('South Hemisphere',32,num2str(perall(5),'%4.2f'),'%'));
xlabel('Time(year)');  

suptitle('MCS number Time series removing seasonal cycle');
saveas(gcf,'../fig/num_init_ts_exp8_region1','pdf')

figure(3)
subplot(4,2,1)
plot_num_ts_anom_runm(yanom(:,6),ymv(:,6))
title(strcat('Africa',32,num2str(perall(6),'%4.2f'),'%'));
set(gca,'XTickLabel',{})

subplot(4,2,2)
plot_num_ts_anom_runm(yanom(:,7),ymv(:,7))
title(strcat('Indian Ocean',32,num2str(perall(7),'%4.2f'),'%'));
set(gca,'XTickLabel',{})

subplot(4,2,3)
plot_num_ts_anom_runm(yanom(:,8),ymv(:,8))
title(strcat('Weat Pacific',32,num2str(perall(8),'%4.2f'),'%'));
set(gca,'XTickLabel',{})

subplot(4,2,4)
plot_num_ts_anom_runm(yanom(:,9),ymv(:,9))
title(strcat('Central Pacific',32,num2str(perall(9),'%4.2f'),'%'));
set(gca,'XTickLabel',{})

subplot(4,2,5)
plot_num_ts_anom_runm(yanom(:,10),ymv(:,10))
title(strcat('East Pacific',32,num2str(perall(10),'%4.2f'),'%'));
set(gca,'XTickLabel',{})

subplot(4,2,6)
plot_num_ts_anom_runm(yanom(:,11),ymv(:,11))
title(strcat('South Ameriac',32,num2str(perall(11),'%4.2f'),'%'));
xlabel('Time(year)');  

subplot(4,2,7)
plot_num_ts_anom_runm(yanom(:,12),ymv(:,12))
title(strcat('Atlantic',32,num2str(perall(12),'%4.2f'),'%'));
xlabel('Time(year)');  

suptitle('MCS number Time series removing seasonal cycle');
saveas(gcf,'../fig/num_init_ts_exp8_region2','pdf')

%figure(4)
%subplot(2,1,1)
%plot_num_ts_per(per(:,2:3))
%title('Land Ocean Percentage');
%legend('land','ocean')
%subplot(2,1,2)
%plot_num_ts_per(per(:,4:5))
%title('NH SH Percenteage');
%legend('NH','SH')
%saveas(gcf,'../fig/num_init_ts_exp8_region3','pdf')
%
%figure(5)
%plot_num_ts_per(per(:,6:12))
%title('Basins Percenteage');
%h = legend('Af','In','WP','CP','EP','SA','At');
%saveas(gcf,'../fig/num_init_ts_exp8_region4','pdf')
