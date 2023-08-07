
function  projectile3d(V,theta,phi,x0,y0,z0,simtime,n)

% Simulation Settings 

t = linspace(0,simtime,n);
g = -9.81;


% Velocity Components in new coordinated system

Vx = V.*cosd(theta).*sind(phi);
Vz = V.*sind(theta);
Vy = V.*cosd(phi).*cosd(theta);

% X Range 

x = x0 + Vx.*t;

% Alititude 

z = z0 + Vz.*t + 0.5.*g.*t.^2;

% Z range

y = y0 + Vy.*t ;


% Time of flight

if z0 == 0


    tland = (-2.*Vz)./(g);
    xland = x0 + Vx.*tland;
    yland = y0 + Vy.*tland;

else

    tland = (-Vz - sqrt(Vz.^2 - (2.*g.*z0)))./g ;
    xland = x0 + Vx.*tland;
    yland = y0 + Vy.*tland;

end

% Max altitude 

[hmax,idx] = max(z) ;

% Plot Trajectory

display(hmax)
display(xland)
display(yland)

plot3(x,y,z,"b-")
xlabel("X Range / [m] ")
ylabel("Y Range / [m] ")
zlabel("Altitude / [m] ")
title("Trajectory","FontSize",16)
xlim([0 xland])
ylim([0 yland])
zlim([0 hmax])
grid minor

hold on 

plot3(x(idx),y(idx),hmax,"r.",'MarkerSize',13)
plot3(xland,yland,0,"x")
legend("Trajectory","Max height","Landing point","Location","southeast")

hold off


end


