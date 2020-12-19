% drivers for tides done in January 2018

% tides from CHS constituents
filename = '/ocean/nsoontie/MEOPAR/tides/CHS_tidal_constituents/07120const.wlev';
location = 'Victoria';
starts = '01-Jan-2013';
ends = '31-Dec-2020';
type = 'CHS';
exclude_long = 1;
cut_off = 0.3;
ssh_units = 'm';
time_zone = 'PST';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

filename = '/ocean/nsoontie/MEOPAR/tides/CHS_tidal_constituents/07917const.wlev';
location = 'Nanaimo';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

filename = '/ocean/nsoontie/MEOPAR/tides/CHS_tidal_constituents/07795const.wlev';
location = 'Point Atkinson';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

filename = '/ocean/nsoontie/MEOPAR/tides/CHS_tidal_constituents/07811const.wlev';
location = 'Squamish';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

filename = '/ocean/nsoontie/MEOPAR/tides/CHS_tidal_constituents/07830const.wlev';
location = 'Halfmoon Bay';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

filename = '/ocean/nsoontie/MEOPAR/tides/CHS_tidal_constituents/07277const.wlev';
location = 'Patricia Bay';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

filename = '/ocean/nsoontie/MEOPAR/tides/CHS_tidal_constituents/08525const.wlev';
location = 'Port Renfrew';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

filename = '/ocean/nsoontie/MEOPAR/tides/CHS_tidal_constituents/08074const.wlev';
location = 'Campbell River';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

filename = '/home/sallen/MEOPAR/tide_data/07604const.wlev';
location = 'Sand Heads';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

filename = '/home/sallen/MEOPAR/tide_data/07610const.wlev';
location = 'Woodwards Landing';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

filename = '/home/sallen/MEOPAR/tide_data/07654const.wlev';
location = 'New Westminster';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

filename = '/home/sallen/MEOPAR/tide_data/07786const.wlev';
location = 'Sandy Cove';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

% from NOAA constituents
type = 'NOAA_const';
filename = '/ocean/nsoontie/MEOPAR/tides/NOAA_tidal_constituents/CherryPoint_harmonics.csv';
location = 'Cherry Point';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

filename = '/ocean/nsoontie/MEOPAR/tides/NOAA_tidal_constituents/NeahBay_harmonics.csv';
location = 'Neah Bay';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

filename = '/home/sallen/MEOPAR/tide_data/FridayHarbor_harmonics.csv';
location = 'Friday Harbor';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);

% from raw sea level
type = 'NOAA';
filename = '/home/sallen/MEOPAR/tide_data/BoundaryBay/BoundaryBay_2016_wlev.csv';
location = 'Boundary Bay';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);
filename = '/home/sallen/MEOPAR/tide_data/BoundaryBay/BoundaryBay_2015_wlev.csv';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);
% Use 2014 as it has the nicest time series and all three are very similar
filename = '/home/sallen/MEOPAR/tide_data/BoundaryBay/BoundaryBay_2014_wlev.csv';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone);


