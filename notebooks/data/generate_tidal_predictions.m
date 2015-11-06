function [pred_all,pred_8,pred_no_shallow, tim] = generate_tidal_predictions(filename,location, starts, ends, type, exclude_long, cut_off)
% Uses t_tide to calculates tidal predictions for all siginificant 
%constituents, 8 constituents, or all constituents except shallow water.
%The 8 constituents are: M2,K1,O1,P1,Q1,N2,S2,K2
%Either performs an harmonic analysis on a water level time series stored
%in filename or reads harmoncis from csvfilename

%filename contains DFO/NOAA produced water level observations or CHS
%water level constituents.

%starts is that start date for predictions (eg. 01-Jan-2006)
%ends is the end date for the predictions (eg. 31-Dec-2006)

%type representes the type of water level measurements (NOAA or DFO or CHS or NOAA_const)
%if type is CHS then the filename is actually a file that contains the
%CHS harmoncic constituents
%if type is NOAA_const then filename is a file that contains the NOAA
%constiuents.

%exclude_long is 1 if long period constituents should be removed from 
%predictions, 0 otherwise

%cut_off is the cut_off amplitude for filtering large non-tidal energy from
%the time series. A reasonable value is 0.3 This is only applied if a
%harmonic analysis is necessary, 

%Outputs:
%pred_all is a tidal prediction using all significant constituents
%pred_8 uses only the big 8
%pred_no_shallow uses all except the shallow water constituents. 
%saves a spreadsheet with tim, pred_all, pred_8, pred_no_shallow
% (location_tidal_prediction_starts_ends.csv)
%If a harmonics analysis is necesasary, files with the analysis output and
%constituents are also saved. 

%Note: For cases where the harmonics are calcualted by t_tide, the tidal
%prediction only uses constituetns with signal to noise ratio > 2. 

%See https://salishsea-meopar-docs.readthedocs.org/en/latest/storm_surges/tools.html#tidal-predictions for more documentations

% NKS May 2014


%% Initial harmonics and prediction caclulations
% determine harmonics

%default snr
snr=2;
if strcmp(type, 'DFO')
    [tidestruc,lat,msl]=calculate_harmonics_filter(filename,location, cut_off);
elseif strcmp(type,'NOAA')
    [tidestruc,lat,msl]=calculate_harmonics_filter_NOAA(filename,location, cut_off);
elseif strcmp(type, 'CHS')
    [tidestruc,lat,msl]=read_CHS_harmonics(filename);
    snr=0;
elseif strcmp(type, 'NOAA_const')
    [tidestruc,lat,msl]=read_NOAA_harmonics(filename);
    snr=0;
else print('Unrecognised type')
end


%% Exlcude long period if necessary
%Remove long period constituents. Do not use these in the predictions
if(exclude_long)
names_long = ['SA  '; 'SSA '; 'MSM '; 'MM  ';'MSF ';'MF  '];
for i=1:length(names_long)
n=names_long(i,:);
ind = strmatch(n,tidestruc.name,'exact');
tidestruc.name(ind,:) = [];
tidestruc.freq(ind) = [];
tidestruc.tidecon(ind,:) = [];
end
end

%% predictions with 8 constituents
%Create a new struct object with only 8 consts.
names_8=['M2'; 'K1'; 'O1';'P1';'Q1';'N2';'S2';'K2'];
freqs_8 = zeros(8,1);
pha_8 = zeros(8,1);
pha_err8 = zeros(8,1);
amp_8 = zeros(8,1);
amp_err8 = zeros(8,1);
 for i=1:8
n=names_8(i,:);
ind = strmatch(n,tidestruc.name,'exact');
freqs_8(i) = tidestruc.freq(ind);
amp_8(i) = tidestruc.tidecon(ind,1);
amp_err8(i) = tidestruc.tidecon(ind,2);
pha_8(i) = tidestruc.tidecon(ind,3);
pha_err8(i) = tidestruc.tidecon(ind,4);
 end
 
tidecon_8=[amp_8'; amp_err8'; pha_8'; pha_err8']';

tidestruc_8.name=names_8;
tidestruc_8.tidecon=tidecon_8;
tidestruc_8.freq=freqs_8;

%% Predictions without shallow water constituents
%Remove shallow water constituents. Do not use these in the predictions
CONST = t_getconsts;
names_noshallow = CONST.name(isfinite(CONST.ishallow),:);
tidestruc_noshallow = tidestruc;
for i=1:length(names_noshallow)
n=names_noshallow(i,:);
ind = strmatch(n,tidestruc_noshallow.name,'exact');
tidestruc_noshallow.name(ind,:) = [];
tidestruc_noshallow.freq(ind) = [];
tidestruc_noshallow.tidecon(ind,:) = [];
end

%% Do predictions
%t_tide should be run for 1 year of data at a time

%Time
start_date=datenum(starts);
end_date=datenum(ends);
tim = start_date:1/24:end_date;

[startyear,~,~,~,~,~] = datevec(tim(1));
[endyear,~,~,~,~,~] = datevec(tim(end-1));
pred_all = zeros(length(tim),1);
pred_8 = zeros(length(tim),1);
pred_no_shallow = zeros(length(tim),1);
predcounter = 1;

%Loop through years
for yr = startyear:endyear
    disp(yr)
    I = tim >= datenum(yr,1,1) & tim < datenum(yr+1,1,1);
    start_date = tim(I);
    disp(datestr(start_date(1,1)))
    
    %Get predicted tide for same period
    pred_all(predcounter:predcounter+length(start_date)-1) = t_predic(tim(I),tidestruc,'latitude',lat,'synthesis',snr);
    pred_8(predcounter:predcounter+length(start_date)-1) = t_predic(tim(I),tidestruc_8,'latitude',lat,'synthesis',snr); 
    pred_no_shallow(predcounter:predcounter+length(start_date)-1) = t_predic(tim(I),tidestruc_noshallow,'latitude',lat,'synthesis',snr); 
    predcounter = predcounter+length(start_date);
    disp(predcounter)
end

%% Plot 
figure
subplot(3,1,1)
plot(tim,pred_8,'b',tim,pred_all,'m',tim,pred_all-pred_8,'r')
legend('predictions 8 const.', 'predictions all','difference','Location','EastOutside')
xlabel('time')
ylabel('water level elevation (m CD)')
datetick('x','mm/yyyy')

subplot(3,1,2)
plot(tim,pred_8,'b',tim,pred_no_shallow,'m',tim,pred_no_shallow-pred_8,'r')
legend('predictions 8 const.', 'predictions no shallow','difference','Location','EastOutside')
xlabel('time')
ylabel('water level elevation (m CD)')
datetick('x','mm/yyyy')

subplot(3,1,3)
plot(tim,pred_all,'b',tim,pred_no_shallow,'m',tim,pred_no_shallow-pred_all,'r')
legend('predictions all const.', 'predictions no shallow','difference','Location','EastOutside')
xlabel('time')
ylabel('water level elevation (m CD)')
datetick('x','mm/yyyy')

%% Save predictions
M = datestr(tim);
n = length(tim);
newfile = [location  '_tidal_prediction_' starts '_' ends '.csv'];
fid = fopen(newfile, 'w');
%add some headers
fprintf(fid, 'Harmonics from: ,');
fprintf(fid, '%s,\n',filename);
fprintf(fid, 'Mean ,');
fprintf(fid, '%f,\n',msl);
fprintf(fid, 'Latitude ,');
fprintf(fid, '%f,\n',lat);
fprintf(fid, 'Time_Local , pred_8 , pred_all , pred_noshallow \n');
for row=1:n
    fprintf(fid, '%s ,', M(row,:));
    fprintf(fid,' %f,', pred_8(row));
    fprintf(fid,' %f,', pred_all(row));
    fprintf(fid,' %f\n', pred_no_shallow(row));
end
fclose(fid);
