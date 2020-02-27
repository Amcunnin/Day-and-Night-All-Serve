%% last modified 2/25/2020 by AMC

%TODO: UPDATE SUMMARY
%TODO: automate sensor collection and validitiy
%TODO: DETERMINE WHAT TO DO WITH EMPTY DATA
%?TODO?: CREATE MAPING FUNCTION

%function [outputArg1,outputArg2] = untitled2(inputArg1,inputArg2)
function [temp1, temp2, temp3, temp4, temp5, amp1, amp2, amp3] = ReadData()

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

devices = daq.getDevices;
s = daq.createSession('ni');

%% Establish All Devices
% Temperature Sensors
t1 = addAnalogInputChannel(s, 'DAQ1', 'ai0', 'Voltage');
t2 = addAnalogInputChannel(s, 'DAQ1', 'ai1', 'Voltage');
t3 = addAnalogInputChannel(s, 'DAQ1', 'ai2', 'Voltage');
t4 = addAnalogInputChannel(s, 'DAQ1', 'ai3', 'Voltage');
t5 = addAnalogInputChannel(s, 'DAQ2', 'ai3', 'Voltage');
t1.TerminalConfig = 'Differential';
t2.TerminalConfig = 'Differential';
t3.TerminalConfig = 'Differential';
t4.TerminalConfig = 'Differential';
t5.TerminalConfig = 'Differential';

% Amperage Sensors
a1 = addAnalogInputChannel(s, 'DAQ2', 'ai0', 'Voltage');
a2 = addAnalogInputChannel(s, 'DAQ2', 'ai1', 'Voltage');
a3 = addAnalogInputChannel(s, 'DAQ2', 'ai2', 'Voltage');
a1.TerminalConfig = 'Differential';
a2.TerminalConfig = 'Differential';
a3.TerminalConfig = 'Differential';

data = s.inputSingleScan;

temp1 = data(1);
temp2 = data(2);
temp3 = data(3);
temp4 = data(4);
temp5 = data(5);
amp1 = data(6);
amp2 = data(7);
amp3 = data(8);

end

