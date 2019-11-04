function [ degC ] = data2DegC( data )
%data2DegC takes raw data from AD8495 and turns it into a temperature
%reading

degC = (data-1.25)/0.005;

end

