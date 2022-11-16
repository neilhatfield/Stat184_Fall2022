library(ggplot2)
library(esquisse)
library(dplyr)
data(diamonds)
View(diamonds)

dat<-diamonds%>%group_by(cut)%>%select("x","y","z")%>%summarise(count= n(), x_min = min(x, na.rm= TRUE),x_q1=quantile(x, prob=0.25, na.rm=TRUE),x_median=median(x,na.rm = TRUE),x_q3=quantile(x, prob=0.75, na.rm=TRUE),x_max=max(y,na.rm=TRUE),mad_x=mad(x), sd_x=sd(x),
                                           y_min = min(y, na.rm= TRUE),y_q1=quantile(y, prob=0.25, na.rm=TRUE),y_median=median(y,na.rm = TRUE),y_q3=quantile(y, prob=0.75, na.rm=TRUE),y_max=max(y,na.rm=TRUE),mad_y=mad(y), sd_y=sd(y),
                                           z_min = min(z, na.rm= TRUE),z_q1=quantile(z, prob=0.25, na.rm=TRUE),z_median=median(z,na.rm = TRUE),z_q3=quantile(z, prob=0.75, na.rm=TRUE),z_max=max(z,na.rm=TRUE),mad_z=mad(z), sd_z=sd(z)) 
View(dat)