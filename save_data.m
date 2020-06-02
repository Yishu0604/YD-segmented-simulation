% load P1e-2_a20_b80
load P1e-2_a20_b80_n10000
ratio_diamond  
for i= 1:10
    ratio_diamond_new(i) = mean(MS_the_sta(i)*ones(10000,1)./MS_YD_sim_sta);
end
ratio_diamond_new

ratio_Time_sta = reshape(ratio_MS_sta,10*10000,1);
xlswrite('data_static.csv',ratio_Time_sta,1,'C2')
xlswrite('data_static_new.csv',ratio_diamond_new',1,'C2')
xlswrite('data_static_new.csv',ratio_blue*ones(10,1),1,'E2')
xlswrite('data_static_new.csv',ratio_red*ones(10,1),1,'F2')

ratio_Time_dyn = reshape(ratio_MS_dyn,20*10000,1);
xlswrite('data_dynamic.csv',ratio_Time_dyn,1,'C2')
xlswrite('data_dynamic_new.csv',ratio_orange*ones(20,1),1,'D2')
xlswrite('data_dynamic_new.csv',ratio_purple*ones(20,1),1,'E2')




load P1e-2_alpha25_beta0_5_n10000
ratio_diamond  
for i= 1:10
    ratio_diamond_new(i) = mean(MS_the_sta(i)*ones(10000,1)./MS_YD_sim_sta);
end
ratio_diamond_new

ratio_Time_sta = reshape(ratio_MS_sta,10*10000,1);
xlswrite('data_static.csv',ratio_Time_sta,1,'C100002')
xlswrite('data_static_new.csv',ratio_diamond_new',1,'C12')
xlswrite('data_static_new.csv',ratio_blue*ones(10,1),1,'E12')
xlswrite('data_static_new.csv',ratio_red*ones(10,1),1,'F12')

ratio_Time_dyn = reshape(ratio_MS_dyn,20*10000,1);
xlswrite('data_dynamic.csv',ratio_Time_dyn,1,'C200002')
xlswrite('data_dynamic_new.csv',ratio_orange*ones(20,1),1,'D22')
xlswrite('data_dynamic_new.csv',ratio_purple*ones(20,1),1,'E22')






load P1e-2_mu50_sigma2_5_n10000
ratio_diamond  
for i= 1:10
    ratio_diamond_new(i) = mean(MS_the_sta(i)*ones(10000,1)./MS_YD_sim_sta);
end
ratio_diamond_new

ratio_Time_sta = reshape(ratio_MS_sta,10*10000,1);
xlswrite('data_static.csv',ratio_Time_sta,1,'C200002')
xlswrite('data_static_new.csv',ratio_diamond_new',1,'C22')
xlswrite('data_static_new.csv',ratio_blue*ones(10,1),1,'E22')
xlswrite('data_static_new.csv',ratio_red*ones(10,1),1,'F22')

ratio_Time_dyn = reshape(ratio_MS_dyn,20*10000,1);
xlswrite('data_dynamic.csv',ratio_Time_dyn,1,'C400002')
xlswrite('data_dynamic_new.csv',ratio_orange*ones(20,1),1,'D42')
xlswrite('data_dynamic_new.csv',ratio_purple*ones(20,1),1,'E42')






