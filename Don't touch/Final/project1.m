function varargout = project1(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project1_OpeningFcn, ...
                   'gui_OutputFcn',  @project1_OutputFcn, ...
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


% --- Executes just before project1 is made visible.
function project1_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for project1
handles.output = hObject;
ah=axes('unit','normalized','position',[0 0 1 1]);

bg=imread('homepage_bg.jpg');imagesc(bg);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom')

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project1_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in one_well.
function one_well_Callback(hObject, eventdata, handles)
close(project1)
well_one


% --- Executes on button press in two_well.
function two_well_Callback(hObject, eventdata, handles)
close(project1)
playground


% --- Executes on button press in kronig.
function kronig_Callback(hObject, eventdata, handles)
close(project1)
kronig_penny



% --- Executes during object creation, after setting all properties.


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
