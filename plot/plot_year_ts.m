function plot_year_ts(yn)
% plot(12:251, yn, 'k')
plot(1:20, yn)
legend('Num');
set(gca,'xtick',(1:2:41));
set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04' '06'})
xlim([0 21])
%title('Number Time series');  
xlabel('Time(year)');  
ylabel('Number of MCS');
grid on
set(gca, 'GridLineStyle' ,'--')
% saveas(gcf,'fig/num_ts','pdf')
