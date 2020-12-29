% drivers for tides done in December 2020

starts = '30-Dec-2006';
ends = '31-Dec-2030';
type = 'CHS';
exclude_long = 1;
cut_off = 0.3;
ssh_units = 'm';
time_zone = 'PST';

% 10 minute files with 5 minute offset
num_per_hr = 6
offset = 1/(12*24.)

% from raw sea level
type = 'NOAA';
% Use 2014 as it has the nicest time series and all three (2014-2016) are very similar
filename = '/home/sallen/MEOPAR/tidal_constituents/tide_data/BoundaryBay/BoundaryBay_2014_wlev.csv';
location = 'Boundary Bay';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);


