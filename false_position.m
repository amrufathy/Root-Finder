function [result] = false_position(Xl, Xu, Es, max_iter, equation, handles)

column = {'Xl' 'Xu' 'f(Xl)' 'f(Xu)' 'Xr' 'f(Xr)' 'Es'};
set(handles.table,'ColumnName' , column);

oldVal = 0;
x = -100:0.1:100;

cla;
p = ezplot(equation);
set(p, 'Color', 'black', 'LineWidth', 2);
hold on;

for i = 1:max_iter
    fxu = getfx(equation, Xu);
    fxl = getfx(equation, Xl);
    
    Xr = (Xl * fxu - Xu * fxl) / (fxu - fxl) * 1.0;
    fxr = getfx(equation, Xr);

    error = (abs(Xr - oldVal));
    table(i,:) = [Xl Xu fxl fxu Xr fxr error];
    plot(Xl, x, 'r'); hold on;
    plot(Xu, x, 'g'); hold on;
    
    if error <= Es
        break
    end

    if fxr == 0
        break
    elseif fxl * fxr < 0
        Xu = Xr;
    else
        Xl = Xr;
    end
    
    oldVal = Xr;
end

set(handles.table, 'Data', table);
result = Xr;

hold off;

end