%% last modified 2/11/2020 by AMC


%%
% From Spec Sheet
% Response time: 2 sec
% Freq: 50/60 Hz Nominal
%
%% Main Code


clear
clc

devices = daq.getDevices
s = daq.createSession('ni');
addAnalogInputChannel(s, 'AMP', 'ai0', 'Voltage');
counter = 0;
while(1)
    data = s.inputSingleScan;
    disp(counter)
    ai0 = data(1)
    pause(3);
    counter = counter+1;
    clc
end


