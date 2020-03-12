#static final
rm(list=ls())
library(ggplot2)
data_static<-read.table('C:/Users/duyis/Desktop/code/csv/data_static.csv', header=TRUE, sep=',', row.names = 'row_name')
data_static$k <- as.factor(data_static$k)
# data_static$Distribution<-factor(data_static$Distribution,levels=c("Uniform","Gamma","Normal")) #¸Ä·Ö×éË³Ðò
p<-ggplot() + geom_boxplot(data=data_static, aes(x=k,y=ratio_Time_sta),outlier.size = 0.5)+
  geom_point(data=data_static, aes(x=k, y=Cind,group=Distribution),size=3,shape=23,color='brown',bg='brown')+
  geom_line(data=data_static, aes(x=k, y=ratio_the_dyn_YD_sta,group=Distribution),color='blue',size=0.5)+
  geom_line(data=data_static, aes(x=k, y=ratio_YD_dyn_YD_sta,group=Distribution),color='red',size=0.5)

p+facet_grid(. ~ Distribution,as.table=TRUE) + ylab(expression(makespan~normalized~by~MS[YD_sta])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 14, angle = 90))


#dynamic final
rm(list=ls())
library(ggplot2)
data_dynamic<-read.table('C:/Users/duyis/Desktop/code/csv/data_dynamic.csv', header=TRUE, sep=',', row.names = 'row_name')
data_dynamic$gamma <- as.factor(data_dynamic$gamma)
p<-ggplot() + geom_boxplot(data=data_dynamic, aes(x=gamma,y=ratio_Time_dyn),outlier.size = 0.5)+
  geom_line(data=data_dynamic, aes(x=gamma, y=ratio_the_sta_YD_dyn,group=Distribution),color='orange',size=0.5)+
  geom_line(data=data_dynamic, aes(x=gamma, y=ratio_YD_sta_YD_dyn,group=Distribution),color='purple',size=0.5)
p

p + facet_grid(. ~ Distribution,as.table=TRUE) + xlab(expression(gamma))+ ylab(expression(makespan~normalized~by~MS[YD_dyn])) + theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90))

#pfail final
rm(list=ls())
library(ggplot2)
library(scales)
Data_pfail<-read.table('C:/Users/duyis/Desktop/code/csv/data_pfail.csv', header=TRUE, sep=',', row.names = 'row_name')
p<-ggplot(Data_pfail, aes(x=P, y=Mean, colour=Ratio,group=Ratio)) + geom_line(size=2)

p

p + facet_grid(. ~ Distribution,as.table=TRUE) +
  scale_y_continuous(
    name = 'normalized makespan') +
  scale_x_log10(
    name = expression(failure~probability~p[fail]),
    breaks = trans_breaks("log10", function(x) 10^x),
    labels = trans_format("log10", math_format(10^.x)))+
  scale_color_discrete(breaks = c('ratio_sta','ratio_dyn'), labels = c(expression(MS[sim_sta]^kstatic/MS[YD_sta]),expression(MS[sim_dyn]^OPT/MS[YD_sta])))+
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90))


#sigma final
rm(list=ls())
library(ggplot2)
library(scales)
Data_sigma<-read.table('C:/Users/duyis/Desktop/code/csv/data_sigma.csv', header=TRUE, sep=',', row.names = 'row_name')
p<-ggplot(Data_sigma, aes(x=sigma, y=Mean, colour=Ratio,group=Ratio)) + geom_line(size=2)

p 

p + facet_grid(. ~ Distribution,as.table=TRUE,scales = "free") + 
  scale_y_continuous(
    name = 'normalized makespan') +
  scale_x_continuous(
    name = expression(standard~deviation~sigma))+
  scale_color_discrete(breaks = c('ratio_sta','ratio_dyn'), labels = c(expression(MS[sim_sta]^kstatic/MS[YD_sta]),expression(MS[sim_dyn]^OPT/MS[YD_sta])))+
  theme(axis.title.x = element_text(size = 14, angle = 0),axis.title.y = element_text(size = 16, angle = 90))
