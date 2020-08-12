function varargout = linear_potential_well(varargin)
% linear_potential_well MATLAB code for linear_potential_well.fig
%      linear_potential_well, by itself, creates a new linear_potential_well or raises the existing
%      singleton*.
%
%      H = linear_potential_well returns the handle to a new linear_potential_well or the handle to
%      the existing singleton*.
%
%      linear_potential_well('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONFIG3.M with the given input arguments.
%
%      linear_potential_well('Property','Value',...) creates a new linear_potential_well or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before linear_potential_well_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to config3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help config3

% Last Modified by GUIDE v2.5 21-Aug-2019 23:33:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @linear_potential_well_OpeningFcn, ...
                   'gui_OutputFcn',  @linear_potential_well_OutputFcn, ...
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


% --- Executes just before config3 is made visible.
function linear_potential_well_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to config3 (see VARARGIN)

% Choose default command line output for config3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


a3=getappdata(0,'x3');
if(~isnan(a3))
    set(handles.width_base,'String',num2str(2*a3));
    set(handles.width_slider, 'value', 2*a3);
end

a3=getappdata(0,'m3');
if(~isnan(a3))
    set(handles.mbase,'String',num2str(a3/5.69375));
    set(handles.mslider, 'value', a3/5.69375);
end


a3=getappdata(0,'depth2');
if(~isnan(a3))
    set(handles.depth_base,'String',num2str(a3));
    set(handles.depth_slider, 'value', a3);
end


a3=getappdata(0,'per2');
if(~isnan(a3))
    set(handles.percentage_base,'String',num2str(a3));
    set(handles.percentage_slider, 'value', a3);
end
% UIWAIT makes config3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = linear_potential_well_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(linear_potential_well)

% --- Executes on slider movement.
function mslider_Callback(hObject, eventdata, handles)
% hObject    handle to mslider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
m3=get(hObject,'Value');

assignin('base','massval',m3);
set(handles.mbase,'String',num2str(m3));
m3 = m3*5.69375; %Standard mass of electron
setappdata(0,'m3',m3)

% --- Executes during object creation, after setting all properties.
function mslider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mslider (see GCBO)
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

% Hints: get(hObject,'String') returns contents of mbase as text
%        str2double(get(hObject,'String')) returns contents of mbase as a double


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
x3=get(hObject,'Value');
assignin('base','widthval',x3);
set(handles.width_base,'String',num2str(x3));
x3=x3/2;
setappdata(0,'x3',x3)


% --- Executes during object creation, after setting all properties.
function width_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to width_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function width_base_Callback(hObject, eventdata, handles)
% hObject    handle to width_base (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of width_base as text
%        str2double(get(hObject,'String')) returns contents of width_base as a double


% --- Executes during object creation, after setting all properties.
function width_base_CreateFcn(hObject, eventdata, handles)
% hObject    handle to width_base (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function depth_slider_Callback(hObject, eventdata, handles)
% hObject    handle to depth_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
depth2=get(hObject,'Value');
assignin('base','depthval',depth2);
set(handles.depth_base,'String',num2str(depth2));
setappdata(0,'depth2',depth2)

% --- Executes during object creation, after setting all properties.
function depth_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to depth_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function percentage_slider_Callback(hObject, eventdata, handles)
% hObject    handle to percentage_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
per2=get(hObject,'Value');
assignin('base','percentageval',per2);
set(handles.percentage_base,'String',num2str(per2));
setappdata(0,'per2',per2)

% --- Executes during object creation, after setting all properties.
function percentage_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentage_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function depth_base_Callback(hObject, eventdata, handles)
% hObject    handle to depth_base (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of depth_base as text
%        str2double(get(hObject,'String')) returns contents of depth_base as a double


% --- Executes during object creation, after setting all properties.
function depth_base_CreateFcn(hObject, eventdata, handles)
% hObject    handle to depth_base (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentage_base_Callback(hObject, eventdata, handles)
% hObject    handle to percentage_base (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of percentage_base as text
%        str2double(get(hObject,'String')) returns contents of percentage_base as a double


% --- Executes during object creation, after setting all properties.
function percentage_base_CreateFcn(hObject, eventdata, handles)
% hObject    handle to percentage_base (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
