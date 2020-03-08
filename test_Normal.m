% Normal
clear
n = 1000;  %number of data
eta = 0.1; %the proportion of checkpoint time to iteration time per step
load Faults_P_1e-0_1 F lambda
mu=50;
sigma=2.5;
C = eta*mu; %fixed checkpoint time
R = C; %generate recovery time
D = 0.1*C; %generate downtime
E_X = mu;
T_ave_sta = [];
T_sta=[];
total_test_k=1;
for m = 1:total_test_k %checkpoint after m iterations
    for i=1:1000 %repeat 100 times
        T_sta(i,m) = simulation_static_normal(n,m,eta,mu,sigma,F(i,:));
    end
    T_ave_sta(m)=sum(T_sta(:,m))/1000 %the average result
end
[Time_k_simulation_OPT,k_simulation_OPT]=min(T_ave_sta);
k_static_OPT = max((lambertw(-exp(-lambda*C-1))+1)/(lambda*mu+1/2*lambda^2*sigma^2),1);
k_daly=max(1/E_X*sqrt(2*C/lambda),1);
% Time_k_static_OPT=T_ave_sta(round(k_static_OPT))
for k=1:total_test_k
    MS(k)=n*exp(lambda*R)*(1/lambda+D)*(exp(lambda*C+k*(lambda*mu+1/2*lambda^2*sigma^2))-1)/k;
end
Time_k_static_OPT=MS(round(k_static_OPT));
Time_k_daly=T_ave_sta(round(k_daly));
ratio_T_sta = T_sta/Time_k_daly;
ratio_MS=MS/Time_k_daly;

E_elambdaX = exp(lambda*mu+1/2*lambda^2*sigma^2);
w_dynamic_OPT = 1/lambda * lambertw(-lambda*E_X/(E_elambdaX-1)*exp(-lambda*(C+E_X/(E_elambdaX-1)))) + E_X/(E_elambdaX-1);
T_ave_dyn = [];
T_dyn=[];
for ii = 1:20 %checkpoint after m iterations
    gamma = 0.1*ii;
    w_dyn = gamma * w_dynamic_OPT;
    for i=1:1000 %repeat 100 times
        T_dyn(i,ii) = simulation_dynamic_normal(n,w_dyn,eta,mu,sigma,F(i,:));
    end
    T_ave_dyn(ii)=sum(T_dyn(:,ii))/1000 %the average result
end
[Time_w_simulation_OPT,y]=min(T_ave_dyn);
gamma=0.1*y;
w_simulation_OPT = gamma*w_dynamic_OPT;
w_daly = sqrt(2*C/lambda);
Time_w_dyn_OPT = T_ave_dyn(10);

for i=1:1000 %repeat 100 times
    T_dyn(i,21) = simulation_dynamic_normal(n,w_dyn,eta,mu,sigma,F(i,:));
end
Time_w_daly=sum(T_dyn(:,21))/1000; %the average result
ratio_T_dyn = T_dyn/Time_w_daly;

Time_k_simulation_OPT_max = max(T_sta(:,k_simulation_OPT));
Time_k_simulation_OPT_min = min(T_sta(:,k_simulation_OPT));
Time_k_daly_max = max(T_sta(:,round(k_daly)));
Time_k_daly_min = min(T_sta(:,round(k_daly)));
Time_w_simulation_OPT_max = max(T_dyn(:,y));
Time_w_simulation_OPT_min = min(T_dyn(:,y));
Time_w_dyn_OPT_max = max(T_dyn(:,10));
Time_w_dyn_OPT_min = min(T_dyn(:,10));
Time_w_daly_max = max(T_dyn(:,21));
Time_w_daly_min = min(T_dyn(:,21));

% ratio_Time_k_simulation_OPT = Time_k_simulation_OPT / Time_k_daly %sta_simulation
% ratio_Time_k_static_OPT = Time_k_static_OPT / Time_k_daly %sta_toeory
% 
% ratio_Time_w_simulation_OPT = Time_w_simulation_OPT / Time_w_daly %dyn_simulation
% ratio_Time_w_dyn_OPT = Time_w_dyn_OPT / Time_w_daly  %dyn_theory

ratio_Time_k_simulation_OPT_mean = Time_k_simulation_OPT / Time_k_daly; %sta_simulation
ratio_Time_k_simulation_OPT_max = Time_k_simulation_OPT_max / Time_k_daly_min; 
ratio_Time_k_simulation_OPT_min = Time_k_simulation_OPT_min / Time_k_daly_max; 

ratio_Time_k_static_OPT_mean = Time_k_static_OPT / Time_k_daly; %sta_toeory
ratio_Time_k_static_OPT_max = Time_k_static_OPT / Time_k_daly_min;
ratio_Time_k_static_OPT_min = Time_k_static_OPT / Time_k_daly_max;

ratio_Time_w_simulation_OPT_mean = Time_w_simulation_OPT / Time_w_daly; %dyn_simulation
ratio_Time_w_simulation_OPT_max = Time_w_simulation_OPT_max / Time_w_daly_min;
ratio_Time_w_simulation_OPT_min = Time_w_simulation_OPT_min / Time_w_daly_max;

ratio_Time_w_dyn_OPT_mean = Time_w_dyn_OPT / Time_w_daly;  %dyn_theory
ratio_Time_w_dyn_OPT_max = Time_w_dyn_OPT_max / Time_w_daly_min;
ratio_Time_w_dyn_OPT_min = Time_w_dyn_OPT_min / Time_w_daly_max;

data=[ratio_Time_k_simulation_OPT_min ratio_Time_k_simulation_OPT_max ratio_Time_k_simulation_OPT_mean;
    ratio_Time_k_static_OPT_min ratio_Time_k_static_OPT_max ratio_Time_k_static_OPT_mean;
    ratio_Time_w_simulation_OPT_min ratio_Time_w_simulation_OPT_max ratio_Time_w_simulation_OPT_mean;
    ratio_Time_w_dyn_OPT_min ratio_Time_w_dyn_OPT_max ratio_Time_w_dyn_OPT_mean]
xlswrite('data_figure2_normal.csv',data,1,'D26')
save P1e-0_1_mu50_sigma2_5.mat

% winopen('test.xlsx')