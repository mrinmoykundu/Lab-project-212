function varargout = config_pt_potential(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @config_pt_potential_OpeningFcn, ...
                   'gui_OutputFcn',  @config_pt_potential_OutputFcn, ...
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


% --- Executes just before config_pt_potential is made visible.
function config_pt_potential_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes config_pt_potential wait for user response (see UIRESUME)
% uiwait(handles.figure1);
a2=getappdata(0,'x');
if(~isnan(a2))
    set(handles.width_base,'String',num2str(2*a2));
    set(handles.x_slider, 'value', 2*a2);
end

a2=getappdata(0,'m');
if(~isnan(a2))
    set(handles.m_base,'String',num2str(a2/5.69375));
    set(handles.m_slider, 'value', a2/5.69375);
end

a2=getappdata(0,'lambda');
if(~isnan(a2))
    set(handles.lambda_base,'String',num2str(a2));
    set(handles.lambda_slider, 'value', a2);
end

% --- Outputs from this function are returned to the command line.
function varargout = config_pt_potential_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

close(config_pt_potential)

% --- Executes on slider movement.
function x_slider_Callback(hObject, eventdata, handles)

x=get(hObject,'Value');
assignin('base','widthval',x);
set(handles.width_base,'String',num2str(x));
x=x/2;
setappdata(0,'x',x)

% --- Executes during object creation, after setting all properties.
function x_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function width_base_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function width_base_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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



% --- Executes during object creation, after setting all properties.
function m_base_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function lambda_slider_Callback(hObject, eventdata, handles)

lambda=get(hObject,'Value');
assignin('base','massval',lambda);
set(handles.lambda_base,'String',num2str(lambda));
setappdata(0,'lambda',lambda)

% --- Executes during object creation, after setting all properties.
function lambda_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function lambda_base_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function lambda_base_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
