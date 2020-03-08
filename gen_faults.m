clear
n = 1000;  %number of data
eta = 0.1; %the proportion of checkpoint time to iteration time per step
E_X=50;
C = eta*E_X;   %fixed checkpoint time
R = C; %generate recovery time
D = 0.1*C; %generate downtime
T = E_X+C;
P = 10^(-0.1); %probability of error occurring in each iteration
lambda = -log(1-P)/T;
F = []; %generate faluts
for i=1:1000
    ii = 1;
    F(i,1) = max(exprnd(1/lambda),D);
    while F(i,ii) < 500000
        ii = ii+1;
        F(i,ii) = F(i,ii-1)+max(exprnd(1/lambda),D);
    end
end
save Faults_P_1e-0_1