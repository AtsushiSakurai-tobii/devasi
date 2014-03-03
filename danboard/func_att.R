#被験者情報の取得
#
#function ATTDATADF(ATTLIST.SUBSET, ATT.DF)
#ATTLIST.SUBSET:被験者リスト(Suset()したもの)
#ATT.DF        :被験者データ
#
#attlist.subset <- subset(attlist, attlist$check == "valid")
#att.df    　　 <- data.frame(att[, attlist.subset$attno])

ATTDATADF <- function(ATTLIST.SUBSET, ATT.DF){
  
  #初期設定
  attdata.df <- data.frame()
  for(i in 1:ncol(ATT.DF)){
    #attデータからattlistに対応するデータを取得する
    (att.data   <- ATTLIST.SUBSET[ATTLIST.SUBSET$attno==colnames(ATT.DF)[i], eval(parse(text=paste("ATT.DF$",colnames(ATT.DF)[i],sep="")))+3])
    #Combineするためにデータ構造を変換する
    (att.data   <- t(data.frame(as.vector(as.matrix(att.data)))))
    #結合
    (attdata.df <- rbind(attdata.df, att.data))
  }
  rownames(attdata.df)<-colnames(ATT.DF)
  return(t(data.frame(attdata.df)))
}