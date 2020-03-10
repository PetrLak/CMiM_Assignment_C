omega = 2;
P = 2*pi/omega;
dt = [P/20 P/2000]';
T = 3*P;

% Initial condition
X_0 = 2;
v_0 = 0;

for ii = 1:length(dt)
N_t = floor(round(T/dt(ii)));

t = linspace(0, N_t*dt(ii), N_t+1);

u = zeros(N_t+1, length(dt));
v = zeros(N_t+1, length(dt));

% Initial condition are assigned.
u(1,:) = X_0;
v(1,:) = v_0;

    for n = 2:N_t+1
        u(n,ii) = (1.0/(1+(dt(ii)*omega)^2)) * (dt(ii)*v(n-1,ii) + u(n-1,ii));
        v(n,ii) = (1.0/(1+(dt(ii)*omega)^2)) * (-dt(ii)*omega^2*u(n-1,ii) + v(n-1,ii));
    end
    
hold on
plot(t, u(:,ii), '--');
end

plot(t, X_0*cos(omega*t), 'g-');

legend('numerical1', 'numerical2', 'exact');
title('Backward Euler scheme')
xlabel('t'); ylabel('Position of mass u');

hold off
