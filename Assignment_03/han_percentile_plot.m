%Author: Hanzalah Bin Sohail
%Roll no. 04112013014
%BS 7th Geophysics (2020-2024)
%Date: 27 Nov, 2023


function  [tbl,plt] = han_percentile_plot(data);

% Sort the data
d = sort(data);
n = numel(d);

% Initialize an empty vector to store percentiles
perc = zeros(1, 100);

% Calculate percentiles from 1 to 100
for i = 1:100
    pos = (i / 100) * (n - 1) + 1; % Adjust position calculation
    if pos == round(pos)
        % If position is an integer, no interpolation needed
        perc(i) = d(pos);
    else
        % Interpolate between values
        lower_index = floor(pos);
        upper_index = ceil(pos);
        fraction = pos - lower_index;
        perc(i) = d(lower_index) * (1 - fraction) + d(upper_index) * fraction;
    end
end

s = 1:100;

%Converting into table
tbl = table(s',perc');
tbl.Properties.VariableNames = {'Percentile_no','Percentiles'};


%Generating Percentile Plot 
if nargout == 2;
    disp(tbl);
    figure;
    plt = plot(s,perc,'r','Linewidth',3);
    ylabel('Percentiles');
    xlabel('Percentile Number');
    title('Percentile Plot');
    legend('Percentile Curve');
    grid on;

elseif nargout == 1;
    disp(tbl);
    
elseif nargout ~= 1 || 2
    error('Please Enter 1 or 2 Output arguments');
end 

end 

        
        