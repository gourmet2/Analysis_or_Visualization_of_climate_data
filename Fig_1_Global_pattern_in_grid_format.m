%

clc;clear

ax = worldmap([-90 90],[-180 180]); %显示的地图范围为-180-180

setm(ax,'mapprojection','robinson'); %robinson生成圆形的图，Mercator则显示很长的地图,miller生成短地图
setm(ax,'ParallelLabel','off');
setm(ax,'MeridianLabel','off');
set(ax,'Linewidth',0.5,'fontsize',12);

R = makerefmat('RasterSize', size(matrix_plot),'Latlim', [-90 90], 'Lonlim', [-180 180]);%lat2 %这里的Lonlim和worldmap中的精度范围保持一致

h=geoshow(flip(matrix_plot),R,'DisplayType','texturemap','facealpha','texture');

set(h,'alphadata',~isnan(flip(matrix_plot)));
hc0=colorbar('southoutside');
set(hc0,'position',[0.25 0.27 0.36 0.035]);

colormap(ax,map);
%colormap(parula) %parula

land = shaperead('landareas', 'UseGeoCoords', true);
geoshow(ax, land, 'FaceColor', 'none')
