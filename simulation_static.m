function [t] = simulation_static(W,n,m,F,C,R,D)
%n = 1000;  %number of data
%alpha and beta are parameters of Gamma distribution 
%P is probability of error occurring in each iteration
%m is checkpoint after m iterations

%w_i is iteration time
%W= gamrnd(alpha,1/beta,[1 n]); %generate w_i obeys Gamma(alpha,beta)

t = 0; %time 
i = 1; %index of next iteration
k = 1; %index of next falut
while i <= n 
    if i <= n-m+1 %the final incomplete iteration is more than m
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
    else %the final incomplete iteration is less than m
        if  t+sum(W(i:end))+C <= F(k) %success of iteration i
            t = t+sum(W(i:end))+C;
            i = n+1;  
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
end