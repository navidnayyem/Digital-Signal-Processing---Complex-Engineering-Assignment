%reads data from the file, and returns sampled data(audio_data) and a sample rate for that data(fs)
[audio_data, fs] = audioread('Audio_signal_with_noise.wav');
Nfft = 1024; %length of New Fast Fourier Transform
FourierTransformOfOriginalSignal = abs(fft(audio_data,Nfft));

%FilteredSignal = filter(LowPassHammingFs42000Fc4000, audio_data);
FilteredSignal = filter(LowPassKaiserFs100Fc1, audio_data); %best filter
%FilteredSignal = filter(LowPassKaiserFs22000Fc0point2, audio_data);
%FilteredSignal = filter(LowPassTriangularFs44100Fc5000, audio_data);

player = audioplayer(FilteredSignal, fs);
play(player);
audiowrite('BestFilterLowPassKaiserFs100Fc1.wav',FilteredSignal,fs);
figure ; plot(FourierTransformOfOriginalSignal(1:Nfft/2))
title('Fourier Transform of Original Signal');
xlabel('Frequency(Hz)')
ylabel('Signal Magnitude(dB)')
figure ; plot(FilteredSignal(1:Nfft))
title('Filtered Signal');
xlabel('Frequency(Hz)')
ylabel('Signal Magnitude(dB)')