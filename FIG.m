function varargout = FIG(varargin)
% FIG MATLAB code for FIG.fig
%      FIG, by itself, creates a new FIG or raises the existing
%      singleton*.
%
%      H = FIG returns the handle to a new FIG or the handle to
%      the existing singleton*.
%
%      FIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIG.M with the given input arguments.
%
%      FIG('Property','Value',...) creates a new FIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FIG_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FIG_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FIG

% Last Modified by GUIDE v2.5 19-Nov-2020 20:17:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FIG_OpeningFcn, ...
                   'gui_OutputFcn',  @FIG_OutputFcn, ...
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


% --- Executes just before FIG is made visible.
function FIG_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FIG (see VARARGIN)

% Choose default command line output for FIG
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FIG wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FIG_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
for i=1:126
for j=1:126
Imagen(i,j)=i+j;
end
end
Im_gris= uint8(Imagen); %defino que mi matriz va de 0 a 255 unisgned integer8-bits
axes(handles.axes1)
imshow(Im_gris)
%en este caso la imagen es de mxn 
[m n] = size(Im_gris)
M_zeros = uint8(zeros(m)); %entero sin signo de 8 bits
Imagen_roja(:,:,1)=Im_gris; %deja activa la primera matriz que se refiere ala matriz roja

Imagen_roja(:,:,2)=M_zeros; %deja en 0 la segunda matriz que se refiere a lamatriz verde
Imagen_roja(:,:,3)=M_zeros; %deja en 0 la segunda matriz que se refiere a lamatriz azul
axes(handles.axes2)
imshow(Imagen_roja)
Imagen_verde(:,:,1)=M_zeros;
Imagen_verde(:,:,2)=Im_gris;
Imagen_verde(:,:,3)=M_zeros;
axes(handles.axes3)
imshow(Imagen_verde)
Imagen_azul(:,:,1)=M_zeros;
Imagen_azul(:,:,2)=M_zeros;
Imagen_azul(:,:,3)=Im_gris;
axes(handles.axes4)
imshow(Imagen_azul)

for i=1:126
for j=1:126
Imagen_color_01(i,j)=i+j;
end
end
for i=1:126
for j=1:126
Imagen_color_02(i,j)=125*cos((i+j)/20)+1; %20=amplitud de onda
end
end
for i=1:126
for j=1:126
Imagen_color_03(i,j)=125*sin((i+j)/20)+1;
end
end
Imagen_color(:,:,1) = uint8(Imagen_color_01);
Imagen_color(:,:,2) = uint8(Imagen_color_02);
Imagen_color(:,:,3) = uint8(Imagen_color_03);
axes(handles.axes5)
imshow(Imagen_color) %20=es para que muestre la imagen
%Imagen= [0 1; 1 0];
%Imagen= [0 0.5 1; 0.5 1 0; 1 0 0.5];
%imshow (Imagen)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
