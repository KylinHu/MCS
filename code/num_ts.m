% global mcs time series
clear
clc
data_path='/home/hxm_stu/WORK1/hcq/MCS/Result/run_globalTropical_86-05_1exp3/';
output_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
% record_name = 'record_tracks_time_01-Dec-1985_01-Feb-1986_01-Jan-1986_01-Feb-1986___area_180_360_1_1080.mat';
% record_name = '*1986_01*1986_01*.mat';
record_name = '*.mat';
all_file = dir(fullfile(data_path, record_name));
% fin = load (fullfile(data_path, record_name));
% record_tracks = fin.record_tracks;
% ncid = netcdf.open('/home/hxm_stu/WORK1/hcq/MCS/data/landsea.nc','NOWRITE'); 
% ncdisp('landsea.nc'); 
% mask    = ncread('landsea.nc','LSMASK');

%% 
% time series of MCS number in different regions

file_name = strcat('record_num_exp3','.txt');
fid = fopen(fullfile(output_path, file_name),'w');
for monnum = 1:length(all_file)
    load (fullfile(data_path, all_file(monnum).name));
    region = strfind (all_file(monnum).name, '___area_180_360_1_1080.mat');
    daten = all_file(monnum).name(44:region-13);
    dateym = datestr(daten,'yyyymm');
    age = [record_tracks.age].'; 
    mcs_track = record_tracks(find(age>=3));
%     %% regional
%     shield_x = cat(1,mcs_track0.list_shield_x);
%     mcs_track = mcs_track0(find(shield_x(:,1)>=45 & shield_x(:,1)<=135));
%% 
    num = length(mcs_track); 
    % disp (num);
    %% currently cannot read nc in this pro, so just get global num
%    num_sea = 0;
%    num_land = 0;
%     for i = 1:length(mcs_track)    
%        x = round(mcs_track(i).list_shield_x(1));
%        y = round(mcs_track(i).list_shield_y(1));
%        lat = 120-fix((x-1)/3);
%        lon = fix((y-1)/3+1);
%        if mask(lon,lat)== 0  % 0--sea;1--land                                  
%        num_sea = num_sea +1;
%        end
%        if mask(lon,lat)== 1
%         num_land = num_land +1;
%        end
%        fprintf(fid,'%s %i %i %i\n',dateym, num,num_sea,num_land); 
%     end
        fprintf(fid,'%s %i\n',dateym, num); 
end
fclose(fid); 
