% Uniform
clear
n = 1000;  %number of data
eta = 0.1; %the proportion of checkpoint time to iteration time per step
load Faults_P_1e-0_1 F lambda
a=20;
b=80;
C = eta*(a+b)/2;   %fixed checkpoint time
R = C; %generate recovery time
D = 0.1*C; %generate downtime
E_X = (a+b)/2;
T_ave_sta = [];
T_sta=[];
total_test_k=1;
for m = 1:total_test_k 
    for i=1:1000 
        T_sta(i,m) = simulation_static_uniform(n,m,eta,a,b,F(i,:));
    end
    T_ave_sta(m)=sum(T_sta(:,m))/1000 %static average result
end
[Time_k_sim_OPT,k_sim_OPT]=min(T_ave_sta); %static simluation optimal time

k_daly=max(1/E_X*sqrt(2*C/lambda),1); %static Young/Daly Time
Time_k_daly=T_ave_sta(round(k_daly));


for k=1:total_test_k
    MS(k)=n*exp(lambda*R)*(1/lambda+D)*(exp(lambda*C)*((exp(lambda*b)-exp(lambda*a))/(lambda*(b-a)))^k-1)/k;
end
k_the_OPT = max((lambertw(-exp(-lambda*C-1))+1)/(log((exp(lambda*b)-exp(lambda*a))/(lambda*(b-a)))),1);
Time_k_the_OPT=MS(round(k_the_OPT)); %static theory optimal time
ratio_T_sta = T_sta/Time_k_daly; %plot box figures for figure 1
ratio_MS=MS/Time_k_daly; %plot red diamonds for figure 1

E_elambdaX = (exp(lambda*b)-exp(lambda*a))/(lambda*(b-a));
w_dynamic_OPT = 1/lambda * lambertw(-lambda*E_X/(E_elambdaX-1)*exp(-lambda*(C+E_X/(E_elambdaX-1)))) + E_X/(E_elambdaX-1);
T_ave_dyn = [];
T_dyn=[];
for ii = 1:20 
    gamma = 0.1*ii;
    w_dyn = gamma * w_dynamic_OPT;
    for i=1:1000 
        T_dyn(i,ii) = simulation_dynamic_uniform(n,w_dyn,eta,a,b,F(i,:));
    end
    T_ave_dyn(ii)=sum(T_dyn(:,ii))/1000 
end
[Time_w_sim_OPT,y]=min(T_ave_dyn); %dynamic simulation optimal time
gamma=0.1*y;
w_sim_OPT = gamma*w_dynamic_OPT;

w_daly = sqrt(2*C/lambda);
Time_w_the_OPT = T_ave_dyn(10); %dynamic average result

for i=1:1000 %repeat 100 times
    T_dyn(i,21) = simulation_dynamic_uniform(n,w_daly,eta,a,b,F(i,:));
end
Time_w_daly=sum(T_dyn(:,21))/1000;  %dynamic Young/Daly time
ratio_T_dyn = T_dyn/Time_w_daly; %plot box figures for figure 2

Time_k_sim_OPT_max = max(T_sta(:,k_sim_OPT));
Time_k_sim_OPT_min = min(T_sta(:,k_sim_OPT));
Time_k_daly_max = max(T_sta(:,round(k_daly)));
Time_k_daly_min = min(T_sta(:,round(k_daly)));
Time_w_sim_OPT_max = max(T_dyn(:,y));
Time_w_sim_OPT_min = min(T_dyn(:,y));
Time_w_the_OPT_max = max(T_dyn(:,10));
Time_w_the_OPT_min = min(T_dyn(:,10));
Time_w_daly_max = max(T_dyn(:,21));
Time_w_daly_min = min(T_dyn(:,21));


ratio_Time_k_sim_OPT_mean = Time_k_sim_OPT / Time_k_daly; %interval of ratio of sta_simulation
ratio_Time_k_sim_OPT_max = Time_k_sim_OPT_max / Time_k_daly_min; 
ratio_Time_k_sim_OPT_min = Time_k_sim_OPT_min / Time_k_daly_max; 

ratio_Time_k_the_OPT_mean = Time_k_the_OPT / Time_k_daly; %interval of ratio of sta_toeory
ratio_Time_k_the_OPT_max = Time_k_the_OPT / Time_k_daly_min;
ratio_Time_k_the_OPT_min = Time_k_the_OPT / Time_k_daly_max;

ratio_Time_w_sim_OPT_mean = Time_w_sim_OPT / Time_w_daly; %interval of ratio of dyn_simulation
ratio_Time_w_sim_OPT_max = Time_w_sim_OPT_max / Time_w_daly_min;
ratio_Time_w_sim_OPT_min = Time_w_sim_OPT_min / Time_w_daly_max;

ratio_Time_w_the_OPT_mean = Time_w_the_OPT / Time_w_daly;  %interval of ratio of dyn_theory
ratio_Time_w_the_OPT_max = Time_w_the_OPT_max / Time_w_daly_min;
ratio_Time_w_the_OPT_min = Time_w_the_OPT_min / Time_w_daly_max;

data=[ratio_Time_k_sim_OPT_min ratio_Time_k_sim_OPT_max ratio_Time_k_sim_OPT_mean;
    ratio_Time_k_the_OPT_min ratio_Time_k_the_OPT_max ratio_Time_k_the_OPT_mean;
    ratio_Time_w_sim_OPT_min ratio_Time_w_sim_OPT_max ratio_Time_w_sim_OPT_mean;
    ratio_Time_w_the_OPT_min ratio_Time_w_the_OPT_max ratio_Time_w_the_OPT_mean]
xlswrite('data_figure2_uniform.csv',data,1,'D26')
save P1e-0_1_a20_b80.mat