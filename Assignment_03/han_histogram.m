%Author: Hanzalah Bin Sohail
%Roll no. 04112013014
%BS 7th Geophysics (2020-2024)
%Date: 27 Nov, 2023

function han_histogram(data);

%Plotting Histogram
figure;
histogram(data,15,'FaceColor',[0.4940 0.1840 0.5660],'EdgeColor',[0.5940 0.1840 0.5560]);
hold on;

% Calculate histogram data manually
[counts, edges] = histcounts(data, 15);

% Calculate bin widths and midpoints
binWidth = edges(2) - edges(1);
binMidpoints = edges(1:end-1) + binWidth / 2;

% Plot line connecting bin midpoints
plot(binMidpoints, counts, 'r.-', 'LineWidth', 2); % Connect midpoints with red dots and lines

hold off;

ylabel('Frequency/Counts');
title('Histogram Plot');
legend('Histogram plot','Line connecting midpoints');
grid on;
end 