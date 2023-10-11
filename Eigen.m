%The Eigen Values are listed in the attached Excel file. The values are
%plotted and the two AC excitation frequencies are selecter from them.

% Define the Excel file name and sheet name
excelFileName = 'Eigen-Value.xlsx';
sheetName = 'Sheet1';

% Read the data and header labels from Excel
[numData, txtData, ~] = xlsread(excelFileName, sheetName);

% Extract the two columns
column1 = numData(:, 1);
column2 = numData(:, 2);

% Extract header labels
xAxisLabel = txtData{1};
yAxisLabel = txtData{2};

% Define the x-value ranges for subplots
minValue1 = 125.5;
maxValue1 = 126.5;
minValue2 = 187.5;
maxValue2 = 188.5;

% Create a figure for the main plot
figure;

% Main plot (top)
subplot(2, 1, 1); % Create the first subplot
semilogy(column1, column2, 'k-', 'LineWidth', 2); % Black line with increased thickness
xlabel(xAxisLabel); % Use the label from the Excel sheet for the x-axis
ylabel(yAxisLabel); % Use the label from the Excel sheet for the y-axis
%title('Main Plot'); % Main plot title
grid on;

% Add legend to main plot
legend('Damping ratio -- imag(freq)/abs(freq)');

% Get the current axis limits of the main plot
xLimits = xlim;
yLimits = ylim;

% Draw a selection box for Subplot 1 in the main plot
rectangle('Position', [minValue1, min(yLimits), maxValue1 - minValue1, max(yLimits) - min(yLimits)], ...
    'EdgeColor', 'r', 'LineWidth', 2);

% Draw a selection box for Subplot 2 in the main plot
rectangle('Position', [minValue2, min(yLimits), maxValue2 - minValue2, max(yLimits) - min(yLimits)], ...
    'EdgeColor', 'b', 'LineWidth', 2);

% Subplot 1 (bottom-left)
subplot(2, 2, 3); % Create the second subplot in the bottom-left
xRange1 = column1 >= minValue1 & column1 <= maxValue1; % Define the range of values for subplot 1
semilogy(column1(xRange1), column2(xRange1), 'r-', 'LineWidth', 2); % Black line with increased thickness
xlabel(xAxisLabel); % Use the label from the Excel sheet for the x-axis
ylabel(yAxisLabel); % Use the label from the Excel sheet for the y-axis
title('Subplot 1'); % Subplot 1 title
grid on;

% Add legend to subplot 1
legend('Damping ratio -- imag(freq)/abs(freq)');

% Subplot 2 (bottom-right)
subplot(2, 2, 4); % Create the third subplot in the bottom-right
xRange2 = column1 >= minValue2 & column1 <= maxValue2; % Define the range of values for subplot 2
semilogy(column1(xRange2), column2(xRange2), 'b-', 'LineWidth', 2); % Black line with increased thickness
xlabel(xAxisLabel); % Use the label from the Excel sheet for the x-axis
ylabel(yAxisLabel); % Use the label from the Excel sheet for the y-axis
title('Subplot 2'); % Subplot 2 title
grid on;

% Add legend to subplot 2
legend('Damping ratio -- imag(freq)/abs(freq)');

%tiffFilePath = 'E:\MatLAB_Temp\Eigen.tiff';
% Set the desired resolution (e.g., 300 DPI)
%resolution = 300;

% Save the figure as a TIFF file with the specified resolution
%print(gcf, tiffFilePath, '-dtiff', ['-r' num2str(resolution)]);
