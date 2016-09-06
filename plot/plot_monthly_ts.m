function plot_monthly_ts(yn)
plot(1:12, yn)
% legend('Num');
set(gca,'xtick',(1:1:12));
set(gca,'XTickLabel',{'Jan' 'Feb' 'Mar' 'Apr' 'May' 'Jun' 'Jul' 'Aug' 'Sep' 'Oct' 'Nov' 'Dec'})
xlim([1 12])
%title('Number Time series');  
xlabel('Time(mon)');  
% ylabel('Number of MCS');
grid on
set(gca, 'GridLineStyle' ,'--')
% saveas(gcf,'fig/num_ts','pdf')