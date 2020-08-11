function varargout = well_one(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @well_one_OpeningFcn, ...
    'gui_OutputFcn',  @well_one_OutputFcn, ...
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


% --- Executes just before well_one is made visible.
function well_one_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
ah=axes('unit','normalized','position',[0 0 1 1]);

bg=imread('well_known_potential_bg.jpg');imagesc(bg);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom')


global done_button;
done_button = 1;

global h_bar ;
h_bar = 0.659375; % eV fs
global E_max;
E_max = 10000;
% Choose default command line output for well_one
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = well_one_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)

function popupmenu2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in back_to_home.
function back_to_home_Callback(hObject, eventdata, handles)

close(well_one)
project1



% --- Executes on slider movement.


% --- Executes on button press in config_pf.
function config_pf_Callback(hObject, eventdata, handles)

pop=get(handles.popupmenu2,'Value');

if pop==1
    config1
elseif pop==2
    config2
elseif pop==3
    config3
elseif pop==4
    config_4
elseif pop==5
    config1_well2
elseif pop==6
    config_pt_potential
elseif pop==7
    config_morse
elseif pop==8
    config_lennard
end


% --- Executes on button press in pe_button.
function pe_button_Callback(hObject, eventdata, handles)

num_state=handles.n;
pop=get(handles.popupmenu2,'Value');
axes(handles.axes1)

if pop==4
    Plot_V(handles.X,handles.V,handles.Es(1:2*num_state),0,1);
else
    Plot_V(handles.X,handles.V,handles.Es(1:num_state),1,1);
end

guidata(hObject, handles)


function states_Callback(hObject, eventdata, handles)

handles.n=str2num(get(hObject,'string'));

if handles.n<0
    errordlg('invalid state')
end
guidata(hObject, handles)



% --- Executes during object creation, after setting all properties.
function states_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Probability_density.
function Probability_density_Callback(hObject, eventdata, handles)
pop=get(handles.popupmenu2,'Value');
modes=handles.array_n;
axes(handles.axes2)


if pop==4
    plot_PDF(handles.psis,...
        modes*2,1,handles.m,0)
else
    plot_PDF(handles.psis,...
        modes,handles.x,handles.m,1)
end




function state_for_probability_Callback(hObject, eventdata, handles)

handles.array_n=str2num(get(hObject,'string'));
if find(handles.array_n>handles.n)
    errordlg('Maximum state crossed')
end
guidata(hObject, handles)



% --- Executes during object creation, after setting all properties.
function state_for_probability_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in energy_eigen_button.
function energy_eigen_button_Callback(hObject, eventdata, handles)


pop=get(handles.popupmenu2,'Value');
axes(handles.axes1)
state=handles.n;


if pop==4
    E_vs_n(handles.Es, 2*(1:state) ,'.')
else
    E_vs_n(handles.Es, 1:state,'.');
end

guidata(hObject, handles)


% --- Executes on button press in config_pf_done.
function config_pf_done_Callback(hObject, eventdata, handles)

set(handles.end_calculation,'String',' ');
pause(1);


pop=get(handles.popupmenu2,'Value');


if pop==1
    handles.x=getappdata(0,'x1');
    handles.m=getappdata(0,'m1');
    handles.depth1=getappdata(0,'depth1');
    handles.per1=getappdata(0,'per1');
    [handles.V,handles.X,handles.Es,handles.psis]= draw_square...
        (handles.x,handles.m,handles.depth1,handles.per1);
    
    set(handles.end_calculation,'String','Done');
    
    
elseif pop==2
    handles.x=getappdata(0,'x2');
    handles.m=getappdata(0,'m2');
    handles.omega=getappdata(0,'w');
    [handles.V,handles.X,handles.Es,handles.psis]=draw_harmonic...
        (handles.m,handles.x,handles.omega);
    
    set(handles.end_calculation,'String','Done');
    
elseif pop==3
    handles.x=getappdata(0,'x3');
    handles.m=getappdata(0,'m3');
    handles.depth2=getappdata(0,'depth2');
    handles.per2=getappdata(0,'per2');
    [handles.V,handles.X,handles.Es,handles.psis]=draw_linear...
        (handles.m,handles.x,handles.depth2,handles.per2);
    
    set(handles.end_calculation,'String','Done');
    
elseif pop==4
    handles.constant=getappdata(0,'cons');
    handles.m=getappdata(0,'m4');
    [handles.V,handles.X,handles.Es,handles.psis]=draw_coulumbo...
        (handles.constant,handles.m);
    
    set(handles.end_calculation,'String','Done');
elseif pop==5
    handles.x=getappdata(0,'x');
    handles.m=getappdata(0,'m');
    handles.max_strength=getappdata(0,'depth');
    handles.per_well_width=getappdata(0,'per');
    handles.barrier_width=getappdata(0,'barrier_width');
    [handles.V,handles.X,handles.Es,handles.psis]= draw_infinite_square...
        (handles.x,handles.m,handles.max_strength,...
        handles.per_well_width,handles.barrier_width);
    
    set(handles.end_calculation,'String','Done');
elseif pop==6
    handles.lambda=getappdata(0,'lambda');
    handles.m=getappdata(0,'m');
     handles.x=getappdata(0,'x');
    [handles.V,handles.X,handles.Es,handles.psis]=draw_pt_potential...
        (handles.m,handles.lambda,handles.x);
    
    set(handles.end_calculation,'String','Done');
  elseif pop==7
    handles.a=getappdata(0,'a');
    handles.m=getappdata(0,'m');
    handles.depth=getappdata(0,'depth');
    handles.r_e=getappdata(0,'r_e');
    handles.x=1;
    [handles.V,handles.X,handles.Es,handles.psis]= draw_morse_potential...
        (handles.m,handles.depth,handles.a,handles.r_e);
  set(handles.end_calculation,'String','Done');
elseif pop==8
   
    handles.m=getappdata(0,'m');
    handles.depth=getappdata(0,'depth');
    handles.r_e=getappdata(0,'r_e');
    handles.x=1;  %handles.x_t 
    [handles.V,handles.X,handles.Es,handles.psis]=draw_lennard_potential...
        (handles.m,handles.depth,handles.r_e,handles.x);
    set(handles.end_calculation,'String','Done');
end
guidata(hObject, handles)



function end_calculation_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function end_calculation_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in real_psi.
function real_psi_Callback(hObject, eventdata, handles)

axes(handles.axes2);
pop=get(handles.popupmenu2,'Value');
if pop == 4
    Time_Dep_Real_Part_Anim(handles.psis(:,2*handles.array_n(1)), ...
        handles.Es(2*handles.array_n(1)),2, 1,handles.time_knob_value);
else
    Time_Dep_Real_Part_Anim(handles.psis(:,handles.array_n(1)), ...
        handles.Es(handles.array_n(1)),2, 1,handles.time_knob_value);
end

% --- Executes on button press in im_psi.
function im_psi_Callback(hObject, eventdata, handles)

axes(handles.axes2);
pop=get(handles.popupmenu2,'Value');
if pop == 4
    Time_Dep_Im_Part_Anim(handles.psis(:,2*handles.array_n(1)), ...
        handles.Es(2*handles.array_n(1)),2, 1,handles.time_knob_value);
else
    Time_Dep_Im_Part_Anim(handles.psis(:,handles.array_n(1)), ...
        handles.Es(handles.array_n(1)),2, 1,handles.time_knob_value);
end


% --- Executes on slider movement.
function time_knob_slider_Callback(hObject, eventdata, handles)
% hObject    handle to time_knob_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.time_knob_value=get(hObject,'Value');
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function time_knob_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to time_knob_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
