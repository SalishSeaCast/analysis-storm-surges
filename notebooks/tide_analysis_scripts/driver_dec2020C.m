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


% from NOAA constituents
type = 'NOAA_const';
filename = '/home/sallen/MEOPAR/tidal_constituents/NOAA_tidal_constituents/CherryPoint_harmonics.csv';
location = 'Cherry Point';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);

filename = '/home/sallen/MEOPAR/tidal_constituents/NOAA_tidal_constituents/NeahBay_harmonics.csv';
location = 'Neah Bay';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);

filename = '/home/sallen/MEOPAR/tidal_constituents/tide_data/FridayHarbor_harmonics.csv';
location = 'Friday Harbor';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);


