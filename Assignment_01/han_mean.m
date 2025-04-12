
%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023

function han_mean(d);
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

%Calculating Mean 
s1 = sum(mid_p.*f);
s2 = sum(f);
m = s1/s2;
fprintf('Mean = %5.4f\n',m);

disp(new_data);

%Plotting Distribution
figure;
subplot(2,1,1);
bar(midp,f,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',2)
hold on;
plot(m,0,'b.','MarkerSize',44)
xlabel('Class Interval');
ylabel('Frequency');
title('Histogram Representation');
legend('Histogram','Mean');
grid on;

subplot(2,1,2);
plot(midp,f,'color','[0 0.4470 0.7410]','Linewidth',2);
hold on;
H=area(midp,f);
set(H(1),'FaceColor',[0.3010 0.7450 0.9330]);
hold on;
plot(m,0,'b.','MarkerSize',44)
xlabel('Class Interval');
ylabel('Frequency');
title('Frequency Distribution');
legend('Frequency Distribution','Area under the curve','Mean');
grid on;

end 


