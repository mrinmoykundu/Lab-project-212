function varargout = config_lennard(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @config_lennard_OpeningFcn, ...
                   'gui_OutputFcn',  @config_lennard_OutputFcn, ...
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


% --- Executes just before config_lennard is made visible.
function config_lennard_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes config_lennard wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = config_lennard_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on slider movement.
function m_slider_Callback(hObject, eventdata, handles)

m=get(hObject,'Value');
assignin('base','massval',m);
set(handles.m_base,'String',num2str(m));
m = m*5.69375; %Standard mass of electron
setappdata(0,'m',m)

% --- Executes during object creation, after setting all properties.
function m_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function m_base_Callback(hObject, eventdata, handles)

function m_base_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function depth_slider_Callback(hObject, eventdata, handles)

depth=get(hObject,'Value');
assignin('base','depthval',depth);
set(handles.depth_base,'String',num2str(depth));

setappdata(0,'depth',depth)
% --- Executes during object creation, after setting all properties.
function depth_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function depth_base_Callback(hObject, eventdata, handles)

function depth_base_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(config_lennard)

% --- Executes on slider movement.
function r_e_slider_Callback(hObject, eventdata, handles)


r_e=get(hObject,'Value');
assignin('base','r_e_val',r_e);
set(handles.r_e_base,'String',num2str(r_e));

setappdata(0,'r_e',r_e)
% --- Executes during object creation, after setting all properties.
function r_e_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function r_e_base_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function r_e_base_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
