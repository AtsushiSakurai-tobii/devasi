##
##ユーザ選択
## 1: Atsushiの場合ならびに、2: Hajimeの場合でそれぞれ対応するカレントディレクトリをセット
switch(menu(c("Atsushi", "Hajime"), title="0: exit") + 1, cat("Nothing done\n"), setwd("C:/R/dev/apps/danboard/"), setwd("/Users/sasMBP/Documents/Tobii_Japan/devasi/danboard/"))->dir.danbord

#mainファイル
#myfuncの読み込み
source("func_my.r")
source("func_save.r")
source("func_spsstable.r")

#データの読み込み
source("read_data.r")

#データチェック
source("check_diff.r")
source("check_aoidata_metrics.r")
source("check_aoidata_plot.r")

#SPSS用アウトプット(テーブル)
source("spsstable.r")


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
