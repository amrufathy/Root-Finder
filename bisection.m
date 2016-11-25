function [result] = bisection(Xl, Xu, Es, max_iter, equation, handles)

column = {'Xl' 'Xu' 'Xr' 'f(Xl)' 'f(Xu)' 'f(Xr)' 'Es'};
set(handles.table,'ColumnName' , column);

error = 0.0;
limit = int32(log2(abs(Xu - Xl) / Es)) + 1;
Xr = ((Xl + Xu) / 2.0);
x = -100:0.1:100;

cla;
p = ezplot(equation);
set(p, 'Color', 'black', 'LineWidth', 2);
hold on;

for i = 1:max_iter 
    fXr = getfx(equation, Xr);
    fXl = getfx(equation, Xl);
    fXu = getfx(equation, Xu);
    oldVal = Xr;
    
    table(i,:) = [Xl Xu Xr fXl fXu fXr error];
    plot(Xl, x, 'r'); hold on;
    plot(Xu, x, 'g'); hold on;
    
    if fXr == 0
        result = Xr;
        return;
    elseif fXr * fXl > 0
    	Xl = Xr;
    else
        Xu = Xr;  
    end
            
    Xr = (Xl + Xu) / 2.0;
    error = vpa(abs(Xr - oldVal));
    
    if error < Es || i > limit
        break
    end
end

set(handles.table, 'Data', table);
result = Xr;

hold off;

end