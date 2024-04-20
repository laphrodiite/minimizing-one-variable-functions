function [estMinPos] = FibonacciM(f, x, a, b, finalArea)
    
    % Calculating the number of iterations needed and also the fibonacci 
    % numbers up to n
    n = 3;
    fib = [1, 1];
    while 1 %(fib(n - 1) < ((b - a)/finalArea))
        fib(end + 1) = fib(n-1) + fib(n-2);

        if(fib(n) >= ((b - a)/finalArea))
            break;
    n = n + 1;

    end
    % Initialization of matrices needed to store the values of k, a and b on
    % every iteration as well as initialization of variable k which counts
    % the number of iterations.
    kMatx = 0;
    k = 1;
    aMatx = a;
    bMatx = b;
    
    % Initialization of x1 and x2 according to the golden section method.
    x1 = a + (fib(n-2) / fib(n)) * (b - a);
    x2 = a + (fib(n-1) / fib(n)) * (b - a);
    
    
    while k < n

        if subs(f, x, x1) < subs(f, x, x2)
            b = x2;
            x2 = x1;
            x1 = a + (fib(n -k -2) / fib(n - k)) * (b - a);
        else
            a = x1;
            x1 = x2;
            x2 = a + (fib(n -k -1) / fib(n - k)) * (b - a);
        end

      % Appending the new values to the matrices
      aMatx(end + 1) = a;
      bMatx(end + 1) = b;
      kMatx(end + 1) = k;
      k = k + 1;

    end

    % Giving the final value to the estimated minimum's position.
    estMinPos = (a + b) / 2;

    % Code to plot the graph of the positions of a and b for every iteration
    % (when not used turn to comment)

    plot(kMatx, aMatx, 'bd')
    hold on;
    plot(kMatx, bMatx, 'mp')
    grid on
    xlabel('k');
    ylabel('Edges')
    legend('a', 'b')
    title('Fibonacci of f1 for l=0.01')
   
end

