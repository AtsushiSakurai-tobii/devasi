#Mainファイル
#ProjectName: ES026
setwd("C:/R/dev/apps/danboard/")

#Libraryの初期読み込み
source("read_Library.r")
#Functionの初期読み込み
source("read_Function.r")
#データの初期読み込み
source("read_Data.r")

#データチェック
#任意の条件によりSubsetでデータセットする
aoigetlist <- subset(aoilist, aoilist$check == "valid")
source("check_diff.r")
#source("check_aoidata_metrics.r")
setwd("C:/R/dev/apps/danboard/")
source("check_aoidata_plot.r")
setwd("C:/R/dev/apps/danboard/")
source("check_aoidata_metrics.r")

#SPSSデータと被験者情報をマージする
#(1)被験者情報用データセット
attlist.subset <- subset(attlist, attlist$check == "valid")
att.df    　　 <- data.frame(att[, attlist.subset$attno])
attdata.df     <- data.frame(ATTDATADF(attlist.subset, att.df))

#同じユーザで複数テストを行った場合
#subsを使用する
#Function::SPSSTABLE L44
attdata.df     <- transform(attdata.df, subs=rownames(att.df))

colnames(attdata.df)<-c("TobiiNo","Sex","Age","Occupation","Address","UseFrequency","RecordingNo","OS","UserStatus","UseDesign","subs")

#(2)インタビュー情報用データセット
#1st
#################################
(rec <- intev[,1:171])
########
##  intev(列名)==aoilist(aoigroup1)(*)である必要がある
########
colnames(rec)      <- rownames(aoilist)
rec.melt           <- FunctionMelt(rec)
colnames(rec.melt) <- c("subs","aoigroup1","Status")
intev.melt         <- rec.melt
#################################

#2nd(Fix)
#################################
#(2)インタビュー情報用データセット
(rec.df <- intev[,1:171])
(enj.df <- intev[,172:342])
#intev(列名)==aoilist(aoigroup1)である必要がある
colnames(rec.df) <- rownames(aoilist) # (*)
colnames(enj.df) <- rownames(aoilist) # (*)
rec.melt.df <- FunctionMelt(rec.df)
enj.melt.df <- FunctionMelt(enj.df)
colnames(rec.melt.df)<-c("subs","aoigroup1","Recognition")
colnames(enj.melt.df)<-c("subs","aoigroup1","Visibility")
intev.melt <- cbind(rec.melt.df, Visibility=enj.melt.df$Visibility)
#################################

#(3)AOI情報と被験者情報のマージと整形
mains <- SPSSTABLE()
mains <- mains[order(mains$TobiiNo, mains$UseDesign),]
mains <- transform(mains, Index=c(1:nrow(mains)))
mains_fix <- mains[c(
  "Index",
  "TobiiNo",
  "RecordingNo",
  "Sex",
  "Age",
  "Occupation",
  "UseFrequency",
  "UserStatus",
  "UseDesign",
  #"subs",
  #"d.aoi",
  #"c.aoi",
  #"t.aoi",
  "observations",
  #"ImageFile",
  "aoiname1",
  #"aoigroup1",
  "aoigroup2",
  "aoigroup3",
  "aoigroup4",
  "aoigroup5",
  "aoigroup6",
  #"aoigroup7",
  #"details",
  "Duration",
  "Count",
  "TTF",
  "PercentOfDur",
  "PercentOfCou",
  "d.N",
  "c.N",
  "t.N",
  "Recognition",
  "Visibility"
)]
colnames(mains_fix)[c(20,21)]<-c("%OfDuration","%OfCount")
savefunc(2, mains_fix)

#exp) 対象者1 対象コンテンツAndroid-A
#     出力内容
#     対象者1 対象コンテンツAndroid-A/B,iPhone
#     コンテンツ調査外のものは除く
#     出力内容
#     対象者1 対象コンテンツAndroid-A
#     UserDesign iOS
#     aoigroup2  I
#     "i"1文字目で評価する
fix.df <- subset(mains_fix, toupper(substr(mains_fix$UseDesign,1,1))==substr(mains_fix$aoigroup2,1,1))
savefunc(2, fix.df)

#################work
#arrange(morimilk, TobiiNo,d.aoi)
#ddply(morimilks, .(TobiiNo), summarize, AveDuration=mean(Duration),AveCount=mean(Count), na.rm=TRUE, .progress="text")








#aoidf関数(aoiテーブルデータ)の読み込み
#単一プロジェクト使用のためコメント化
#source("func_aoitable.r")

#subset条件に対してaoiテーブルデータを出力する
source(paste(projn,"_aoisubset.R",sep=""))

#基礎プロット
source("basicplot.r")

#正規性の検定
source("test.distribute.r")

#決定木分析
source("decisiontree.r")

#ロジスティック分析
source("logregssion.r")

#重回帰分析
source("multiregression.r")
