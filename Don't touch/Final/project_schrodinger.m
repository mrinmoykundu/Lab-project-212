function varargout = project_schrodinger(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_schrodinger_OpeningFcn, ...
                   'gui_OutputFcn',  @project_schrodinger_OutputFcn, ...
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


% --- Executes just before project_schrodinger is made visible.
function project_schrodinger_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for project_schrodinger
handles.output = hObject;
ah=axes('unit','normalized','position',[0 0 1 1]);

bg=imread('homepage_bg.jpg');imagesc(bg);
set(ah,'handlevisibility','off','visible','off');
uistack(ah,'bottom')

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes project_schrodinger wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_schrodinger_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes on button press in one_well.
function one_well_Callback(hObject, eventdata, handles)
close(project_schrodinger)
well_one


% --- Executes on button press in two_well.
function two_well_Callback(hObject, eventdata, handles)
close(project_schrodinger)
playground


% --- Executes on button press in kronig.
function kronig_Callback(hObject, eventdata, handles)
close(project_schrodinger)
kronig_penny
