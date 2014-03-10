##データ読み込みファイル

#プロジェクトの指定
#projn <- "JRER"
#projn <- "YAYOI14"
projectname <- myfunc()

#Rシートを指定
projectsheet <- paste("C:/R/dev/apps/danboard/usr/lib/", projectname,"_Master_r.xlsx",sep="")

#読み込み  
attlist   <- read.xlsx( projectsheet, 1,  encoding="UTF-8", header=TRUE)
att       <- read.xlsx( projectsheet, 2,  encoding="UTF-8", header=TRUE, row.names=TRUE)
queslist  <- read.xlsx( projectsheet, 3,  encoding="UTF-8", header=TRUE, row.names=TRUE)
ques      <- read.xlsx( projectsheet, 4,  encoding="UTF-8", header=TRUE, row.names=TRUE)
hearlist  <- read.xlsx( projectsheet, 5,  encoding="UTF-8", header=TRUE, row.names=TRUE)
hear      <- read.xlsx( projectsheet, 6,  encoding="UTF-8", header=TRUE, row.names=TRUE)
intevlist <- read.xlsx( projectsheet, 7,  encoding="UTF-8", header=FALSE)
intev     <- read.xlsx( projectsheet, 8,  encoding="UTF-8", header=TRUE, row.names=TRUE)
aoilist   <- read.xlsx( projectsheet, 9,  encoding="UTF-8", header=TRUE, row.names=TRUE)
dur       <- read.xlsx( projectsheet, 10, encoding="UTF-8", stringsAsFactors=FALSE, header=TRUE, row.names=TRUE)
cou       <- read.xlsx( projectsheet, 11, encoding="UTF-8", stringsAsFactors=FALSE, header=TRUE, row.names=TRUE)
ttf       <- read.xlsx( projectsheet, 12, encoding="UTF-8", stringsAsFactors=FALSE, header=TRUE, row.names=TRUE)
