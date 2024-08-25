
function [volume_estimate, ci] = VolumeSphereIntersect(P, Q, R, S, T, W)
    P = P(:);
    Q = Q(:);

    %disp(P-Q);
    distance_PQ = norm(P - Q);
    
    if distance_PQ > R + S
        volume_estimate = 0;
        ci = [0, 0];
        return;
    end
    
    B = max(P - R, Q - S);
    disp(B);
    C = min(P + R, Q + S);
    disp(C);

    count_inside = 0;
    
    disp(abs(prod(B-C)));
    volume_box = abs(prod(B-C));
    
    for i = 1:T
        x = B(1,:) +  (C(1,:)-B(1,:))*rand();
        y = B(2,:) +  (C(2,:)-B(2,:))*rand();
        z = B(3,:) +  (C(3,:)-B(3,:))*rand();
        point = [x;y;z];
        %disp(point);
        if norm(point - P) <= R && norm(point - Q) <= S
            count_inside = count_inside + 1;
        end
    end
    
    fraction_inside = count_inside / T;
    
    volume_estimate = fraction_inside * volume_box;
    
    sigma = sqrt(fraction_inside * (1 - fraction_inside) / T);
    if W==0.95
        z = 1.95;
    else
        z = 2.6;
    end
    
    disp(z);
    ci_lower = volume_estimate - z * sigma * volume_box;
    ci_upper = volume_estimate + z * sigma * volume_box;
    ci = [ci_lower, ci_upper];
end
