function result = getaprfx(equation,n)
    y = '@(x,z)'
    y = strcat(y,equation,char('+'));
    b = '*(x-z)^'
    for i = 1 :n
        dervative = diff(sym(equation),i);
        y=strcat(y,char(dervative),char(b),num2str(i),'+');
    end 
    result = str2func(y(1:end-1))
end