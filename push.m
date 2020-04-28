
function varargout = push(varargin)
% push M-source for push.fig
%      push, by itself, creates a new push or raises the existing
%      singleton*.
%
%      H = push returns the handle to a new push or the handle to
%      the existing singleton*.
%
%      push('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in push.M with the given input arguments.
%
%      push('Property','Value',...) creates a new push or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before push_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to push_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help push

% Last Modified by GUIDE v2.5 21-Nov-2008 11:43:53

% Begin initialization code - DO NOT TARGET
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @push_OpeningFcn, ...
                   'gui_OutputFcn',  @push_OutputFcn, ...
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
% End initialization code - DO NOT TARGET


% --- Executes just before push is made visible.
function push_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to push (see VARARGIN)

clc
% Choose default command line output for push
handles.pic='test.png';

handles.output = hObject;
handles.pic='test.png';

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes push wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = push_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata,handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%set(handles.text1, 'String', 'push button pushed')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Function Developed by Fahd A. Abbasi.
% Department of Electrical and Electronics Engineering, University of
% Engineering and Technology, Taxila, PAKISTAN.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% The function takes two images as argument and using edge detection
% checks whether they are the same or not...a cool and simple code which
% can be used in security systems.
% The level at which the two pictures should be matched can be controlled
% by changing the code at line 100.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% USAGE (SAMPLE CODE)
%
%
%       pic1 = imread('cameraman.tif');
%       pic2 = imread('cameraman.tif');
%       ait_picmatch(pic1,pic2);
%       
%       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   

%function pattmatch(k,p)
display('vaaiibhav');
pic1 = imread('test.png');
pic2 = imread('test.png');
k = pic1;
p = pic2;
% k=handles.XX;
% p=handles.YY;
[x,y,z] = size(k);
if(z==1)
    ;
else
    k = rgb2gray(k);
end

[x,y,z] = size(p);
if(z==1)
    ;
else
    p = rgb2gray(p);
end



%applying edge detection on first picture
%so that we obtain white and black points and edges of the objects present
%in the picture.

edge_det_k = edge(k,'prewitt');

%%applying edge detection on second picture
%so that we obtain white and black points and edges of the objects present
%in the picture.

edge_det_p = edge(p,'prewitt');

%definition of different variables to be used in the code below

%output variable if pictures have been matched.
OUTPUT_MESSAGE = '   almost same x-ray images ';

%output variable if objects in the whole picture have not been matched.
OUTPUT_MESSAGE2 = ' x-ray images not matching ';

%initialization of different variables used
matched_data = 0;
white_points = 0;
black_points = 0;
x=0;
y=0;
l=0;
m=0;

%for loop used for detecting black and white points in the picture.
for a = 1:1:300
    for b = 1:1:300
        if(edge_det_k(a,b)==1)
            white_points = white_points+1;
        else
            black_points = black_points+1;
        end
    end
end
display('testing');
%for loop comparing the white (edge points) in the two pictures
for i = 1:1:300
    for j = 1:1:300
        if(edge_det_k(i,j)==1)&(edge_det_p(i,j)==1)
            matched_data = matched_data+1;
            else
                ;
        end
    end
end
    



%calculating percentage matching.
total_data = white_points;
total_matched_percentage = (matched_data/total_data)*100;
%handles.pp=total_matched_percentage;
%guidata(hObject,handles);
set(handles.result,'String',total_matched_percentage);
%outputting the result of the system.
if(total_matched_percentage >= 85)          %can add flexability at this point by reducing the amount of matching.
    
    total_matched_percentage
    OUTPUT_MESSAGE
    display(OUTPUT_MESSAGE);
    set(handles.result1,'String',OUTPUT_MESSAGE);
else
    
    total_matched_percentage
    OUTPUT_MESSAGE2
    display(OUTPUT_MESSAGE2);
    set(handles.result1,'String',OUTPUT_MESSAGE2);
end





















% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --------------------------------------------------------------------
function source_Callback(hObject, eventdata, handles)
% hObject    handle to source (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

file = uigetfile('*.jpg');
    if ~isequal(file, 0)
       k=imread(file);
       handles.YY = k;
z=k;
guidata(hObject,handles);
%guidata(hObject,handles);
       subplot(2,2,1),imshow(k);title('source');
      
    end

% --------------------------------------------------------------------
function new_Callback(hObject, eventdata, handles)
% hObject    handle to new (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function target_Callback(hObject, eventdata, handles)
% hObject    handle to target (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

file = uigetfile('*.jpg');
    if ~isequal(file, 0)
        p=imread(file);
       
      subplot(2,2,2),imshow(p);title('target');
       handles.XX = p;
guidata(hObject,handles);
    end

% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('coded by ANISHFRANCIS,lecturer,ECE DEPT');
% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function howto_Callback(hObject, eventdata, handles)
% hObject    handle to howto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('use medium sized images');

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

file = uigetfile('*.jpg');
    if ~isequal(file, 0)
        imshow(file);
        %open(source);
    end



function result_Callback(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result as text
%        str2double(get(hObject,'String')) returns contents of result as a double

% --- Executes during object creation, after setting all properties.



function result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.



if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





function result1_Callback(hObject, eventdata, handles)
% hObject    handle to result1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of result1 as text
%        str2double(get(hObject,'String')) returns contents of result1 as a double


% --- Executes during object creation, after setting all properties.
function result1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to result1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


