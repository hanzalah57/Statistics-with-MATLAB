%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023


function han_sd(n)
nl = length(n);
ns = sum(n);
m = ns./nl;
for i=1:nl;
    md(i)=n(i)-m;
end 
vs = md.^2;
vs2 = sum(vs);
var = vs2./nl;
sd = sqrt(var);
fprintf('Variance = %5.2f \n',var);
fprintf('Standard Deviation = %5.2f \n',sd);
end 