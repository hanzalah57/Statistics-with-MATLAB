%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
%Date: 9 Nov, 2023

function han_moment(insert_data,insert_moment_value);

k = insert_moment_value;
data = insert_data;

%Identifying data 
lower_cl = data(:,1);
upper_cl = data(:,2);
f = data(:,3);

%Calculating mid points 
for i=1:length(upper_cl);
    midp(i)=(upper_cl(i)+lower_cl(i))./2;
end 

%Calculating Mean 
fm = midp.*f';
s1 = sum(fm);
fs = sum(f);
m = s1./fs;
fprintf('Mean = %5.2f \n',m);

%Calculating Mean Deviation 
md_1 = midp-m;
md = abs(md_1);


% Calculating kth Moment 
smd = md.^k;
sf = f'.*smd;
ss = sum(sf);
var = ss./sum(f);
fprintf('%dth Moment = %5.2f \n',k,var);
 if k==2;
     fprintf('which is equals to variance \n');
 end 
end 
