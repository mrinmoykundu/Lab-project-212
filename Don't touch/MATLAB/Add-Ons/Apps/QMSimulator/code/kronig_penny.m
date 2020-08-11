function varargout = kronig_penny(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @kronig_penny_OpeningFcn, ...
                   'gui_OutputFcn',  @kronig_penny_OutputFcn, ...
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


% --- Executes just before kronig_penny is made visible.
function kronig_penny_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
ah=axes('unit','normalized','position',[0 0 1 1]);

bg=imread('kronny_bg.jpg');imagesc(bg);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom')


handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes kronig_penny wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = kronig_penny_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in home.
function home_Callback(hObject, eventdata, handles)
% hObject    handle to home (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(kronig_penny)
project1



function num_well_Callback(hObject, eventdata, handles)

handles.well_num=str2num(get(hObject,'string'));
guidata(hObject, handles)



% --- Executes during object creation, after setting all properties.
function num_well_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pe_button.
function pe_button_Callback(hObject, eventdata, handles)


axes(handles.axes1)
Plot_V(handles.X,handles.V,handles.E(1:handles.n),1,0);



guidata(hObject, handles)

% --- Executes on button press in probability_density.
function probability_density_Callback(hObject, eventdata, handles)

axes(handles.axes2)
modes=handles.array_n;
m =  5.69375; %electron mass in new unit
x_t=1;
plot_PDF(handles.Psis_penny,modes,x_t,m,1);

% --- Executes on button press in energy_state_button.
function energy_state_button_Callback(hObject, eventdata, handles)


axes(handles.axes1)
E_vs_n(handles.E, (1:handles.n) ,'.');


guidata(hObject, handles)

function states_Callback(hObject, eventdata, handles)
% hObject    handle to states (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of states as text
%        str2double(get(hObject,'String')) returns contents of states as a double

handles.n=str2num(get(hObject,'string'));

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



function array_states_Callback(hObject, eventdata, handles)
% hObject    handle to array_states (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of array_states as text
%        str2double(get(hObject,'String')) returns contents of array_states as a double
handles.array_n=str2num(get(hObject,'string'));
if find(handles.array_n>handles.n)
    errordlg('Maximum state crossed')
end
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function array_states_CreateFcn(hObject, eventdata, handles)
% hObject    handle to array_states (see GCBO)
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
handles.x=get(hObject,'Value');
assignin('base','widthval',handles.x);
set(handles.wbase,'String',num2str(handles.x));
guidata(hObject, handles)

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

% Hints: get(hObject,'String') returns contents of wbase as text
%        str2double(get(hObject,'String')) returns contents of wbase as a double


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


% --- Executes on button press in config_pf_done.
function config_pf_done_Callback(hObject, eventdata, handles)
% hObject    handle to config_pf_done (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.end_calculation,'String',' ');
pause(1);

[handles.V,handles.X,handles.E,handles.Psis_penny]= draw_kronig...
    (handles.well_num,handles.x,handles.E_field);

set(handles.end_calculation,'String','Done');
guidata(hObject, handles)

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


% --- Executes on slider movement.
function electric_field_slider_Callback(hObject, eventdata, handles)
% hObject    handle to electric_field_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.E_field=get(hObject,'Value');
assignin('base','fieldval',handles.E_field);
set(handles.e_field_base,'String',num2str(handles.E_field));
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function electric_field_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to electric_field_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function e_field_base_Callback(hObject, eventdata, handles)
% hObject    handle to e_field_base (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_field_base as text
%        str2double(get(hObject,'String')) returns contents of e_field_base as a double


% --- Executes during object creation, after setting all properties.
function e_field_base_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_field_base (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in E_vs_Density_of_states.
function E_vs_Density_of_states_Callback(hObject, eventdata, handles)
% hObject    handle to E_vs_Density_of_states (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
handles.a = (2/handles.well_num)/(1+handles.x)

handles.D_E=density_of_states(handles.E);
guidata(hObject, handles)
% --- Executes on button press in E_vs_k.
function E_vs_k_Callback(hObject, eventdata, handles)
% hObject    handle to E_vs_k (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2)
k_vs_E(handles.E,handles.D_E,handles.a,2);
