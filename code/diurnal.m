% spacial position for number,intesity,duration, size in each pixel during whole track time
clear 
clc
%data_path='/Users/hcq/workspace/MCS/Result/run_globalTropical_86-05_1exp3/';
%output_path='/Users/hcq/workspace/MCS_2016_private/data/space/';
data_path='/home/hxm_stu/WORK1/hcq/MCS/Result/run_globalTropical_86-05_1exp3/';
output_path='/home/hxm_stu/WORK1/hcq/MCS_analyze/data/';
%record_name = 'record_tracks_time_01-Dec-1985_01-Feb-1986_01-Jan-1986_01-Feb-1986___area_180_360_1_1080.mat';
%record_name = '*1998_01*1998_01*.mat';
record_name = '*.mat';
all_file = dir(fullfile(data_path, record_name));

%ncid = netcdf.open('/Users/hcq/workspace/MCS_2016_private/landsea.nc','NOWRITE'); 
% ncdisp('landsea.nc'); 
%mask    = ncread('landsea.nc','LSMASK');

%% 
num_init = zeros(8,1); 
num = zeros(8,1) ; 
tem_low = zeros(8,1);
tem_avg = zeros(8,1);
size = zeros(8,1);
% 
for monnum = 1:length(all_file)
    
    load (fullfile(data_path, all_file(monnum).name));
    region = strfind (all_file(monnum).name, '___area_180_360_1_1080.mat');
    daten = all_file(monnum).name(44:region-13);
    dateym = datestr(daten,'yyyymm');
   
    age = [record_tracks.age].';
    mcs_track = record_tracks(find(age>=6));
    

    % read pixel position
    for i = 1:length(mcs_track)
        track = mcs_track(i);

        step_init = datestr(timestamp_2_date(mcs_track(i).list_time(1)),15);
        step_init = str2double(step_init(1:2))/3 +1;
        
%        x = round(mcs_track(i).list_shield_x(1));
%        y = round(mcs_track(i).list_shield_y(1));
%        lat = 120-fix((x-1)/3);
%        lon = fix((y-1)/3+1);
%        if mask(lon,lat)== 0                                  
        num_init(step_init) = num_init(step_init) +1;
%        end
        
        for t = 1:track.age

            step = datestr(timestamp_2_date(mcs_track(i).list_time(t)),15);
            step = str2double(step(1:2))/3 +1;
            
            %%%
%            x = round(mcs_track(i).list_shield_x(t));
%            y = round(mcs_track(i).list_shield_y(t));
%            lat = 120-fix((x-1)/3);
%            lon = fix((y-1)/3+1);
            
%            if mask(lon,lat)== 0

                num(step) = num(step) +1;
                
                tem_low(step) = tem_low(step)+mcs_track(i).list_low_temperature(t);
                tem_avg(step) = tem_avg(step)+mcs_track(i).list_avg_temperature(t);
                size(step) = size(step)+mcs_track(i).list_shield(t);
%            end  
        end

    end
        
end
tem_low = tem_low./num;
tem_avg = tem_avg./num;
size = size./num;
file_name = strcat('duirnal_','global','.mat');
%file_name = strcat('duirnal_','sea','.mat');
% file_name = strcat('duirnal_','land','.mat');
savefile = fullfile(output_path, file_name);
save(savefile, 'num_init','num','tem_low','tem_avg','size')
