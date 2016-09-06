% 
clear 
clc
data_path='/Users/hcq/workspace/MCS/data/';
data_name = 'sst_pdf_monthly.mat';
load(fullfile(data_path, data_name)); 

mlt = zeros(240,1);
pmx = zeros(240,1);
test = zeros(240,1);
for step = 1:240
    [pmx(step),mlt(step)] = max(pdf(step,2:19));
    mlt(step)  = 20.75+mlt(step)*0.5;
    test(step) = mlt(step)*pmx(step);
end
%mlt  = (20.5+mlt*0.5+21+mlt*0.5)*0.5;
figure(1)
plot_num_ts(mlt)


grid on
set(gca, 'GridLineStyle' ,'--')
ylabel('')
%%

saveas(gcf,'../fig/sst_mlt_monthly','pdf')