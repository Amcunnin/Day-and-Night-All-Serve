%% last modified 2/27/20 by AMC

function varargout = AllServeV2(varargin)
% ALLSERVEV2 MATLAB code for AllServeV2.fig
%      ALLSERVEV2, by itself, creates a new ALLSERVEV2 or raises the existing
%      singleton*.
%
%      H = ALLSERVEV2 returns the handle to a new ALLSERVEV2 or the handle to
%      the existing singleton*.
%
%      ALLSERVEV2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ALLSERVEV2.M with the given input arguments.
%
%      ALLSERVEV2('Property','Value',...) creates a new ALLSERVEV2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AllServeV2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AllServeV2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AllServeV2

% Last Modified by GUIDE v2.5 27-Feb-2020 05:17:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AllServeV2_OpeningFcn, ...
                   'gui_OutputFcn',  @AllServeV2_OutputFcn, ...
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

%TODO: TURN EACH BUTTON INTO A FUNCTION?
%TODO: UTILIZE BETTER WAY TO STOP GUI/FUNCTIONS

% --- Executes just before AllServeV2 is made visible.
function AllServeV2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AllServeV2 (see VARARGIN)

% Choose default command line output for AllServeV2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes AllServeV2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AllServeV2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%% --- Executes on button press in btn_Start.

%?TODO?: TURN INTO TOGGLE OPERATION 
%TODO: GRAB ALL SENSOR DATA
%TODO: MAKE MORE STREAMLINE AND AUTOMATED
%TODO: CHECK IF DATA IS VALID
%TODO: ADD FEATURE TO ASK USER FOR TIME DELAY
%TODO: ADD ERROR DISPLAY TO GUI
%TODO: ADD CURRENT TIME DELAY DISPLAY
%TODO: FIX SENSOR LOC. DISPLAY NAMES

function btn_Start_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.text66, 'String', 'Start');
time_Delay = 1;
while(1)
    pause(.5)
    if ~checkStop(get(handles.text66, 'String'))
        try
            set(handles.text66, 'String', 'Reading Data');
%             [temp1, temp2, temp3, temp4, temp5, amp1, amp2, amp3] = ReadData();
            temp1 = 0.0796;
            temp2 = 1.5246;
            temp3 = 1.299;
            temp4 = 1.2687;
            temp5 = 1.3298;
            amp1 = 1.4024;
            amp2 = 0.6106;
            amp3 = 0.12532;
            pause(time_Delay);
        catch kittens
            fprintf('Data Unavailable\n')
            set(handles.text66, 'String', 'DATA ERROR');
            break;
        end
        
        %% Display Data
        format shortg
        
        %% Temperature Sensors
        %Condensor temperature sensor
        set(handles.text31, 'String', 'Condenser'); % Sensor Loc
        set(handles.text32, 'String', num2str(temp1)); % Raw Data
        temp1_TempC = data2DegC(temp1);
        set(handles.text33, 'String', num2str(temp1_TempC)); % TempC
        set(handles.text34, 'String', num2str(degC2degF(temp1_TempC))); % TempF
        
        %Liquid Line temperature sensor
        set(handles.text35, 'String', 'LiquidLine'); % Sensor Loc
        set(handles.text36, 'String', num2str(temp2)); % Raw Data
        temp2_TempC = data2DegC(temp2);
        set(handles.text37, 'String', num2str(temp2_TempC)); % TempC
        set(handles.text38, 'String', num2str(degC2degF(temp2_TempC))); % TempF
        
        %Evaporator temperature sensor
        set(handles.text39, 'String', 'Evaporator'); % Sensor Loc
        set(handles.text40, 'String', num2str(temp3)); % Raw Data
        temp3_TempC = data2DegC(temp3);
        set(handles.text41, 'String', num2str(temp3_TempC)); % TempC
        set(handles.text42, 'String', num2str(degC2degF(temp3_TempC))); % TempF
        
        %Cabinet temperature sensor
        set(handles.text43, 'String', 'Cabinet'); % Sensor Loc
        set(handles.text44, 'String', num2str(temp4)); % Raw Data
        temp4_TempC = data2DegC(temp4);
        set(handles.text45, 'String', num2str(temp4_TempC)); % TempC
        set(handles.text46, 'String', num2str(degC2degF(temp4_TempC))); % TempF
        
        %Suction Line temperature sensor
        set(handles.text47, 'String', 'SuctionLine'); % Sensor Loc
        set(handles.text48, 'String', num2str(temp5)); % Raw Data
        temp5_TempC = data2DegC(temp1);
        set(handles.text49, 'String', num2str(temp5_TempC)); % TempC
        set(handles.text50, 'String', num2str(degC2degF(temp5_TempC))); % TempF
        
        %% Amp Sensors
        %Condensor Current sensor
        set(handles.text54, 'String', 'Condenser'); % Sensor Loc
        set(handles.text55, 'String', num2str(amp1)); % Raw Data
        set(handles.text62, 'String', num2str(voltageToAmps(amp1))); % Amps
        
        %Compressor Current sensor
        set(handles.text56, 'String', 'Compressor'); % Sensor Loc
        set(handles.text57, 'String', num2str(amp2)); % Raw Data
        set(handles.text63, 'String', num2str(voltageToAmps(amp2))); % Amps
        
        %Evaporator Current sensor
        set(handles.text58, 'String', 'Evaporator'); % Sensor Loc
        set(handles.text59, 'String', num2str(amp3)); % Raw Data
        set(handles.text64, 'String', num2str(voltageToAmps(amp3))); % Amps
        
        fprintf('I just displayed data\n')
        pause(time_Delay);
        
        if ~(strcmp(get(handles.text67, 'String'),'Not Started'))
            btn_LogData_Callback(hObject, eventdata, handles)
        end
    else
        fprintf('Data Read Paused\n')
        break;
    end
end


%% --- Executes on button press in btn_Stop.

%TODO: TERMINATE PROGRAM

function btn_Stop_Callback(hObject, eventdata, handles)
% hObject    handle to btn_Stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fprintf('Stopping\n')
set(handles.text66, 'String', 'Stopped');
return



%% --- Executes on button press in btn_LogData.

%TODO: CREATE NEW DIRECTORY
%TODO: ADD TIMESTAMP TO GUI
%TODO: NOTATE
%TODO: CHECK IF LOGGER IS BEING CLICKED WHILE STOPPED
%TODO: CREATE .CSV FILE WITH TIMESTAMP
%TODO: POPULATE .CSV WITH SENSOR DATA

function btn_LogData_Callback(hObject, eventdata, handles)
% hObject    handle to btn_LogData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
logger_delay = 4;
    if (~checkStop(get(handles.text66, 'String')))
        
        if (strcmp(get(handles.text67, 'String'),'Not Started'))
            Timestamp = datestr(now,'mm_dd_yyyy_HHMM');
            set(handles.text69, 'String', Timestamp);
            format = '%-10s\t%-10s\t%-10s\n';
            fprintf('\nTimestamp Set\n')
            fprintf('logger started\n\n')
            set(handles.btn_LogData,'Enable','off')
        end
        set(handles.text67, 'String', 'Logger Started');
        Timestamp = get(handles.text69, 'String');
        
        % Make "Logs" Directory if it does not already exist
        master_logs = 'Logs';
        if ~exist(master_logs, 'dir')
            mkdir(master_logs)
            fprintf('\nLog Master Dir Created\n')
        end
        
        % Create subdirectory for logging instance
        sub_dir = fullfile(master_logs, Timestamp);
        if ~exist(sub_dir, 'dir')
            mkdir(sub_dir)
            fprintf('\nLog  Sub-Dir Created\n')
        end

        % make .csv file
        file = fullfile(sub_dir, strcat(Timestamp,'.csv'));
        if ~isfile(file)
            filename = fullfile(sub_dir, strcat(Timestamp,'.csv'));
            %test
            fid = fopen(filename,'w');
            fprintf(fid,'%f,%f,%f,%f,%f,%f\r\n',[1, 2, 3, 4, 5, 6].');
            fid = fclose(fid);
            fprintf('made a file\n')
        else
            fprintf('appended a the file\n')
        end
        
        
        fprintf('I just logged data\n')
        btn_Start_Callback(hObject, eventdata, handles);
        
        
        
        
    
    else
        set(handles.text67, 'String', 'Logger Paused');
        fprintf('logger paused\n')
        return
    end
    pause(1)
