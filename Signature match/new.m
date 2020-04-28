function varargout = new(varargin)
% NEW MATLAB code for new.fig
%      NEW, by itself, creates a new NEW or raises the existing
%      singleton*.
%
%      H = NEW returns the handle to a new NEW or the handle to
%      the existing singleton*.
%
%      NEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEW.M with the given input arguments.
%
%      NEW('Property','Value',...) creates a new NEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before new_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to new_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help new

% Last Modified by GUIDE v2.5 08-Jun-2016 14:15:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @new_OpeningFcn, ...
                   'gui_OutputFcn',  @new_OutputFcn, ...
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


% --- Executes just before new is made visible.
function new_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to new (see VARARGIN)

% Choose default command line output for new
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes new wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = new_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in btn_im2.
function btn_im2_Callback(hObject, eventdata, handles)
% hObject    handle to btn_im2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% [FileName2 PathName2] = uigetfile('*.bmp','Select the second Signature file');
% fullFileName = fullfile(PathName2, FileName2);
global pic2;
pic2 = imread('test2.bmp');

imshow(pic2,'Parent',handles.axes2);

% --- Executes on button press in btn_im1.
function btn_im1_Callback(hObject, eventdata, handles)
% hObject    handle to btn_im1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% [FileName1 PathName1] = uigetfile('*.bmp','Select the first Signature file');
% fullFileName = fullfile(PathName1, FileName1);
global pic1;

pic1 = imread('test.bmp');

imshow(pic1,'Parent',handles.axes1);

% --- Executes on button press in btn_match.
function btn_match_Callback(hObject, eventdata, handles)
% hObject    handle to btn_match (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global percentage; 
global results_message;       
      pic1 = imread('test.bmp');
      pic2 = imread('test2.bmp');
    neural_match(pic1,pic2);
    set(handles.txt_percentage,'String',percentage);
    set(handles.txt_results,'String',results_message);   
   
