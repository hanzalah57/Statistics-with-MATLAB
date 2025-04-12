%Author: Hanzalah Bin Sohail
%Roll no. 04112013014
%BS 7th Geophysics (2020-2024)
%Date: 8th Jan, 2024

%==========TREND SURFACE ANALYSIS==========
%==========Z=f(X,Y)+E======================
%==========Z = a+bX+cY+E===================

function han_trend_surface_analysis(X,Y,Z) %Required trivariate dataset 

%Checking the input data for any error
format shortG
if nargin<3 ||  nargin>3 %3 Input arguments 
    error('Please Insert Three Input arguments');
    
elseif length(X) ~= length(Y)
    error('Insert datasets of equal length');
    
elseif length(Y) ~= length(Z)
    error('Insert datasets of equal length'); 
end 
    
%Defining the required parameters
n = length(X);
SX = sum(X);
SY = sum(Y);
SZ = sum(Z);
SSX = sum(X.^2);
SSY = sum(Y.^2);
for i=1:n
    XY(i) = X(i).*Y(i);
    ZX(i) = Z(i).*X(i);
    ZY(i) = Z(i).*Y(i);
end 
SXY = sum(XY);
SZX = sum(ZX);
SZY = sum(ZY);

%Defining the matrix 
A = [n SX SY;SX SSX SXY;SY SXY SSY]
x = [SZ;SZX;SZY]
B = inv(A)*x

%Finding the trend coefficients from the obtained matrix B
a = B(1,1);
b = B(2,1);
c = B(3,1);
fprintf('\na = %5.5f\n',a)
fprintf('\nb = %5.5f\n',b)
fprintf('\nc = %5.5f\n',c)

%Generating the linear trend surface equation using trend coefficients 
for i=1:n
    z(i) = a + (b.*X(i)) + (c.*Y(i));
end 

%Finding Residuals 
for i=1:n
    res(i) = Z(i)-z(i);
end 

%Squaring the trend values 
sz = z.^2;

%Generating table 
tbl = table(X,Y,Z,z',res',sz');
tbl.Properties.VariableNames = {'X','Y','Z_observed','Z_computed','Residuals','SZ'};
disp(tbl);

%Deriving index of goodness of fit of the trend surface
r1 = sum(sz) - (sum(z).^2)./n;
r2 = sum(Z.^2) - (sum(Z).^2)./n;
r = r1./r2;
fprintf('Ry = %5.4f%%\n',r*100);

%Creating trend surface (plane)
figure;
subplot(1,2,1)
hold on;
[x_mesh,y_mesh] = meshgrid(linspace(min(X),max(Y)),linspace(min(Y),max(X)));
z_mesh = a + b * x_mesh + c * y_mesh;
 
%Plotting the trend surafce using surf
surf(x_mesh,y_mesh,z_mesh,'FaceAlpha',0.5);
xlabel('x-coordinate in km');
ylabel('y-coordinate in km');
zlabel('height in 100m ');
title('Trend Surface in 3D along datapoints');

%Adding data points to the plane 
scatter3(X,Y,Z,'r','filled','SizeData',100);
colorbar;
colormap('Summer');
grid on;
hold off;

subplot(1,2,2)
contourf(x_mesh,y_mesh,z_mesh); 
cb = colorbar;
ylabel(cb, 'height in 100m '); 
xlabel('x-coordinate in km');
ylabel('y-coordinate in km');
title('Trend Surface map');
grid on 

end 


    
