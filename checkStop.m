function [stopped] = checkStop(statusCheck)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% TODO: DETAILED EXPLAINATION
% TODO: CHECK FOR DATA ERRORS
if strcmp(statusCheck, 'Stopped')
    stopped = true;
else
    stopped = false;
end

