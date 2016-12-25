function [result] = fixed_point(X0, Es, max_iter, equation, handles)

column = {'Xi' 'Xi+1' 'Es'};
set(handles.table,'ColumnName' , column);

g = strcat(equation, ' + x');
% g = equation;
iterations = max_iter;
Xnow = X0;

cla;
p = ezplot(g);
set(p, 'Color', 'black', 'LineWidth', 2);
hold on;
grid on;

tic;
for i = 1:max_iter
    Xnew = double(getfx(g, Xnow));
    
    err = double(abs(Xnew - Xnow));
    
    table(i,:) = [Xnow Xnew err];
    
    if err <= Es
        iterations = i;
        break
    end
    
    Xnow = Xnew;
    
    set(handles.table, 'Data', table);
    pause(1/16);
end

exec_time = toc;
set(handles.execution_time_text, 'String', exec_time);
set(handles.num_iterations_text, 'String', iterations);
result = Xnew;

hold off;

end
