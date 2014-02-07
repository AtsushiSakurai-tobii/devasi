setwd("C:/R/dev/apps/datacheck/")
library("gdata", lib.loc="C:/Users/asi/Documents/R/R-2.15.1/library")
library("lattice", lib.loc="C:/Users/asi/Documents/R/R-2.15.1/library")
library("data.table", lib.loc="C:/Users/asi/Documents/R/R-2.15.1/library")

#データの読み込み
#source("dataread.r")

#VD/VC/TTFのメトリクス読み込み
(aoilist)
(dur)
(cou)
(ttf)

#<No Modifier>:対象AOIの他のデータは除く
aoigetlist <- subset(aoilist, aoilist$name2 != "<No Modifier>")
durgetdm   <- data.matrix(dur[, aoitargetlist$aoino])
cougetdm   <- data.matrix(cou[, aoitargetlist$aoino])
ttfgetdm   <- data.matrix(ttf[, aoitargetlist$aoino])

#列名で並べ替える
durget <- durgets[,order(colnames(durgetdm))]
couget <- cougets[,order(colnames(cougetdm))]
ttfget <- ttfgets[,order(colnames(ttfgetdm))]

#基本データの確認
str(durget)
str(couget)
str(ttfget)
dim(durget)
dim(couget)
dim(ttfget)
summary(durget)
summary(couget)
summary(ttfget)

#NA値を除外する:TRUE値で確認する
Nadur <- apply(durget, 2, is.na)
Nacou <- apply(couget, 2, is.na)
Nattf <- apply(ttfget, 2, is.na)
NadurSum <- apply(Nadur, 2, sum)
NacouSum <- apply(Nacou, 2, sum)
NattfSum <- apply(Nattf, 2, sum)

#有効データ数
(durchk <- t(data.frame(nrow(durget) - NadurSum)))
(couchk <- t(data.frame(nrow(couget) - NacouSum)))
(ttfchk <- t(data.frame(nrow(ttfget) - NattfSum)))

#有効データ数の確認
CheckDatas <- data.frame(t(rbind(durchk,couchk,ttfchk)))
CheckData  <- CheckDatas
CheckData$diff_DC <- CheckData[,1] - CheckData[,2]
CheckData$diff_DF <- CheckData[,1] - CheckData[,3]
CheckData$diff_CF <- CheckData[,2] - CheckData[,3]

#差分ないためOKとする
summary(CheckData)