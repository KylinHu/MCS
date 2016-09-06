function [t]=ttest(x)
% INPUT is the variable which will be detected the trend and abrupt.
% OUPUT is the output trend variable from second year to final year minus
% two years.
% t(0.05)=1.645,t(0.01)=2.326 single end test; t(0.05)=1.96,t(0.01)=2.576 double end test
n=length(x);
for i=2:n-2
    sum1=0;
   for j=1:i
       sum1=sum1+x(j);
   end
    mean1(i-1)=sum1/i;
    ss1=0;
    for j=1:i
        ss1=ss1+(x(j)-mean1(i-1))*(x(j)-mean1(i-1));
    end
    fc1(i-1)=ss1/(i-1);
    
    sum2=0;
    for k=i:n
        sum2=sum2+x(k);
    end
    mean2(i-1)=sum2/(n-i+1);
    ss2=0;
    for d=i:n
        ss2=ss2+(x(d)-mean2(i-1))*(x(d)-mean2(i-1));
    end
    fc2(i-1)=ss2/(n-i);
    t(i-1)=(mean1(i-1)-mean2(i-1))*sqrt(i*(n-i+1)*(n-1))/sqrt((i-1)*fc1(i-1)+(n-i)*fc2(i-1))/sqrt(n+1);
end
        
