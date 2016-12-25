function [result] = newton_raphson(X0, Es, max_iter, equation, handles)

column = {'Xi-1' 'Xi' 'f(Xi-1)' 'f(Xi)' 'Es'};
set(handles.table,'ColumnName' , column);

Xnow = X0;
Xprev = X0;
iterations = max_iter;
x = -100:0.1:100;

cla;
p = ezplot(equation);
set(p, 'Color', 'black', 'LineWidth', 2);
hold on;
grid on;

tic;
for i = 1:max_iter
    fx_1 = double(getfx(equation, Xprev));
    dfx = double(getndfx(equation, 1, Xprev));
    
    if dfx == 0
    	dfx = getaprfx(equation, 4);
        dfx = dfx(Xprev+0.001, Xprev);
    end
    
    Xnow = double(Xprev - (fx_1 * 1.0 / dfx));
    plot(Xnow, x, 'r'); hold on;
    fx = double(getfx(equation, Xnow));
    
    err = double(abs(Xnow - Xprev));

    table(i,:) = [Xprev Xnow fx_1 fx err];
    Xprev = Xnow;
    
    if err < Es
        iterations = i;
        break
    end
    
    set(handles.table, 'Data', table);
    pause(1/16);
end

exec_time = toc;
set(handles.execution_time_text, 'String', exec_time);
set(handles.num_iterations_text, 'String', iterations);
result = Xnow;

hold off;

end