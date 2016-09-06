% PDF,frequency
clear
clc
%data_path='/Users/hcq/workspace/MCS/Result/run_globalTropical_86-05_1exp3/';
%output_path='/Users/hcq/workspace/MCS_2016_private/data/';
data_path='/home/hxm_stu/WORK1/hcq/MCS/Result/run_globalTropical_86-05_1exp3/';
output_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
% record_name = 'record_tracks_time_01-Dec-1985_01-Feb-1986_01-Jan-1986_01-Feb-1986___area_180_360_1_1080.mat';
% record_name = '*1986_01*1986_01*.mat';
record_name = '*.mat';
all_file = dir(fullfile(data_path, record_name));

file_name = strcat('Fre_size_global_exp3','.txt');
fid = fopen(fullfile(output_path, file_name),'w');
for monnum = 1:length(all_file)
    load (fullfile(data_path, all_file(monnum).name));
    region = strfind (all_file(monnum).name, '___area_180_360_1_1080.mat');
    daten = all_file(monnum).name(44:region-13);
    dateym = datestr(daten,'yyyymm');
    age = [record_tracks.age].'; 
    mcs_track0 = record_tracks(find(age>=6));
%% size frequency
    agen  = [mcs_track0.age].';
    duration = unique(agen);
    area = cat(1,mcs_track0.list_shield);
    for i = 1:length(mcs_track0)
        [area_max,tim_step] = max(area(i,:));
        %[area_max,tim_step] = nanmax(area(i,:));
        area_avg= mean(area(i,1:mcs_track0(i).age));
        %area_avg= nanmean(area(i,:));
        fprintf(fid,'%s %i %i\n',dateym, area_max,area_avg);
    end
%% 

end
fclose(fid); 
