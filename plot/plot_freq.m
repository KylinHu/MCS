%--plot Freq
clear 
clc
data_path='/Users/hcq/workspace/MCS_2016_private/data/';
data_name = 'Fre_size_global.txt';
tmp =load (fullfile(data_path, data_name));

%% duration number Frequency
% agen = tmp(:,2);
% duration = unique(agen);
% numon = [];
% for i = 1:length(duration)
%     nn = tmp(find(tmp(:,2) == duration(i)),3);
%     tmon = length(nn);
%     numsum= sum(nn);
%     numon_avg = numsum/tmon ; 
%     numon = [numon numon_avg];
% end 
% plot(duration, numon)
% title('Duration Frequency');  
% xlabel('Lifecycle(Hours)');  
% ylabel('Number of MCS');
% grid on
% set(gca, 'GridLineStyle' ,'--')
% saveas(gcf,'Freq_duration_global','png')
%% size PDF
size_max = tmp(:,2);
size_avg = tmp(:,3);

xmin=min(size_max);
xmax=max(size_max );
% xp=linspace(xmin,xmax,100);
xp=linspace(5000,500000,500);
f1=ksdensity(size_max,xp);
f2=ksdensity(size_avg,xp);
figure(1)
plot(xp,f1,'r');
hold on 
plot(xp,f2,'k');
legend('sizemax','sizeavg');
grid on
set(gca, 'GridLineStyle' ,'--')
saveas(gcf,'size_pdf','png')
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

