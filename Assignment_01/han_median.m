
%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023

function han_median(d);
data  = d;

%Cumulative Frequency Calculation from frequency column 
f = data(:,3);
cf = cumsum(f);
fprintf('Total Frequency = %5.2f\n',cf(end))

%Defining Class marks or Midpoints vector 
lower_cl = data(:,1);
upper_cl = data(:,2);
for i=1:length(upper_cl);
midp(i) = (upper_cl(i)+lower_cl(i))/2;
end 
mid_p = midp';

%Making Improved data matrix with midpoints and cumulative frequency column
nd = [lower_cl';upper_cl';f';cf';mid_p'];
new_data=nd';

%Calculating Median 
p = sum(f)./2;
fprintf('Median class = %5.2f th value \n',p);
mc = find(cf>=p,1);
med = (lower_cl(mc))+(p-cf(mc-1))/f(mc).*(upper_cl(mc)-lower_cl(mc));
fprintf('Median = %5.2f \n',med);

%Percentage Cumulative frequency
pc = (cf/sum(f)).*100;
disp(pc);

%Defining Percentage Cumulative Plot 
plot(midp,pc,'g-o','LineWidth',2)
xlabel('Class Marks');
ylabel('Percentage Cumulative Frequency');
title('Median Representation on a Percentage Cumulative Frequency Curve');
grid on;
end 
