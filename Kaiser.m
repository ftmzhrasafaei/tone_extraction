function Hd = Kaiser
%KAISER Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.5 and DSP System Toolbox 9.7.
% Generated on: 23-Jan-2021 14:07:31

% FIR Window Bandpass filter designed using the FIR1 function.

% All frequency values are in Hz.
Fs = 44100;  % Sampling Frequency

Fstop1 = 195;             % First Stopband Frequency
Fpass1 = 199;             % First Passband Frequency
Fpass2 = 201;             % Second Passband Frequency
Fstop2 = 205;             % Second Stopband Frequency
Dstop1 = 1e-05;           % First Stopband Attenuation
Dpass  = 0.057501127785;  % Passband Ripple
Dstop2 = 1e-05;           % Second Stopband Attenuation
flag   = 'scale';         % Sampling Flag

% Calculate the order from the parameters using KAISERORD.
[N,Wn,BETA,TYPE] = kaiserord([Fstop1 Fpass1 Fpass2 Fstop2]/(Fs/2), [0 ...
                             1 0], [Dstop1 Dpass Dstop2]);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Wn, TYPE, kaiser(N+1, BETA), flag);
Hd = dfilt.dffir(b);

% [EOF]
