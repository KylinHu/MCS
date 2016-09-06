% spacial position for number,intesity,duration in each pixel during whole track time
% compare to spa_dis.m : only not ./num
clear 
clc
%data_path='/Users/hcq/workspace/MCS/Result/run_globalTropical_86-05_1exp3/';
%output_path='/Users/hcq/workspace/MCS_2016_private/data/space/';
data_path='/home/hxm_stu/WORK1/hcq/MCS/Result/run_globalTropical_86-05_1exp7/';
output_path='/home/hxm_stu/WORK1/hcq/MCS_analyze/data/';
% record_name = 'record_tracks_time_01-Dec-1985_01-Feb-1986_01-Jan-1986_01-Feb-1986___area_180_360_1_1080.mat';
% record_name = '*1986_01*1986_01*.mat';
record_name = '*.mat';
all_file = dir(fullfile(data_path, record_name));
%% 
% num2 =zeros(181,1080); 
num =zeros(1080,181,240); 
tem =zeros(1080,181,240);
duration =zeros(1080,181,240); 
coverage = zeros(1080,181,240);
% time  = zeros(240);
% num =zeros(1080,181,12); 
% tem =zeros(1080,181,12);
% duration =zeros(1080,181,12); 
% % time  = zeros(12);
for monnum = 1:length(all_file)
    load (fullfile(data_path, all_file(monnum).name));
    region = strfind (all_file(monnum).name, '___area_180_360_1_1080.mat');
    daten = all_file(monnum).name(44:region-13);
    dateym = datestr(daten,'yyyymm');
    
    age = [record_tracks.age].';
    mcs_track = record_tracks(find(age>=6));
    %     pixel = {mcs_track.list_pixel}';
    
%     num1 =zeros(181,1080); 
    % read pixel position
    for i = 1:length(mcs_track)
        track = mcs_track(i);
        for t = 1:track.age
%            pixelnum = length(mcs_track(i).list_pixel{t});
            pixelnum = size(mcs_track(i).list_pixel{t},1);
            for n = 1:pixelnum
                x = mcs_track(i).list_pixel{t}(n,1);
                y = mcs_track(i).list_pixel{t}(n,2);
%                 num1(x,y) = num1(x,y)+1;
%                 num2(x,y) = num2(x,y)+1;
                num(y,x,monnum) = num(y,x,monnum)+1;
                tem(y,x,monnum) = tem(y,x,monnum)+mcs_track(i).list_temperature{t}(n,1);    
                duration(y,x,monnum) = duration(y,x,monnum)+mcs_track(i).age;    
                coverage(y,x,monnum) = coverage(y,x,monnum)+mcs_track(i).list_shield(:,t); 
            end
        end
    end
%     file_name1 = strcat('pixelxy_num',dateym,'.mat');
%     savefile1 = fullfile(output_path, file_name1);
%     save(savefile1, 'num1')
    tm = str2double(dateym);
    time(monnum) = tm;    
end

%tem = tem./num;
%duration  = duration./num;
%coverage = coverage./num;

file_name = strcat('pixel_','yr86yr05monthly_allnum_exp7','.mat');
savefile = fullfile(output_path, file_name);
save(savefile, 'num','tem','duration','coverage','time')

% file_name2 = strcat('pixelxy_num','yr86yr05','.mat');
% savefile2 = fullfile(output_path, file_name2);
% save(savefile2, 'num2')
