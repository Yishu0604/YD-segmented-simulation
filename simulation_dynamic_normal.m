function [t] = simulation_dynamic_normal(n,w_dyn,eta,mu,sigma,F)
%n = 1000;  %number of data
%mu and sigma are parameters of Normal distribution 
%P is probability of error occurring in each iteration
%checkpoint after the amount of work since last checkpoint is greater than W_dyn

%w_i is iteration time
W = max(0,normrnd(mu,sigma,[1 n])); %generate w_i obeys Truncated Normal Distribution N(\mu,\sigma^2,0,inf)
C = eta*mu;
R = C; %generate recovery time
D = 0.1*C; %generate downtime
% lambda = -log(1-P);
% F = []; %generate faluts
% ii = 1;
% F(1) = max(exprnd(1/lambda),D);
% while F(ii) < 100000
%       ii = ii+1;
%       F(ii) = F(ii-1)+max(exprnd(1/lambda),D);
% end


t = 0; %time 
i = 1; %index of next iteration
k = 1; %index of next falut
while i <= n 
    for m = 1:1:n-i+1 %calculate the sum of m iterations beyond W_dyn
        if sum(W(i:i+m-1)) >= w_dyn
           break
        end
    end
    if  t+sum(W(i:i+m-1))+C <= F(k) %success of iteration i
        t = t+sum(W(i:i+m-1))+C;
        i = i+m;  
    else %failure
        if  F(k)+D+R <= F(k+1) %no failure in recovery
            t = F(k)+D+R;
            k = k+1;
        else %failure in recovery
            t = F(k+1);
            k = k+2;
            while t+D+R > F(k) %look for first successful recovery
                t = F(k);
                k = k+1;
            end
            t = t+D+R;
        end
    end     
end