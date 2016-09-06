%--plot Freq
% clear 
% clc
% data_path='/Users/hcq/workspace/MCS/data/';
% data_name = 'size_global_exp3.txt';
% data_name0 = 'size_sea_exp3.txt';
% data_name1 = 'size_land_exp3.txt';
% tmp =load (fullfile(data_path, data_name));
% tmp0 =load (fullfile(data_path, data_name0));
% tmp1 =load (fullfile(data_path, data_name1));

%% size PDF

%% global
cover = tmp(:,2);
sn = zeros(21,1);
q = zeros(21,1);

sn(1) = length(cover(logical(cover<6000)));
q(1) = sn(1);
for i = 1:20

    t = cover>=i*6000 & cover<i*6000+2000;
    sn(i+1) = length(cover(logical(t))); 
    q(i+1) = q(i)+sn(i+1);
 
end

% sn(102) = length(cover(logical(cover>= 1020000)));

snp = sn/length(cover)*100;
tsnp = q/length(cover)*100;


figure(1)
bar(1:21,snp);
hold on
plot(1:21,tsnp);
legend('Global')

% set(gca,'xtick',(1:1:10));
% set(gca,'XTickLabel',{'<2' '2-4' '4-6' '6-8' '8-10' '10-12' '12-14' '14-16' '16-18' '>18'})
title('Number PDF');  
xlabel('MCS size(10^4km^2)');  
ylabel('Percentage');

saveas(gcf,'../fig/size_globii_pdf_exp3','pdf')

