clear 
clc
data_path='/Users/hcq/workspace/MCS/data/';
%data_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
%data_name3= 'record_num_exp3.txt';
data_name= 'duration_ts_global_exp8.mat';
record = load (fullfile(data_path, data_name));
duration = (record.duration-1)*3;

%%%%
anom_duration = anom(duration); 


%%%%%%
figure(1)
subplot(2,1,1)
plot_num_ts(duration)

title('Global MCS Lifetime Time series');
ylabel('Duration (hours)');
legend('lifetime');

subplot(2,1,2)
plot_num_ts_anom(anom_duration)
legend('lifetime anom');
title('Global MCS Lifetime Time series removing seasonal cycle');
xlabel('Time(year)');  
ylabel('Duration (hours)');
saveas(gcf,'../fig/duration_ts_exp8_global','pdf')