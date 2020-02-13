%% last modified 2/11/2020 by AMC
%%
function [CalcAmps] = voltageToAmps(voltage)
%voltageToAmps takes an inputed voltage and returns calculated amps
%   This function is meant to take a voltage from a H622-20 Transducer and
%   convert it to an amperage reading based on schematic specs provided
%   from the manufacturer. The input voltage should be between 0-5, and the
%   calculated amps will result in 0-20 amps

if voltage < 0
    CalcAmps = 0.0;
else
    format short g
    CalcAmps = round(4*voltage,2);
end

end

