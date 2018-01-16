function varargout = Experiment_2_GUI(varargin)
% EXPERIMENT_2_GUI MATLAB code for Experiment_2_GUI.fig
%      EXPERIMENT_2_GUI, by itself, creates a new EXPERIMENT_2_GUI or raises the existing
%      singleton*.
%
%      H = EXPERIMENT_2_GUI returns the handle to a new EXPERIMENT_2_GUI or the handle to
%      the existing singleton*.
%
%      EXPERIMENT_2_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXPERIMENT_2_GUI.M with the given input arguments.
%
%      EXPERIMENT_2_GUI('Property','Value',...) creates a new EXPERIMENT_2_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Experiment_2_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Experiment_2_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Experiment_2_GUI

% Last Modified by GUIDE v2.5 16-Jan-2018 01:25:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Experiment_2_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Experiment_2_GUI_OutputFcn, ...
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

function Experiment_2_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Experiment_2_GUI (see VARARGIN)

% Choose default command line output for Experiment_2_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

newobjs = instrfind; fclose(newobjs); clear newobjs

function varargout = Experiment_2_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function start_Callback(hObject, eventdata, handles)

global go

go = 1;

s = serial('COM4');
fopen(s);
fprintf(s,'RS232?')
settings = fgets(s)
data = ['..................................'];
pause(1)

while(go)
     settings = fgets(s)
     A = size(settings);
     if(settings(1:8) ~= 'distance')
     else
         if(A(2) ~= 34)
             if(A(2) == 33)
                settings = strcat(settings, '...');
             elseif(A(2) == 32)
                settings = strcat(settings, '....');
             elseif(A(2) == 31)
                settings = strcat(settings, '.....');
             end  
            data = [settings; data];
         else
            data = [settings; data];
         end
     end
     pause(.01)
end

save('Test', 'data')


function stop_Callback(hObject, eventdata, handles)

global go 

go = 0;

newobjs = instrfind; 
fclose(newobjs); 
clear newobjs