clearvars, clc, close all

% Before you begin! This script contains all the code needed to make
% the required graphs for the sake of simplicity. All will have f1 as
% example and to run a different step it is needed to make the rest
% comments

% trueM1 = -0.701 || at x=1.927
% trueM2 = 0.01 || at x=2.05
% trueM3 = -0.68071 || at x=1.167

% We use symbolic functions and variables as it is needed to calculate the
% derivative of a function. For the sake of harmony we will use it even for
% the methods that don't require it.
syms 'x';
f1 = (x - 2)^2 + log(x+3) * x;
f2 = exp(-2*x) + (x - 2)^2;
f3 = exp(x) * (x^3 - 1) + (x-1) * sin(x);

%% Plotting the functions to get an idea of the minimum
x = linspace(-10, 10, 100);
tiledlayout(1, 3);

nexttile;
fplot(f1, [-50,50], 'r');
title('f1');
xlabel('x');
ylabel('y');
ylim([-10,10]);

nexttile;
fplot(f2, [-50,50], 'g');
title('f2');
xlabel('x');
ylabel('y');
ylim([-10,10]);

nexttile;
fplot(f3, [-50,50], 'b');
title('f3');
xlabel('x');
ylabel('y');
ylim([-10,10]);

sgtitle('Plots of the three functions');

%%
% Step 1: Bisection Method

% Results for the variation of ε
% mins is a matrix that will hold the minimum values
minsE = zeros(1, 10);

% Wmin is a matrix that will hold the x positions of the minimum values
WminE = zeros(1, 10);

epsilon = linspace(0.0001,0.001,10);
for i = 1:10
    WminE(i) = bisectionM(f3, x, -1, 3, epsilon(i), 0.01);
    minsE(i) = eval(subs(f3, x, WminE(i)));
end
figure (1)
plot(epsilon, minsE, '--ro')
xlabel('Epsilon');
ylabel('Estimated Minimum');
grid on;
title('Bisection Method of f3');
saveas(1,'bisection_e_f3','jpg')

% Results for the variation of l
l = linspace(0.005, 0.09, 10);
minsL = zeros(1, 10);
WminsL = zeros(1, 10);
for i = 1:10
    WminsL(i) = bisectionM(f3, x, -1, 3, 0.001, l(i));
    minsL(i) = subs(f3, x, WminsL(i));
end
figure (2)
plot(l, minsL, '--ro')
xlabel('l');
ylabel('Estimated Minimum');
grid on;
title('Bisection Method of f3');
saveas(2,'bisection_l_f3','jpg')

%%
sth = bisectionM(f1, x, -1, 3, 0.001, 0.01);

%%
% Step 2: Golden Section method:
l = linspace(0.005, 0.09, 10);
minsL = zeros(1, 10);
WminsL = zeros(1, 10);
for i = 1:10
    WminsL(i) = goldenSection(f3, x, -1, 3, l(i));
    minsL(i) = subs(f3, x, WminsL(i));
end
figure (2)
plot(l, minsL, '--ro')
xlabel('l');
ylabel('Estimated Minimum');
grid on;
title('Golden Section Method of f3');
saveas(2,'gsection_l_f3','jpg')
%%
sth = goldenSection(f1, x, -1, 3, 0.01);

%%
% Step 3: Fibonacci method:

    l = linspace(0.005, 0.09, 10);
    minsL = zeros(1, 10);
    WminsL = zeros(1, 10);
    for i = 1:10
        WminsL(i) = FibonacciM(f1, x, -1, 3, l(i));
        minsL(i) = subs(f1, x, WminsL(i));
    end
    figure (2)
    plot(l, minsL, '--ro')
    xlabel('l');
    ylabel('Estimated Minimum');
    grid on;
    title('Fibonacci Method of f1');
    saveas(2,'fibonacci_l_f1','jpg')

%%
sth = FibonacciM(f2, x, -1, 3, 0.01);

%%
% Step 4: Bisection with the use of Derivative method:

    f1prime = diff(f1, x);
    f2prime = diff(f2, x);
    f3prime = diff(f3, x);
   
    l = linspace(0.005, 0.09, 10);
    minsL = zeros(1, 10);
    WminsL = zeros(1, 10);
    for i = 1:10
        WminsL(i) = bisectionDM(f3prime, x, -1, 3, l(i));
        minsL(i) = subs(f3, x, WminsL(i));
    end
    figure (2)
    plot(l, minsL, '--ro')
    xlabel('l');
    ylabel('Estimated Minimum');
    grid on;
    title('Bisection w/Derivative Method of f3');
    saveas(2,'Dbisection_l_f3','jpg')
%%
f3prime = diff(f3, x);
sth = bisectionDM(f3prime, x, -1, 3, 0.01);

%%
    %min1 = bisectionM(f1, x, 0, 3, 0.001, 0.01)
    %min1 = goldenSection(f1, x, 0, 3, 0.01)
    %min1 = FibonacciM(f1, x, 0, 3, 0.01)
    %min1 = bisectionDM(f1prime, x, 0, 3, 0.01)
    %eval(subs(f1, x, min1))

    %min2 = bisectionM(f2, x, 0, 3, 0.001, 0.01)
    %min2 = goldenSection(f2, x, 0, 3, 0.01)
    %min2 = FibonacciM(f2, x, 0, 3, 0.01)
    %min2 = bisectionDM(f2prime, x, 0, 3, 0.01)
    %eval(subs(f2, x, min2))

    %min3 = bisectionM(f3, x, 0, 3, 0.001, 0.01)
    %min3 = goldenSection(f3, x, 0, 3, 0.01)
    %min3 = FibonacciM(f3, x, 0, 3, 0.01)
    %min3 = bisectionDM(f3prime, x, 0, 3, 0.01)
    %eval(subs(f3, x, min3))