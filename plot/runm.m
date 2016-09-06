%% running mean
function [ymv] = runm(yanom)
n =length(yanom);
m = 11;
ymv(1:n)=NaN;

for t=1:n-m+1
    ymv(t+(m-1)/2)=sum(yanom(t:(t+m-1)))/m;
end
