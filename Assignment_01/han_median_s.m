%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023


function han_median_s(d);
s = sort(d);
n = length(s);
if mod(n,2)==0;
    fprintf('Number of data points are even.\n');
    n2  = n/2;
    m = (s(n2)+s(n2+1))./2;
    fprintf('So Median = %5.2f\n',m);
else
    fprintf('Number of data points are odd.\n');
    n1 = (n+1)/2;
    m = s(n1);
    fprintf('So Median = %5.2f\n',m);
end 

    
    

    