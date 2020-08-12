function varargout = harmonic_oscillator(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @harmonic_oscillator_OpeningFcn, ...
    'gui_OutputFcn',  @harmonic_oscillator_OutputFcn, ...
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


% --- Executes just before config2 is made visible.
function harmonic_oscillator_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


a2=getappdata(0,'x2');
if(~isnan(a2))
    set(handles.widthbase,'String',num2str(2*a2));
    set(handles.width_slider, 'value', 2*a2);
end

a2=getappdata(0,'m2');
if(~isnan(a2))
    set(handles.mbase,'String',num2str(a2/5.69375));
    set(handles.mslider, 'value', a2/5.69375);
end

a2=getappdata(0,'w');
if(~isnan(a2))
    set(handles.wbase,'String',num2str(a2));
    set(handles.f_slider, 'value', a2);
end

% UIWAIT makes config2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = harmonic_oscillator_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)

close(harmonic_oscillator)

% --- Executes on slider movement.
function mslider_Callback(hObject, eventdata, handles)

m2=get(hObject,'Value');

assignin('base','massval',m2);
set(handles.mbase,'String',num2str(m2));
m2 = m2*5.69375; %Standard mass of electron
setappdata(0,'m2',m2)

% --- Executes during object creation, after setting all properties.
function mslider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function mbase_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function mbase_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function width_slider_Callback(hObject, eventdata, handles)

x2=get(hObject,'Value');
assignin('base','widthval',x2);
set(handles.widthbase,'String',num2str(x2));
x2=x2/2;
setappdata(0,'x2',x2)

% --- Executes during object creation, after setting all properties.
function width_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function widthbase_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function widthbase_CreateFcn(hObject, eventdata, handles)

%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function f_slider_Callback(hObject, eventdata, handles)

w=get(hObject,'Value');
assignin('base','widthval',w);
set(handles.wbase,'String',num2str(w));

setappdata(0,'w',w)

% --- Executes during object creation, after setting all properties.
function f_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function wbase_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function wbase_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
