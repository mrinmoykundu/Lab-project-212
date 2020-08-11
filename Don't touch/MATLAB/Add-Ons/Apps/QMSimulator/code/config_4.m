function varargout = config_4(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @config_4_OpeningFcn, ...
                   'gui_OutputFcn',  @config_4_OutputFcn, ...
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


% --- Executes just before config_4 is made visible.
function config_4_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes config_4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

a4=getappdata(0,'cons');
if(~isnan(a4))
    set(handles.cbase,'String',num2str(a4));
    set(handles.cons_slider, 'value', a4);
end

a4=getappdata(0,'m4');
if(~isnan(a4))
    set(handles.mbase,'String',num2str(a4/5.69375));
    set(handles.mass_slider, 'value', a4/5.69375);
end



% --- Outputs from this function are returned to the command line.
function varargout = config_4_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)

close(config_4)

% --- Executes on slider movement.
function cons_slider_Callback(hObject, eventdata, handles)

c=get(hObject,'Value');
assignin('base','consval',c);
set(handles.cbase,'String',num2str(c));

setappdata(0,'cons',c)

% --- Executes during object creation, after setting all properties.
function cons_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function cbase_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function cbase_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function mass_slider_Callback(hObject, eventdata, handles)

m4=get(hObject,'Value');

assignin('base','massval',m4);
set(handles.mbase,'String',num2str(m4));
m4 = m4*5.69375; %Standard mass of electron
setappdata(0,'m4',m4)

% --- Executes during object creation, after setting all properties.
function mass_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function mbase_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function mbase_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
