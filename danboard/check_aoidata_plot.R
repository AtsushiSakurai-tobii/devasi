setwd(paste("C:/R/dev/apps/datacheck/", projectname, sep=""))
#plotCheck
(durget)
(couget)
(ttfget)

dursum  <- apply(durget, 2, sum , na.rm = TRUE)
cousum  <- apply(couget, 2, sum , na.rm = TRUE)
ttfsum  <- apply(ttfget, 2, sum , na.rm = TRUE)
durMean <- apply(durget, 2, mean, na.rm = TRUE)
couMean <- apply(couget, 2, mean, na.rm = TRUE)
ttfMean <- apply(ttfget, 2, mean, na.rm = TRUE)
durSd   <- apply(durget, 2, sd  , na.rm = TRUE)
couSd   <- apply(couget, 2, sd  , na.rm = TRUE)
ttfSd   <- apply(ttfget, 2, sd  , na.rm = TRUE)

#Histgram
#各メトリクス全体のヒストグラム
png(paste("Export_", projectname, "_chkplot_hist_allmetrics.png",sep=""), width=1280, height=1024)
op<-par(mfrow = c(3,1))
hist(durget, col="red"  , breaks = 300)
hist(couget, col="blue" , breaks = 300)
hist(ttfget, col="green", breaks = 300)
par(op)
dev.off()

#HistgramとBoxplotを表示する
library(reshape2) #melt関数を使用する
simple.hist.and.boxplot <- function(x) {
  op<-par(mfrow = c(2,1))
  hist(x, col = "blue", breaks = 300, xlim = c(0, max(x, na.rm=TRUE)))
  rug(x)
  boxplot(melt(x)$value, horizontal = TRUE, las = 0, ylim = range(c(0, max(x, na.rm=TRUE))))
  par(op)
}
png(paste("Export_", projectname, "_chkplot_hist-box_dur.png",sep=""), width=1280, height=1024)
simple.hist.and.boxplot(durget)
dev.off()
png(paste("Export_", projectname, "_chkplot_hist-box_cou.png",sep=""), width=1280, height=1024)
simple.hist.and.boxplot(couget)
dev.off()
png(paste("Export_", projectname, "_chkplot_hist-box_ttf.png",sep=""), width=1280, height=1024)
simple.hist.and.boxplot(ttfget)
dev.off()

#qqnorm:データの正規性確認
png(paste("Export_", projectname, "_chkplot_qqnorm_allmetrics.png",sep=""), width=1280, height=1024)
op<-par(mfrow = c(3,1))
qqnorm( durget )
qqline( durget, lwd=2, col="red", main="Normal Q-Q Plot_Duration" )
qqnorm( couget )
qqline( couget, lwd=2, col="red", main="Normal Q-Q Plot_Count" )
qqnorm( ttfget )
qqline( ttfget, lwd=2, col="red", main="Normal Q-Q Plot_TTF" )
par(op)
dev.off()

#Sccaterplot
png(paste("Export_", projectname, "_chkplot_Scatterplot_dur.png",sep=""), width=1280, height=1024)
pairs.panels(ifelse(is.na(durget),0, durget), main=paste("Scatterplot of All Aoi duration", sep=""))
dev.off()
png(paste("Export_", projectname, "_chkplot_Scatterplot_cou.png",sep=""), width=1280, height=1024)
pairs.panels(ifelse(is.na(couget),0, couget), main=paste("Scatterplot of All Aoi count", sep=""))
dev.off()
png(paste("Export_", projectname, "_chkplot_Scatterplot_ttf.png",sep=""), width=1280, height=1024)
pairs.panels(ifelse(is.na(ttfget),0, ttfget), main=paste("Scatterplot of All Aoi ttf", sep=""))
dev.off()

###
##work
#
#アソンの積率相関係数
d <- cor(durget$d.aoi0016,durget$d.aoi0017)
write.csv(d,"testcor_***get.csv")
g <- graph.data.frame(d, directed = FALSE)
plot.igraph(g)
plot.igraph(g,vertex.size=20,vertex.label.cex=1.0,edge.width=1,edge.arrow.size=0.1,layout=layout.fruchterman.reingold)
degree(g)
closeness(g)
betweenness(g)


g <- simplify(g, remove.multiple = TRUE, remove.loops = TRUE)
df <- get.data.frame(g)
#スピアマンの順位相関係数
cor(durget, method="s")

setwd("C:/R/dev/apps/danboard/")