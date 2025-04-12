
%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023


function han_mode(d);
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

%Calculating Mode 
p = max(f);
fprintf('Modal class = %5.2f th value \n',p);
mc = find(f==p);
mod = (f(mc)-f(mc-1))./((2*f(mc))-(f(mc-1)+f(mc+1)));
h = upper_cl(mc)-lower_cl(mc);
mod1=mod.*h;
mod2 = mod1+lower_cl(mc);
fprintf('Mode = %5.2f \n',mod2);

%Plotting data distribution with mode
bar(midp,f,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',2)
hold on;
plot(mod2,f(mc),'b.','MarkerSize',44)
xlabel('Class Interval');
ylabel('Frequency');
title('Histogram Representation');
legend('Histogram','Mode');
grid on;
end 