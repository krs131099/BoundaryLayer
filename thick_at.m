
function [v25,v50,v75] = thick_at(t,v)
v25 = t.*v.*(0.25);
v50 = t.*v.*(0.50);
v75 = t.*v.*(0.75);
end
