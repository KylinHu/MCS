%--time series of MCS number
%--three parts:fig1--global&global_anom+runm;
%--fig2--anom+runm,land,sea,NH,SH;fig3--anom+runm,seven regions
clear 
clc
%data_path='/Users/hcq/workspace/MCS_2016_private/data/';
data_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
%data_name3= 'record_num_exp3.txt';
data_name= 'record_num_exp3_region.txt';
record_num = load (fullfile(data_path, data_name));

[xt,i] = sort(record_num(:,1));

yngb = record_num(i,2);
ynld = record_num(i,3);
ynoc = record_num(i,4);
ynNH = record_num(i,5);
ynSH = record_num(i,6);
ynAf = record_num(i,7);
ynIn = record_num(i,8);
ynWP = record_num(i,9);
ynCP = record_num(i,10);
ynEP = record_num(i,11);
ynSA = record_num(i,12);
ynAt = record_num(i,13);
%% remove seasonal cycle
yanom_gb = anom(yngb); 
yanom_ld = anom(ynld); 
yanom_oc = anom(ynoc); 
yanom_NH = anom(ynNH); 
yanom_SH = anom(ynSH); 
yanom_Af = anom(ynAf); 
yanom_In = anom(ynIn); 
yanom_WP = anom(ynWP); 
yanom_CP = anom(ynCP); 
yanom_EP = anom(ynEP); 
yanom_SA = anom(ynSA); 
yanom_At = anom(ynAt); 
 
%% running mean
ymv_gb = runm(yanom_gb); 
ymv_ld = runm(yanom_ld); 
ymv_oc = runm(yanom_oc); 
ymv_NH = runm(yanom_NH); 
ymv_SH = runm(yanom_SH); 
ymv_Af = runm(yanom_Af); 
ymv_In = runm(yanom_In); 
ymv_WP = runm(yanom_WP); 
ymv_CP = runm(yanom_CP); 
ymv_EP = runm(yanom_EP); 
ymv_SA = runm(yanom_SA); 
ymv_At = runm(yanom_At); 

%% percent relative deviation
% yf3= yanom/ymon

% plot global&global_anom+runm time series
figure(1)
subplot(2,1,1)
plot_num_ts(yngb)
title('Global MCS number Time series');

subplot(2,1,2)
plot_num_ts_anom(yanom_gb,ymv_gb)
legend('Numanom','run5');
title('Global MCS number Time series removing seasonal cycle');
xlabel('Time(year)');  
ylabel('Number anomaly');
saveas(gcf,'../fig/num_ts_exp3_global','pdf')

figure(2)
subplot(2,2,1)
plot_num_ts_anom(yanom_ld,ymv_ld)
title('Land');
subplot(2,2,2)
plot_num_ts_anom(yanom_oc,ymv_oc)
title('Ocean');
subplot(2,2,3)
plot_num_ts_anom(yanom_NH,ymv_NH)
title('North Hemisphere');
xlabel('Time(year)');  
subplot(2,2,4)
plot_num_ts_anom(yanom_SH,ymv_SH)
title('South Hemisphere');
xlabel('Time(year)');  

suptitle('MCS number Time series removing seasonal cycle');
saveas(gcf,'../fig/num_ts_exp3_region1','pdf')

figure(3)
subplot(4,2,1)
plot_num_ts_anom(yanom_Af,ymv_Af)
title('Africa');
set(gca,'XTickLabel',{})

subplot(4,2,2)
plot_num_ts_anom(yanom_In,ymv_In)
title('Indian Ocean');
set(gca,'XTickLabel',{})

subplot(4,2,3)
plot_num_ts_anom(yanom_WP,ymv_WP)
title('West Pacific');
set(gca,'XTickLabel',{})

subplot(4,2,4)
plot_num_ts_anom(yanom_CP,ymv_CP)
title('Central Pacific');
set(gca,'XTickLabel',{})

subplot(4,2,5)
plot_num_ts_anom(yanom_EP,ymv_EP)
title('Eastern Pacific');
set(gca,'XTickLabel',{})

subplot(4,2,6)
plot_num_ts_anom(yanom_SA,ymv_SA)
title('South America');
xlabel('Time(year)');  

subplot(4,2,7)
plot_num_ts_anom(yanom_At,ymv_At)
title('Atlantic');
xlabel('Time(year)');  

suptitle('MCS number Time series removing seasonal cycle');
saveas(gcf,'../fig/num_ts_exp3_region2','pdf')
