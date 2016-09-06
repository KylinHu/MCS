clear
clc
% data_path='/home/hxm_stu/WORK1/hcq/MCS/Result/run_globalTropical_86-05_1exp3/';
% output_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
data_path='/Users/hcq/workspace/MCS/Result/run_globalTropical_86-05_1exp3/';
output_path='/Users/hcq/workspace/MCS/data/';

% record_name = 'record_tracks_time_01-Dec-1985_01-Feb-1986_01-Jan-1986_01-Feb-1986___area_180_360_1_1080.mat';
% record_name = '*1986_01*1986_01*.mat';
record_name = '*.mat';
all_file = dir(fullfile(data_path, record_name));

file_name = strcat('corr_size_temp_exp3','.txt');
fid = fopen(fullfile(output_path, file_name),'w');

for monnum = 1:length(all_file)
    temp_low = [];
    temp_avg = [];
    coverage = [];
    load (fullfile(data_path, all_file(monnum).name));
    region = strfind (all_file(monnum).name, '___area_180_360_1_1080.mat');
    daten = all_file(monnum).name(44:region-13);
    dateym = datestr(daten,'yyyymm');
    age = [record_tracks.age].'; 
    mcs_track = record_tracks(find(age>=3));
    for i = 1:length(mcs_track)
        track = mcs_track(i);
        for t = 1:track.age
%         step = datestr(timestamp_2_date(track.list_time(t)),15);
%         step = str2double(step(1:2))/3 +1;
        
        temp_low = [temp_low,track.list_low_temperature(t)];
        temp_avg = [temp_avg,track.list_avg_temperature(t)];
        coverage = [coverage,track.list_shield(t)];
        end
    end
    [r1,p1] = corrcoef(temp_low,coverage);%compute sample correlation and p-values
    [r2,p2] = corrcoef(temp_avg,coverage);
    cor1= r1(find(p1<0.05));  % find significant correlations
    cor2= r2(find(p2<0.05));  % find significant correlations                       
    fprintf(fid,'%s %i %i\n',dateym, cor1(1), cor2(1)); 
end
fclose(fid); 