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
plot(12:251, yngb, 'k')
legend('Num');
set(gca,'xtick',(12:24:252));
set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04' '06'})
xlim([0 263])
title('Global time series');  
xlabel('Time(year)');  
ylabel('Number of MCS');
grid on
set(gca, 'GridLineStyle' ,'--')

subplot(2,1,2)
plot(12:251, yanom_gb,'k')
hold on
plot(12:251, ymv_gb,'-.b')
legend('Numanom','run5');
set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
xlim([0 263])
title('Global time series remove seasonal cycle');
xlabel('Time(year)');
ylabel('anom Number of MCS');
grid on
set(gca, 'GridLineStyle' ,'--')

saveas(gcf,'../fig/num_ts_exp3_global','pdf')

figure(2)
subplot(2,2,1)
plot(12:251, yanom_ld,'k')
hold on
plot(12:251, ymv_ld,'-.b')
%legend('Numanom','run5');
set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
xlim([0 263])
title('Land time series remove seasonal cycle');
xlabel('Time(year)');
ylabel('anom Number of MCS');
grid on

subplot(2,2,2)
plot(12:251, yanom_oc,'k')
hold on
plot(12:251, ymv_oc,'-.b')
%legend('Numanom','run5');
set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
xlim([0 263])
title('Ocean time series remove seasonal cycle');
xlabel('Time(year)');
ylabel('anom Number of MCS');
grid on

subplot(2,2,3)
plot(12:251, yanom_NH,'k')
hold on
plot(12:251, ymv_NH,'-.b')
%legend('Numanom','run5');
set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
xlim([0 263])
title('NH time series remove seasonal cycle');
xlabel('Time(year)');
ylabel('anom Number of MCS');
grid on

subplot(2,2,4)
plot(12:251, yanom_SH,'k')
hold on
plot(12:251, ymv_SH,'-.b')
%legend('Numanom','run5');
set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
xlim([0 263])
title('SH time series remove seasonal cycle');
xlabel('Time(year)');
ylabel('anom Number of MCS');
grid on

saveas(gcf,'../fig/num_ts_exp3_region1','pdf')

figure(3)
subplot(4,2,1)
plot(12:251, yanom_Af,'k')
hold on
plot(12:251, ymv_Af,'-.b')
%legend('Numanom','run5');
set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
xlim([0 263])
title('Africa time series remove seasonal cycle');
xlabel('Time(year)');
%ylabel('anom Number of MCS');
grid on

subplot(4,2,2)
plot(12:251, yanom_In,'k')
hold on
plot(12:251, ymv_In,'-.b')
%legend('Numanom','run5');
set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
xlim([0 263])
title('Indian time series remove seasonal cycle');
xlabel('Time(year)');
%ylabel('anom Number of MCS');
grid on

subplot(4,2,3)
plot(12:251, yanom_WP,'k')
hold on
plot(12:251, ymv_WP,'-.b')
%legend('Numanom','run5');
set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
xlim([0 263])
title('West Pacific time series remove seasonal cycle');
xlabel('Time(year)');
ylabel('anom Number of MCS');
grid on

subplot(4,2,4)
plot(12:251, yanom_CP,'k')
hold on
plot(12:251, ymv_CP,'-.b')
%legend('Numanom','run5');
set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
xlim([0 263])
title('Central Pacific time series remove seasonal cycle');
xlabel('Time(year)');
%ylabel('anom Number of MCS');
grid on

subplot(4,2,5)
plot(12:251, yanom_EP,'k')
hold on
plot(12:251, ymv_EP,'-.b')
%legend('Numanom','run5');
set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
xlim([0 263])
title('Eastern Pacific time series remove seasonal cycle');
xlabel('Time(year)');
%ylabel('anom Number of MCS');
grid on

subplot(4,2,6)
plot(12:251, yanom_SA,'k')
hold on
plot(12:251, ymv_SA,'-.b')
%legend('Numanom','run5');
set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
xlim([0 263])
title('South America time series remove seasonal cycle');
xlabel('Time(year)');
%ylabel('anom Number of MCS');
grid on

subplot(4,2,7)
plot(12:251, yanom_At,'k')
hold on
plot(12:251, ymv_At,'-.b')
%legend('Numanom','run5');
set(gca,'xtick',(0:24:240));
set(gca,'XTickLabel',{'85' '87' '89' '91' '93' '95' '97' '99' '01' '03' '05'})
xlim([0 263])
title('Atlantic time series remove seasonal cycle');
xlabel('Time(year)');
%ylabel('anom Number of MCS');
grid on
saveas(gcf,'../fig/num_ts_exp3_region2','pdf')
