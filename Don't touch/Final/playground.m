function varargout = playground(varargin)
% PLAYGROUND MATLAB code for playground.fig
%      PLAYGROUND, by itself, creates a new PLAYGROUND or raises the existing
%      singleton*.
%
%      H = PLAYGROUND returns the handle to a new PLAYGROUND or the handle to
%      the existing singleton*.
%
%      PLAYGROUND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PLAYGROUND.M with the given input arguments.
%
%      PLAYGROUND('Property','Value',...) creates a new PLAYGROUND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before playground_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to playground_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help playground

% Last Modified by GUIDE v2.5 11-Sep-2019 21:38:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @playground_OpeningFcn, ...
                   'gui_OutputFcn',  @playground_OutputFcn, ...
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


% --- Executes just before playground is made visible.
function playground_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
ah=axes('unit','normalized','position',[0 0 1 1]);

bg=imread('bg.jpg');imagesc(bg);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom')



global h_bar ;
h_bar = 0.659375; % eV fs
global E_max;
  E_max = 10000;
  
% Choose default command line output for playground
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = playground_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in home.
function home_Callback(hObject, eventdata, handles)

close(playground)
project1

% --- Executes on button press in config_pf.
function config_pf_Callback(hObject, eventdata, handles)
% hObject    handle to config_pf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

playground_config;



% --- Executes on button press in pe_button.
function pe_button_Callback(hObject, eventdata, handles)
% hObject    handle to pe_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

state=handles.n;
axes(handles.axes1)

Plot_V(handles.X,handles.V,handles.E(1:state),1,1);    

guidata(hObject, handles)

% --- Executes on button press in probability_density.
function probability_density_Callback(hObject, eventdata, handles)
% hObject    handle to probability_density (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

modes=handles.array_n;
axes(handles.axes2);

plot_PDF(handles.Psis,...
    modes,handles.x,handles.m,1)

% --- Executes on button press in energy_state_button.
function energy_state_button_Callback(hObject, eventdata, handles)
% hObject    handle to energy_state_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


axes(handles.axes1)
state=handles.n;
E_vs_n(handles.E, 1:state,'.');

guidata(hObject, handles)


% --- Executes on button press in config_pf_done.
function config_pf_done_Callback(hObject, eventdata, handles)
% hObject    handle to config_pf_done (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.end_calculation,'String',' ');
pause(1);

handles.x=getappdata(0,'x');
handles.m=getappdata(0,'m');
handles.func=getappdata(0,'func'); 

[handles.V,handles.X,handles.E,handles.Psis]= draw_user_defined...
    (handles.func,handles.m,handles.x);

set(handles.end_calculation,'String','Done');


guidata(hObject, handles)

function states_Callback(hObject, eventdata, handles)
% hObject    handle to states (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of states as text
%        str2double(get(hObject,'String')) returns contents of states as a double
handles.n=str2double(get(hObject,'string'));

if handles.n<0 
    errordlg('invalid state')
end
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function states_CreateFcn(hObject, eventdata, handles)
% hObject    handle to states (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function state_array_Callback(hObject, eventdata, handles)
% hObject    handle to state_array (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of state_array as text
%        str2double(get(hObject,'String')) returns contents of state_array as a double

handles.array_n=str2num(get(hObject,'string'));
if find(handles.array_n>handles.n)
    errordlg('Maximum state crossed')
end
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function state_array_CreateFcn(hObject, eventdata, handles)
% hObject    handle to state_array (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function end_calculation_Callback(hObject, eventdata, handles)
% hObject    handle to end_calculation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of end_calculation as text
%        str2double(get(hObject,'String')) returns contents of end_calculation as a double


% --- Executes during object creation, after setting all properties.
function end_calculation_CreateFcn(hObject, eventdata, handles)
% hObject    handle to end_calculation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
