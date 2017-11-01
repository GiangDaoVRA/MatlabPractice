function varargout = TH3_Q6_Recognition_Digits_kNN_Plus(varargin)
% TH3_Q6_RECOGNITION_DIGITS_KNN_PLUS MATLAB code for TH3_Q6_Recognition_Digits_kNN_Plus.fig
%      TH3_Q6_RECOGNITION_DIGITS_KNN_PLUS, by itself, creates a new TH3_Q6_RECOGNITION_DIGITS_KNN_PLUS or raises the existing
%      singleton*.
%
%      H = TH3_Q6_RECOGNITION_DIGITS_KNN_PLUS returns the handle to a new TH3_Q6_RECOGNITION_DIGITS_KNN_PLUS or the handle to
%      the existing singleton*.
%
%      TH3_Q6_RECOGNITION_DIGITS_KNN_PLUS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TH3_Q6_RECOGNITION_DIGITS_KNN_PLUS.M with the given input arguments.
%
%      TH3_Q6_RECOGNITION_DIGITS_KNN_PLUS('Property','Value',...) creates a new TH3_Q6_RECOGNITION_DIGITS_KNN_PLUS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TH3_Q6_Recognition_Digits_kNN_Plus_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TH3_Q6_Recognition_Digits_kNN_Plus_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TH3_Q6_Recognition_Digits_kNN_Plus

% Last Modified by GUIDE v2.5 12-Oct-2017 15:33:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TH3_Q6_Recognition_Digits_kNN_Plus_OpeningFcn, ...
                   'gui_OutputFcn',  @TH3_Q6_Recognition_Digits_kNN_Plus_OutputFcn, ...
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


% --- Executes just before TH3_Q6_Recognition_Digits_kNN_Plus is made visible.
function TH3_Q6_Recognition_Digits_kNN_Plus_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TH3_Q6_Recognition_Digits_kNN_Plus (see VARARGIN)

% Choose default command line output for TH3_Q6_Recognition_Digits_kNN_Plus
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TH3_Q6_Recognition_Digits_kNN_Plus wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TH3_Q6_Recognition_Digits_kNN_Plus_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnLoad.
function btnLoad_Callback(hObject, eventdata, handles)
% hObject    handle to btnLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  [filenames, pathname] = uigetfile( ...
  {'*.idx1-ubyte;*.idx3-ubyte',...
 'MNIST Files (*.idx1-ubyte,*.idx3-ubyte)'}, ...
   'Chon file','MultiSelect','on');
  %Load Anh train
  handles.imgTrainAll = loadMNISTImages([pathname,'/train-images.idx3-ubyte']);
  handles.lblTrainAll = loadMNISTLabels([pathname,'/train-labels.idx1-ubyte']);
  handles.imgTestAll = loadMNISTImages([pathname,'/t10k-images.idx3-ubyte']);
  handles.lblTestAll = loadMNISTLabels([pathname,'/t10k-labels.idx1-ubyte']);
   %Nap thuat toan
  handles.mdl = fitcknn(handles.imgTrainAll',handles.lblTrainAll);
  set(handles.txtFilePath,'string',pathname);
  guidata(hObject, handles);
  msgbox('Nap du lieu thanh cong');
    
function txtFilePath_Callback(hObject, eventdata, handles)
% hObject    handle to txtFilePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtFilePath as text
%        str2double(get(hObject,'String')) returns contents of txtFilePath as a double


% --- Executes during object creation, after setting all properties.
function txtFilePath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtFilePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtNo_Callback(hObject, eventdata, handles)
% hObject    handle to txtNo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtNo as text
%        str2double(get(hObject,'String')) returns contents of txtNo as a double


% --- Executes during object creation, after setting all properties.
function txtNo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtNo (see GCBO)
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
    n = get(handles.txtNo,'string');
    n = str2num(n);
     %Nhan dang
    imgTest = handles.imgTestAll(:,n);
    lblPredictTest = predict(handles.mdl,imgTest');
    lblImageTest = handles.lblTestAll(n);
    
    img2D = reshape(imgTest,28,28);
    imshow(img2D);   
    strLabelImage = 'So: ';
    strLabelImage = [strLabelImage,num2str(lblImageTest)];
    title(strLabelImage);
    set(handles.txtPredict,'string',lblPredictTest);
    guidata(hObject, handles);
    


function txtTest_Callback(hObject, eventdata, handles)
% hObject    handle to txtTest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTest as text
%        str2double(get(hObject,'String')) returns contents of txtTest as a double


% --- Executes during object creation, after setting all properties.
function txtTest_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
