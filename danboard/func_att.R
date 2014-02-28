#被験者情報の取得
attdatadf <- function(ATTLIST.SUBSET, ATT.DF){
  #ATTLIST.SUBSET:被験者リスト(Suset()したもの)
  #ATT.DF        :被験者データ
  
  #初期設定
  attdata.df <- data.frame()
  for(i in 1:ncol(ATT.DF)){
    #Test################################################
    #ATTLIST.SUBSET[ATTLIST.SUBSET$attno=="att01",ATT.DF$att01+3]
    #i<-1
    #####################################################
    
    #attデータからattlistに対応するデータを取得する
    (att.data   <- ATTLIST.SUBSET[ATTLIST.SUBSET$attno==colnames(ATT.DF)[i], eval(parse(text=paste("ATT.DF$",colnames(ATT.DF)[i],sep="")))+3])
    
    #Combineするためにデータ構造を変換する
    (att.data   <- t(data.frame(as.vector(as.matrix(att.data)))))
    
    #結合
    (attdata.df <- rbind(attdata.df, att.data))
  }
  return(attdata.df)
}