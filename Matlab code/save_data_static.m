clear
load P1e-2_mu50_sigma2_5

ratio_Time_sta = reshape(ratio_MS_sta,10*1000,1);

xlswrite('data_static.csv',ratio_Time_sta,1,'C20002')

Cind = [ratio_diamond(1)*ones(1000,1);ratio_diamond(2)*ones(1000,1);ratio_diamond(3)*ones(1000,1);ratio_diamond(4)*ones(1000,1);ratio_diamond(5)*ones(1000,1);ratio_diamond(6)*ones(1000,1);ratio_diamond(7)*ones(1000,1);ratio_diamond(8)*ones(1000,1);ratio_diamond(9)*ones(1000,1);ratio_diamond(10)*ones(1000,1)];

xlswrite('data_static.csv',Cind,1,'D20002')

ratio_the_dyn_YD_sta = ratio_blue*ones(10000,1);

xlswrite('data_static.csv',ratio_the_dyn_YD_sta,1,'F20002')

ratio_YD_dyn_YD_sta = ratio_red*ones(10000,1);

xlswrite('data_static.csv',ratio_YD_dyn_YD_sta,1,'G20002')
