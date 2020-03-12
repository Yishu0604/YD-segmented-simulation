clear
load P1e-2_mu50_sigma2_5

ratio_Time_dyn = reshape(ratio_MS_dyn,20000,1);

xlswrite('data_dynamic.csv',ratio_Time_dyn,1,'C40002')

ratio_the_sta_YD_dyn = ratio_orange*ones(20000,1);

xlswrite('data_dynamic.csv',ratio_the_sta_YD_dyn,1,'E40002')

ratio_YD_sta_YD_dyn = ratio_purple*ones(20000,1);

xlswrite('data_dynamic.csv',ratio_YD_sta_YD_dyn,1,'F40002')