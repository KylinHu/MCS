 %% monthly avarage
function [ymon] = monavg(yn)
 for i = 1:12
     ymon(i)= (mean(yn(i:12:240)));
%      yanom(i:12:240)= yn(i:12:240)- ymon;     
 end