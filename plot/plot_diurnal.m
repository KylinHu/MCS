%--plot time series
clear 
clc
%data_path='/Users/hcq/workspace/MCS_2016_private/data/space/';
data_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
% data_name = 'duirnal_global';
data_name0 = 'duirnal_sea';
data_name1 = 'duirnal_land';
data0 = load (fullfile(data_path, data_name0));
data1 = load (fullfile(data_path, data_name1));

num_init0 = data0.num_init;
num_init1 = data1.num_init;

num0 = data0.num;
num1 = data1.num;

tem_low0 = data0.tem_low;
tem_low1 = data1.tem_low;

tem_avg0 = data0.tem_avg;
tem_avg1 = data1.tem_avg;

size0 = data0.size;
size1 = data1.size;

numi_yr0 = num_init0/240; % per year/month
numi_yr1 = num_init1/240;

num_yr0 = num0/240; % per year/month
num_yr1 = num1/240; % per year/month


step = (0:3:21);

subplot(3,2,1)

b = bar(step,[numi_yr0,numi_yr1]);
barmap=[0.0 0.0 1.0; 0.0 1.0 0.0]; %[0.7 0.7 0.7] is grey, [ 0.05 .45 0.1] is green
colormap(barmap);
title('Generate Num')

subplot(3,2,2)
%bar(step,[num_yr0,num_yr1],'group','stack')
bar(step,[num_yr0,num_yr1])
title('Occurrence Num')

subplot(3,2,3)
plot(step,tem_low0,'b')
hold on 
plot(step,tem_low1,'g')
title('Low Temprature(K)')


subplot(3,2,4)
plot(step,tem_avg0,'b')
hold on 
plot(step,tem_avg1,'g')
title('Avg Temprature(K)')

subplot(3,2,5)
plot(step,size0,'b')
hold on 
plot(step,size1,'g')
title('Size')

xlabel('Time(h)');  

set(gca,'xtick',(0:3:21));
%h = legend('sea','land');
%po = get( h, 'Position' );
%legend('boxoff')
%set(h,'Fontsize',10,'Position', [po(1)+0.14, po(2), po(3), po(4)])  


% grid on
% set(gca, 'GridLineStyle' ,'--')
suptitle('Diurnal characteristics');
saveas(gcf,'../fig/diurnal','pdf')
% 
% 
