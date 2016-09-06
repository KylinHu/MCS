% spacial position for number,intesity,duration, size in each pixel during whole track time
clear 
clc
data_path='/Users/hcq/workspace/MCS/Result/run_globalTropical_86-05_1exp3/';
output_path='/Users/hcq/workspace/MCS/data/';
% data_path='/home/hxm_stu/WORK1/hcq/MCS/Result/run_globalTropical_86-05_1exp3/';
% output_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
% record_name = 'record_tracks_time_01-Dec-1985_01-Feb-1986_01-Jan-1986_01-Feb-1986___area_180_360_1_1080.mat';
% record_name = '*1998_01*1998_01*.mat';
record_name = '*.mat';
all_file = dir(fullfile(data_path, record_name));

%ncid = netcdf.open('/Users/hcq/workspace/MCS_2016_private/landsea.nc','NOWRITE'); 
% ncdisp('landsea.nc'); 
%mask    = ncread('landsea.nc','LSMASK');

%% 

duration = zeros(240,1);
times = zeros(240,1);
% 
for monnum = 1:length(all_file)
    
    load (fullfile(data_path, all_file(monnum).name));
    region = strfind (all_file(monnum).name, '___area_180_360_1_1080.mat');
    daten = all_file(monnum).name(44:region-13);
    dateym = datestr(daten,'yyyymm');
   
    age = [record_tracks.age].';
    mcs_track = record_tracks(find(age>=3));
    
    tem_low_rec = zeros(length(mcs_track), 1);

    
    for i = 1:length(mcs_track)
        track = mcs_track(i);
              
        duration(monnum) = duration(monnum) + track.age;
                       
     end
        duration(monnum) = duration(monnum)/length(mcs_track);

end
[time,index] = sort(times);
duration = duration(index);

file_name = strcat('duration_ts_','global','.mat');
%file_name = strcat('duirnal_','sea','.mat');
% file_name = strcat('duirnal_','land','.mat');
savefile = fullfile(output_path, file_name);
save(savefile, 'time','duration')