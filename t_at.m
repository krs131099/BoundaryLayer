% this fucntion gives the partial thickness points of the line.


function [t_25,t_50,t_75] = t_at(thick)

t_25 = thick.*0.25;
t_50 = thick.*0.50;
t_75 = thick.*0.75;
end
