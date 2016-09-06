%--time series of MCS number
%--three parts:fig1--global&global_anom+runm;
%--fig2--anom+runm,land,sea,NH,SH;fig3--anom+runm,seven regions
clear 
clc
data_path='/Users/hcq/workspace/MCS/data/';
% data_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
%data_name3= 'record_num_exp3.txt';
data_name= 'record_num_exp3.txt';
record_num = load (fullfile(data_path, data_name));

[xt,i] = sort(record_num(:,1));


% perall= zeros(12);
%k = {'gb','ld','oc','NH','SH','Af','In','WP','CP','EP','SA','At'}
%q = strcat('ynn',k);

    yn = record_num(i,2);
%    disp(j)
%   disp(yn)
%% remove seasonal cycle
   yanom= anom(yn); 
%% running mean
   ymv = runm(yanom); 
%% percent relative deviation
% yf3= yanom/ymon

% calculate percentage of each partens



   %disp(per)
   %disp(perall)
% plot global&global_anom+runm time series
figure(1)
subplot(2,1,1)
plot_num_ts(yn)
title('Global MCS number Time series');

subplot(2,1,2)
plot_num_ts_anom_runm(yanom,ymv)
legend('Numanom','run11');
title('Global MCS number Time series removing seasonal cycle');
xlabel('Time(year)');  
ylabel('Number anomaly');
saveas(gcf,'../fig/num_ts_exp3_global','pdf')

