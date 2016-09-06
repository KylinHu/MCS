 %% remove seasonal cycle
function [yanom] =anom(yn)
 for i = 1:12
     ymon= mean(yn(i:12:240));
     yanom(i:12:240)= yn(i:12:240)- ymon;     
 end