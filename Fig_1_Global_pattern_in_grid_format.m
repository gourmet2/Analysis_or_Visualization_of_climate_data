% First, we need to have a matrix, for example, the gridded global data. Here we set the pixel without value as NAN.
% matrix_plot is the matrix you'd like to visulize

clc;clear

R = makerefmat('RasterSize', size(matrix_plot),'Latlim', [-90 90], 'Lonlim', [-180 180]); % The latlim & lonlim here depends on the geographic area of your matrix.

ax = worldmap([-90 90],[-180 180]); % choose the display area of the map. This should have the area as your matrix   

setm(ax,'mapprojection','robinson'); % choose the projection of the map. Robinson，Mercator, and Miller are three widely-used projection
setm(ax,'ParallelLabel','off'); % show no latitude information
setm(ax,'MeridianLabel','off'); % show no longitute information
set(ax,'Linewidth',0.5,'fontsize',12); % set the fontsize and linewidth. But changes is not obvious when adjusting the linewidth

h = geoshow(flip(matrix_plot), R, 'DisplayType','texturemap','facealpha','texture');  % show your matrix

set(h,'alphadata',~isnan(flip(matrix_plot))); % NAN pixel has no color.
hc0 = colorbar('southoutside');  % the location of your color bar. Also, you can remove this line so that the colorbar won't show.
set(hc0,'position',[0.25 0.27 0.36 0.035]);  % the location of your color bar. Also, you can remove this line so that the colorbar won't show.


colormap(parula) % colormap
% colormap(ax,map); % you can also set your exclusive colorbar, such as [143 180 104;255 201 104;200 138 112]/255

land = shaperead('landareas', 'UseGeoCoords', true);
geoshow(ax, land, 'FaceColor', 'none')
