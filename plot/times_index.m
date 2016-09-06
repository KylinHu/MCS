clear 
clc
data_path='/Users/hcq/workspace/MCS/data/';
%data_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
%data_name3= 'record_num_exp8.txt';
data_name= 'index_ts_global_exp8';
record = load (fullfile(data_path, data_name));
num = record.num;
duration = record.duration;
tem_low = record.tem_low;
tem_avg = record.tem_avg;
size_max = record.size_max;
size_avg= record.size_avg;

%%%%
anom_num= anom(num); 
anom_duration = anom(duration); 

anom_tem_low = anom(tem_low); 
anom_tem_avg = anom(tem_avg); 
anom_size_max = anom(size_max); 
anom_size_avg = anom(size_avg); 

mv_num = runm(anom_num); 

%%%%%%
figure(1)
subplot(2,1,1)
plot_num_ts(num)
title('Global MCS number Time series');

subplot(2,1,2)
plot_num_ts_anom_runm(anom_num,mv_num)
legend('Numanom','run11');
title('Global MCS number Time series removing seasonal cycle');
xlabel('Time(year)');  
ylabel('Number anomaly');
saveas(gcf,'../fig/num_ts_exp8_global','pdf')


figure(2)
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

figure(3)
subplot(2,1,1)
plot_temsize_ts(tem_low,tem_avg)
title('Global MCS Tb Time series');
ylabel('Degree (K)');
% legend('Tb lowest','Tb avg');

subplot(2,1,2)
plot_temsize_ts_anom(anom_tem_low,anom_tem_avg)
legend('Tb lowest','Tb avg');
title('Global MCS Tb Time series removing seasonal cycle');
xlabel('Time(year)');  
ylabel('Degree (K)');
saveas(gcf,'../fig/temp_ts_exp8_global','pdf')

figure(4)
subplot(2,1,1)
plot_temsize_ts(size_max,size_avg)
title('Global MCS Size Time series');
ylabel('km^2');
% legend('Size max','Size avg');

subplot(2,1,2)
plot_temsize_ts_anom(anom_size_max,anom_size_avg)
legend('Size max','Size avg');
title('Global MCS Size Time series removing seasonal cycle');
xlabel('Time(year)');  
ylabel('km^2');
saveas(gcf,'../fig/size_ts_exp8_global','pdf')