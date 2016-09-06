% spacial position for number,intesity,duration, size in each pixel during whole track time
clear 
clc
data_path='/Users/hcq/workspace/MCS/Result/run_globalTropical_86-05_1exp3/';
output_path='/Users/hcq/workspace/MCS_2016_private/data/';
%data_path='/home/hxm_stu/WORK1/hcq/MCS/Result/run_globalTropical_86-05_1exp3/';
%output_path='/home/hxm_stu/WORK1/hcq/MCS/data/';
%record_name = 'record_tracks_time_01-Dec-1985_01-Feb-1986_01-Jan-1986_01-Feb-1986___area_180_360_1_1080.mat';
%record_name = '*1998_01*1998_01*.mat';
record_name = '*.mat';
all_file = dir(fullfile(data_path, record_name));

ncid = netcdf.open('/Users/hcq/workspace/MCS_2016_private/landsea.nc','NOWRITE'); 
% ncdisp('landsea.nc'); 
mask    = ncread('landsea.nc','LSMASK');

file_name = strcat('size_global','.txt');
file_name0 = strcat('size_sea','.txt');
file_name1 = strcat('size_land','.txt');

fid = fopen(fullfile(output_path, file_name),'w');
fid0 = fopen(fullfile(output_path, file_name0),'w');
fid1 = fopen(fullfile(output_path, file_name1),'w');
%% 
for monnum = 1:length(all_file)
    
    load (fullfile(data_path, all_file(monnum).name));
    region = strfind (all_file(monnum).name, '___area_180_360_1_1080.mat');
    daten = all_file(monnum).name(44:region-13);
    dateym = datestr(daten,'yyyymm');
   
    age = [record_tracks.age].';
    mcs_track = record_tracks(find(age>=3));
    
%     numage =length(mcs_track.age); 

    % read pixel position
    for i = 1:length(mcs_track)
        track = mcs_track(i);
        for t = 1:track.age

%             pixelnum = length(mcs_track(i).list_pixel{t});
%             for n = 1:pixelnum
%                 x = mcs_track(i).list_pixel{t}(n,1);
%                 y = mcs_track(i).list_pixel{t}(n,2);
                x = round(mcs_track(i).list_shield_x(:,t));
                y = round(mcs_track(i).list_shield_y(:,t));
                lat = 120-fix((x-1)/3);
                lon = fix((y-1)/3+1);
       
                size = mcs_track(i).list_shield(:,t);
                fprintf(fid,'%s %i\n',dateym,size);
                
                if mask(lon,lat)== 0
                    size_sea = mcs_track(i).list_shield(:,t);
                    fprintf(fid0,'%s %i\n',dateym,size_sea);
                end

                if mask(lon,lat)== 1
                    size_land = mcs_track(i).list_shield(:,t);
                    fprintf(fid1,'%s %i\n',dateym,size_land);
                end
        end

    end
        
end

% tem = tem./num;
% duration  = duration./num;
% coverage = coverage./num;
% file_name = strcat('pixel_','yr86yr05monthly','.mat');
% savefile = fullfile(output_path, file_name);
% save(savefile, 'num','tem','duration','coverage','time')

% file_name2 = strcat('pixelxy_num','yr86yr05','.mat');
% savefile2 = fullfile(output_path, file_name2);
% save(savefile2, 'num2')
