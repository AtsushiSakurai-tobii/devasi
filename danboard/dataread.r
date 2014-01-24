#データ読み込みファイル
setwd("C:/R/apps/danboard/modules/usr/lib/")
library("xlsx")

attlist  <- read.xlsx("JRER_Master_r.xlsx", 1,  encoding="UTF-8")
att      <- read.xlsx("JRER_Master_r.xlsx", 2,  encoding="UTF-8")
queslist <- read.xlsx("JRER_Master_r.xlsx", 3,  encoding="UTF-8")
ques     <- read.xlsx("JRER_Master_r.xlsx", 4,  encoding="UTF-8")
hearlist <- read.xlsx("JRER_Master_r.xlsx", 5,  encoding="UTF-8")
hear     <- read.xlsx("JRER_Master_r.xlsx", 6,  encoding="UTF-8")

aoilist  <- read.xlsx("JRER_Master_r.xlsx", 9,  encoding="UTF-8")
dur      <- read.xlsx("JRER_Master_r.xlsx", 10, encoding="UTF-8", stringsAsFactors=FALSE)
cou      <- read.xlsx("JRER_Master_r.xlsx", 11, encoding="UTF-8", stringsAsFactors=FALSE)
ttf      <- read.xlsx("JRER_Master_r.xlsx", 12, encoding="UTF-8", stringsAsFactors=FALSE)
