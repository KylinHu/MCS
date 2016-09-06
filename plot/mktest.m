      function [u1,u2]=MKtest(x)
      m=length(x);
       for i=1:m
         xr(i)=x(m+1-i);
       end
      
 u1(1)=0;
       d=0; 
       for i=2:m
         num=0;
         for j=1:i
           if x(i)> x(j)
             num=num+1;
           end
         end
         d=d+num;
         e=i*(i-1)/4;
         var=i*(i-1)*(2*i+5)/72;
         u1(i)=(d-e)/sqrt(var);
       end

 ur(1)=0;
       d=0; 
       for i=2:m
         num=0;
         for j=1:i
           if xr(i)> xr(j)
             num=num+1;
           end
         end
         d=d+num;
         e=i*(i-1)/4;
         var=i*(i-1)*(2*i+5)/72;
         ur(i)=(d-e)/sqrt(var);
       end
       for i=1:m
         u2(i)=-ur(m+1-i);
       end
% t(0.05)=1.645,t(0.01)=2.326 single end test; t(0.05)=1.96,t(0.01)=2.576 double end test.