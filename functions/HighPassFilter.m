function varargout = HighPassFilter(varargin)
% LOWPASSFILTER MATLAB code for LowPassFilter.fig
%      LOWPASSFILTER, by itself, creates a new LOWPASSFILTER or raises the existing
%      singleton*.
%
%      H = LOWPASSFILTER returns the handle to a new LOWPASSFILTER or the handle to
%      the existing singleton*.
%
%      LOWPASSFILTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOWPASSFILTER.M with the given input arguments.
%
%      LOWPASSFILTER('Property','Value',...) creates a new LOWPASSFILTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LowPassFilter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LowPassFilter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% edithighpass the above text to modify the response to help LowPassFilter

% Last Modified by GUIDE v2.5 07-Jan-2017 21:48:41

% Begin initialization code - DO NOT EDITHIGHPASS
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HighPassFilter_OpeningFcn, ...
                   'gui_OutputFcn',  @HighPassFilter_OutputFcn, ...
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
% End initialization code - DO NOT EDITHIGHPASS


% --- Executes just before HighPassFilter is made visible.
function HighPassFilter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HighPassFilter (see VARARGIN)

% Choose default command line output for HighPassFilter
handles.output = hObject;
handles.cfgchn = [];
handles.cfgpreproc = [];

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HighPassFilter wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HighPassFilter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.cfgchn;
varargout{2} = handles.cfgpreproc;

delete(handles.figure1);



% --- Executes on button press in btnOk.
function btnOk_Callback(hObject, eventdata, handles)
% hObject    handle to btnOk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.cfgchn = eval(get(handles.editChannel,'String'));

cfg = [];
cfg.hpfilter = 'yes';
cfg.hpfreq = str2double(get(handles.editHighPass,'String'));

handles.cfgpreproc = cfg;
guidata(hObject, handles);

uiresume(handles.figure1);

% --- Executes on button press in btnCancel.
function btnCancel_Callback(hObject, eventdata, handles)
% hObject    handle to btnCancel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uiresume(handles.figure1);



% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
if isequal(get(hObject, 'waitstatus'), 'waiting')
% The GUI is still in UIWAIT, us UIRESUME
    uiresume(hObject);
else
% The GUI is no longer waiting, just close it
    delete(hObject);
end
