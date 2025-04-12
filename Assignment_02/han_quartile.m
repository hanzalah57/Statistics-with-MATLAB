%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023

%Defining Percentile function with inputs 
function han_quartile(d,k);
data=d;

%Defining Columns from data
lower_cl = data(:,1);
upper_cl = data(:,2);
f = data(:,3);

%Calculating Cumulative Frequency
cf = cumsum(f);

%Percentage Cumulative frequency
pcf = (cf/sum(f)).*100;

%Calculating Class Marks or Midpoints 
for i=1:length(upper_cl);
    mid_p(i) = (upper_cl(i)+lower_cl(i))./2;
end 
midp = mid_p';

%Generating Improved data
nd = [lower_cl';upper_cl';f';cf';pcf';midp'];
new_data = nd';
disp(new_data);

%Calculating Quartile
n = sum(f);
p = (k/4).*(n);
fprintf('%d th Quartile Class = %5.2f th value \n',k,p);
pc = find(cf>=p,1);
qua = (lower_cl(pc))+(p-cf(pc-1))/f(pc).*(upper_cl(pc)-lower_cl(pc));
fprintf('%d th Quartile = %5.2f \n',k,qua);

%Range of the Data
minv = lower_cl(1);
maxv = upper_cl(end);
r = maxv - minv;
fprintf('Range = %5.2f \n',r);

%Plotting Distribution
figure;
subplot(2,1,1);
bar(midp,f,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',2)
hold on;
plot(qua,0,'r.','MarkerSize',44)
xlabel('Class Interval');
ylabel('Frequency');
title('Histogram Representation');
legend('Histogram','Quartile');
grid on;
hold off;

subplot(2,1,2);
plot(midp,f,'b--','Linewidth',2);
hold on;
H=area(midp,f);
set(H(1),'FaceColor',[0.3010 0.7450 0.9330]);
hold on;
plot(qua,0,'r.','MarkerSize',44)
xlabel('Class Interval');
ylabel('Frequency');
title('Frequency Distribution');
legend('Frequency Distribution','Area under the curve','Quartile');
grid on;
hold off;

end 
