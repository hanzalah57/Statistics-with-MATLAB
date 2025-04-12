%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
%Date: 11th Nov, 2023


%Covariance: measure of the joint variability of two random variables
%Insert data having two column vectors i.e, x and y......................
function han_covariance(d);
data = d;

x = data(:,1);
y = data(:,2);

%Mean of x
nx = length(x);
nxs = sum(x);
mx = nxs/nx;
fprintf('Mean of X = %5.2f\n',mx);

%Mean of y
ny = length(y);
nys = sum(y);
my = nys/ny;
fprintf('Mean of Y = %5.2f\n',my);

for i=1:nx;
    mdx(i) = x(i)-mx;
end 

for i=1:ny;
    mdy(i) = y(i)-my;
end 

m = [x';y';mdx;mdy]';
disp(m);

mm = mdx.*mdy;
mms = sum(mm);
cov = mms./length(x);
fprintf('Covariance = %5.2f\n',cov);


c1 = std(x)*std(y);
c = cov/c1;
fprintf('Correlation Coefficient = %5.2f\n',c);


if cov>0;
    fprintf('X and Y have positive relationship\n');
elseif cov<0;
    fprintf('X and Y have negative relationship\n');
else
    fprintf('X and Y have no relationship\n');
end 
    
    
figure   
hold on;
s = scatter(x,y,'filled');
s.LineWidth = 1.2;
s.MarkerEdgeColor = 'b';
s.MarkerFaceColor = [0 0.5 0.5];
xlabel('X');
ylabel('Y');
title('Correlation');
grid on;
hold off;


end 


    
