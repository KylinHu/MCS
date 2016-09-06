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
sn = zeros(10,1);

t1 = cover<20000;
t2 = cover>=20000&cover<40000;
t3 = cover>=40000&cover<60000;
t4 = cover<80000&cover>=60000;
t5 = cover<100000&cover>=80000;
t6 = cover>=100000&cover<120000;
t7 = cover<140000&cover>=120000;
t8 = cover>=140000&cover<160000;
t9 = cover>=160000&cover<180000;
t10 = cover>=180000;

sn(1)  =length(cover(logical(t1)));
sn(2)  =length(cover(logical(t2)));
sn(3)  =length(cover(logical(t3)));
sn(4)  =length(cover(logical(t4)));
sn(5)  =length(cover(logical(t5)));
sn(6)  =length(cover(logical(t6)));
sn(7)  =length(cover(logical(t7)));
sn(8)  =length(cover(logical(t8)));
sn(9)  =length(cover(logical(t9)));
sn(10)  =length(cover(logical(t10)));
%% 
%% sea
cover0 = tmp0(:,2);
sn0 = zeros(10,1);

t01 = cover0<20000;
t02 = cover0>=20000&cover0<40000;
t03 = cover0>=40000&cover0<60000;
t04 = cover0<80000&cover0>=60000;
t05 = cover0<100000&cover0>=80000;
t06 = cover0>=100000&cover0<120000;
t07 = cover0<140000&cover0>=120000;
t08 = cover0>=140000&cover0<160000;
t09 = cover0>=160000&cover0<180000;
t010 = cover0>=180000;

sn0(1)  =length(cover0(logical(t01)));
sn0(2)  =length(cover0(logical(t02)));
sn0(3)  =length(cover0(logical(t03)));
sn0(4)  =length(cover0(logical(t04)));
sn0(5)  =length(cover0(logical(t05)));
sn0(6)  =length(cover0(logical(t06)));
sn0(7)  =length(cover0(logical(t07)));
sn0(8)  =length(cover0(logical(t08)));
sn0(9)  =length(cover0(logical(t09)));
sn0(10)  =length(cover0(logical(t010)));
%%
%% land
cover1 = tmp1(:,2);
sn1 = zeros(10,1);

t11 = cover1<20000;
t12 = cover1>=20000&cover1<40000;
t13 = cover1>=40000&cover1<60000;
t14 = cover1<80000&cover1>=60000;
t15 = cover1<100000&cover1>=80000;
t16 = cover1>=100000&cover1<120000;
t17 = cover1<140000&cover1>=120000;
t18 = cover1>=140000&cover1<160000;
t19 = cover1>=160000&cover1<180000;
t110 = cover1>=180000;

sn1(1)  =length(cover1(logical(t11)));
sn1(2)  =length(cover1(logical(t12)));
sn1(3)  =length(cover1(logical(t13)));
sn1(4)  =length(cover1(logical(t14)));
sn1(5)  =length(cover1(logical(t15)));
sn1(6)  =length(cover1(logical(t16)));
sn1(7)  =length(cover1(logical(t17)));
sn1(8)  =length(cover1(logical(t18)));
sn1(9)  =length(cover1(logical(t19)));
sn1(10)  =length(cover1(logical(t110)));
%%
snp = sn/length(cover)*100;
snp0 = sn0/length(cover0)*100;
snp1 = sn1/length(cover1)*100;
    


figure(1)
bar(1:10,[snp,snp0,snp1]);
legend('Global','Sea','Land')
set(gca,'xtick',(1:1:10));
set(gca,'XTickLabel',{'<2' '2-4' '4-6' '6-8' '8-10' '10-12' '12-14' '14-16' '16-18' '>18'})
title('Number PDF');  
xlabel('MCS size(10^4km^2)');  
ylabel('Percentage');

saveas(gcf,'../fig/size_glob_pdf_exp3','pdf')

