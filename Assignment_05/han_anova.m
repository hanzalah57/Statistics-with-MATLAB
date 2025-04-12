%Author: Hanzalah Bin Sohail
%Roll no. 04112013014
%BS 7th Geophysics (2020-2024)
%Date: 6th Jan, 2024

function han_anova(data)
k1 = data(:,1);
k2 = data(:,2);
k3 = data(:,3);
k4 = data(:,4);

%Overall mean 
OM = mean(data(:))

%Calculating number of groups 
NG = size(data,2)

%Calculating number of observations
NO = size(data,1)

%Calculating Group mean and SSB
Gm = mean(data)
SSB = NO*sum((Gm-OM).^2)

%Calculate sum of squares within groups
SSW = 0;
for i=1:NG
    SSW = SSW+sum((data(:,i)-Gm(i)).^2);
end

%Calculating Degrees of Freedom 
dfb = NG-1
dfw = NG*(NO-1)

%Calculating mean squares
MSB = SSB/dfb
MSW = SSW/dfw

%Calculating F-statistics 
Fs = MSB/MSW

%Significance level
alpha = 0.05

%Calculate critical F-value
Crit_f = finv(1-alpha,dfb,dfw)

if Fs>Crit_f
    disp('There is significant difference between the means');
else
    disp('There is no significant difference between the means');
end
end 






