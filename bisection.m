function [result] = bisection(Xl, Xu, Es, max_iter, equation, handles)

column = {'Xl' 'Xu' 'Xr' 'f(Xl)' 'f(Xu)' 'f(Xr)' 'Es'};
set(handles.table,'ColumnName' , column);

err = 0.0;
limit = int32(log2(abs(Xu - Xl) / Es)) + 1;
Xr = ((Xl + Xu) / 2.0);
x = -100:0.1:100;
iterations = max_iter;

cla;
p = ezplot(equation);
set(p, 'Color', 'black', 'LineWidth', 2);
hold on;
grid on;

tic;
for i = 1:max_iter 
    fXr = double(getfx(equation, Xr));
    fXl = double(getfx(equation, Xl));
    fXu = double(getfx(equation, Xu));
    oldVal = Xr;
    
    table(i,:) = [Xl Xu Xr fXl fXu fXr err];
    plot(Xl, x, 'r'); hold on;
    plot(Xu, x, 'g'); hold on;
    
    if fXr == 0
        iterations = i;
        break
    elseif fXr * fXl > 0
    	Xl = Xr;
    else
        Xu = Xr;  
    end
            
    Xr = double((Xl + Xu) / 2.0);
    err = double(abs(Xr - oldVal));
    
    if err < Es || i > limit
        iterations = i;
        break
    end
    
    set(handles.table, 'Data', table);
    pause(1/16);
end

exec_time = toc;
set(handles.execution_time_text, 'String', exec_time);
set(handles.num_iterations_text, 'String', iterations);
result = Xr;

hold off;

end