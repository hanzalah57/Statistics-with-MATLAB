%Author: Hanzalah Bin Sohail
%Roll no. 04112013014
%BS 7th Geophysics (2020-2024)
%Date: 9th Dec, 2023

%======CALCULATING REGRESSION THROUGH CORRELATION METHOD=========

function han_regression_r(x,y) %Required two coulmn vectors x and y for linear regression 

format shortG
if nargin<2 ||  nargin>2
    error('Please Insert Two Input arguments');
    
elseif length(x) ~= length(y)
    error('Insert datasets of equal length');
end 

%Raw Score Method for correlation 

%Mean of x
n1 = length(x);
s1 = sum(x);
m1 = s1./n1;
fprintf('\n Mean of x = %5.4f \n \n ',m1);

%Standard Deviation of x 
for i=1:n1;
    mdx(i)=x(i)-m1;
end 
vsx = mdx.^2;
vssx = sum(vsx);
varx = vssx./n1;
sdx = sqrt(varx);
sd1 = sdx;
fprintf('\n Standard deviation of x = %5.4f \n \n ',sd1);

%Mean of y
n2 = length(y);
s2 = sum(y);
m2 = s2./n2;
fprintf('\n Mean of y = %5.4f \n \n ',m2);

%Standard Deviation of y
for i=1:n2
    mdy(i) = y(i) - m2;
end 
vsy = mdy.^2;
vssy = sum(vsy);
vary = vssy./n2;
sdy = sqrt(vary);
sd2 = sdy;
fprintf('\n Standard deviation of y = %5.4f \n \n ',sd2);

%Product of x and y
p = x.*y;
sp = sum(p);

%Sum of squares of x and y
sx = sum(x.^2);
sy = sum(y.^2);

%Calculating correlation Coefficient (r)
r1 = (n1.*sp) - (s1*s2);
r2 = ((n1.*sx) - ( s1.^2)) * ((n1.*sy) - (s2.^2));
r3 = sqrt(r2);
r = r1./r3;

fprintf('\n Correlation Coefficeint (r) = %5.4f \n \n ',r);

if r>0;
    fprintf('\nX and Y have positive relationship\n\n');
elseif r<0;
    fprintf('X and Y have negative relationship\n');
elseif r==1
    fprintf('Strong Positive Correlation\n')
elseif r==-1
    fprintf('Strong Nagative Correlation\n')
else
    fprintf('X and Y have no relationship\n');
end 

%Calculating y_hat Regression Equation (y on x)
for i=1:n1
    y_hat(i) = m2 + ((r.*(sdy./sdx)).* (x(i)-m1));
end 

%Calculating Standard Error Estimate
sy_hat = sdy.*(sqrt(1-r.^2));
fprintf('\n Standard Error Estimate = %5.4f\n',sy_hat);

%Converting into table
tbl = table(x,y,p,x.^2,y.^2,y_hat');
tbl.Properties.VariableNames = {'x','y','xy','x2','y2','y_hat'};
disp(tbl); 
 

%Plotting Regression line 
figure   
hold on;
s = scatter(x,y,'filled','c','filled','Marker','o','SizeData',75);
p = plot(x,y_hat,'r','Linewidth',2);
xlabel('X');
ylabel('Y');
legend('Data points','Best fit line','Location','northwest');
title('Linear Regression through Correlation Nethod');
grid on;
hold off;
    
end 

