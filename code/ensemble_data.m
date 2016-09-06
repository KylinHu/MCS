%%%for data -- Prof Lin
clear 
clc
data_path='/Users/hcq/workspace/MCS/data/';
data_name0= 'record_num_exp3.txt';
data_name1= 'temp_size_ts_global_exp3';
data_name2= 'duration_ts_global_exp3';

record0 = load (fullfile(data_path, data_name0));
record1 = load (fullfile(data_path, data_name1));
record2 = load (fullfile(data_path, data_name2));



record_name = '*.mat';
all_file = dir(fullfile(data_path, record_name));


[time,i] = sort(record0(:,1));
num = record0(i,2);

tem_low = record1.tem_low;
tem_avg = record1.tem_avg;
size_max = record1.size_max;
size_avg= record1.size_avg;
duration = (record2.duration-1)*3;

output_path='/Users/hcq/workspace/MCS/data/';
file_name = strcat('index_ts_','global_','exp3','.mat');
savefile = fullfile(output_path, file_name);
save(savefile, 'time','num','duration','tem_low','tem_avg','size_max','size_avg')