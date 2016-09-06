clear 
clc
data_path='/Users/hcq/workspace/MCS/data/';
%data_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
%data_name3= 'record_num_exp3.txt';
data_name= 'temp_size_ts_global_exp8';
record = load (fullfile(data_path, data_name));
tem_low = record.tem_low;
tem_avg = record.tem_avg;
size_max = record.size_max;
size_avg= record.size_avg;

%%%%
anom_tem_low = anom(tem_low); 
anom_tem_avg = anom(tem_avg); 
anom_size_max = anom(size_max); 
anom_size_avg = anom(size_avg); 
%%%%%%
figure(1)
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

figure(2)
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