% K R S Nandhan, M Greeshma Varsha
% program to find and plot boundary layer thickness & velocity profile


%user inputs - free stream velocity.
%output - a graph with the boundary layer and velocity profile ploted on it.

%Note : all the measurements are taken in SI units.

%Note : The determination of the flow is based on the  overall Reynolds number, 
%        not on local  Reynolds number(it could be confusing).

%Note : some data is assumed for the program simplicity.

% Note : the formulas are taken from the "Introduction to flight" textbook by J D Anderson.


% the table is a grid,which is the most important data and the output of all the calculations
%is stored in that grid.

clear all;

velocity = input('enter the velocity value : ');

table = zeros(100,10);
% table contents-column wise indexing
%1 = points
%2 = velocity
%3 = reynolds number
%4 = thickness
%5 = dist at 25% of thickness
%6 = dist at 50% of thickness
%7 = dist at 75% of thickness
%8 =  vel at 25% of thickness
%9 =  vel at 50% of thickness
%10 = vel at 75% of thickness



% numerical data
%assuming the length of the plate is 10m
points = 0.1:0.1:10;
mu = 1.789*10^-5;
rho = 1.225;
len = 10;


%calculations_ reynold's number
rey_main = (rho*velocity*len)/mu;

re = (rho*velocity*points)/mu;
% local reynolds number (re)


%boundary layer calculation based on reynolds number
if rey_main < 3*10^6
    
thick = (5.2.*points)./(sqrt(re));
disp('the flow is Laminar')

else 
    thick = (0.37.*points)./(re.^0.2);
    disp('the flow is Turbulent')

end



%inserting data to the table
table(:,1) = points';

table(:,2) = velocity;

table(:,4) = thick';

table(:,3) = re'./10^6;




% calculation of velocity profile
for i = 1:100

    [table(i,8),table(i,9),table(i,10)] = thick_at(thick(i),velocity);
    
    [table(i,5),table(i,6),table(i,7)] = t_at(thick(i));


end


% boundary layer plot

plot(points,thick,'b','LineWidth',3);

grid on;

xlabel('Length(m)');
ylabel('Thickness(m)');
title("Boundary Layer Thickness at "+velocity+"m/s");
hold on

axis([0 len 0 0.2]);

%points_2 = linspace(points(10),points(80),2);




% velocity profile plot using quiver

    p1 = [table(30,1),table(60,1),table(30,1),table(60,1),table(30,1),table(60,1)];
    
    p2 = [table(30,5),table(60,5),table(30,6),table(60,6),table(30,7),table(60,7)];
    
    p3 = [table(30,8),table(60,8),table(30,9),table(60,9),table(30,10),table(60,10)];
    
    zeros = zeros(1,6);

    quiver(p1,p2,p3,zeros,'g>');
    
    legend('Boundary layer','Velocity profile');
    
    
    % Report issues / feedback : github.com/krs131099/BoundaryLayer
    


