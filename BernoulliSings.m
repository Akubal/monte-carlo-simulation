function singular = BernoulliSings(N, T)
    count = 0;

    for trial = 1:T
       
        B = [];
        for i=1:N
            b = [];
            for j=1:N
                x = rand();
                if x < 0.5
                    b(end+1) = 1;
                else
                    b(end+1) = -1;
                end
            end
            B(end+1,:) = b;
        end
        %disp(B);
        if det(B) == 0
            count = count + 1;
        end
    end

    singular = count / T;
end
