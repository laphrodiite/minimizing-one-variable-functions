function [estMinPos] = goldenSection(f, x, a, b, finalArea)
    tic
    d = 0.61803398875;

    % Initialization of matrices needed to store the values of k, a and b on
    % every iteration as well as initialization of variable k which counts
    % the number of iterations.
    kMatx = 0;
    k = 0;
    aMatx = a;
    bMatx = b;

    % Initialization of x1 and x2 according to the golden section method.
    x1 = a + (1 - d)*(b - a);
    x2 = a + d*(b - a);

while (b - a)>= finalArea
    if subs(f, x, x1) < subs(f, x, x2)
        b = x2;
        x2 = x1;
        x1 = a + (1 - d)*(b - a);

    else
        a = x1;
        x1 = x2;
        x2 = a + d*(b -a);
    end

    % Appending the new values to the matrices
    aMatx(end + 1) = a;
    bMatx(end + 1) = b;
    k = k + 1;
    kMatx(end + 1) = k;
end
    
    % Giving the final value to the estimated minimum's position.
    estMinPos = (a + b)/2;

    % Code to plot the graph of the positions of a and b for every iteration
    % (when not used turn to comment)
    if finalArea == 0.01
        figure(3)
        plot(kMatx, aMatx, 'bd');
        hold on;
        plot(kMatx, bMatx, 'mp');
        grid on;
        xlabel('k');
        ylabel('Edges');
        legend('a', 'b');
        title('Golden Section Method of f3 for l = 0.01');
        saveas(3,'gsection_ab_f3','jpg')
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
        title('Golden Section Method of f3 for l = 0.005');
        saveas(4,'gsection_abDown_f3','jpg')
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
        title('Golden Section Method of f3 for l = 0.09');
        saveas(5,'gsection_abUp_f3','jpg')
    end
toc
end