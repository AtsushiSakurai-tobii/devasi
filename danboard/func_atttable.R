#SPSS用被験者情報用のデータセットをつくる
#function ATTABLE(PRO.SPSS, ATTDATA)
#PRO.SPSS :取得したAOIデータ(spss.table)
#ATTDATA  :取得した被験者データ(attdata.df)
#
PRO.SPSS <- spss.table
ATTDATA  <- attdata.df

ATTTABLE <- function(PRO.SPSS, ATTDATA){
  
  #初期設定
  attdata.table <- data.frame()
  #PRO.SPSSのTobiiNoに対して被験者情報(ATTDATA)を取得する
  for(i in 1:nrow(PRO.SPSS)){
    (attdata.get   <- ATTDATA[PRO.SPSS$TobiiNo[i],])
    (attdata.table <- rbind(attdata.table, attdata.get))
  }
  rownames(attdata.table)<-NULL
  colnames(attdata.table)<-c("TobiiNo","Sex","Age","Occupation ")
  return(attdata.table)
}