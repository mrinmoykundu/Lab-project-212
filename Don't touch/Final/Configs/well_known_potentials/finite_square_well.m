function varargout = finite_square_well(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @finite_square_well_OpeningFcn, ...
                   'gui_OutputFcn',  @finite_square_well_OutputFcn, ...
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





% --- Executes just before config1 is made visible.
function finite_square_well_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);



a1=getappdata(0,'x1');
if(~isnan(a1))
set(handles.widthbase,'String',num2str(2*a1));
set(handles.width_slider, 'value', 2*a1);
end


a1=getappdata(0,'m1');
if(~isnan(a1))
set(handles.mbase,'String',num2str(a1/5.69375));
set(handles.m_slider, 'value', a1/5.69375);
end

a1=getappdata(0,'depth1');
if(~isnan(a1))
set(handles.depthbase,'String',num2str(a1));
set(handles.depth_slider, 'value', a1);
end

a1=getappdata(0,'per1');
if(~isnan(a1))
set(handles.perbase,'String',num2str(a1));
set(handles.percentage_slider, 'value', a1);
end

function varargout = finite_square_well_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)

close(finite_square_well)


function width_slider_Callback(hObject, eventdata, handles)


x1=get(hObject,'Value');
assignin('base','widthval',x1);
set(handles.widthbase,'String',num2str(x1));
x1=x1/2;
setappdata(0,'x1',x1)


% --- Executes during object creation, after setting all properties.
function width_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


function widthbase_Callback(hObject, eventdata, handles)

function widthbase_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function m_slider_Callback(hObject, eventdata, handles)

m1=get(hObject,'Value');
assignin('base','massval',m1);
set(handles.mbase,'String',num2str(m1));
m1 = m1*5.69375; %Standard mass of electron
setappdata(0,'m1',m1)


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
function depth_slider_Callback(hObject, eventdata, handles)


depth1=get(hObject,'Value');
assignin('base','depthval',depth1);
set(handles.depthbase,'String',num2str(depth1));
setappdata(0,'depth1',depth1)
% --- Executes during object creation, after setting all properties.
function depth_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function percentage_slider_Callback(hObject, eventdata, handles)

per1=get(hObject,'Value');
assignin('base','percentageval',per1);
set(handles.perbase,'String',num2str(per1));
setappdata(0,'per1',per1)

% --- Executes during object creation, after setting all properties.
function percentage_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function depthbase_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function depthbase_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function perbase_Callback(hObject, eventdata, handles)

function perbase_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
