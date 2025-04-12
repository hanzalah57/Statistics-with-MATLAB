%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
%Date: 9 Nov, 2023

function han_skewness(insert_data);
data = insert_data;

%Identifying data 
lower_cl = data(:,1);
upper_cl = data(:,2);
f = data(:,3);

%Calculating mid points 
for i=1:length(upper_cl);
    midp(i)=(upper_cl(i)+lower_cl(i))./2;
end 

%Cumulative Frequency Calculation from frequency column 
f = data(:,3);
cf = cumsum(f);
fprintf('Total Frequency = %5.2f\n',cf(end))

%Calculating Mean 
fm = midp.*f';
s1 = sum(fm);
fs = sum(f);
m = s1./fs;
fprintf('Mean = %5.2f \n',m);


%Calculating Median 
p_2 = sum(f)./2;
fprintf('Median class = %5.2f th value \n',p_2);
mc_2 = find(cf>=p_2,1);
med = (lower_cl(mc_2))+(p_2-cf(mc_2-1))/f(mc_2).*(upper_cl(mc_2)-lower_cl(mc_2));
fprintf('Median = %5.2f \n',med);

%Calculating Mode 
p = max(f);
fprintf('Modal class = %5.2f th value \n',p);
mc = find(f==p);
mod = (f(mc)-f(mc-1))./((2*f(mc))-(f(mc-1)+f(mc+1)));
h = upper_cl(mc)-lower_cl(mc);
mod1=mod.*h;
mod2 = mod1+lower_cl(mc);
fprintf('Mode = %5.2f \n',mod2);

%Calculating Mean Deviation 
md_1 = midp-m;
md = abs(md_1);

% Calculating 2nd Moment 
smd_2 = md.^2;
sf_2 = f'.*smd_2;
ss_2 = sum(sf_2);
m2 = ss_2./sum(f);
fprintf('2nd Moment = %5.2f \n',m2);


% Calculating 3rd Moment 
smd_3 = md.^3;
sf_3 = f'.*smd_3;
ss_3 = sum(sf_3);
m3 = ss_3./sum(f);
fprintf('3rd Moment = %5.2f \n',m3);

%Calculating Skewness Coefficient (B1)
B1 = (m3.^2)./(m2.^3);
fprintf('Skewness Coefficient (B1) = %5.2f \n',B1);

%Calculating Skewness Measure (Sk)
sd = sqrt(m2);
fprintf('Standard Deviation = %5.2f\n',sd);
Sk = (m-mod2)./sd;
fprintf('Skewness Measure (Sk) = %5.2f\n',Sk);

%Plotting Distribution
figure;
bar(midp,f,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0 .9 .9],'LineWidth',2)
hold on;
plot(midp,f,'b--','Linewidth',3)
plot(m,0,'r.','MarkerSize',44)
plot(med,0,'c.','MarkerSize',44)
plot(mod2,0,'g.','MarkerSize',44)
xlabel('Class Interval');
ylabel('Frequency');
legend('Histogram','Curve','Mean', 'Median','Mode');

if B1>0;
    title('Positively Skewed Distribution');
    grid on;
elseif B1<0;
    title('Negatively Skewed Distribution');
    grid on;
else
    title('Perfectly Symmetrical Distribution');
    grid on;
hold off;


end 




