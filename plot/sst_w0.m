% 
clear 
clc
data_path='/Users/hcq/workspace/MCS/data/SST/';
data_path0='/Users/hcq/workspace/MCS/data/w500/';
data_name = 'HadISST8009.nc';
data_name0 = 'w500_8399.nc';
data_name1 = 'w500_0009.nc';
%ncid = netcdf.open(fullfile(data_path, data_name),'NOWRITE'); 
%ncdisp(fullfile(data_path, data_name)); 
 

sstData    = ncread(fullfile(data_path, data_name),'sst');
wData0    = ncread(fullfile(data_path0, data_name0),'w');
wData1    = ncread(fullfile(data_path0, data_name1),'w');
% TimeData  = ncread(fullfile(data_path0, data_name0),'time'); %????time
% LonData  = ncread(fullfile(data_path0, data_name0),'longitude'); %????lon
% LatData  = ncread(fullfile(data_path0, data_name0),'latitude'); %????lat

% sst  = sstData(:,60:121,73:312);  %for tropical area,1986-2005
% [x,y,z] = size(sst);
% ssti = reshape(sst,1,x*y*z);


% N = zeros(18,1);
% % N(1) = length(ssti(logical(ssti < 21)));
% % N(20) = length(ssti(logical(ssti >= 30)));
% for i = 1:18
%     t = ssti>=20.5+0.5*i & ssti < 21+0.5*i;
% %     t(isnan(t)) = 0;
%     N(i) = length(ssti(logical(t))); 
% end
% 
% np = N/length(ssti)*100;
% 
% figure(1)
% plot(0.5:17.5,np);
% hold on
% scatter(0.5:17.5,np);
% 
% set(gca,'xtick',(0:2:18));
% set(gca,'XTickLabel',{'21' '22' '23' '24' '25' '26' '27' '28' '29' '30'})
% 
% xlabel('SST (^o C)');  
% ylabel('PDF (%)');
% 
% grid on
% set(gca, 'GridLineStyle' ,'--')
%%

saveas(gcf,'../fig/sst_w500_alltime_pdf','pdf')