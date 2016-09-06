function plot_num_ts_anom_runm(yanom,ymv)
plot(12:251, yanom, 'k')
hold on
plot(12:251, ymv, '-.b')


%legend('Numanom','run5');
set(gca,'xtick',(12:24:252));
set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04' '06'})
xlim([0 263])
%title('Number Time series');  
%xlabel('Time(year)');  
%ylabel('Number anomaly');
grid on
set(gca, 'GridLineStyle' ,'--')
% saveas(gcf,'fig/num_ts','pdf')