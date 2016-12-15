function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 16-Dec-2016 01:43:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function equation_text_Callback(hObject, eventdata, handles)
% hObject    handle to equation_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of equation_text as text
%        str2double(get(hObject,'String')) returns contents of equation_text as a double


% --- Executes during object creation, after setting all properties.
function equation_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to equation_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in plot_button.
function plot_button_Callback(hObject, eventdata, handles)
% hObject    handle to plot_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
func = get(handles.equation_text, 'String');
p = ezplot(func);
set(p, 'Color', 'black', 'LineWidth', 2);
zoom on

% --- Executes on selection change in method_menu.
function method_menu_Callback(hObject, eventdata, handles)
% hObject    handle to method_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns method_menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from method_menu
method = get(handles.method_menu, 'Value');

if method == 3
    set(handles.gofx,'visible','on');
    set(handles.gofx_text,'visible','on');
else
    set(handles.gofx,'visible','off');
    set(handles.gofx_text,'visible','off');
end

% --- Executes during object creation, after setting all properties.
function method_menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to method_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x0_text_Callback(hObject, eventdata, handles)
% hObject    handle to x0_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0_text as text
%        str2double(get(hObject,'String')) returns contents of x0_text as a double


% --- Executes during object creation, after setting all properties.
function x0_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x1_text_Callback(hObject, eventdata, handles)
% hObject    handle to x1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x1_text as text
%        str2double(get(hObject,'String')) returns contents of x1_text as a double


% --- Executes during object creation, after setting all properties.
function x1_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x1_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iter_text_Callback(hObject, eventdata, handles)
% hObject    handle to iter_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iter_text as text
%        str2double(get(hObject,'String')) returns contents of iter_text as a double


% --- Executes during object creation, after setting all properties.
function iter_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iter_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function error_text_Callback(hObject, eventdata, handles)
% hObject    handle to error_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of error_text as text
%        str2double(get(hObject,'String')) returns contents of error_text as a double


% --- Executes during object creation, after setting all properties.
function error_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to error_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in solve_button.
function solve_button_Callback(hObject, eventdata, handles)
% hObject    handle to solve_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
method = get(handles.method_menu, 'Value');
func = get(handles.equation_text, 'String');

x0 = str2num(get(handles.x0_text, 'String')); xl = x0;
x1 = str2num(get(handles.x1_text, 'String')); xu = x1;
imax = str2num(get(handles.iter_text, 'String'));
error = str2num(get(handles.error_text, 'String'));

% answer = 0;

switch method
    case 1  % 'Bisection'
        answer = bisection(xl, xu, error, imax, func, handles);
    case 2  % 'False Position (Regula Falsi)'
        answer = false_position(xl, xu, error, imax, func, handles);
    case 3  % 'Fixed Point'
        func = get(handles.gofx_text, 'String');
        answer = fixed_point(x0, error, imax, func, handles);
    case 4  % 'Newton-Raphson'
        answer = newton_raphson(x0, error, imax, func, handles);
    case 5  % 'Secant'
        answer = secant(x0, x1, error, imax, func, handles);
    case 6  % 'Birge-Vieta'
        answer = 0;
end

set(handles.answer_text, 'String', answer);


function answer_text_Callback(hObject, eventdata, handles)
% hObject    handle to answer_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of answer_text as text
%        str2double(get(hObject,'String')) returns contents of answer_text as a double


% --- Executes during object creation, after setting all properties.
function answer_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to answer_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function execution_time_text_Callback(hObject, eventdata, handles)
% hObject    handle to execution_time_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of execution_time_text as text
%        str2double(get(hObject,'String')) returns contents of execution_time_text as a double


% --- Executes during object creation, after setting all properties.
function execution_time_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to execution_time_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function num_iterations_text_Callback(hObject, eventdata, handles)
% hObject    handle to num_iterations_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_iterations_text as text
%        str2double(get(hObject,'String')) returns contents of num_iterations_text as a double


% --- Executes during object creation, after setting all properties.
function num_iterations_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_iterations_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gofx_text_Callback(hObject, eventdata, handles)
% hObject    handle to gofx_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gofx_text as text
%        str2double(get(hObject,'String')) returns contents of gofx_text as a double


% --- Executes during object creation, after setting all properties.
function gofx_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gofx_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in upload_file.
function upload_file_Callback(hObject, eventdata, handles)
% hObject    handle to upload_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

txt_file = fileread(get(handles.file_path, 'Value'))


function file_path_Callback(hObject, eventdata, handles)
% hObject    handle to file_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of file_path as text
%        str2double(get(hObject,'String')) returns contents of file_path as a double


% --- Executes during object creation, after setting all properties.
function file_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to file_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
