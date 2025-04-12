%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023


function han_sd_g(data);

%Identifying data 
lower_cl = data(:,1);
upper_cl = data(:,2);
f = data(:,3);

%Calculating mid points 
for i=1:length(upper_cl);
    midp(i)=(upper_cl(i)+lower_cl(i))./2;
end 
disp(midp);

%Improved data 
impd = [lower_cl';upper_cl';f';midp]';
disp(impd);

%Calculating mean 
fm = midp.*f';
s1 = sum(fm);
fs = sum(f);
m = s1./fs;
fprintf('Mean = %5.2f \n',m);

%mean deviation 
md = midp-m;
disp(md);

%Variance
smd = md.^2;
sf = f'.*smd;
disp(sf);
ss = sum(sf);
disp(ss);
var = ss./sum(f);
fprintf('Variance = %5.2f \n',var);

%standard deviation 
sd = sqrt(var);
fprintf('Standard Deviation = %5.2f \n',sd);

end 


