function [result] = getfx(equation, x)

equation = strcat('@(x)', equation);
equation = str2func(equation);
result = equation(x);

end