%--time series
clear 
clc
%data_path='/Users/hcq/workspace/MCS_2016_private/data/';
data_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
data_name3= 'record_num_exp3.txt';
% data_name = 'record_num_region.txt';
record_num3 = load (fullfile(data_path, data_name3));

[xt3,i3] = sort(record_num3(:,1));

yn3 = record_num3(i3,2);
%yn_s= record_num(i,3);
%yn_l = record_num(i,4);
 %% remove seasonal cycle
 for i = 1:12
     ymon3= round(mean(yn3(i:12:240)));
     yanom3(i:12:240)= yn3(i:12:240)- ymon3;  
 end
yanom3 = yanom3.' ;
 %% plot test time series
% [u1,u2] = mktest(yn3);
% [t] = ttest(yn3);
[u1,u2] = mktest(yanom3);
[t] = ttest(yanom3);

figure(1)
subplot(2,1,1)
lu = length(u1);
plot(1:lu, u1, 'r')
hold on
plot(1:lu, u2, 'b')
hold on

u5 = 1.96*ones(1,lu);
u1 = 2.576*ones(1,lu);
plot(1:lu, u5, '-.k') 
hold on
plot(1:lu, u1, '-.m')
hold on
legend('UF','UB','t0.05','t0.01');
u55 = -u5;
plot(1:lu, u55,'-.k')
hold on
u11 = -u1;
plot(1:lu, u11, '-.m') 

set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04'})
%title('MCS Number Test time series');  
title('MCS Number remove seasonal cycle Test time series');  
xlabel('Time(year)');  
ylabel('MK test parameter');
grid on
set(gca, 'GridLineStyle' ,'--')

subplot(2,1,2)
lt = length(t);
t5 = 1.96*ones(1,lt);
t1 = 2.576*ones(1,lt);

plot(1:lt, t, 'g')
hold on 
plot(1:lt, t5, '-.k')
hold on
plot(1:237, t1, '-.m')
hold on
legend('T','t(0.05)','t(0.01)');

hold on
t55 = -t5;
plot(1:lt, t55, '-.k')
hold on
t11 = -t1;
plot(1:lt, t11, '-.m')

set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04'})
%title('MCS Number Test time series');  
title('MCS Number remove seasonal cycle Test time series');  
xlabel('Time(year)');  
ylabel('T test parameter');
grid on

set(gca, 'GridLineStyle' ,'--')
saveas(gcf,'../fig/num_ts_anom_test_exp3','pdf')
