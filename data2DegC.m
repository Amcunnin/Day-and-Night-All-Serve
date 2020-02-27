%% last modified 2/27/20 by AMC
function [ degC ] = data2DegC( data )
%data2DegC takes raw data from AD8495 and turns it into a temperature
%reading

adjustment = 0;
degC_raw = (data-1.25+adjustment)/0.005;
degC = round(degC_raw*100)/100;

end

