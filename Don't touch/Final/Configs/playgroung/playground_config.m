function varargout = playground_config(varargin)
% PLAYGROUND_CONFIG MATLAB code for playground_config.fig
%      PLAYGROUND_CONFIG, by itself, creates a new PLAYGROUND_CONFIG or raises the existing
%      singleton*.
%
%      H = PLAYGROUND_CONFIG returns the handle to a new PLAYGROUND_CONFIG or the handle to
%      the existing singleton*.
%
%      PLAYGROUND_CONFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLAYGROUND_CONFIG.M with the given input arguments.
%
%      PLAYGROUND_CONFIG('Property','Value',...) creates a new PLAYGROUND_CONFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before playground_config_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to playground_config_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help playground_config

% Last Modified by GUIDE v2.5 11-Sep-2019 21:37:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @playground_config_OpeningFcn, ...
                   'gui_OutputFcn',  @playground_config_OutputFcn, ...
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


% --- Executes just before playground_config is made visible.
function playground_config_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to playground_config (see VARARGIN)

% Choose default command line output for playground_config
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
a1=getappdata(0,'x');
if(~isnan(a1))
set(handles.wbase,'String',num2str(2*a1));
set(handles.width_slider, 'value', 2*a1);
end


a1=getappdata(0,'m');
if(~isnan(a1))
set(handles.mbase,'String',num2str(a1/5.69375));
set(handles.m_slider, 'value', a1/5.69375);
end



% UIWAIT makes playground_config wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = playground_config_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(playground_config)

% --- Executes on slider movement.
function m_slider_Callback(hObject, eventdata, handles)

m=get(hObject,'Value');

assignin('base','massval',m);
set(handles.mbase,'String',num2str(m));
m = m*5.69375; %Standard mass of electron
setappdata(0,'m',m)

% --- Executes during object creation, after setting all properties.
function m_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to m_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function mbase_Callback(hObject, eventdata, handles)
% hObject    handle to mbase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes during object creation, after setting all properties.
function mbase_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mbase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function width_slider_Callback(hObject, eventdata, handles)
% hObject    handle to width_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
x=get(hObject,'Value');
assignin('base','widthval',x);
set(handles.wbase,'String',num2str(x));
x=x/2;
setappdata(0,'x',x)

% --- Executes during object creation, after setting all properties.
function width_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to width_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function wbase_Callback(hObject, eventdata, handles)
% hObject    handle to wbase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function wbase_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wbase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function input_potential_Callback(hObject, eventdata, handles)
% hObject    handle to input_potential (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input_potential as text
%        str2double(get(hObject,'String')) returns contents of input_potential as a double
func = get(hObject,'String');
setappdata(0,'func',func);

% --- Executes during object creation, after setting all properties.
function input_potential_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input_potential (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
