%reads data from the file, and returns sampled data(audio_data) and a sample rate for that data(fs)
[audio_data,fs] = audioread('Audio_signal_with_noise.wav');
[X, f] = periodogram(audio_data, hamming(length(audio_data)), length(audio_data), fs);
[pks,locs] = findpeaks(X,f) %find peaks of signal
timeperiod = max(diff(locs)) %time period of signal
