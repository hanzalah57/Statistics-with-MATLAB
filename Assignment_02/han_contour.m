function han_contour(data);
lat = data(:,1);
lon = data(:,2);
al = data(:,3);

[lon_g,lat_g] = meshgrid(unique(lon),unique(lat));
a_grid = griddata(lon,lat,al,lon_g,lat_g,'linear');
contour(lon_g,lat_g,a_grid);
colorbar;