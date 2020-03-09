% Computes the total energy (Potential energy + Kinetic energy)of an
% oscillating system
% NOTE: These are not exactly the physical potential and kinetic energy! 
function [U, KE] = osc_energy(u, v, omega)
    U = (1/2)*omega.^2*u.^2; % Potential energy
    KE = (1/2)*v.^2; % Kinetic energy
end
