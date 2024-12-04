function [estMinPos] = FibonacciM(f, x, a, b, finalArea)
    tic
    % Precompute Fibonacci numbers until the ratio (b - a) / F(n) is less than finalArea.
    F = [1, 1];  % Initialize Fibonacci sequence
    n = 2;
    while (b - a) / F(end) >= finalArea
        F = [F, F(end) + F(end - 1)];
        n = n + 1;
    end

    % Initialize matrices to store the iteration variables
    kMatx = 0;
    k = 0;
    aMatx = a;
    bMatx = b;

    % Compute the initial points x1 and x2 based on Fibonacci sequence
    x1 = a + (F(n-2) / F(n)) * (b - a);
    x2 = a + (F(n-1) / F(n)) * (b - a);

    % Iterative process
    while (b - a) >= finalArea
        if subs(f, x, x1) < subs(f, x, x2)
            b = x2;
            x2 = x1;
            x1 = a + (F(n - k - 3) / F(n - k - 1)) * (b - a);
        else
            a = x1;
            x1 = x2;
            x2 = a + (F(n - k - 2) / F(n - k - 1)) * (b - a);
        end

        % Update the matrices with the new values
        aMatx(end + 1) = a;
        bMatx(end + 1) = b;
        k = k + 1;
        kMatx(end + 1) = k;
    end

    % Estimate the minimum position
    estMinPos = (a + b) / 2;

    % Plotting the graph (similar to the golden section method)
    if finalArea == 0.01
        figure(3)
        plot(kMatx, aMatx, 'bd');
        hold on;
        plot(kMatx, bMatx, 'mp');
        grid on;
        xlabel('k');
        ylabel('Edges');
        legend('a', 'b');
        title('Fibonacci Method of f3 for l = 0.01');
        saveas(3, 'fibonacci_ab_f3', 'jpg');
    end

    if finalArea == 0.005
        figure(4)
        plot(kMatx, aMatx, 'bd');
        hold on;
        plot(kMatx, bMatx, 'mp');
        grid on;
        xlabel('k');
        ylabel('Edges');
        legend('a', 'b');
        title('Fibonacci Method of f3 for l = 0.005');
        saveas(4, 'fibonacci_abDown_f3', 'jpg');
    end

    if finalArea == 0.09
        figure(5)
        plot(kMatx, aMatx, 'bd');
        hold on;
        plot(kMatx, bMatx, 'mp');
        grid on;
        xlabel('k');
        ylabel('Edges');
        legend('a', 'b');
        title('Fibonacci Method of f3 for l = 0.09');
        saveas(5, 'fibonacci_abUp_f3', 'jpg');
    end
    toc
end