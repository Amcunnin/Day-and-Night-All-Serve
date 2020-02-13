%% last modified 2/13/20 by AMC

%% Main Code
clear
clc

addpath('../Functions/');

% initialize the Daq
devices = daq.getDevices

s = daq.createSession('ni');
addAnalogInputChannel(s, 'TEMP', 'ai0', 'Voltage');
addAnalogInputChannel(s, 'TEMP', 'ai1', 'Voltage');
addAnalogInputChannel(s, 'TEMP', 'ai2', 'Voltage');
addAnalogInputChannel(s, 'TEMP', 'ai3', 'Voltage');
addAnalogInputChannel(s, 'TEMP', 'ai4', 'Voltage');

time_delay = 1;

while(1)
% this is an infinite loop, to exit, hit ctrl+C in command window

data = s.inputSingleScan;

% interpret data
ai0 = data(1);
ai0_TempC = data2DegC(ai0);
ai0_TempF = degC2degF(ai0_TempC);

ai1 = data(2);
ai1_TempC = data2DegC(ai1);
ai1_TempF = degC2degF(ai1_TempC);

ai2 = data(3);
ai2_TempC = data2DegC(ai2);
ai2_TempF = degC2degF(ai2_TempC);

ai3 = data(4);
ai3_TempC = data2DegC(ai3);
ai3_TempF = degC2degF(ai3_TempC);

ai4 = data(5);
ai4_TempC = data2DegC(ai4);
ai4_TempF = degC2degF(ai4_TempC);

% display data
disp_Str = { 'Name', 'Data', 'TempC', 'TempF';
             'ai0', num2str(ai0), num2str(ai0_TempC), num2str(ai0_TempF);
             'ai1', num2str(ai1), num2str(ai1_TempC), num2str(ai1_TempF);
             'ai2', num2str(ai2), num2str(ai2_TempC), num2str(ai2_TempF);
             'ai3', num2str(ai3), num2str(ai3_TempC), num2str(ai3_TempF);
             'ai4', num2str(ai4), num2str(ai4_TempC), num2str(ai4_TempF);
             'ai5', num2str(ai5), num2str(ai5_TempC), num2str(ai5_TempF);
             }
pause (time_delay)
clc
end
