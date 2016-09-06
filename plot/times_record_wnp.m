%--time series of MCS number
%--three parts:fig1--global&global_anom+runm;
%--fig2--anom+runm,land,sea,NH,SH;fig3--anom+runm,seven regions
clear 
clc
data_path='/Users/hcq/workspace/MCS/data/';
% data_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
%data_name3= 'record_num_exp3.txt';
data_name= 'record_num_init_exp3_WNP.txt';
record_num = load (fullfile(data_path, data_name));

% [xt,i] = sort(record_num(:,1));

yn = zeros(240,4);
ymonavg = zeros(12,4);
ymonsum = zeros(20,4);
yanom = zeros(240,4);
ymv= zeros(240,4);
per= zeros(240,4);
% perall= zeros(12);
%k = {'gb','ld','oc','NH','SH','Af','In','WP','CP','EP','SA','At'}
%q = strcat('ynn',k);
for j = 1:4
    yn(:,j) = record_num(:,j+1);
%    disp(j)
%   disp(yn)

%% monthly
   ymonavg(:,j) = monavg(yn(:,j)); 
   %% remove seasonal cycle
   yanom(:,j) = anom(yn(:,j)); 
%% fixed/chosen monthly add each year
   ymonsum(:,j) = monsum(yn(:,j)); 
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
subplot(2,2,1)
plot_num_ts(yn(:,2))
hold on
plot_num_ts(yn(:,3))
hold on 
plot_num_ts(yn(:,4))
title(strcat('WNP MCS genesis number',32,num2str(perall(2),'%4.2f'),'%'));

legend('WNP','WWNP','EWNP');

%xlabel('Time(year)');  
%ylabel('Number');
% saveas(gcf,'../fig/num_init_ts_exp3_WNP','pdf')

% figure(2)
subplot(2,2,2)
plot_monthly_ts(ymonavg(:,2))
hold on
plot_monthly_ts(ymonavg(:,3))
hold on 
plot_monthly_ts(ymonavg(:,4))
title('Monthly WNP MCS genesis number');
legend('WNP','WWNP','EWNP');
% saveas(gcf,'../fig/num_init_monthly_exp3_WNP','pdf')
xlabel('Time(year)'); 

% figure(3)
subplot(2,2,3)
plot_year_ts(ymonsum(:,2))
hold on
plot_year_ts(ymonsum(:,3))
hold on 
plot_year_ts(ymonsum(:,4))
title('Annaul Jun-Oct WNP MCS genesis number');
legend('WNP','WWNP','EWNP');
saveas(gcf,'../fig/num_init_monadd_exp3_WNP','pdf')
xlabel('Time(year)'); 


