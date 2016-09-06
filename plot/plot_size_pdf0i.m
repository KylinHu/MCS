%--plot Freq
clear 
clc
data_path='/Users/hcq/workspace/MCS/data/';
data_name = 'size_global_exp3.txt';
data_name0 = 'size_sea_exp3.txt';
data_name1 = 'size_land_exp3.txt';
tmp =load (fullfile(data_path, data_name));
tmp0 =load (fullfile(data_path, data_name0));
tmp1 =load (fullfile(data_path, data_name1));

%% size PDF

%% global
cover = tmp(:,2);
sn = zeros(8,1);

t1 = cover<6000;
t2 = cover>=6000&cover<8000;
t3 = cover>=8000&cover<10000;
t4 = cover<12000&cover>=10000;
t5 = cover<14000&cover>=12000;
t6 = cover>=14000&cover<16000;
t7 = cover<18000&cover>=16000;
t8 = cover>=18000&cover<20000;


sn(1)  =length(cover(logical(t1)));
sn(2)  =length(cover(logical(t2)));
sn(3)  =length(cover(logical(t3)));
sn(4)  =length(cover(logical(t4)));
sn(5)  =length(cover(logical(t5)));
sn(6)  =length(cover(logical(t6)));
sn(7)  =length(cover(logical(t7)));
sn(8)  =length(cover(logical(t8)));

%% 
%% sea
cover0 = tmp0(:,2);
sn0 = zeros(8,1);

t01 = cover0<6000;
t02 = cover0>=6000&cover0<8000;
t03 = cover0>=8000&cover0<10000;
t04 = cover0<12000&cover0>=10000;
t05 = cover0<14000&cover0>=12000;
t06 = cover0>=14000&cover0<16000;
t07 = cover0<18000&cover0>=16000;
t08 = cover0>=18000&cover0<20000;

sn0(1)  =length(cover0(logical(t01)));
sn0(2)  =length(cover0(logical(t02)));
sn0(3)  =length(cover0(logical(t03)));
sn0(4)  =length(cover0(logical(t04)));
sn0(5)  =length(cover0(logical(t05)));
sn0(6)  =length(cover0(logical(t06)));
sn0(7)  =length(cover0(logical(t07)));
sn0(8)  =length(cover0(logical(t08)));
%%
%% land
cover1 = tmp1(:,2);
sn1 = zeros(8,1);

t11 = cover1<6000;
t12 = cover1>=6000&cover1<8000;
t13 = cover1>=8000&cover1<10000;
t14 = cover1<12000&cover1>=10000;
t15 = cover1<14000&cover1>=12000;
t16 = cover1>=14000&cover1<16000;
t17 = cover1<18000&cover1>=16000;
t18 = cover1>=18000&cover1<20000;


sn1(1)  =length(cover1(logical(t11)));
sn1(2)  =length(cover1(logical(t12)));
sn1(3)  =length(cover1(logical(t13)));
sn1(4)  =length(cover1(logical(t14)));
sn1(5)  =length(cover1(logical(t15)));
sn1(6)  =length(cover1(logical(t16)));
sn1(7)  =length(cover1(logical(t17)));
sn1(8)  =length(cover1(logical(t18)));

%%
snp = sn/length(cover)*100;
snp0 = sn0/length(cover0)*100;
snp1 = sn1/length(cover1)*100;
    


figure(1)
bar(1:8,[snp,snp0,snp1]);
legend('Global','Sea','Land')
set(gca,'xtick',(1:1:8));
set(gca,'XTickLabel',{'<6' '6-8' '8-10' '10-12' '12-14' '14-16' '16-18' '18-20'})
title('Number PDF');  
xlabel('MCS size(10^3km^2)');  
ylabel('Percentage');

saveas(gcf,'../fig/size_globi_pdf_exp3','pdf')