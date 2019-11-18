function [ai0, ai1] = ReadData()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
devices = daq.getDevices;

% TODO: automate sensor collection and validitiy

s = daq.createSession('ni');
addAnalogInputChannel(s, 'Dev2', 'ai0', 'Voltage');
addAnalogInputChannel(s, 'Dev2', 'ai1', 'Voltage');
data = s.inputSingleScan;

ai0 = data(1);

ai1 = data(2);

pause (0.5);

end

