%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023

%Defining Percentile function with inputs 
function han_decile(d,k);
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

%Calculating Decile
n = sum(f);
p = (k/10).*(n);
fprintf('%d th Decile Class = %5.2f th value \n',k,p);
pc = find(cf>=p,1);
dec = (lower_cl(pc))+(p-cf(pc-1))/f(pc).*(upper_cl(pc)-lower_cl(pc));
fprintf('%d th Decile = %5.2f \n',k,dec);

%Representing kth Percentile on percentage frequency curve 
figure;

subplot(2,1,1);
plot(midp,pcf,'m-o','Linewidth',4)
hold on;
plot(dec,0,'r.','MarkerSize',45)
xlabel('Class Marks');
ylabel('Percentage Cumulative Frequency');
title('Decile Representation on a Percentage Cumulative Frequency Curve');
legend('Percentage CF curve','Decile')
hold off;
grid on;

subplot(2,1,2);
plot(midp,f,'b--','Linewidth',4)
hold on;
H=area(midp,f);
set(H(1),'FaceColor',[0.50, 0.33, 0.78]);
plot(dec,0,'r.','MarkerSize',45)
xlabel('Class Marks');
ylabel('Frequency');
title('Decile Representation on a Frequency Distribution Curve');
legend('Frequency Distribution Curve','Area under the curve','Decile')
hold off;
grid on;

end 


