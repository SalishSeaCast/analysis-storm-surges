% drivers for tides done in June 2019

starts = '30-Dec-2006';
ends = '31-Dec-2020';
exclude_long = 1;
cut_off = 0.3;
ssh_units = 'm';
time_zone = 'PST';
num_per_hr = 1;
offset = 0;

% from raw sea level
type = 'NOAA';
filename = '/ocean/nsoontie/MEOPAR/tides/NOAA_tidal_constituents/NeahBay_2015_wlev.csv';
location = 'Neah Bay';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);



