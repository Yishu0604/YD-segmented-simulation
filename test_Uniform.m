% Uniform
% for iii = 1:10 
clear
n = 1000;  %number of data
% index=iii;
%eta = 0.1; %the proportion of checkpoint time to iteration time per step
load Faults_P_1e-2 F lambda C
%eval(['load Faults_eta',num2str(index),'_P_1e-2 F lambda C'])

a=20;
b=80;
E_X = (a+b)/2;
%C = eta*E_X;   %fixed checkpoint time
R = C; %generate recovery time
D = 1; %generate fixed downtime

MS_sim_ave_sta = [];
MS_sim_sta=[];
total_test_k=10;
Number_of_experiments = 10000;

for m = 1:total_test_k 
    for i=1:Number_of_experiments
        rng(i,'twister');
        W = a+(b-a)*rand(1,n);
        MS_sim_sta(i,m) = simulation_static(W,n,m,F(i,:),C,R,D);
    end
    MS_sim_ave_sta(m)=mean(MS_sim_sta(:,m));  %static average result
end
[MS_sim_ave_sta_OPT,k_sim_OPT]=min(MS_sim_ave_sta); %static simluation optimal time

k_FO_old=1/E_X*sqrt(2*C/lambda);

k_FO=max(round(k_FO_old),1);  %static Young/Daly Fisrt order

MS_YD_sim_sta=MS_sim_sta(:,k_FO);

MS_YD_sim_ave_sta = mean(MS_YD_sim_sta); %static Young/Daly Fisrt order time

for k=1:total_test_k
    MS_the_sta(k)=n*exp(lambda*R)*(1/lambda+D)*(exp(lambda*C)*((exp(lambda*b)-exp(lambda*a))/(lambda*(b-a)))^k-1)/k;
end
x_static=(lambertw(-exp(-lambda*C-1))+1)/(log((exp(lambda*b)-exp(lambda*a))/(lambda*(b-a))));
k1 = max(floor(x_static),1);
k2 = ceil(x_static);
if MS_the_sta(k1)<=MS_the_sta(k2)
   k_static = k1;
else
   k_static=k2;   
end
MS_the_sta_OPT=MS_the_sta(k_static); %static theory optimal time

ratio_MS_sta = MS_sim_sta./MS_YD_sim_sta; %plot box figures for figure 1

%ratio_diamond = MS_the_sta/MS_YD_sim_ave_sta; %plot red diamonds for figure 1
for i= 1:total_test_k
    ratio_diamond(i) = mean(MS_the_sta(i)*ones(10000,1)./MS_YD_sim_sta);
end
ratio_diamond_OPT = ratio_diamond(k_sim_OPT); %should be ratio_diamond_OPT = ratio_diamond(k_static)

E_elambdaX = (exp(lambda*b)-exp(lambda*a))/(lambda*(b-a));
W_th = 1/lambda * lambertw(-lambda*E_X/(E_elambdaX-1)*exp(-lambda*(C+E_X/(E_elambdaX-1)))) + E_X/(E_elambdaX-1);
MS_sim_ave_dyn = [];
MS_sim_dyn=[];
for ii = 1:20 
    gamma = 0.1*ii;
    w_dyn = gamma * W_th;
    for i=1:Number_of_experiments
        rng(i,'twister');
        W = a+(b-a)*rand(1,n);
        MS_sim_dyn(i,ii) = simulation_dynamic(W,n,w_dyn,F(i,:),C,R,D);
    end
    MS_sim_ave_dyn(ii)=mean(MS_sim_dyn(:,ii));
end
[MS_sim_ave_dyn_OPT,y]=min(MS_sim_ave_dyn); %dynamic simulation optimal time
gamma=0.1*y;
W_sim_OPT = gamma*W_th;

MS_the_dyn_OPT = MS_sim_ave_dyn(10); %dynamic average result

W_FO = sqrt(2*C/lambda);
for i=1:Number_of_experiments %repeat 100 times
    rng(i,'twister');
    W = a+(b-a)*rand(1,n);
    MS_sim_dyn(i,21) = simulation_dynamic(W,n,W_FO,F(i,:),C,R,D);
end
MS_YD_sim_dyn=MS_sim_dyn(:,21);
MS_YD_sim_ave_dyn = mean(MS_YD_sim_dyn);  %dynamic Young/Daly time
ratio_MS_dyn = MS_sim_dyn(:,1:20)./MS_YD_sim_dyn; %plot box figures for figure 2

ratio_blue = MS_the_dyn_OPT / MS_YD_sim_ave_sta; %blue line 
ratio_red = MS_YD_sim_ave_dyn / MS_YD_sim_ave_sta; %red line
ratio_orange = MS_the_sta_OPT / MS_YD_sim_ave_dyn; %orange line
ratio_purple = MS_YD_sim_ave_sta /  MS_YD_sim_ave_dyn; %purple line
 
%pfail and sigma
ratio1 = MS_sim_ave_sta(k_static)/mean(MS_YD_sim_sta);
ratio2 = MS_sim_ave_dyn(10)/mean(MS_YD_sim_sta);
data = [ratio_blue ratio_red ratio_orange ratio_purple ratio1 ratio2];

save P1e-1_a20_b80.mat
%save eta1_P1e-2_a20_b80.mat
% eval(['save eta',num2str(index),'_P1e-2_a20_b80.mat'])

% ratio_MS_sta_OPT = ratio_MS_sta(:,k_sim_OPT);
% new_index=(index-1)*10000+2;
% % xlswrite('data.csv',ratio_MS_sta_OPT,1,'D     2      ')
% eval(['xlswrite(''data.csv'',ratio_MS_sta_OPT,1,''D',num2str(new_index),''')'])
% %xlswrite('data_small.csv',k_sim_OPT,1,'D2')
% eval(['xlswrite(''data_small.csv'',k_sim_OPT,1,''D',num2str(index+1),''')'])
% %xlswrite('data_small.csv',k_static,1,'E2')
% eval(['xlswrite(''data_small.csv'',k_static,1,''E',num2str(index+1),''')'])
% %xlswrite('data_small.csv',k_FO,1,'F2')
% eval(['xlswrite(''data_small.csv'',k_FO,1,''F',num2str(index+1),''')'])
% %xlswrite('data_small.csv',ratio_diamond_OPT,1,'G2')
% eval(['xlswrite(''data_small.csv'',ratio_diamond_OPT,1,''G',num2str(index+1),''')'])
% 
% ratio_MS_dyn_OPT = ratio_MS_dyn(:,y);
% % xlswrite('data.csv',ratio_MS_dyn_OPT,1,'E2')
% eval(['xlswrite(''data.csv'',ratio_MS_dyn_OPT,1,''E',num2str(new_index),''')'])
% %xlswrite('data_small.csv',W_sim_OPT,1,'H2')
% eval(['xlswrite(''data_small.csv'',W_sim_OPT,1,''H',num2str(index+1),''')'])
% % xlswrite('data_small.csv',W_th,1,'I2')
% eval(['xlswrite(''data_small.csv'',W_th,1,''I',num2str(index+1),''')'])
% % xlswrite('data_small.csv',W_FO,1,'J2')
% eval(['xlswrite(''data_small.csv'',W_FO,1,''J',num2str(index+1),''')'])
% 
% % xlswrite('data_small.csv',ratio1,1,'K2')
% eval(['xlswrite(''data_small.csv'',ratio1,1,''K',num2str(index+1),''')'])
% % xlswrite('data_small.csv',ratio2,1,'L2')
% eval(['xlswrite(''data_small.csv'',ratio2,1,''L',num2str(index+1),''')'])
% % end


