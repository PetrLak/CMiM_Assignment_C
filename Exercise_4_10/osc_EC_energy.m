% Euler-Cromer scheme
omega = 2;
P = 2*pi/omega;
dt = P/80;
T = 3*P;
N_t = floor(round(T/dt));
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;

% Step equations forward in time
for n = 1:N_t
    v(n+1) = v(n) - dt*omega^2*u(n);
    u(n+1) = u(n) + dt*v(n+1);
end

% NOTE: These are not exactly the physical potential and kinetic energy!
[U, KE] = osc_energy(u, v, omega);

% Plotting the total energy (sum of Potential U and Kinetic energy KE)
SumE = U + KE;
hold on
plot(t, SumE, 'b-');
xlabel('t');
leg_dt = strcat('Used step size dt=', num2str(dt));
legend(leg_dt)
title('Euler-Cromer scheme')
ylabel('Kinetic + potential energy');
