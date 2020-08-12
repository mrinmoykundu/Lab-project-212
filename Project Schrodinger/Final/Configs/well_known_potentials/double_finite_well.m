function varargout = double_finite_well(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @double_finite_well_OpeningFcn, ...
                   'gui_OutputFcn',  @double_finite_well_OutputFcn, ...
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


% --- Executes just before double_finite_well is made visible.
function double_finite_well_OpeningFcn(hObject, eventdata, handles, varargin)

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

a1=getappdata(0,'depth');
if(~isnan(a1))
set(handles.depth_base,'String',num2str(a1));
set(handles.depth_slider, 'value', a1);
end

a1=getappdata(0,'per');
if(~isnan(a1))
set(handles.percentage_base,'String',num2str(a1));
set(handles.per_well_slider, 'value', a1);
end

a1=getappdata(0,'barrier_width');
if(~isnan(a1))
set(handles.barrier_width_base,'String',num2str(a1));
set(handles.barrier_slider, 'value', a1);
end

function varargout = double_finite_well_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)

close(double_finite_well)

% --- Executes on slider movement.
function m_slider_Callback(hObject, eventdata, handles)

m=get(hObject,'Value');

assignin('base','massval',m);
set(handles.mbase,'String',num2str(m));
m = m*5.69375; %Standard mass of electron
setappdata(0,'m',m)

% --- Executes during object creation, after setting all properties.
function m_slider_CreateFcn(hObject, eventdata, handles)

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
x=get(hObject,'Value');
assignin('base','widthval',x);
set(handles.wbase,'String',num2str(x));
x=x/2;
setappdata(0,'x',x)

% --- Executes during object creation, after setting all properties.
function width_slider_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function wbase_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function wbase_CreateFcn(hObject, eventdata, handles)

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


% --- Executes on slider movement.
function per_well_slider_Callback(hObject, eventdata, handles)

per=get(hObject,'Value');
assignin('base','percentageval',per);
set(handles.percentage_base,'String',num2str(per));
setappdata(0,'per',per)

% --- Executes during object creation, after setting all properties.
function per_well_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function depth_base_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function depth_base_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function percentage_base_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function percentage_base_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function barrier_slider_Callback(hObject, eventdata, handles)


barrier_width=get(hObject,'Value');
assignin('base','bar_width_val',barrier_width);
set(handles.barrier_width_base,'String',num2str(barrier_width));
setappdata(0,'barrier_width',barrier_width)
% --- Executes during object creation, after setting all properties.
function barrier_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function barrier_width_base_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function barrier_width_base_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
