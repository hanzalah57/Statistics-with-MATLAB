%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
%Date: 11th Nov, 2023

function han_kurtosis(insert_data);
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
md = midp-m;

% Calculating 2nd Moment 
smd_2 = md.^2;
sf_2 = f'.*smd_2;
ss_2 = sum(sf_2);
m2 = ss_2./sum(f);
fprintf('2nd Moment (Variance) = %5.2f \n',m2);

%Calculating Standard Deviation
sd = sqrt(m2);
fprintf('Standard Deviation = %5.2f\n',sd);


% Calculating 4rd Moment 
smd_4 = md.^4;
sf_4 = f'.*smd_4;
ss_4 = sum(sf_4);
m4 = ss_4./sum(f);
fprintf('4th Moment = %5.2f \n',m4);

%Calculating Kurtosis Coefficient (B2)
B2 = (m4)/(m2^2);
fprintf('Kurtosis Coefficient (B2) = %5.2f \n',B2);

%Calculating Kurtosis Measure (K)
K = (m-med)./sd;
fprintf('Kurtosis Measure (K) = %5.2f\n',K);

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

if B2>3;
    title('Platykurtic Distribution');
    grid on;
elseif B2<3;
    title('Leptokurtic Distribution');
    grid on;
else
    title('Mesokurtic Distribution');
    grid on;
hold off;


end 




