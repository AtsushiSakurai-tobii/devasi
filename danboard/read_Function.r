#functionの初期読み込み

#Project名の入力指示
#(projn)
source("func_my.r")

#保存用関数
#SAVE==1: AOIData_Checked.csv(check_aoidata_metrics.R)
#SAVE==2: SPSS.csv(morimilk.R)
source("func_save.r")

#AOIデータのSPSS出力用関数
source("func_spsstable.r")

#Excelデータに対するSPSS用出力関数
##データテーブルに対してリストデータに変換する
source("func_att.R")
##データテーブルに対してリストデータに変換する>melt適用
source("func_atttable.R")

source("func_melt.R")

#R static
source("FunctionPercent.R")
source("FunctionGroupOfObject.R")
source("FunctionHistAndBoxplot.R")
