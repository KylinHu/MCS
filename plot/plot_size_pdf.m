%--plot Freq
clear 
clc
data_path='/Users/hcq/workspace/MCS/data/';
data_name = 'size_global_exp3.txt';
data_name0 = 'size_sea_exp3.txt';
data_name1 = 'size_land_exp3.txt';
tmp =load (fullfile(data_path, data_name));
tmp0 =load (fullfile(data_path, data_name0));
tmp1 =load (fullfile(data_path, data_name1));

%% size PDF
size = tmp(:,2);
size0 = tmp0(:,2);
size1 = tmp1(:,2);

ymin=min(size);
ymax=max(size);

% x=linspace(5000,30000,200); 
% f=x/length(size); 
% yy=hist(size,x); 


% xp=linspace(ymin,ymax,100);
xp=linspace(5000,30000,500); 
f=ksdensity(size,xp);
f0=ksdensity(size0,xp);
f1=ksdensity(size1,xp);


figure(1)
plot(xp,f,'k');
hold on 
plot(xp,f0,'b');
hold on
plot(xp,f1,'r');

legend('global','sea','land');
grid on
set(gca, 'GridLineStyle' ,'--')
saveas(gcf,'../fig/size_global_pdf_exp3','pdf')
%% 

% % plot 
% figure(1)
% plot(1:240, yn1,'r')
% hold on
% plot(1:240, yn2,'k')
% legend('Tmin','Tavg');
% set(gca,'xtick',(12:24:252));
% set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04' '06'})
% title('Intensity');  
% xlabel('Time(year)');  
% ylabel('Temperature of MCS');
% grid on
% set(gca, 'GridLineStyle' ,'--')
% saveas(gcf,'mcs_temp_ts','png')


% % remove seasonal cycle
% for i = 1:12
%     ymon1= mean(yn1(i:12:240));
%     ymon2= mean(yn2(i:12:240));
%     yanom1(i:12:240)= yn1(i:12:240)- ymon1;
%     yanom2(i:12:240)= yn2(i:12:240)- ymon2;
% end
% figure(2)
% plot(1:240, yanom1,'r')
% hold on
% plot(1:240, yanom2,'k')
% legend('Tmin','Tavg');
% set(gca,'xtick',(12:24:252));
% set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04' '06'})
% title('Intensity remove seasonal cycle');  
% xlabel('Time(year)');  
% ylabel('Anomaly Temperature of MCS'); 
% grid on
% set(gca, 'GridLineStyle' ,'--')
% saveas(gcf,'mcs_num_ts','png')

