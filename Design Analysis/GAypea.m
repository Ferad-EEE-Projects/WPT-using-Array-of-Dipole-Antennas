%%%%%%%%%%%%%% Define Problem %%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;
% Create and empty problem instance
problem = ypea_problem();

% Set the type of problem
problem.type = 'max';

% Define the decision variables and search space
problem.vars = [
    ypea_var('x', 'int', 'lower_bound', 2, 'upper_bound', 50)
    ypea_var('y', 'real', 'lower_bound', 0.1, 'upper_bound', 2)
];

% Get a handler to the Sphere function
dipolean = ypea_test_function('dipolean');

% Define the objective function
problem.obj_func = @(sol) dipolean(sol.x,sol.y);


%%%%%%%%%%%%%% Use GA %%%%%%%%%%%%%%%%%%%%%%
% Initialize an instance of Genetic Algorithm
ga = ypea_ga();

% Maximum Number of Iterations
ga.max_iter = 30;

% Population Size
ga.pop_size = 100;

% Crossover Probability
ga.crossover_prob = 0.7;

% Crossover Inflation Factor
ga.crossover_inflation = 0.4;

% Mutation Probability
ga.mutation_prob = 0.3;

% Mutation Rate
ga.mutation_rate = 0.1;

% Mutation Step Size
ga.mutation_step_size = 0.5;

% Mutation Step Size Damp
ga.mutation_step_size_damp = 0.99;

% Selection Method
ga.selection = 'roulettewheel';

% Selection Pressure
ga.selection_pressure = 5;

% Turns on displaying the information at each iteration
ga.display = true;      %or suppress using: false

%%%%%%%%%%%%%% Pass the Problem %%%%%%%%%%%%%%%%%%%%%%
% Solve the problem using GA
best_sol = ga.solve(problem); % to Run GA

%best_sol.solution
%best_sol.solution.x
%best_sol.obj_value
%ga.run_time
%ga.nfe
%
% % Optimization process
figure;
ga.semilogy('nfe', 'LineWidth', 2);
xlabel('NFE');
ylabel('Best Objective Value');
title(['Results of ' ga.full_name]);
grid on;