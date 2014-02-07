##データ読み込みファイル
setwd("C:/R/dev/apps/danboard/usr/lib/")
library("xlsx")

#プロジェクトの指定
#projn <- "JRER"
projn <- "YAYOI14"

#プロジェクトディレクトリの作成
dir.create(paste("C:/R/dev/apps/datacheck/", projn, "/", sep=""), showWarnings = TRUE)
dir.create(paste("C:/R/dev/apps/danboard/usr/out/", projn, "/", sep=""), showWarnings = TRUE)

#Rシートを指定
projs <- paste(projn,"_Master_r.xlsx",sep="")

#読み込み  
attlist  <- read.xlsx( projs, 1,  encoding="UTF-8")
att      <- read.xlsx( projs, 2,  encoding="UTF-8")
queslist <- read.xlsx( projs, 3,  encoding="UTF-8")
ques     <- read.xlsx( projs, 4,  encoding="UTF-8")
hearlist <- read.xlsx( projs, 5,  encoding="UTF-8")
hear     <- read.xlsx( projs, 6,  encoding="UTF-8")

aoilist  <- read.xlsx( projs, 9,  encoding="UTF-8")
dur      <- read.xlsx( projs, 10, encoding="UTF-8", stringsAsFactors=FALSE)
cou      <- read.xlsx( projs, 11, encoding="UTF-8", stringsAsFactors=FALSE)
ttf      <- read.xlsx( projs, 12, encoding="UTF-8", stringsAsFactors=FALSE)
