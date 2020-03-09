% Values according to 4.1.6 Making the Population Growth Model More Realistic 
dt = 20; % Time step size [months]
T = 100; % Investigated time
r = 0.1; % Net growth rate r
M = 500; % Maximum population
N_0 = 100; % Initial population size

f = @(N,t) r*(1-N/M)*N; % logistic equation

% Solves differential equations for initial time step size dt
[u_dt, t_dt] = ode_FE(f, N_0, dt, T);

k = 1; % Initial k for While loop
given = 1;

while given == 1
    dt_halved = 2^(-k)*dt;
    
    % Solves differential equations for halved time step size dt_halved
    [u_halved, t_halved] = ode_FE(f, N_0, dt_halved, T);
    
    plot(t_dt, u_dt, 'k-')
    hold on
    plot(t_halved, u_halved, 'r--', 'LineWidth', 1.4)
    title({'Population Growth', 'Two Timesteps'})
    xlabel('t'); ylabel('N(t)');
    leg_dt = strcat('Used step size dt=', num2str(dt));
    leg_dt_halved = strcat('Used step size dt=', num2str(dt_halved));
    legend(leg_dt, leg_dt_halved);
    hold off
    fprintf('Last timestep: %g\n', dt_halved)
    
    given = input('Continue with smaller time step? 1 for YES, 0 for NO.\n');
    if given == 1
        k = k + 1;
        u_dt = u_halved;
        t_dt = t_halved;
        dt = dt_halved;
    end
end
