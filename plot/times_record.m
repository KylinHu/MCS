%--time series
clear 
clc
%data_path='/Users/hcq/workspace/MCS_2016_private/data/';
data_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
data_name3= 'record_num_exp3.txt';
data_name4= 'record_num_exp4.txt';
data_name5= 'record_num_exp5_core.txt';
data_name6= 'record_num_exp6_core.txt';
data_name7= 'record_num_exp7.txt';
% data_name = 'record_num_region.txt';
record_num3 = load (fullfile(data_path, data_name3));
record_num4 = load (fullfile(data_path, data_name4));
record_num5 = load (fullfile(data_path, data_name5));
record_num6 = load (fullfile(data_path, data_name6));
record_num7 = load (fullfile(data_path, data_name7));

[xt3,i3] = sort(record_num3(:,1));
[xt4,i4] = sort(record_num4(:,1));
[xt5,i5] = sort(record_num5(:,1));
[xt6,i6] = sort(record_num6(:,1));
[xt7,i7] = sort(record_num7(:,1));

yn3 = record_num3(i3,2);
yn4 = record_num4(i4,2);
yn5 = record_num5(i5,2);
yn6 = record_num6(i6,2);
yn7 = record_num7(i7,2);
%yn_s= record_num(i,3);
%yn_l = record_num(i,4);

% plot time series

figure(1)

subplot(3,2,1)
plot(12:251, yn3, 'k')
hold on
plot(12:251, yn4, 'r')
hold on
plot(12:251, yn5, 'g')
hold on
plot(12:251, yn6, 'b')
hold on
plot(12:251, yn7, 'y')
h=legend('exp3','exp4','exp5','exp6','exp7');
set(h,'Fontsize',2);

set(gca,'xtick',(12:24:252));
set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04' '06'})
xlim([0 263])
title('MCS Number time series');  
xlabel('Time(year)');  
ylabel('Number of MCS');
grid on
set(gca, 'GridLineStyle' ,'--')

subplot(3,2,2)
plot(12:251, yn3, 'k')
set(gca,'xtick',(12:24:252));
set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04' '06'})
xlim([0 263])
title('MCS Number time series');  
xlabel('Time(year)');  
ylabel('Number of MCS');
grid on
set(gca, 'GridLineStyle' ,'--')

subplot(3,2,3)
plot(12:251, yn4, 'r')
set(gca,'xtick',(12:24:252));
set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04' '06'})
xlim([0 263])
title('MCS Number time series');  
xlabel('Time(year)');  
ylabel('Number of MCS');
grid on
set(gca, 'GridLineStyle' ,'--')

subplot(3,2,4)
plot(12:251, yn5, 'g')
set(gca,'xtick',(12:24:252));
set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04' '06'})
xlim([0 263])
title('MCS Number time series');  
xlabel('Time(year)');  
ylabel('Number of MCS');
grid on
set(gca, 'GridLineStyle' ,'--')

subplot(3,2,5)
plot(12:251, yn6, 'b')
set(gca,'xtick',(12:24:252));
set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04' '06'})
xlim([0 263])
title('MCS Number time series');  
xlabel('Time(year)');  
ylabel('Number of MCS');
grid on
set(gca, 'GridLineStyle' ,'--')

subplot(3,2,6)
plot(12:251, yn7, 'y')
set(gca,'xtick',(12:24:252));
set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04' '06'})
xlim([0 263])
title('MCS Number time series');  
xlabel('Time(year)');  
ylabel('Number of MCS');
grid on
set(gca, 'GridLineStyle' ,'--')

saveas(gcf,'../fig/num_ts','pdf')

 %% remove seasonal cycle
 for i = 1:12
     ymon3= round(mean(yn3(i:12:240)));
     yanom3(i:12:240)= yn3(i:12:240)- ymon3;
     
     ymon4= round(mean(yn4(i:12:240)));
     yanom4(i:12:240)= yn4(i:12:240)- ymon4;
     ymon5= round(mean(yn5(i:12:240)));
     yanom5(i:12:240)= yn5(i:12:240)- ymon5;
     ymon6= round(mean(yn6(i:12:240)));
     yanom6(i:12:240)= yn6(i:12:240)- ymon6;
     ymon7= round(mean(yn7(i:12:240)));
     yanom7(i:12:240)= yn7(i:12:240)- ymon7;
 end
 figure(2)
 subplot(3,2,1)
 plot(12:251, yanom3,'k')
 hold on
 plot(12:251, yanom4,'r')
 hold on
 plot(12:251, yanom5,'g')
 hold on
 plot(12:251, yanom6,'b')
 hold on
 plot(12:251, yanom7,'y')
 hold on
 h=legend('exp3','exp4','exp5','exp6','exp7');
 set(h,'Fontsize',2);
 %legend('Numanomexp3','Numanomexp4','Numanomexp5','Numanomexp6','Numanomexp7');
 set(gca,'xtick',(0:24:240));
 set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
 xlim([0 263])
 title('MCS Number time series  remove seasonal cycle');  
 xlabel('Time(year)');  
 ylabel('anom Number of MCS');
 %grid on
 %set(gca, 'GridLineStyle' ,'--')
 
 saveas(gcf,'../fig/num_ts_anom','pdf')


 subplot(3,2,2)
 plot(12:251, yanom3,'k')
 set(gca,'xtick',(0:24:240));
 set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
 xlim([0 263])
 title('MCS Number time series  remove seasonal cycle');  
 xlabel('Time(year)');  
 ylabel('anom Number of MCS');
 grid on
 set(gca, 'GridLineStyle' ,'--')

 subplot(3,2,3)
 plot(12:251, yanom4,'r')
 set(gca,'xtick',(0:24:240));
 set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
 xlim([0 263])
 title('MCS Number time series  remove seasonal cycle');  
 xlabel('Time(year)');  
 ylabel('anom Number of MCS');
 grid on
 set(gca, 'GridLineStyle' ,'--')
 
 subplot(3,2,4)
 plot(12:251, yanom5,'g')
 set(gca,'xtick',(0:24:240));
 set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
 xlim([0 263])
 title('MCS Number time series  remove seasonal cycle');  
 xlabel('Time(year)');  
 ylabel('anom Number of MCS');
 grid on
 set(gca, 'GridLineStyle' ,'--')
 
 subplot(3,2,5)
 plot(12:251, yanom6,'b')
 set(gca,'xtick',(0:24:240));
 set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
 xlim([0 263])
 title('MCS Number time series  remove seasonal cycle');  
 xlabel('Time(year)');  
 ylabel('anom Number of MCS');
 grid on
 set(gca, 'GridLineStyle' ,'--')
 
 subplot(3,2,6)
 plot(12:251, yanom7,'y')
 set(gca,'xtick',(0:24:240));
 set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
 xlim([0 263])
 title('MCS Number time series  remove seasonal cycle');  
 xlabel('Time(year)');  
 ylabel('anom Number of MCS');
 grid on
 set(gca, 'GridLineStyle' ,'--')

 set(gca,'xtick',(0:24:240));
 set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
 xlim([0 263])
 title('MCS Number time series  remove seasonal cycle');  
 xlabel('Time(year)');  
 ylabel('anom Number of MCS');
 grid on
 set(gca, 'GridLineStyle' ,'--')
 
 saveas(gcf,'../fig/num_ts_anom','pdf')

