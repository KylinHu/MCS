clear 
clc
data_path='/Users/hcq/workspace/MCS/data/claus/';
data_name = 'claus_1992-07.nc';
ncid = netcdf.open(fullfile(data_path, data_name),'NOWRITE'); 
ncdisp(fullfile(data_path, data_name)); 

TbData    = ncread(fullfile(data_path, data_name),'temperature');
LatData    = ncread(fullfile(data_path, data_name),'latitude');
LonData    = ncread(fullfile(data_path, data_name),'longitude');
netcdf.close(ncid); 