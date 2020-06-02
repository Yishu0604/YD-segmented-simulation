% index=1;
ratio_MS_sta_OPT = ratio_MS_sta(:,k_static);%ratio_MS_sta_OPT = ratio_MS_sta(:,k_sim_OPT);
new_index=(index-1)*10000+2;
% xlswrite('data.csv',ratio_MS_sta_OPT,1,'D     2      ')
eval(['xlswrite(''data.csv'',ratio_MS_sta_OPT,1,''D',num2str(new_index),''')'])
%xlswrite('data_small.csv',k_sim_OPT,1,'D2')
eval(['xlswrite(''data_small.csv'',k_sim_OPT,1,''D',num2str(index+1),''')'])
%xlswrite('data_small.csv',k_static,1,'E2')
eval(['xlswrite(''data_small.csv'',k_static,1,''E',num2str(index+1),''')'])
%xlswrite('data_small.csv',k_FO,1,'F2')
eval(['xlswrite(''data_small.csv'',k_FO,1,''F',num2str(index+1),''')'])
%xlswrite('data_small.csv',ratio_diamond_OPT,1,'G2')
eval(['xlswrite(''data_small.csv'',ratio_diamond_OPT,1,''G',num2str(index+1),''')'])


ratio_MS_dyn_OPT = ratio_MS_dyn(:,10);%ratio_MS_dyn_OPT = ratio_MS_dyn(:,y);
% xlswrite('data.csv',ratio_MS_dyn_OPT,1,'E2')
eval(['xlswrite(''data.csv'',ratio_MS_dyn_OPT,1,''E',num2str(new_index),''')'])
%xlswrite('data_small.csv',W_sim_OPT,1,'H2')
eval(['xlswrite(''data_small.csv'',W_sim_OPT,1,''H',num2str(index+1),''')'])
% xlswrite('data_small.csv',W_th,1,'I2')
eval(['xlswrite(''data_small.csv'',W_th,1,''I',num2str(index+1),''')'])
% xlswrite('data_small.csv',W_FO,1,'J2')
eval(['xlswrite(''data_small.csv'',W_FO,1,''J',num2str(index+1),''')'])

% xlswrite('data_small.csv',ratio1,1,'K2')
eval(['xlswrite(''data_small.csv'',ratio1,1,''K',num2str(index+1),''')'])
% xlswrite('data_small.csv',ratio2,1,'L2')
eval(['xlswrite(''data_small.csv'',ratio2,1,''L',num2str(index+1),''')'])
