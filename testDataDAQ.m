%% last modified 11/4/19 by AMC

%% Main Code
clear
clc

devices = daq.getDevices

s = daq.createSession('ni');
addAnalogInputChannel(s, 'Dev2', 'ai0', 'Voltage');
addAnalogInputChannel(s, 'Dev2', 'ai1', 'Voltage');
while(1)
% this is an infinite loop, to exit, hit ctrl+C in command window
data = s.inputSingleScan;
% 0degree C = 1.25V
ai0 = data(1);
ai0_TempC = data2DegC(ai0);
ai0_TempF = degC2degF(ai0_TempC);

ai1 = data(2);
ai1_TempC = data2DegC(ai1);
ai1_TempF = degC2degF(ai1_TempC);


disp_Str = { 'Name', 'Data', 'TempC', 'TempF';
             'ai0', num2str(ai0), num2str(ai0_TempC), num2str(ai0_TempF);
             'ai1', num2str(ai1), num2str(ai1_TempC), num2str(ai1_TempF);}
pause (0.5)
clc
end
