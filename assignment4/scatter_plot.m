function [] = scatter_plot( points )
%SCATTER_PLOT Plots the points as a scatter plot
%   scatter_plot(points)
%   points is an Nx2 matrix consisting of (x,y) data points to be plotted
%   as a scatter plot.

scatter(points(:,1),points(:,2));

end

