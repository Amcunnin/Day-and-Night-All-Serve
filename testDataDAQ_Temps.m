%% last modified 2/23/20 by AMC

%% Main Code
clear
clc

% initialize the Daq
devices = daq.getDevices

s = daq.createSession('ni');
t1 = addAnalogInputChannel(s, 'DAQ1', 'ai0', 'Voltage');
t2 = addAnalogInputChannel(s, 'DAQ1', 'ai1', 'Voltage');
t3 = addAnalogInputChannel(s, 'DAQ1', 'ai2', 'Voltage');
t4 = addAnalogInputChannel(s, 'DAQ1', 'ai3', 'Voltage');
t5 = addAnalogInputChannel(s, 'DAQ2', 'ai3', 'Voltage');
%^this sensor needs to be put on another DAQ because the ones we are
%currently using only allow for up to 4 differential sensors

t1.TerminalConfig = 'Differential';
t2.TerminalConfig = 'Differential';
t3.TerminalConfig = 'Differential';
t4.TerminalConfig = 'Differential';
t5.TerminalConfig = 'Differential';

% Data stream loop
counter = 0;
pause_delay = 1;

while(1)
    % this is an infinite loop, to exit, hit ctrl+C in command window
    
    data = s.inputSingleScan;
    fprintf('Iteration: %d\tCurrent Delay: %d seconds\n',counter,pause_delay)
    
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
        }
    pause (pause_delay)
    counter = counter+1;
    clc
end
