%Author: Hanzalah Bin Sohail
%Roll no. 04112013014
%BS 7th Geophysics (2020-2024)
%Date: 16th Dec, 2023

%======CALCULATING LINEAR MULTIPLE REGRESSION=========%
%================Y=a+b1x1+b2x2========================%

function han_multi_regression(X1,X2,Y) %Required trivariate dataset 

format shortG
if nargin<3 ||  nargin>3 %3 Input arguments 
    error('Please Insert Three Input arguments');
    
elseif length(X1) ~= length(X2)
    error('Insert datasets of equal length');
    
elseif length(X2) ~= length(Y)
    error('Insert datasets of equal length');    
end 

%Least square solution by deviation from mean 

%Calculating Deviations 
n = length(Y);
X1_bar = mean(X1);
X2_bar = mean(X2);
Y_bar = mean(Y);

for i=1:n
    x1(i) = X1(i) - X1_bar;
    x2(i) = X2(i) - X2_bar;
    y(i) = Y(i) - Y_bar;
end 

%Calculating squares of x1 and x2 and sum
x12 = x1.^2;
s_x12 = sum(x12);
x22 = x2.^2;
s_x22 = sum(x22);

%Multiplying 
for i=1:n
    x1y(i) = x1(i).*y(i);
    x2y(i) = x2(i).*y(i);
    x1x2(i) = x1(i).*x2(i);
end 

%Calculatiny sum
s_x1y = sum(x1y);
s_x2y = sum(x2y);
s_x1x2 = sum(x1x2);

%Calculating b1
b11 = (s_x22.*s_x1y) - (s_x1x2.*s_x2y);
b12 = (s_x12.*s_x22) - (s_x1x2).^2;
b1 = b11./b12;
fprintf('\nb1 = %5.5f\n',b1)

%Calculting b2
b21 = (s_x12.*s_x2y) - (s_x1x2.*s_x1y);
b22 = (s_x12.*s_x22) - (s_x1x2).^2;
b2 = b21./b22;
fprintf('\nb2 = %5.5f\n',b2)

%Calculating a 
a = Y_bar - (b1.*X1_bar) - (b2.*X2_bar);
fprintf('\na = %5.5f\n',a)

%Calculating y-hat
for i=1:n
    y_hat(i) = a + (b1.*X1(i)) + (b2.*X2(i));
end 

%Calculating Residuals 
for i=1:n
    res(i) = Y(i)- y_hat(i);
end 

%Generating table 
tbl = table(Y,X1,X2,y',x1',x2',x12',x22',x1y',x2y',x1x2',y_hat',res');
tbl.Properties.VariableNames = {'Y','X1','X2','y','x1','x2','x12','x22','x1y','x2y','x1x2','y_hat','Residuals'};
disp(tbl);

%Creating regression plane
figure;
%plot3(X1,X2,Y,'r')
hold on;
[x1_mesh,x2_mesh] = meshgrid(linspace(min(X1),max(X1)),linspace(min(X2),max(X2)));
y_mesh = a + b1 * x1_mesh + b2 * x2_mesh;
 
%Plotting the regression plane
surf(x1_mesh,x2_mesh,y_mesh,'FaceAlpha',0.5);
xlabel('X1');
ylabel('X2');
zlabel('Y');
title('Multiple Linear Regression');

%Adding data points to the plane 
scatter3(X1,X2,Y,'r','filled','SizeData',100);
colorbar;
colormap('winter');
grid on;
hold off;
end 
