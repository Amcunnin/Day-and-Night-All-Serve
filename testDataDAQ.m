clear
clc

devices = daq.getDevices

s = daq.createSession('ni');
addAnalogInputChannel(s, 'Dev2', 'ai0', 'Voltage');
addAnalogInputChannel(s, 'Dev2', 'ai1', 'Voltage');
while(1)
data = s.inputSingleScan;
% 0degree C = 1.25V
ai0 = data(1);
ai0_TempC = (ai0-1.25)/.005;
ai0_TempF = (ai0_TempC *(9/5))+32;

ai1 = data(2);
ai1_TempC = (ai1-1.25)/.005;
ai1_TempF = (ai1_TempC *(9/5))+32;


disp_Str = { 'Name', 'Data', 'TempC', 'TempF';
             'ai0', num2str(ai0), num2str(ai0_TempC), num2str(ai0_TempF);
             'ai1', num2str(ai1), num2str(ai1_TempC), num2str(ai1_TempF);}
%TempC = (data(2)-1.25)/.005;
%TempF = (TempC *(9/5))+32;
pause (0.5)
clc
end
