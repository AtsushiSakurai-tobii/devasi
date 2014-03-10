#setwd("C:/R/dev/apps/datacheck/")
#VD/VC/TTFのメトリクス読み込み

#<No Modifier>:対象AOIの他のデータは除く
#aoigetlist <- subset(aoilist, aoilist$check == "valid" & aoilist$name2 != "<No Modifier>")
durgetdm   <- data.matrix(dur[, aoigetlist$duration])
cougetdm   <- data.matrix(cou[, aoigetlist$count])
ttfgetdm   <- data.matrix(ttf[, aoigetlist$ttf])

#列名で並べ替える
durget <- durgetdm[,order(colnames(durgetdm))]
couget <- cougetdm[,order(colnames(cougetdm))]
ttfget <- ttfgetdm[,order(colnames(ttfgetdm))]

#基本データの確認
#str(durget)
#str(couget)
#str(ttfget)
#dim(durget)
#dim(couget)
#dim(ttfget)
#summary(durget)
#summary(couget)
#summary(ttfget)

#NA値を除外する:TRUE値で確認する
Nadur <- apply(durget, 2, is.na)
Nacou <- apply(couget, 2, is.na)
Nattf <- apply(ttfget, 2, is.na)
NadurSum <- apply(Nadur, 2, sum)
NacouSum <- apply(Nacou, 2, sum)
NattfSum <- apply(Nattf, 2, sum)

###############Test
#
#library("plyr", lib.loc="C:/Users/asi/Documents/R/R-2.15.1/library")
#nmissing関数:欠損値の個数をカウントする
#nmissing<-function(x)sum(is.na(x))
#colwise(nmissing)(data.frame(durget))
#
#ddply(durget,.(rownames(durget)),colwise(nmissing))
###############

#有効データ数(NA値を除く有効データの個数を確認する)
(durchk <- t(data.frame(nrow(durget) - NadurSum)))
(couchk <- t(data.frame(nrow(couget) - NacouSum)))
(ttfchk <- t(data.frame(nrow(ttfget) - NattfSum)))
sum(durchk)
sum(couchk)
sum(ttfchk)

#有効データ数の確認(各メトリクス間のデータ数の差分を確認する)
CheckDatas <- data.frame(t(rbind(durchk,couchk,ttfchk)))
CheckData  <- CheckDatas
CheckData$diff_DC <- CheckData[,1] - CheckData[,2]
CheckData$diff_DF <- CheckData[,1] - CheckData[,3]
CheckData$diff_CF <- CheckData[,2] - CheckData[,3]

#差分ないためOKとする
if(sum(CheckData$diff_DC) == 0 && sum(CheckData$diff_DF) == 0 && sum(CheckData$diff_DC) == 0){
  print("CheckData=>OK")
  print(summary(CheckData))
}else{
  print("CheckData=>NG")
  print(summary(CheckData))
}