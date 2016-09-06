% spacial position for number,intesity,duration, size in each pixel during whole track time
clear 
clc
data_path='/Users/hcq/workspace/MCS/Result/run_globalTropical_86-05_1exp3/';
output_path='/Users/hcq/workspace/MCS/data/';
% data_path='/home/hxm_stu/WORK1/hcq/MCS/Result/run_globalTropical_86-05_1exp3/';
% output_path='/home/hxm_stu/WORK1/hcq/MCS_analyze/data/';
record_name = 'record_tracks_time_01-Dec-1985_01-Feb-1986_01-Jan-1986_01-Feb-1986___area_180_360_1_1080.mat';
%record_name = '*1998_01*1998_01*.mat';
% record_name = '*.mat';
all_file = dir(fullfile(data_path, record_name));

%ncid = netcdf.open('/Users/hcq/workspace/MCS_2016_private/landsea.nc','NOWRITE'); 
% ncdisp('landsea.nc'); 
%mask    = ncread('landsea.nc','LSMASK');

%% 

tem_low = zeros(1,1);
tem_avg = zeros(1,1);
size_max = zeros(1,1);
size_avg = zeros(1,1);
times = zeros(1,1);
% 
for monnum = 1:length(all_file)
    
    load (fullfile(data_path, all_file(monnum).name));
    region = strfind (all_file(monnum).name, '___area_180_360_1_1080.mat');
    daten = all_file(monnum).name(44:region-13);
    dateym = datestr(daten,'yyyymm');
   
    age = [record_tracks.age].';
    mcs_track = record_tracks(find(age>=3));
    
    tem_low_rec = zeros(length(mcs_track), 1);
    tem_avg_rec = zeros(length(mcs_track), 1);
    size_max_rec = zeros(length(mcs_track), 1);
    size_avg_rec = zeros(length(mcs_track), 1);
    
    for i = 1:length(mcs_track)
        track = mcs_track(i);
              
        for t = 1:track.age
                       
            tem_low_rec(i) = tem_low_rec(i)+track.list_low_temperature(t);
            tem_avg_rec(i) = tem_avg_rec(i)+track.list_avg_temperature(t);
 
            size_avg_rec(i) = size_avg_rec(i)+ track.list_shield(t);

        end
        tem_low_rec(i) = tem_low_rec(i)/track.age;
        tem_avg_rec(i) = tem_avg_rec(i)/track.age;
        size_max_rec(i) = max(track.list_shield(1:track.age));
        size_avg_rec(i) = size_avg_rec(i)/track.age;
        
        tem_low(monnum) = tem_low(monnum)+tem_low_rec(i);
        tem_avg(monnum) = tem_avg(monnum)+tem_avg_rec(i);
        size_max(monnum) = size_max(monnum)+size_max_rec(i);
        size_avg(monnum) = size_avg(monnum)+size_avg_rec(i);
        
    end
    tem_low(monnum) = tem_low(monnum)/length(mcs_track);
    tem_avg(monnum) = tem_avg(monnum)/length(mcs_track);
    size_max(monnum) = size_max(monnum)/length(mcs_track);
    size_avg(monnum) = size_avg(monnum)/length(mcs_track);
    
    tm = str2double(dateym);
    times(monnum) = tm;
end
[time,index] = sort(times);
tem_low = tem_low(index);
tem_avg = tem_avg(index);
size_max = size_max(index);
size_avg = size_avg(index);

file_name = strcat('temp_size_ts_','global','.mat');
%file_name = strcat('duirnal_','sea','.mat');
% file_name = strcat('duirnal_','land','.mat');
savefile = fullfile(output_path, file_name);
save(savefile, 'time','tem_low','tem_avg','size_max','size_avg')