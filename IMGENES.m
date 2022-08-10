function varargout = IMGENES(varargin)
% IMGENES MATLAB code for IMGENES.fig
%      IMGENES, by itself, creates a new IMGENES or raises the existing
%      singleton*.
%
%      H = IMGENES returns the handle to a new IMGENES or the handle to
%      the existing singleton*.
%
%      IMGENES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMGENES.M with the given input arguments.
%
%      IMGENES('Property','Value',...) creates a new IMGENES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before IMGENES_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to IMGENES_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help IMGENES

% Last Modified by GUIDE v2.5 29-Nov-2020 20:16:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @IMGENES_OpeningFcn, ...
                   'gui_OutputFcn',  @IMGENES_OutputFcn, ...
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


% --- Executes just before IMGENES is made visible.
function IMGENES_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to IMGENES (see VARARGIN)

% Choose default command line output for IMGENES
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.axes1,'visible','off')
set(handles.axes2,'visible','off')
set(handles.axes3,'visible','off')
set(handles.axes4,'visible','off')
set(handles.axes5,'visible','off')
set(handles.axes6,'visible','off')

set(handles.Slider_brillo,'visible','off')
set(handles.Slider_contraste,'visible','off')

% UIWAIT makes IMGENES wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = IMGENES_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in analisis.
function analisis_Callback(hObject, eventdata, handles)
cla(handles.axes6)
set(handles.axes1,'visible','on')
set(handles.axes2,'visible','on')
set(handles.axes3,'visible','on')
set(handles.axes4,'visible','on')
set(handles.axes5,'visible','on')
set(handles.axes6,'visible','off')
set(handles.Slider_brillo,'visible','off')
set(handles.Slider_contraste,'visible','off')
cla(handles.axes5,'reset')
Imagen=imread('terreno.jpg');
axes(handles.axes1)
imshow(Imagen)

Imagen_02 = uint8(Imagen(:,:,1));
[m n]=size(Imagen_02)
M_zeros = uint8(zeros(m,n));

Imagen_rojo(:,:,1) = Imagen(:,:,1);
Imagen_rojo(:,:,2) = M_zeros;
Imagen_rojo(:,:,3) = M_zeros;
axes(handles.axes2)
imshow(Imagen_rojo)
Imagen_verde(:,:,1) = M_zeros;
Imagen_verde(:,:,2) = Imagen(:,:,2);
Imagen_verde(:,:,3) = M_zeros;
axes(handles.axes3)
imshow(Imagen_verde)
Imagen_azul(:,:,1) = M_zeros;
Imagen_azul(:,:,2) = M_zeros;
Imagen_azul(:,:,3) = Imagen(:,:,3);
axes(handles.axes4)
imshow(Imagen_azul)

Imagen_gris = rgb2gray(Imagen);
axes(handles.axes5)
imshow(Imagen_gris)
% hObject    handle to analisis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in analisis_de_brillo.
function analisis_de_brillo_Callback(hObject, eventdata, handles)
% hObject    handle to analisis_de_brillo (see GCBO)
set(handles.axes1,'visible','on')
set(handles.axes2,'visible','on')
set(handles.axes3,'visible','on')
set(handles.axes4,'visible','on')
set(handles.axes5,'visible','on')
set(handles.axes6,'visible','on')
set(handles.Slider_brillo,'visible','off')
set(handles.Slider_contraste,'visible','off')

imagen01 = imread('paisaje_grises.jpg');
axes(handles.axes1)
imshow(imagen01)
imagen01_gris=rgb2gray(imagen01);
axes(handles.axes4)
imhist(imagen01_gris)
imagen02 = imread('paisaje_grises_clara.jpg');
axes(handles.axes2)
imshow(imagen02)
imagen02_gris=rgb2gray(imagen02);
axes(handles.axes5)
imhist(imagen02_gris)
imagen03 = imread('paisaje_grises_oscura.jpg');
axes(handles.axes3)
imshow(imagen03)
imagen03_gris=rgb2gray(imagen03);
axes(handles.axes6)
imhist(imagen03_gris)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ajuste_manual.
function ajuste_manual_Callback(hObject, eventdata, handles)
% hObject    handle to ajuste_manual (see GCBO)
cla(handles.axes3)
cla(handles.axes6)
set(handles.axes1,'visible','on')
set(handles.axes2,'visible','on')
set(handles.axes3,'visible','off')
set(handles.axes4,'visible','on')
set(handles.axes5,'visible','on')
set(handles.axes6,'visible','off')
set(handles.Slider_brillo,'visible','on')
set(handles.Slider_contraste,'visible','on')

global imagen_gris
global brillo
global contraste
brillo = 0;
contraste = 0; 
imagen01 = imread('mona.jpg');
axes(handles.axes1)
imshow(imagen01)
imagen_gris=rgb2gray(imagen01);
axes(handles.axes4)
imhist(imagen_gris)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function Slider_brillo_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_brillo (see GCBO)
global imagen_gris
global brillo
global contraste
brillo = (get(handles.Slider_brillo,'value')-0.5)*40;%brillo está dado con valores de 0 a 1
contraste = get(handles.Slider_contraste,'value')*2;
axes(handles.axes2)
imshow(imagen_gris*contraste+brillo)
axes(handles.axes5)
imhist(imagen_gris*contraste+brillo)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Slider_brillo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_brillo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function Slider_contraste_Callback(hObject, eventdata, handles)
% hObject    handle to Slider_contraste (see GCBO)

global imagen_gris
global brillo
global contraste
brillo = (get(handles.Slider_brillo,'value')-0.5)*40;
contraste = get(handles.Slider_contraste,'value')*2;
%imagen_gris = imagen_gris*contraste;

axes(handles.axes2)
imshow(imagen_gris*contraste+brillo)
axes(handles.axes5)
imhist(imagen_gris*contraste+brillo)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function Slider_contraste_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Slider_contraste (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in contraste.
function contraste_Callback(hObject, eventdata, handles)
% hObject    handle to contraste (see GCBO)
set(handles.axes1,'visible','on')
set(handles.axes2,'visible','on')
set(handles.axes3,'visible','on')
set(handles.axes4,'visible','on')
set(handles.axes5,'visible','on')
set(handles.axes6,'visible','on')
set(handles.Slider_brillo,'visible','off')
set(handles.Slider_contraste,'visible','off')
imagen01 = imread('Animal_grises.jpg');
axes(handles.axes1)
imshow(imagen01)
imagen01_gris=rgb2gray(imagen01);
axes(handles.axes4) 
imhist(imagen01_gris)

imagen02 = imread('Animal_grises_con_contraste.jpg');
axes(handles.axes2)
imshow(imagen02)
imagen02_gris=rgb2gray(imagen02);
axes(handles.axes5)
imhist(imagen02_gris)
imagen03 = imread('Animal_grises_sin_contraste.jpg');
axes(handles.axes3)
imshow(imagen03)
imagen03_gris=rgb2gray(imagen03);
axes(handles.axes6)
imhist(imagen03_gris)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
