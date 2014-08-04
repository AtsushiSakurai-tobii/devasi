#Mainファイル
#ProjectName: ES072
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
source("check_aoidata_plot.r")
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

                        #TobiiNo/性別/年齢/職業/職業2/住まい/端末/眼球/年代頻度/利用頻度/提示画面/テスト
colnames(attdata.df)<-c("TobiiNo","Sex","Age","Occupation","Occupation2","Address","mobile","Eye","AgeFrequency","UseFrequency","UseDesign","UserTest","subs")

##(2)インタビュー情報用データセット
#初期値
intev.melt <- 0
##1st
##################################
#(rec <- intev[,1:84])
#########
###  intev(列名)==aoilist(aoigroup1)(*)である必要がある
#########
#colnames(rec)      <- rownames(aoilist)
#rec.melt           <- FunctionMelt(rec)
#colnames(rec.melt) <- c("subs","aoigroup1","QuesAns")
#intev.melt         <- rec.melt
#################################

##2nd(Fix)
##################################
##(2)インタビュー情報用データセット
#(rec.df <- intev[,1:84])
#(enj.df <- intev[,85:168])
###intev(列名)==aoilist(aoigroup1)である必要がある
#colnames(rec.df) <- rownames(aoilist) # (*)
#colnames(enj.df) <- rownames(aoilist) # (*)
#rec.melt.df <- FunctionMelt(rec.df)
#enj.melt.df <- FunctionMelt(enj.df)
#colnames(rec.melt.df)<-c("subs","aoigroup1","Q1")
#colnames(enj.melt.df)<-c("subs","aoigroup1","Q2")
#intev.melt <- cbind(rec.melt.df, Q2=enj.melt.df$Q2)


#(3)AOI情報と被験者情報のマージと整形
mains <- SPSSTABLE()
mains <- mains[order(mains$TobiiNo, mains$UseDesign),]
mains <- transform(mains, Index=c(1:nrow(mains)))
mains_fix <- mains[c(
  "Index",
  "TobiiNo",
  #"RecordingNo",
  "Sex",
  "Age",
  "Occupation",
  "Occupation2",
  "Address",
  "mobile",
  "Eye",
  "UseFrequency",
  "UseDesign",
  "UserTest",
  #"subs",
  #"d.aoi",
  #"c.aoi",
  #"t.aoi",
  "observations",
  #"ImageFile",
  "aoiname1",
  "aoigroup1",
  "aoigroup2",
  "aoigroup3",
  "aoigroup4",
  "aoigroup5",
  #"aoigroup6",
  #"aoigroup7",
  #"details",
  "Duration",
  "Count",
  "TTF",
  "PercentOfDur",
  "PercentOfCou",
  "d.N",
  "c.N",
  "t.N"
  #"Q1",
  #"Q2"
  #  "Recognition",
  #  "Visibility"
)]
colnames(mains_fix)[c(23,24)]<-c("%OfDuration","%OfCount")
savefunc(2, mains_fix)

#exp) 対象者1 対象コンテンツAndroid-A
#     出力内容
#     対象者1 対象コンテンツAndroid-A/B,iPhone
#     コンテンツ調査外のものは除く
#     出力内容
#     対象者1 対象コンテンツAndroid-A
#fix.df <- subset(mains_fix, toupper(substr(mains_fix$UseDesign,5,5))==substr(mains_fix$aoigroup2,1,1))
#fix.df <- subset(mains_fix, mains_fix$UseDesign==mains_fix$aoigroup3)
#savefunc(2, fix.df)
