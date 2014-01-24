#setwd("C:/R/app/danboard/modules/actions/")
#基礎プロット
install.packages("GGally")
library(GGally)


#属性プロット

for (i in 7:length(att)){
#  png(paste("att",i-1,".png",sep=""), width=1280, height=1024)
  hist(att[,i])
#  dev.off()
}

#eyetrackingプロット
png("dur.png", width=1280, height=1024)
#ggpairs(na.omit(dur[,-1])) #duration
#durs <- ifelse(is.na(dur), 0, dur)
dur[is.na(dur)]<-0
ggpairs(dur[,3:90]) #duration
dev.off()

png("cou.png", width=1280, height=1024)
ggpairs(na.omit(cou[,-1])) #count
dev.off()

png("ttf.png", width=1280, height=1024)
ggpairs(na.omit(ttf[,-1])) #time to fixiation
dev.off()
###下記を参考
# airquality$Month <- as.factor(airquality$Month)
# airquality <- airquality[, colnames(airquality) != "Day"]
# ggpairs(na.omit(airquality), 
#         lower=list(continuous="smooth"), colour="Month", 
#         params=list(corSize=6,labelSize=10))


library("psych", lib.loc="C:/Users/asi/Documents/R/R-2.15.1/library")
pairs.panels(dur[,2:10], scale=TRUE)

duration<-as.matrix(dur)
hist(as.numeric(duration[,-c(1,2)]), breaks = seq(0,40,1))
count<-as.matrix(cou)
hist(as.numeric(count[,-c(1,2)]), breaks = seq(0,100,10))

b<-data.frame(as.numeric(a[,-c(1,2)]))
str(b)
summary(b)

hist(as.numeric(dur), breaks = seq(0,1100,10))

