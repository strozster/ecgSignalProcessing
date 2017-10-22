%% Setup and Data Import
A = importdata('408A1_ECG_25.txt');
%disp(A);
disp(length(A))

samples = 0:length(A)-1;         % Sample Indices Vector
Fs = 250;             % Sampling Frequency (Hz)
t = samples/Fs;         % Time Vector (seconds)

%% Plotting ECG data versus time
plot(t,A); % 60 Seconds worth of data / 15000 samples at 250 Hz

%% Computing and Plotting Amplitude Spectrum
L = length(A)
Y = fft(A)
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;
plot(f,P1) 
ylim([0 0.1])
title('Amplitude Spectrum of ECG Signal')
xlabel('f (Hz)')
ylabel('|P1(f)|')
%% First 10 Seconds of ECG Signal Data
data = A - 8; %remove dc offset
disp(t)
plot(t(1,1:(2501)),data(1:(2501),1)); 
data_10s = data(1:(2501),1);
time_10s = t(1,1:(2501));
% Visual Inspection on ECG QRS Peaks
% #     TIME
% 1     0.42
% 2     1.22
% 3     2.06
% 4     2.87
% 5     3.70
% 6     4.55
% 7     5.31
% 8     6.07
% 9     6.79
% 10    7.53
% 11    8.25
% 12    8.97
% 13    9.77

%% Processing of Data for QRS Peak Detection 
hd = bandpassFilter;
z = filter(hd,data_10s);


figure
subplot(2,1,1)       % add first plot in 2 x 1 grid
plot(time_10s,data_10s);
title('Subplot 1')

subplot(2,1,2)       % add second plot in 2 x 1 grid
plot(time_10s,z);      
title('Subplot 2')





















