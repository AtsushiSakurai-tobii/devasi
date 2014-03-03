#Mainファイル
#ProjectName: MORINAGACM
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

#SPSSデータと被験者情報をマージする
#(1)AOI情報のデータセット
spss.table <- SPSSTABLE()

#(2)被験者情報用データセット
attlist.subset <- subset(attlist, attlist$check == "valid")
att.df    　　 <- data.frame(att[, attlist.subset$attno])

attdata.df     <- data.frame(ATTDATADF(attlist.subset, att.df))
attdata.table  <- data.frame(ATTTABLE(spss.table, attdata.df))

#(3)インタビュー情報用データセット
rec <- intev[,1:4]
enj <- intev[,5:8]
colnames(rec) <- c("P","Q","R","T")
colnames(enj) <- c("P","Q","R","T")
rec.melt <- melt(as.matrix(rec), id=rownames(rec))
enj.melt <- melt(as.matrix(enj), id=rownames(enj))

rec.datatable<-DATATABLE(spss.table, rec.melt)
enj.datatable<-DATATABLE(spss.table, enj.melt)

colnames(rec.datatable)<-c("subs","aoigroup1","Recognition")
colnames(enj.datatable)<-c("subs","aoigroup1","Enjoyment")

intev.datatable <- cbind(rec.datatable, Enjoyment=enj.datatable$Enjoyment)


#(4)AOI情報と被験者情報のマージと整形
morimilk <- cbind(attdata.table, spss.table,intev.datatable)
morimilk <- morimilk[order(morimilk$TobiiNo, morimilk$d.aoi),]
morimilk <- transform(morimilk, Index=c(1:nrow(morimilk)))
morimilk <- morimilk[c(
            "Index",
            "TobiiNo",
            "Sex",
            "Age",
            "Occupation.",
            #"subs",
            #"d.aoi",
            #"c.aoi",
            #"t.aoi",
            "observations",
            "ImageFile",
            "aoiname1",
            "aoigroup1",
            "aoigroup2",
            "aoigroup3",
            "aoigroup4",
            "aoigroup5",
            "aoigroup6",
            "aoigroup8",
            "details",
            "Duration",
            "Count",
            "TTF",
            "d.N",
            "c.N",
            "t.N",
            "Enjoyment",
            "Recognition"
            )]
savefunc(2,morimilk)

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
