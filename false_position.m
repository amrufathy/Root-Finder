function [result] = false_position(Xl, Xu, Es, max_iter, equation, handles)

column = {'Xl' 'Xu' 'f(Xl)' 'f(Xu)' 'Xr' 'f(Xr)' 'Es'};
set(handles.table,'ColumnName' , column);

oldVal = 0;
x = -100:0.1:100;
iterations = max_iter;

cla;
p = ezplot(equation);
set(p, 'Color', 'black', 'LineWidth', 2);
hold on;
grid on;

tic;
for i = 1:max_iter
    fxu = double(getfx(equation, Xu));
    fxl = double(getfx(equation, Xl));
    
    if fxu - fxl == 0
        iterations = i;
        break
    end
    
    Xr = (Xl * fxu - Xu * fxl) / (fxu - fxl);
    fxr = double(getfx(equation, Xr));

    err = double(abs(Xr - oldVal));
    table(i,:) = [Xl Xu fxl fxu Xr fxr err];
    plot(Xl, x, 'r'); hold on;
    plot(Xu, x, 'g'); hold on;
    
    if err <= Es
        iterations = i;
        break
    end

    if fxr == 0
        iterations = i;
        break
    elseif fxl * fxr < 0
        Xu = Xr;
    else
        Xl = Xr;
    end
    
    oldVal = Xr;
    
    set(handles.table, 'Data', table);
    pause(1/16);
end

exec_time = toc;
set(handles.execution_time_text, 'String', exec_time);
set(handles.num_iterations_text, 'String', iterations);
result = Xr;

hold off;

end