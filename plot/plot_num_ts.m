%% 
function plot_num_ts(yn)
% plot(12:251, yn, 'k')
plot(12:251, yn)
legend('Num');
set(gca,'xtick',(12:24:252));
set(gca,'XTickLabel',{'86' '88' '90' '92' '94' '96' '98' '00' '02' '04' '06'})
xlim([0 263])
%title('Number Time series');  
xlabel('Time(year)');  
ylabel('Number of MCS');
grid on
set(gca, 'GridLineStyle' ,'--')
% saveas(gcf,'fig/num_ts','pdf')
