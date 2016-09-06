% 
% clear 
% clc
% data_path='/Users/hcq/workspace/MCS/data/SST/';
% data_name = 'HadISST8009.nc';
% ncid = netcdf.open(fullfile(data_path, data_name),'NOWRITE'); 
% ncdisp(fullfile(data_path, data_name)); 

sstData    = ncread(fullfile(data_path, data_name),'sst');
% TimeData  = ncread(fullfile(data_path, data_name),'time'); %????time
% LonData  = ncread(fullfile(data_path, data_name),'longitude'); %????lon
% LatData  = ncread(fullfile(data_path, data_name),'latitude'); %????lat

sst  = sstData(:,60:121,73:312);  %for tropical area,1986-2005
[x,y,z] = size(sst);

output_path='/Users/hcq/workspace/MCS/data/';
file_name = strcat('sst_pdf_monthly','.mat');

pdf = zeros(240,20);
for step = 1:240 
    ssts  = sst(:,:,step);
    ssti  = reshape(ssts,1,x*y);
    N = zeros(18,1);
    N(1) = length(ssti(logical(ssti < 21)));
    N(20) = length(ssti(logical(ssti >= 30)));
    for i = 1:18
        t = ssti>=20.5+0.5*i & ssti < 21+0.5*i;
%     t(isnan(t)) = 0;
         N(i+1) = length(ssti(logical(t))); 
    end
    np = N/length(ssti)*100;
    pdf(step,:) =  np;
end
savefile = fullfile(output_path, file_name);
save(savefile,'pdf') 


