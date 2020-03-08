function [t] = simulation_dynamic_uniform(n,w_dyn,eta,a,b,F)
%n = 1000;  %number of data
%alpha and beta are parameters of Gamma distribution 
%P is probability of error occurring in each iteration
%checkpoint after the amount of work since last checkpoint is greater than W_dyn

%w_i is iteration time
W = a+(b-a)*rand(1,n); %generate w_i obeys Uniform distribution U(0,1)
C = eta*(a+b)/2;   %fixed checkpoint time
R = C; %generate recovery time
D = 0.1*C; %generate downtime

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