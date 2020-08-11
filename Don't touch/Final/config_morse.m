function varargout = config_morse(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @config_morse_OpeningFcn, ...
                   'gui_OutputFcn',  @config_morse_OutputFcn, ...
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


% --- Executes just before config_morse is made visible.
function config_morse_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
a2=getappdata(0,'depth');
if(~isnan(a2))
    set(handles.depth_base,'String',num2str(a2));
    set(handles.depth_slider, 'value', a2);
end

a2=getappdata(0,'m');
if(~isnan(a2))
    set(handles.mass_base,'String',num2str(a2/5.69375));
    set(handles.m_slider, 'value', a2/5.69375);
end

a2=getappdata(0,'a');
if(~isnan(a2))
    set(handles.a_base,'String',num2str(a2));
    set(handles.a_slider, 'value', a2);
end


a2=getappdata(0,'r_e');
if(~isnan(a2))
    set(handles.r_e_base,'String',num2str(a2));
    set(handles.r_e_slider, 'value', a2);
end


% a2=getappdata(0,'a');
% if(~isnan(a2))
%     set(handles.a_base,'String',num2str(2*a2));
%     set(handles.a_slider, 'value', 2*a2);
% end
% 
% a2=getappdata(0,'m');
% if(~isnan(a2))
%     set(handles.mass_base,'String',num2str(a2/5.69375));
%     set(handles.m_slider, 'value', a2/5.69375);
% end
% 
% a2=getappdata(0,'r_e');
% if(~isnan(a2))
%     set(handles.r_e_base,'String',num2str(a2));
%     set(handles.r_e_slider, 'value', a2);
% end
% a2=getappdata(0,'depth');
% if(~isnan(a2))
%     set(handles.depth_base,'String',num2str(a2));
%     set(handles.depth_slider, 'value', a2);
% end

function varargout = config_morse_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
close(config_morse)

function m_slider_Callback(hObject, eventdata, handles)

m=get(hObject,'Value');
assignin('base','massval',m);
set(handles.mass_base,'String',num2str(m));
m = m*5.69375; %Standard mass of electron
setappdata(0,'m',m)
function m_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function mass_base_Callback(hObject, eventdata, handles)

function mass_base_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function depth_slider_Callback(hObject, eventdata, handles)

depth=get(hObject,'Value');
assignin('base','depthval',depth);
set(handles.depth_base,'String',num2str(depth));

setappdata(0,'depth',depth)
function depth_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function depth_base_Callback(hObject, eventdata, handles)

function depth_base_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function a_slider_Callback(hObject, eventdata, handles)
a=get(hObject,'Value');
assignin('base','aval',a);
set(handles.a_base,'String',num2str(a));

setappdata(0,'a',a)

function a_slider_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function a_base_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function a_base_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function r_e_slider_Callback(hObject, eventdata, handles)

r_e=get(hObject,'Value');
assignin('base','r_e_val',r_e);
set(handles.r_e_base,'String',num2str(r_e));

setappdata(0,'r_e',r_e)
% --- Executes during object creation, after setting all properties.
function r_e_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to r_e_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function r_e_base_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function r_e_base_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
