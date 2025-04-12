%Author: Hanzalah Bin Sohail
%Roll no. 04112013014
%BS 7th Geophysics (2020-2024)
%Date: 4th Dec, 2023

%======CALCULATING PEARSONIAN CORRELATION COEFFICIENT=========

function han_correlation(x,y) %Insert two data sets i.e x and y to be correlated 

format shortG
if nargin<2 ||  nargin>2
    error('Please Insert Two Input arguments');
    
elseif length(x) ~= length(y)
    error('Insert datasets of equal length');
end 

%Raw Score Method 

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

%Through Z-Score Method 

i=1;
while i<=n1
    zx(i) = (x(i) - m1)./sd1;
    i = i+1;
end 


j=1;
while j<=n1
    zy(j) = (y(j) - m2)./sd2;
    j = j+1;
end 

%Multiplying zx and zy 
pz = zx.*zy;
pzs = sum(pz);

%Calculating Correlation Coefficient through zx and zy
rz = pzs./n1;
fprintf('\n Correlation Coefficeint (r) through Z-score method = %5.4f \n \n ',rz);

%Converting into table
tbl = table(x,y,p,x.^2,y.^2,zx',zy',pz');
tbl.Properties.VariableNames = {'x','y','xy','x2','y2','zx','zy','zxzy'};
disp(tbl); 
    
figure   
hold on;
s = scatter(x,y,'filled');
s.LineWidth = 10;
s.Marker = 'o';
s.MarkerEdgeColor = [0 0.5 0.5];
s.MarkerFaceColor = [0 0.5 0.5];
xlabel('X');
ylabel('Y');
title('Correlation Plot');
grid on;
hold off;
    
end 

