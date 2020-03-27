% program to find and plot boundary layer thickness & velocity profil

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
disp('the flow is turbulent')

else 
    thick = (0.37.*points)./(re.^0.2);
    disp('the flow is laminar')

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

plot(points,thick,'LineWidth',3);

grid on;

xlabel('Length');
ylabel('Thickness');
title('Boundary Layer Thickness');
hold on

axis([0 len 0 0.2]);

%points_2 = linspace(points(10),points(80),2);

%for t = 5:7
 %   j = 8;
  %  quiver([table(30,1),table(60,1)],[table(30,t),table(60,t)],[table(30,j),table(60,)],[0,0])
   % hold on
%sel = 5:7;
%sel2 = 8:10;
%p= [points(t),points(t),points(t)];   
 %quiver(p,table(sel),table(sel2),zeros(1,3));
%hold on;
%quiver(points(t),thick(t),table(t,6),zeros(1));
%quiver(points(t),thick(t),table(t,7),zeros(1));
%end

% velocity profile plot using quiver

    p1 = [table(30,1),table(60,1),table(30,1),table(60,1),table(30,1),table(60,1)];
    
    p2 = [table(30,5),table(60,5),table(30,6),table(60,6),table(30,7),table(60,7)];
    
    p3 = [table(30,8),table(60,8),table(30,9),table(60,9),table(30,10),table(60,10)];
    
    zeros = zeros(1,6);

    quiver(p1,p2,p3,zeros,'>');
    


