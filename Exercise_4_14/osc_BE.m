omega = 2;
P = 2*pi/omega;
%dt = P/20;
dt = P/2000;
T = 3*P;
N_t = floor(round(T/dt));
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Initial condition
X_0 = 2;
v_0 = 0;

% Initial condition are assigned.
u(1) = X_0;
v(1) = v_0;

for n = 2:N_t+1
    u(n) = (1.0/(1+(dt*omega)^2)) * (dt*v(n-1) + u(n-1));
    v(n) = (1.0/(1+(dt*omega)^2)) * (-dt*omega^2*u(n-1) + v(n-1));
end

plot(t, u, 'b-')
hold on
plot(t, X_0*cos(omega*t), 'g-');

legend('numerical', 'exact');
title('Backward Euler scheme')
xlabel('t'); ylabel('Position of mass u');

hold off
