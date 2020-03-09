% Values according to 4.1.6 Making the Population Growth Model More Realistic 
dt = 20; % Time step size [months]
T = 100; % Investigated time
r = 0.1; % Net growth rate r
M = 500; % Maximum population
N_0 = 100; % Initial population size

f = @(N,t) r*(1-N/M)*N; % logistic equation

% Solves differential equations for initial time step size dt
[u_dt, t_dt] = ode_FE(f, N_0, dt, T)
