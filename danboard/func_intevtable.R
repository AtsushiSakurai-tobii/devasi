#InterviewData(intev)をMeltする
#
#PRO.SPSS <- spss.table
#SELECTED <- (rec <- intev[,1:4])

DATATABLE <- function(PRO.SPSS, SELECTED){
  #meltする
  selected.melt <- melt(as.matrix(SELECTED), id=rownames(SELECTED))
  #初期設定
  meltdata.table <- data.frame()
  
  #PRO.SPSSのSubNo&aoigroupに対して被験者情報(selected.melt)を取得する
  for(i in 1:nrow(PRO.SPSS)){
    
    #subsとaoigroup1を検索条件とする(固定条件)
    ############################################################################
    (meltdata.get   <- selected.melt[c(PRO.SPSS$subs[i],PRO.SPSS$aoigroup[i]),])
    ############################################################################
    
    (meltdata.table <- rbind(meltdata.table, meltdata.get))
    
  }
  rownames(meltdata.table)<-NULL
  return(meltdata.table)
}