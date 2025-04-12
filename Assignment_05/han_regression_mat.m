%Author: Hanzalah Bin Sohail
%Roll no. 04112013014
%BS 7th Geophysics (2020-2024)
%Date: 9th Dec, 2023

%======CALCULATING LINEAR REGRESSION THROUGH LEAST SQUARE METHOD=========
%====== Y=a+bx ======================================
%=======MATRIX APPROACH===============

function han_regression_mat(x,y) %Required two coulmn vectors x and y for linear regression 

format shortG
if nargin<2 ||  nargin>2
    error('Please Insert Two Input arguments');
    
elseif length(x) ~= length(y)
    error('Insert datasets of equal length');
end 

%====== y=a+bx (y on x) y-dependent and x-independent================

%Defining Parameters
n = length(y);
sx = sum(x);
sxs = sum(x.^2);
sy = sum(y);

for i=1:n
    xy(i) = x(i).*y(i);
end 
sxy = sum(xy);

%Defining Matrix 
A = [n sx;sx sxs];
IA = inv(A);
B = [sy;sxy];
X = IA*B;

%SLope b
b = X(2,1);
fprintf('\n Slope (b) = %5.4f\n',b)

%Intercept a 
a = X(1,1);
fprintf('\n Intercept (a) = %5.5f\n',a)

%Generating least square regression equation
i=1;
while i<=n
    y_hat(i) = a + b.*x(i);
    i = i + 1; 
end 

%Calculating Residuals (y-y_hat)
y_hat = y_hat';
for i=1:n
    res(i) = y(i)- y_hat(i);
end 

%Calculating Standard Error Estimate
ys = res.^2;
yss = sum(ys);
sy = sqrt(yss./n);
fprintf('\n Standard Error Estimate = %5.4f\n',sy);

%Standardized Residuals 
res1 = abs(res);
sres = sum(res1);
sresy = sres./sy;
fprintf('\n Standardized Residuals (S.Res.y) = %5.4f\n',sresy);

%Generating table 
tbl = table(x,y,xy',x.^2,y.^2,y_hat,res');
tbl.Properties.VariableNames = {'x','y','xy','x2','y2','y_hat','Residuals'};
disp(tbl); 

%Making plot of Regression Line and Standard Error Estimate
figure;
hold on;
s = scatter(x,y,'b','filled','Marker','o','SizeData',75);
p = plot(x,y_hat,'r','Linewidth',2);
xlabel('X');
ylabel('Y');
legend('Data points','Best fit line','Location','northwest');
title('Best Fit Line through Linear Regression');
grid on;
hold off;
end 
