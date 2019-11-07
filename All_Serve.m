function varargout = All_Serve(varargin)
% ALL_SERVE MATLAB code for All_Serve.fig
%      ALL_SERVE, by itself, creates a new ALL_SERVE or raises the existing
%      singleton*.
%
%      H = ALL_SERVE returns the handle to a new ALL_SERVE or the handle to
%      the existing singleton*.
%
%      ALL_SERVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ALL_SERVE.M with the given input arguments.
%
%      ALL_SERVE('Property','Value',...) creates a new ALL_SERVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before All_Serve_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to All_Serve_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help All_Serve

% Last Modified by GUIDE v2.5 05-Nov-2019 00:59:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @All_Serve_OpeningFcn, ...
                   'gui_OutputFcn',  @All_Serve_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before All_Serve is made visible.
function All_Serve_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to All_Serve (see VARARGIN)

% Choose default command line output for All_Serve
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes All_Serve wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = All_Serve_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in 'Start'.
function pushbutton2_Callback(hObject, eventdata, handles)
% TODO:TURN INTO TOGGLE BUTTON


% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
while(1)
    [ai0, ai1] = ReadData();
    %Device ID
    set(handles.text11, 'String', 'ai0');
    set(handles.text15, 'String', 'ai1');
    %Raw Data
    format shortg
    set(handles.text12, 'String', num2str(ai0));
    set(handles.text16, 'String', num2str(ai1));
    %TempC
    ai0_TempC = data2DegC(ai0);
    ai1_TempC = data2DegC(ai1);
    set(handles.text13, 'String', num2str(ai0_TempC));
    set(handles.text17, 'String', num2str(ai1_TempC));
    %TempF
    set(handles.text14, 'String', num2str(degC2degF(ai0_TempC)));
    set(handles.text18, 'String', num2str(degC2degF(ai1_TempC)));
end


% --- Executes on button press in 'Stop'.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all force
return


% --- Executes on button press in 'Log Data'.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear
clc
filename = 'test.txt';
title = {'Raw Data' 'Temp C' 'Temp F'};
fid = fopen(filename, 'w');
fprintf(fid,'%s\t%s\t\t%s\n',title{:});
fclose(fid);

raw = 'rawData';
tempC = 'tempC';
tempF = 'tempF';
current_Data = {raw, tempC, tempF};

fid = fopen(filename, 'a');
fprintf(fid, '%s\t\t%s\t\t%s\n', current_Data{:});
fclose(fid);

% %if exist(filename, 'file')==2
%      % File exists.
%  %    delete 'filename';
% %else
%      % File does not exist.
%      %title = 'Raw Data';
%      title = ['Raw Data', 'Temp C', 'Temp F'];
%      %xlswrite(filename, cellstr(title));
%      fid = fopen(filename, 'w');
%     fprintf(fid, '%s', title);
%     fclose(fid);
% %end
% time_interval = 1; % seconds
% %while(1)
%     %debug
%     raw = 'rawData';
%     tempC = 'tempC';
%     tempF = 'tempF';
%     %end debug
%     
%     %raw = get(handles.text12, 'String');
%     %tempC = get(handles.text13, 'String');
%     %tempF = get(handles.text14, 'String');
%     
%     current_Data = [raw; tempC; tempF];
%     fid = fopen(filename, 'a');
%     fprintf(fid, '\n%s', current_Data);
%     %xlswrite(filename, cellstr(current_Data),'Sheet1');
%     pause(time_interval)
%     fclose(fid);
%     sprintf('done')
% %end



