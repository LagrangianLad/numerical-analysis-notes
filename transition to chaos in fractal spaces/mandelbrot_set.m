% PABLO CORBALÁN DE CONCEPCIÓN
% Second year of the Double degree in Mathematics and Physics - University of Murcia
% Numerical analysis

clc; clear; close all;

% --- CONFIGURATION PARAMETERS ---
maxIter = 100;        % Número máximo de iteraciones
res = 1080;            % Resolución de la imagen (800x800 píxeles)
xlim = [-2, 1];       % Rango del eje real
ylim = [-1.5, 1.5];   % Rango del eje imaginario

% Create a grid for representing complex numbers complex numbers
x = linspace(xlim(1), xlim(2), res);
y = linspace(ylim(1), ylim(2), res);
[Re, Im] = meshgrid(x, y);
C = Re + 1i * Im;                    % Each complex point z = x + iy

% Initialization of Z and the matrix of results
Z = zeros(size(C));
M = zeros(size(C));

% Principal iterations
for k = 1:maxIter
    Z = Z.^2 + C;               % z_{n+1} = z_n^2 + c
    mask = (abs(Z) <= 2);
    M = M + mask;               % Count iterations before divergence
end

% Creation of the graph
figure;
imagesc(x, y, M);
axis equal tight;
colormap(gray);
title('MANDELBROT SET');
xlabel('REAL PART');
ylabel('IMAGINARY PATH');
set(gca, 'YDir', 'normal');   % Set normal vertical orientation

