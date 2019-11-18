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
set(handles.text20, 'String', 'Reading Data');
while(1)
    try
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
    catch kittens
        clc
        fprintf('Data Unavailable\n')
        % TODO: ADD ERROR DISPLAY TO GUI
        set(handles.text20, 'String', 'DATA ERROR');
        break;
    end
end


% --- Executes on button press in 'Stop'.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fprintf('Stopping\n')
set(handles.text20, 'String', 'Stopped');
return


% --- Executes on button press in 'Log Data'.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% TODO: ENABLE/DISABLE DEBUG OPTION FOR REMOTE CODING
% TODO: ADD FORMATED TIME STAMP TO FILENAME AND LOG
% TODO: ADD LOG TIMER
% TODO: CREATE FUNCTION TO CREATE FILES

% Check to see if logger can start
if checkStop(get(handles.text20, 'String'))
    fprintf('Logger Error\n')
    return
else
    set(handles.text20, 'String', 'Logging Data');
    fprintf('Logger Started\n')
end

 Timestamp = datestr(now,'mm_dd_yyyy_HHMM'); %datetime('now')
 % TODO: ASK LOGGING INTERVAL
 time_interval = 1; % seconds
 format = '%-10s\t%-10s\t%-10s\n';
 
 
 %% Create files
 
 % TODO: CREATE DIRECTORY FOR LOGS
 % TODO: CREATE SUBDIRECTORY FOR EACH LOGGING INSTANCE
 num_sensors = 5;
 for i = 1:num_sensors
     filename = "ai"+(i-1)+"_"+Timestamp+".txt";
     if ~isfile(filename)
         filenames(i) = filename;
         title = {'Raw Data' 'Temp C' 'Temp F'};
         fid = fopen(filenames(i), 'w');
         fprintf(fid,format,title{:});
         fclose(fid);
     end
 end
 
 i = 1;
 while(~checkStop(get(handles.text20, 'String')))
     
     switch i
         case 1
             raw = 'rawData1';
             tempC = 'tempCData1';
             tempF = 'tempFData1';
             current_Data = {raw, tempC, tempF};
         case 2
             raw = 'rawData2';
             tempC = 'tempCData2';
             tempF = 'tempFData2';
             current_Data = {raw, tempC, tempF};
         case 3
             raw = 'rawData3';
             tempC = 'tempCData3';
             tempF = 'tempFData3';
             current_Data = {raw, tempC, tempF};
         case 4
             raw = 'rawData4';
             tempC = 'tempCData4';
             tempF = 'tempFData4';
             current_Data = {raw, tempC, tempF};
         case 5
             raw = 'rawData5';
             tempC = 'tempCData5';
             tempF = 'tempFData5';
             current_Data = {raw, tempC, tempF};
     end
     
     % Update Log
     fid = fopen(filenames(i), 'a');
     fprintf(fid,format, current_Data{:});
     fclose(fid);
     
     if i == num_sensors
         i = 0;
     end
     i = i+1;
     
     pause(time_interval)
 end
 fprintf('Logger Stopped\n')
