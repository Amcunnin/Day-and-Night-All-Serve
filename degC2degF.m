function [ degF ] = degC2degF( degC )
%degC2degF converts a celcius degree into a fahrenheit degree

degF_raw = (degC *(9/5))+32;
degF = round(degF_raw*100)/100;

end

