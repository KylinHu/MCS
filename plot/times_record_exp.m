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

% plot time series

figure(1)
plot(1:240, yn3, 'k')
legend('Numexp9');
set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04'})
title('MCS Number time series');  
xlabel('Time(year)');  
ylabel('Number of MCS');
grid on
set(gca, 'GridLineStyle' ,'--')
saveas(gcf,'../fig/num_ts_exp9','pdf')

 %% remove seasonal cycle
 for i = 1:12
     ymon3= round(mean(yn3(i:12:240)));
     yanom3(i:12:240)= yn3(i:12:240)- ymon3;
     
 end
 figure(2)
 plot(1:240, yanom3,'k')
 legend('Numanomexp9');
 set(gca,'xtick',(0:24:240));
 set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04' '06'})
 title('MCS Number time series  remove seasonal cycle');  
 xlabel('Time(year)');  
 ylabel('anom Number of MCS');
 grid on
 set(gca, 'GridLineStyle' ,'--')
 saveas(gcf,'../fig/num_ts_anom_exp3','pdf')
