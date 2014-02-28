##データ読み込みファイル
#setwd("C:/R/dev/apps/danboard/usr/lib/")
library("xlsx")

#プロジェクトの指定
#projn <- "JRER"
#projn <- "YAYOI14"
projn <- myfunc()

#プロジェクトディレクトリの作成
dir.create(paste("C:/R/dev/apps/datacheck/", projn, "/", sep=""), showWarnings = TRUE)
dir.create(paste("C:/R/dev/apps/danboard/usr/out/", projn, "/", sep=""), showWarnings = TRUE)

#Rシートを指定
projs <- paste("C:/R/dev/apps/danboard/usr/lib/", projn,"_Master_r.xlsx",sep="")

#読み込み  
attlist   <- read.xlsx( projs, 1,  encoding="UTF-8", header=TRUE)
att       <- read.xlsx( projs, 2,  encoding="UTF-8", header=TRUE, row.names=TRUE)
queslist  <- read.xlsx( projs, 3,  encoding="UTF-8", header=TRUE, row.names=TRUE)
ques      <- read.xlsx( projs, 4,  encoding="UTF-8", header=TRUE, row.names=TRUE)
hearlist  <- read.xlsx( projs, 5,  encoding="UTF-8", header=TRUE, row.names=TRUE)
hear      <- read.xlsx( projs, 6,  encoding="UTF-8", header=TRUE, row.names=TRUE)
intevlist <- read.xlsx( projs, 7,  encoding="UTF-8", header=TRUE, row.names=TRUE)
intev     <- read.xlsx( projs, 8,  encoding="UTF-8", header=TRUE, row.names=TRUE)
aoilist   <- read.xlsx( projs, 9,  encoding="UTF-8", header=TRUE, row.names=TRUE)
dur       <- read.xlsx( projs, 10, encoding="UTF-8", stringsAsFactors=FALSE, header=TRUE, row.names=TRUE)
cou       <- read.xlsx( projs, 11, encoding="UTF-8", stringsAsFactors=FALSE, header=TRUE, row.names=TRUE)
ttf       <- read.xlsx( projs, 12, encoding="UTF-8", stringsAsFactors=FALSE, header=TRUE, row.names=TRUE)
