
function  projectile2d(V,theta,x0,y0,simtime,n)

% Simulation Settings 

t = linspace(0,simtime,n);
g = -9.81;


% Velocity Components

Vx = V.*cosd(theta);
Vy = V.*sind(theta);

% Range 

x = x0 + Vx.*t;

% Alititude 

y = y0 + Vy.*t + 0.5.*g.*t.^2;

% Time of flight

if y0 == 0


    tland = (-2.*Vy)./(g);
    xland = Vx.*tland;

else

    tland = (-Vy - sqrt(Vy.^2 - (2.*g.*y0)))./g;
    xland = x0 + Vx.*tland;

end

% Max altitude 

[hmax,~] = max(y) ;

% Plot Trajectory

display(tland)
display(hmax)
display(xland)

plot(x,y,"b-")
ylabel("Altitude / [m] ")
xlabel("Range / [m] ")
title("Trajectory","FontSize",16)
ylim([0 hmax])
xlim([0 xland])
yline(hmax,"r--","Max height",LabelHorizontalAlignment="left",LabelVerticalAlignment="bottom")
grid on

hold on 

quiver(x(1),y(1),Vx,Vy,"filled","m-")

hold off

end