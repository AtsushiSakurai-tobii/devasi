setwd("C:/R/apps/danboard/modules/actions/")
#mainファイル

#データの読み込み
source("dataread.r")

#aoidf関数(aoiテーブルデータ)の読み込み
source("C:/R/apps/danboard/modules/actions/aoitable.r")

#subset条件に対してaoiテーブルデータを出力する
source("C:/R/apps/danboard/modules/templates/JRER_aoisubset.R")

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
