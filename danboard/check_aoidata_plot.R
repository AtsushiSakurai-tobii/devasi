setwd(paste("C:/R/dev/apps/datacheck/", projn, sep=""))
#plotCheck
(durget)
(couget)
(ttfget)

plot(durget, type="l")
boxplot(durget)

#Histgram
#各メトリクス全体のヒストグラム
png(paste("Export_", projn, "_chkplot_hist_allmetrics.png",sep=""), width=1280, height=1024)
par(mfrow = c(3,1))
hist(durget, col="red"  , breaks = 300)
hist(couget, col="blue" , breaks = 300)
hist(ttfget, col="green", breaks = 300)
#hist(durget, breaks = "Scott", col="blue")
dev.off()

#qqnorm:データの正規性確認
png(paste("Export_", projn, "_chkplot_qqnorm_allmetrics.png",sep=""), width=1280, height=1024)
op<-par(mfrow = c(3,1))
qqnorm( durget )
qqline( durget, lwd=2, col="red" )
qqnorm( couget )
qqline( couget, lwd=2, col="red" )
qqnorm( ttfget )
qqline( ttfget, lwd=2, col="red" )
par(op)
dev.off()

#
dursum  <- apply(durget, 2, sum , na.rm = TRUE)
cousum  <- apply(couget, 2, sum , na.rm = TRUE)
ttfsum  <- apply(ttfget, 2, sum , na.rm = TRUE)
durMean <- apply(durget, 2, mean, na.rm = TRUE)
couMean <- apply(couget, 2, mean, na.rm = TRUE)
ttfMean <- apply(ttfget, 2, mean, na.rm = TRUE)
durSd   <- apply(durget, 2, sd  , na.rm = TRUE)
couSd   <- apply(couget, 2, sd  , na.rm = TRUE)
ttfSd   <- apply(ttfget, 2, sd  , na.rm = TRUE)

op<-par(mfrow = c(3,1))
plot(dursum,col="red")
plot(cousum,col="blue")
plot(ttfsum,col="green")
par(op)

op<-par(mfrow = c(3,1))
barplot(dursum,col="red")
barplot(cousum,col="blue")
barplot(ttfsum,col="green")
par(op)

op<-par(mfrow = c(3,1))
hist(dursum, breaks = 300, col = "red")
hist(cousum, breaks = 300, col = "blue")
hist(ttfsum, breaks = 300, col = "green")
par(op)

op<-par(mfrow = c(3,1))
boxplot(durget)
boxplot(couget)
boxplot(ttfget)
par(op)

op<-par(mfrow = c(3,1))
aod <- barplot(durMean, ylab = "Average of Duration(s)", xlab = "AOI")
arrows(aod, durMean - durSd, aod, durMean + durSd, angle = 90, length = 0.1)
arrows(aod, durMean + durSd, aod, durMean - durSd, angle = 90, length = 0.1)

aoc <- barplot(couMean, ylab = "Average of Count(n)"   , xlab = "AOI")
arrows(aoc, couMean - couSd, aoc, couMean + couSd, angle = 90, length = 0.1)
arrows(aoc, couMean + couSd, aoc, couMean - couSd, angle = 90, length = 0.1)

aot <- barplot(ttfMean, ylab = "Average of TTF(s)"     , xlab = "AOI")
arrows(aot, ttfMean - ttfSd, aot, ttfMean + ttfSd, angle = 90, length = 0.1)
arrows(aot, ttfMean + ttfSd, aot, ttfMean - ttfSd, angle = 90, length = 0.1)
par(op)

#散布図行列
#library("psych", lib.loc="C:/Users/asi/Documents/R/R-2.15.1/library")
#pairs.panels(durget[,1:ncol(durget)], scale=TRUE)
#pairs(durget[,1:ncol(durget)], lower.panel=panel.cor)

#外れ値
#library("corrplot", lib.loc="C:/Users/asi/Documents/R/R-2.15.1/library")
#corrplot(log(durget))
#
#source("http://aoki2.si.gunma-u.ac.jp/R/src/SG.R", encoding="euc-jp")
#SG(durget)
#
##http://stat.biopapyrus.net/statistic/r-outliers.html
#library(outliers)
#cochran.test(apply(durget, 2, var, na.rm=TRUE), 1:length(durget))
#grubbs.test(data.frame(durget))