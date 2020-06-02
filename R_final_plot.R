#static final PDF
rm(list=ls())
library(ggplot2)
data_static<-read.table('C:/Users/duyis/Desktop/code 20200507/data_static.csv', header=TRUE, sep=',', row.names = 'row_name')
data_static_new<-read.table('C:/Users/duyis/Desktop/code 20200507/data_static_new.csv', header=TRUE, sep=',', row.names = 'row_name')

data_static$k <- as.factor(data_static$k)
data_static_new$k <- as.factor(data_static_new$k)

levels(data_static$Distribution)<-c("P=1e-2,Gamma(25,0.5)","P=1e-2,Normal(50,2.5)","P=1e-2,Uniform(20,80)") #改标签
levels(data_static_new$Distribution)<-c("P=1e-2,Gamma(25,0.5)","P=1e-2,Normal(50,2.5)","P=1e-2,Uniform(20,80)") #改标签
# data_static$Distribution<-factor(data_static$Distribution,levels=c("Uniform","Gamma","Normal")) #改分组顺序
p<-ggplot() + geom_boxplot(data=data_static, aes(x=k,y=ratio_Time_sta),outlier.size = 0.5)+
  geom_point(data=data_static_new, aes(x=k, y=Cind,group=Distribution),size=3,shape=23,color='brown',bg='brown')+
  geom_line(data=data_static_new, aes(x=k, y=ratio_the_dyn_YD_sta,group=Distribution),color='blue',size=0.5)+
  geom_line(data=data_static_new, aes(x=k, y=ratio_YD_dyn_YD_sta,group=Distribution),color='red',size=0.5)

p+facet_grid(. ~ Distribution,as.table=TRUE) + ylab(expression(makespan~normalized~by~MS[YD_sta])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) +ylim(0.95,1.10)


# #static final tex
# rm(list=ls())
# library(ggplot2)
# library(tikzDevice)
# data_static<-read.table('C:/Users/duyis/Desktop/code/matlab code/data_static.csv', header=TRUE, sep=',', row.names = 'row_name')
# data_static_new<-read.table('C:/Users/duyis/Desktop/code/matlab code/data_static_new.csv', header=TRUE, sep=',', row.names = 'row_name')
# 
# data_static$k <- as.factor(data_static$k)
# data_static_new$k <- as.factor(data_static_new$k)
# 
# tikz("./test1.tex",width=13.62,height=5.39)
# # data_static$Distribution<-factor(data_static$Distribution,levels=c("Uniform","Gamma","Normal")) #改分组顺序
# p<-ggplot() + geom_boxplot(data=data_static, aes(x=k,y=ratio_Time_sta),outlier.size = 0.5)+
#   geom_point(data=data_static_new, aes(x=k, y=Cind,group=Distribution),size=3,shape=23,color='brown',bg='brown')+
#   geom_line(data=data_static_new, aes(x=k, y=ratio_the_dyn_YD_sta,group=Distribution),color='blue',size=0.5)+
#   geom_line(data=data_static_new, aes(x=k, y=ratio_YD_dyn_YD_sta,group=Distribution),color='red',size=0.5)
# 
# p+facet_grid(. ~ Distribution,as.table=TRUE) + ylab('testy')+ ylim(0.95, 1.10) + theme(axis.title.x = element_text(angle = 0),axis.title.y = element_text(angle = 90))
# dev.off()



#dynamic final PDF
rm(list=ls())
library(ggplot2)
data_dynamic<-read.table('C:/Users/duyis/Desktop/code 20200507/data_dynamic.csv', header=TRUE, sep=',', row.names = 'row_name')
data_dynamic_new<-read.table('C:/Users/duyis/Desktop/code 20200507/data_dynamic_new.csv', header=TRUE, sep=',', row.names = 'row_name')

data_dynamic$gamma <- as.factor(data_dynamic$gamma)
data_dynamic_new$gamma <- as.factor(data_dynamic_new$gamma)

levels(data_dynamic$Distribution)<-c("P=1e-2,Gamma(25,0.5)","P=1e-2,Normal(50,2.5)","P=1e-2,Uniform(20,80)") #改标签
levels(data_dynamic_new$Distribution)<-c("P=1e-2,Gamma(25,0.5)","P=1e-2,Normal(50,2.5)","P=1e-2,Uniform(20,80)") #改标签

p<-ggplot() + geom_boxplot(data=data_dynamic, aes(x=gamma,y=ratio_Time_dyn),outlier.size = 0.5)+
  geom_line(data=data_dynamic_new, aes(x=gamma, y=ratio_the_sta_YD_dyn,group=Distribution),color='orange',size=0.5)+
  geom_line(data=data_dynamic_new, aes(x=gamma, y=ratio_YD_sta_YD_dyn,group=Distribution),color='purple',size=0.5)
p

p + facet_grid(. ~ Distribution,as.table=TRUE) + xlab(expression(gamma))+ ylab(expression(makespan~normalized~by~MS[YD_dyn])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90))+ylim(0.95,1.10)








#dynamic final tex
rm(list=ls())
library(ggplot2)
library(tikzDevice)
data_dynamic<-read.table('C:/Users/duyis/Desktop/code/matlab code/data_dynamic.csv', header=TRUE, sep=',', row.names = 'row_name')
data_dynamic_new<-read.table('C:/Users/duyis/Desktop/code/matlab code/data_dynamic_new.csv', header=TRUE, sep=',', row.names = 'row_name')

data_dynamic$gamma <- as.factor(data_dynamic$gamma)
data_dynamic_new$gamma <- as.factor(data_dynamic_new$gamma)

tikz("./test2.tex",width=13.62,height=5.39)
p<-ggplot() + geom_boxplot(data=data_dynamic, aes(x=gamma,y=ratio_Time_dyn),outlier.size = 0.5)+
  geom_line(data=data_dynamic_new, aes(x=gamma, y=ratio_the_sta_YD_dyn,group=Distribution),color='orange',size=0.5)+
  geom_line(data=data_dynamic_new, aes(x=gamma, y=ratio_YD_sta_YD_dyn,group=Distribution),color='purple',size=0.5)
p

p + facet_grid(. ~ Distribution,as.table=TRUE) + xlab('xlabel')+ ylab('ylabel')+ylim(0.95, 1.10) + theme(axis.title.x = element_text(angle = 0),axis.title.y = element_text(angle = 90))
dev.off()



# #pfail final tex
# library(latex2exp)
# rm(list=ls())
# library(ggplot2)
# library(scales)
# Data_pfail<-read.table('C:/Users/duyis/Desktop/code/matlab code/data_pfail.csv', header=TRUE, sep=',', row.names = 'row_name')
# p<-ggplot(Data_pfail, aes(x=P, y=Mean, colour=Ratio,group=Ratio)) + geom_line(size=2)
# 
# p
# 
# p + facet_grid(. ~ Distribution,as.table=TRUE) +
#   scale_y_continuous(
#     name = 'normalized makespan') +
#   scale_x_log10(
#     name = expression(failure~probability~p[fail]),
#     breaks = trans_breaks("log10", function(x) 10^x),
#     labels = trans_format("log10", math_format(10^.x)))+
#   scale_color_discrete(breaks = c('ratio_sta','ratio_dyn'), labels = c(expression(MS[sim_sta](k[static])/MS[YD_sta]),expression(MS[sim_dyn](W[th])/MS[YD_sta])))+
#   theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90)) + theme(legend.position="bottom")



#pfail final tex
rm(list=ls())
library(ggplot2)
library(tikzDevice)
library(scales)
Data_pfail<-read.table('C:/Users/duyis/Desktop/code/matlab code/data_pfail.csv', header=TRUE, sep=',', row.names = 'row_name')
p<-ggplot(Data_pfail, aes(x=P, y=Mean, colour=Ratio,group=Ratio)) + geom_line(size=2)

tikz("./test3.tex",width=13.62,height=5.39)
p

p + facet_grid(. ~ Distribution,as.table=TRUE) +
  scale_y_continuous(
    name = 'ylabel') +
  scale_x_log10(
    name = 'xlabel',
    breaks = trans_breaks("log10", function(x) 10^x),
    labels = trans_format("log10", math_format(10^.x)))+
  scale_color_discrete(breaks = c('ratio_sta','ratio_dyn'), labels = c('MSMSMSMSMSMSMSMSMSMS','ABABABABABABABABABAB'))+
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90)) 
# + theme(legend.position="bottom")
dev.off()





#sigma final PDF
rm(list=ls())
library(ggplot2)
library(scales)

Data_sigma<-read.table('C:/Users/duyis/Desktop/code/matlab code/data_sigma.csv', header=TRUE, sep=',', row.names = 'row_name')

p<-ggplot(Data_sigma, aes(x=sigma, y=Mean, colour=Ratio,group=Ratio)) + geom_line(size=2)

p

p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") +
  scale_y_continuous(
    name = 'normalized makespan') +
  scale_x_continuous(
    name = expression(standard~deviation~sigma))+
  scale_color_discrete(breaks = c('ratio_sta','ratio_dyn'), labels = c(expression(MS[sim_sta](k[static])/MS[YD_sta]),expression(MS[sim_dyn](W[th])/MS[YD_sta])))+
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90)) + theme(legend.position="bottom")



#sigma final
rm(list=ls())
library(ggplot2)
library(tikzDevice)
library(scales)

Data_sigma<-read.table('C:/Users/duyis/Desktop/code/matlab code/data_sigma.csv', header=TRUE, sep=',', row.names = 'row_name')

tikz("./test4.tex",width=13.62,height=5.39)
p<-ggplot(Data_sigma, aes(x=sigma, y=Mean, colour=Ratio,group=Ratio)) + geom_line(size=2)

p 

p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") + 
  scale_y_continuous(
    name = 'ylabel') +
  scale_x_continuous(
    name = 'xlabel')+
  scale_color_discrete(breaks = c('ratio_sta','ratio_dyn'), labels = c('MSMSMSMSMSMSMSMSMSMS','ABABABABABABABABABAB'))+
  theme(axis.title.x = element_text(angle = 0),axis.title.y = element_text(angle = 90)) 
# + theme(legend.position="bottom")
dev.off()


#eta final PDF #figure 7
rm(list=ls())
library(ggplot2)
data_big<-read.table('C:/Users/duyis/Desktop/matlab code/data_big.csv', header=TRUE, sep=',', row.names = 'row_name')
data_small<-read.table('C:/Users/duyis/Desktop/matlab code/data_small.csv', header=TRUE, sep=',', row.names = 'row_name')

data_big$eta <- as.factor(data_big$eta)
data_small$eta <- as.factor(data_small$eta)

#levels(data_static$Distribution)<-c("P=1e-2,Gamma(25,0.5)","P=1e-2,Normal(50,2.5)","P=1e-2,Uniform(20,80)") #改标签
#levels(data_static_new$Distribution)<-c("P=1e-2,Gamma(25,0.5)","P=1e-2,Normal(50,2.5)","P=1e-2,Uniform(20,80)") #改标签

p<-ggplot() + geom_boxplot(data=data_big, aes(x=eta,y=ratio_Time_sta),outlier.size = 0.5)+
  geom_point(data=data_small, aes(x=eta, y=Cind,group=Distribution),size=3,shape=23,color='brown',bg='brown')
  
p+facet_grid(. ~ Distribution,as.table=TRUE) + xlab(expression(eta)) + ylab(expression(makespan~normalized~by~MS[YD_sta])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) 
# +ylim(0.95,1.10)


rm(list=ls()) #figure 9
library(ggplot2)
data_big<-read.table('C:/Users/duyis/Desktop/matlab code/data_big.csv', header=TRUE, sep=',', row.names = 'row_name')

data_big$eta <- as.factor(data_big$eta)

#levels(data_static$Distribution)<-c("P=1e-2,Gamma(25,0.5)","P=1e-2,Normal(50,2.5)","P=1e-2,Uniform(20,80)") #改标签
#levels(data_static_new$Distribution)<-c("P=1e-2,Gamma(25,0.5)","P=1e-2,Normal(50,2.5)","P=1e-2,Uniform(20,80)") #改标签

p<-ggplot() + geom_boxplot(data=data_big, aes(x=eta,y=ratio_Time_dyn),outlier.size = 0.5)

p+facet_grid(. ~ Distribution,as.table=TRUE) + xlab(expression(eta)) + ylab(expression(makespan~normalized~by~MS[YD_dyn])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90)) 
# +ylim(0.95,1.10)




rm(list=ls()) # figure 5 pdf
library(ggplot2)
library(scales)

eta_ratio<-read.table('C:/Users/duyis/Desktop/matlab code/eta_ratio.csv', header=TRUE, sep=',', row.names = 'row_name')

p<-ggplot(eta_ratio, aes(x=eta, y=Mean, colour=Ratio,group=Ratio)) + geom_line(size=2)

p

p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") +
  scale_y_continuous(
    name = 'normalized makespan') +
  scale_x_continuous(
    name = expression(standard~deviation~sigma))+
  scale_color_discrete(breaks = c('ratio_sta','ratio_dyn'), labels = c(expression(MS[sim_sta](k[static])/MS[YD_sta]),expression(MS[sim_dyn](W[th])/MS[YD_sta])))+
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90)) + theme(legend.position="bottom")







# #figure 5a pdf
# rm(list=ls())
# library(ggplot2)
# library(tikzDevice)
# library(scales)
# 
# eta_ratio<-read.table('C:/Users/duyis/Desktop/matlab code/eta_ratio.csv', header=TRUE, sep=',', row.names = 'row_name')
# 
# eta_ratio_gamma <- eta_ratio[which(eta_ratio$Distribution == "Gamma"),]
# 
# p<-ggplot(eta_ratio_gamma, aes(x=eta, y=Mean, colour=Ratio,group=Ratio)) + geom_line(size=2)
# 
# p
# 
# p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") +
#   scale_y_continuous(
#     name = 'ylabel') +
#   scale_x_continuous(
#     name = 'xlabel',breaks = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))+
#   scale_color_discrete(breaks = c('ratio_sta','ratio_dyn'), labels = c('MSMSMSMSMSMSMSMSMSMS','ABABABABABABABABABAB'))+
#   theme(axis.title.x = element_text(angle = 0),axis.title.y = element_text(angle = 90)) + 
#   theme(legend.position='bottom',legend.direction = 'vertical') +
#   guides(colour=guide_legend(title=NULL))








#figure 5a tex
rm(list=ls())
library(ggplot2)
library(tikzDevice)
library(scales)

tikz("C:/Users/duyis/Desktop/figure_eta_gamma.tex",width=3.5,height=5)
eta_ratio<-read.table('C:/Users/duyis/Desktop/matlab code/eta_ratio.csv', header=TRUE, sep=',', row.names = 'row_name')

eta_ratio_gamma <- eta_ratio[which(eta_ratio$Distribution == "Gamma"),]

p<-ggplot(eta_ratio_gamma, aes(x=eta, y=Mean, colour=Ratio,group=Ratio)) + geom_line(size=2)

p

p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") + 
  scale_y_continuous(
    name = 'ylabel') +
  scale_x_continuous(
    name = 'xlabel',breaks = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))+
  scale_color_discrete(breaks = c('ratio_sta','ratio_dyn'), labels = c('MSMSMSMSMSMSMSMSMSMS','ABABABABABABABABABAB'))+
  theme(axis.title.x = element_text(angle = 0),axis.title.y = element_text(angle = 90)) + 
  theme(legend.position="bottom",legend.direction = 'vertical') +
  guides(colour=guide_legend(title=NULL))
dev.off()



# #figure 6a pdf
# rm(list=ls())
# library(ggplot2)
# library(scales)
# 
# 
# eta_k<-read.table('C:/Users/duyis/Desktop/matlab code/eta_k.csv', header=TRUE, sep=',', row.names = 'row_name')
# 
# eta_k_gamma <- eta_k[which(eta_k$Distribution == "Gamma"),]
# 
# p<-ggplot(eta_k_gamma, aes(x=eta, y=Mean, colour=k,group=k)) + geom_line(size=2)
# 
# p
# 
# p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") +
#   scale_y_continuous(
#     name = 'k') +
#   scale_x_continuous(
#     name = 'eta',breaks = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))+
#   scale_color_discrete(breaks = c('ksim','kstatic','kFO'), labels = c(expression(k[sim]),expression(k[static]),expression(k[FO])))+
#   theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90)) + theme(legend.position="bottom")







#figure 6a tex
rm(list=ls())
library(ggplot2)
library(tikzDevice)
library(scales)

tikz("C:/Users/duyis/Desktop/figure_eta_k.tex",width=3,height=4)
eta_k<-read.table('C:/Users/duyis/Desktop/matlab code/eta_k.csv', header=TRUE, sep=',', row.names = 'row_name')

eta_k_gamma <- eta_k[which(eta_k$Distribution == "Gamma"),]

p<-ggplot(eta_k_gamma, aes(x=eta, y=Mean, colour=k,group=k)) + geom_line(size=2)

p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") +
  scale_y_continuous(
    name = 'k') +
  scale_x_continuous(
    name = 'eta',breaks = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))+
  scale_color_discrete(breaks = c('ksim','kstatic','kFO'), labels = c('ksim','kstatic','kFO'))+
  # scale_color_discrete(breaks = c('ksim','kstatic','kFO'), labels = c(expression(k[sim]),expression(k[static]),expression(k[FO])))+
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90)) + theme(legend.position="bottom")

dev.off()





#figure 8a tex
rm(list=ls())
library(ggplot2)
library(tikzDevice)
library(scales)

tikz("C:/Users/duyis/Desktop/figure_eta_W.tex",width=3,height=4)
eta_W<-read.table('C:/Users/duyis/Desktop/matlab code/eta_W.csv', header=TRUE, sep=',', row.names = 'row_name')

eta_W_gamma <- eta_W[which(eta_W$Distribution == "Gamma" & eta_W$W!='Wsim'),]

p<-ggplot(eta_W_gamma, aes(x=eta, y=Mean, colour=W,group=W)) + geom_line(size=2)

p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") +
  scale_y_continuous(
    name = 'W') +
  scale_x_continuous(
    name = 'eta',breaks = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))+
  scale_color_discrete(breaks = c('Wsim','Wth','WFO'), labels = c('Wsim','WthWthWt','WFO'))+
  # scale_color_discrete(breaks = c('ksim','kstatic','kFO'), labels = c(expression(k[sim]),expression(k[static]),expression(k[FO])))+
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90)) + theme(legend.position="bottom")

dev.off()

















# rm(list=ls())
# library(ggplot2)
# library(scales)
# 
# eta_W<-read.table('C:/Users/duyis/Desktop/matlab code/eta_W.csv', header=TRUE, sep=',', row.names = 'row_name')
# 
# p<-ggplot(eta_W, aes(x=eta, y=Mean, colour=W,group=W)) + geom_line(size=2)
# 
# p
# 
# p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") +
#   scale_y_continuous(
#     name = 'W') +
#   scale_x_continuous(
#     name = expression(eta),breaks = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))+
#   scale_color_discrete(breaks = c('Wsim','Wth','WFO'), labels = c(expression(W[sim]),expression(W[th]),expression(W[FO])))+
#   theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90)) 





# figure 3 pfail

#figure 5a pdf
rm(list=ls())
library(ggplot2)
library(tikzDevice)
library(scales)
#tikz("C:/Users/duyis/Desktop/figure_Pfail_gamma.tex",width=3.5,height=5)
P_ratio<-read.table('C:/Users/duyis/Desktop/matlab code/P_csv/P_ratio.csv', header=TRUE, sep=',', row.names = 'row_name')

P_ratio_gamma <- P_ratio[which(P_ratio$Distribution == "Gamma"),]

p<-ggplot(P_ratio_gamma, aes(x=P, y=Mean, colour=Ratio,group=Ratio)) + geom_line(size=2)

p

p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") +
  scale_y_continuous(
    name = 'ylabel') +
  scale_x_log10(
    name = 'xlabel',
    breaks = trans_breaks("log10", function(x) 10^x),
    labels = trans_format("log10", math_format(10^.x)))+
  scale_color_discrete(breaks = c('ratio_sta','ratio_dyn'), labels = c('MSMSMSMSMSMSMSMSMSMS','ABABABABABABABABABAB'))+
  theme(axis.title.x = element_text(angle = 0),axis.title.y = element_text(angle = 90)) +
  theme(legend.position='bottom',legend.direction = 'vertical') +
  guides(colour=guide_legend(title=NULL))
#dev.off()


#figure 5a pdf
rm(list=ls())
library(ggplot2)
library(tikzDevice)
library(scales)
#tikz("C:/Users/duyis/Desktop/figure_Pk_gamma.tex",width=3.5,height=5)
P_k<-read.table('C:/Users/duyis/Desktop/matlab code/P_csv/P_k.csv', header=TRUE, sep=',', row.names = 'row_name')

P_k_gamma <- P_k[which(P_k$Distribution == "Gamma"),]

p<-ggplot(P_k_gamma, aes(x=P, y=Mean, colour=k,group=k)) + geom_line(size=2)

p

p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") +
  scale_y_continuous(
    name = 'ylabel') +
  scale_x_log10(
    name = 'xlabel',
    breaks = trans_breaks("log10", function(x) 10^x),
    labels = trans_format("log10", math_format(10^.x)))+
  scale_color_discrete(breaks = c('ksim','kstatic','kFO'), labels = c('ksim','kstatic','kFO'))+
  theme(axis.title.x = element_text(angle = 0),axis.title.y = element_text(angle = 90)) +
  theme(legend.position='bottom',legend.direction = 'vertical') +
  guides(colour=guide_legend(title=NULL))
#dev.off()














#figure 5a tex
rm(list=ls())
library(ggplot2)
library(tikzDevice)
library(scales)

tikz("C:/Users/duyis/Desktop/figure_eta_gamma.tex",width=3.5,height=5)
P_k<-read.table('C:/Users/duyis/Desktop/matlab code/eta_ratio.csv', header=TRUE, sep=',', row.names = 'row_name')

eta_ratio_gamma <- eta_ratio[which(k_ratio$Distribution == "Gamma"),]

p<-ggplot(eta_ratio_gamma, aes(x=eta, y=Mean, colour=Ratio,group=Ratio)) + geom_line(size=2)

p

p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") + 
  scale_y_continuous(
    name = 'ylabel') +
  scale_x_continuous(
    name = 'xlabel',breaks = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))+
  scale_color_discrete(breaks = c('ksim','kstatic','kFO'), labels = c('ksim','kstatic','kFO'))+
  theme(axis.title.x = element_text(angle = 0),axis.title.y = element_text(angle = 90)) + 
  theme(legend.position="bottom",legend.direction = 'vertical') +
  guides(colour=guide_legend(title=NULL))
dev.off()



# #figure 6a pdf
# rm(list=ls())
# library(ggplot2)
# library(scales)
# 
# 
# eta_k<-read.table('C:/Users/duyis/Desktop/matlab code/eta_k.csv', header=TRUE, sep=',', row.names = 'row_name')
# 
# eta_k_gamma <- eta_k[which(eta_k$Distribution == "Gamma"),]
# 
# p<-ggplot(eta_k_gamma, aes(x=eta, y=Mean, colour=k,group=k)) + geom_line(size=2)
# 
# p
# 
# p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") +
#   scale_y_continuous(
#     name = 'k') +
#   scale_x_continuous(
#     name = 'eta',breaks = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))+
#   scale_color_discrete(breaks = c('ksim','kstatic','kFO'), labels = c(expression(k[sim]),expression(k[static]),expression(k[FO])))+
#   theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90)) + theme(legend.position="bottom")







#figure 6a tex
rm(list=ls())
library(ggplot2)
library(tikzDevice)
library(scales)

tikz("C:/Users/duyis/Desktop/figure_eta_k.tex",width=3,height=4)
eta_k<-read.table('C:/Users/duyis/Desktop/matlab code/eta_k.csv', header=TRUE, sep=',', row.names = 'row_name')

eta_k_gamma <- eta_k[which(eta_k$Distribution == "Gamma"),]

p<-ggplot(eta_k_gamma, aes(x=eta, y=Mean, colour=k,group=k)) + geom_line(size=2)

p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") +
  scale_y_continuous(
    name = 'k') +
  scale_x_continuous(
    name = 'eta',breaks = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))+
  scale_color_discrete(breaks = c('ksim','kstatic','kFO'), labels = c('ksim','kstatic','kFO'))+
  # scale_color_discrete(breaks = c('ksim','kstatic','kFO'), labels = c(expression(k[sim]),expression(k[static]),expression(k[FO])))+
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90)) + theme(legend.position="bottom")

dev.off()





#figure 8a tex
rm(list=ls())
library(ggplot2)
library(tikzDevice)
library(scales)

tikz("C:/Users/duyis/Desktop/figure_eta_W.tex",width=3,height=4)
eta_W<-read.table('C:/Users/duyis/Desktop/matlab code/eta_W.csv', header=TRUE, sep=',', row.names = 'row_name')

eta_W_gamma <- eta_W[which(eta_W$Distribution == "Gamma" & eta_W$W!='Wsim'),]

p<-ggplot(eta_W_gamma, aes(x=eta, y=Mean, colour=W,group=W)) + geom_line(size=2)

p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") +
  scale_y_continuous(
    name = 'W') +
  scale_x_continuous(
    name = 'eta',breaks = c(0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0))+
  scale_color_discrete(breaks = c('Wsim','Wth','WFO'), labels = c('Wsim','WthWthWt','WFO'))+
  # scale_color_discrete(breaks = c('ksim','kstatic','kFO'), labels = c(expression(k[sim]),expression(k[static]),expression(k[FO])))+
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90)) + theme(legend.position="bottom")

dev.off()
