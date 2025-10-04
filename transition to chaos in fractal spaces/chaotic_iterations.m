% PABLO CORBALÁN DE CONCEPCIÓN
% Second year of the Double degree in Mathematics and Physics - University of Murcia
% Numerical analysis

% Description:
% Given a function f: D --> D we call an iterate of the function arround x0 in D
% a succesion of the form xN = f(xN-1) where x0 is a fixed point from D.

% An iterate of a function f may converge to a fixed point, also called orbit of
% first order. An iterate might not converge to a fixed point of the function, but
% to a couple of points that repeat constantly. If an iterate from the function
% f converges to K points (that repeat themselves one after the other) we say the
% iterate converges to an orbit of order K (or a K-orbit). We will describe the orbit
% as chaotic when after many iterations the orbit does not converge to any well
% defined K-orbit.

% If we have different functions, we could plot in a graph the points of convergence
% of a set iterate for each of the functions. Given a set of functions
% F = {fc(x): c in C} we can define an iterate xN = f(x_N-1) for each of the functions
% in the set F. After iterating this succesion, we will reach the points of convergence
% of the function fc(x) for a fixed parameter c = c0. We will plot this points, in
% the X axis we will represent the different real values given to the c parameter,
% while in the Y axis we will be representing the values of convergence of the
% iterate (xN)N. A single point [c |-> y(c)] represents a fixed value of the c
% parameter for which the iterate converges to a 1-orbit (fixed point, orbit of
% order 1). Two points in the Y axis [c |-> y1(c) , y2(c)] represent a fixed value
% of the c parameter for which the iterate converges to a 2-orbit (orbit of order 2)
% and so on.

clc;
clear;
close all;

% --- SYSTEM CONFIGURATION PARAMETERS ---
c_min = -2;          % Inferior limit of c. Points will be calculated from this value
c_max = 0.25;         % Superior limit of c. Points will be calculated up to this value
N_c   = 500;         % Number of values of c that will be calculated.
N_iter = 500;        % Total number of iterations
N_trans = 100;       % Number of transitory iterations
x0 = 0;              % Initial point

% --- FUNCTION DEFINITION ---
function y = f(x, c)
    y = x^2 + c
end
c_values = linspace(c_min, c_max, N_c); % Range of the c parameter

x = zeros(1, N_iter);                   % Vector to store results

figure; hold on;

for c = c_values
    x(1) = x0; % First point

    % Iteration
    for n = 2:N_iter
        x(n) = f(x(n-1), c);
    end

    % Plot the stable points
    plot(c * ones(1, N_iter - N_trans), x(N_trans+1:end), '.k', 'MarkerSize', 1);
end

xlabel('c');
ylabel('xN');
title('Bifurcation diagram of the function fc(x)');

