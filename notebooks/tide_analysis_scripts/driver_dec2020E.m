% drivers for tides done in December 2020

starts = '30-Dec-2006';
ends = '31-Dec-2030';
exclude_long = 1;
cut_off = 0.3;
ssh_units = 'm';
time_zone = 'PST';

type = 'NOAA';
% hourly file for ssh calculation
num_per_hr = 1
offset = 0
filename = '/home/sallen/MEOPAR/tidal_constituents/NOAA_tidal_constituents/NeahBay_2015_wlev.csv';
location = 'Neah Bay Hourly';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);


