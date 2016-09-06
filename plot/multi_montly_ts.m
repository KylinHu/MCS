clear 
clc
data_path='/Users/hcq/workspace/MCS/data/';
%data_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
%data_name3= 'record_num_exp3.txt';
data_name0= 'record_num_init_exp3_region.txt';
data_name1= 'temp_size_ts_global.mat';
data_name2= 'duration_ts_global.mat';
record0 = load (fullfile(data_path, data_name0));
record1= load (fullfile(data_path, data_name1));
record2 = load (fullfile(data_path, data_name2));

num = record0(:,2);
tem_low = record1.tem_low;
tem_avg = record1.tem_avg;
size_max = record1.size_max;
size_avg= record1.size_avg;
duration = (record2.duration-1)*3;

%%%%
mavg_num = monavg(num); 
mavg_tem_low = monavg(tem_low); 
mavg_tem_avg = monavg(tem_avg); 
mavg_size_max = monavg(size_max); 
mavg_size_avg = monavg(size_avg); 
mavg_duration = monavg(duration); 


%%%%%%
figure(1)
subplot(2,2,1)
plot_monthly_ts(mavg_num)
title('Global monthly MCS Num');
ylabel('Number (n)');
% legend('');

subplot(2,2,2)
plot_monthly_ts(mavg_tem_low)
title('Global monthly MCS Tb');
% hold on 
% plot_monthly_ts(mavg_tem_avg)
ylabel('Degree(K)');
%legend('Tb low','Tb avg');

subplot(2,2,3)
plot_monthly_ts(mavg_size_max)
title('Global monthly MCS Size');
hold on 
plot_monthly_ts(mavg_size_avg)
ylabel('Area(km^2)');
legend('Size max', 'Size avg');

subplot(2,2,4)
plot_monthly_ts(mavg_duration)
title('Global monthly MCS Lifetime');
ylabel('Duration(hours)');
% legend('');

saveas(gcf,'../fig/multi_monthly_global','pdf')