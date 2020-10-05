%reads data from the file named filename, and returns sampled data, audio_data, and a sample rate for that data, Fs.
[audio_data, fs] = audioread('Audio_signal_with_noise.wav');
player = audioplayer(audio_data, fs);
play(player);
Nfft = 1024; %length of New Fast Fourier Transform
MP = abs(fft(audio_data,Nfft));
figure ; plot(MP(1:Nfft/2))
xlabel('Frequency(Hz)')
ylabel('Signal Magnitude(dB)')