% drivers for tides done in December 2020

% tides from CHS constituents
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

filename = '/home/sallen/MEOPAR/tidal_constituents/CHS_tidal_constituents/07917const.wlev';
location = 'Nanaimo';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);

filename = '/home/sallen/MEOPAR/tidal_constituents/CHS_tidal_constituents/07795const.wlev';
location = 'Point Atkinson';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);

filename = '/home/sallen/MEOPAR/tidal_constituents/CHS_tidal_constituents/07811const.wlev';
location = 'Squamish';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);

filename = '/home/sallen/MEOPAR/tidal_constituents/CHS_tidal_constituents/07830const.wlev';
location = 'Halfmoon Bay';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);

filename = '/home/sallen/MEOPAR/tidal_constituents/CHS_tidal_constituents/07277const.wlev';
location = 'Patricia Bay';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);

filename = '/home/sallen/MEOPAR/tidal_constituents/CHS_tidal_constituents/08525const.wlev';
location = 'Port Renfrew';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);

filename = '/home/sallen/MEOPAR/tidal_constituents/CHS_tidal_constituents/08074const.wlev';
location = 'Campbell River';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);

filename = '/home/sallen/MEOPAR/tidal_constituents/tide_data/07604const.wlev';
location = 'Sand Heads';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);

filename = '/home/sallen/MEOPAR/tidal_constituents/tide_data/07610const.wlev';
location = 'Woodwards Landing';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);

filename = '/home/sallen/MEOPAR/tidal_constituents/tide_data/07654const.wlev';
location = 'New Westminster';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);

filename = '/home/sallen/MEOPAR/tidal_constituents/tide_data/07786const.wlev';
location = 'Sandy Cove';
[pred_all, pred_8, pred_no_shallow, tim] = generate_tidal_predictions(filename, location, starts, ends, type, exclude_long, cut_off, ssh_units, time_zone, num_per_hr, offset);


