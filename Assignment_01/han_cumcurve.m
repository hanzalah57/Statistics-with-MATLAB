
%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023

function han_cumcurve(d);
data=d;

%Calculating cumulative frequency vector from data 

%less than 
f = data(:,3);
cf_lessthan = cumsum(f);
disp(cf_lessthan);

%more than 
ff = flip(f);
cf_m = cumsum(ff);
cf_morethan = flip(cf_m);
disp(cf_morethan);


%Calculating class marks 
lower_cl = data(:,1);
upper_cl = data(:,2);
for i=1:length(upper_cl);
midp(i) = (upper_cl(i)+lower_cl(i))/2;
end 

%Hypsometric curves (ogive curves)
figure;
plot(midp,cf_lessthan,'r-o','Linewidth',2)
xlabel('Class marks');
ylabel('Cumulative Frequency');
title('Hypsometric Curves');
grid on;
hold on;
plot(midp,cf_morethan,'b-s','Linewidth',2)
legend('Less than cumulative frequency', 'More than cumulative frequency','Location','east');

end 