 %% monsum
function [ysum] = monsum(yn)
 for j = 1:20
     i= j*12-11;
     ysum(j)= yn(i+5)+yn(i+6)+yn(i+7)+yn(i+8)+yn(i+9);
%     yanom(i:12:240)= yn(i:12:240)- ymon;    
 end