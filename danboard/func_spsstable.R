#SPSS用フォーマット
#str(durget)
#str(couget)
#str(ttfget)

SPSSTABLE <- function(){

  d.melt   <- melt(durget, id=rownames(durget))
  c.melt   <- melt(couget, id=rownames(couget))
  t.melt   <- melt(ttfget, id=rownames(ttfget))
  dp.melt  <- melt(FunctionPercent(durget), id=rownames(durget))
  cp.melt  <- melt(FunctionPercent(couget), id=rownames(couget))
  
  head(dct.melt<- data.frame(d.melt,c.melt,t.melt,dp.melt,cp.melt))
  head(
    dct.melt.df <- data.frame(
       #TobiiNo      = as.vector(as.matrix(attlist[1,att[dct.melt$Var1,"att01"]+2])),
        TobiiNo      = as.vector(as.matrix(attlist[1,att[dct.melt$Var1,"att01"]+3])),
        subs         = dct.melt$Var1,
        d.aoi        = dct.melt$Var2,
        c.aoi        = dct.melt$Var2.1,
        t.aoi        = dct.melt$Var2.2,
        Duration     = dct.melt$value,
        Count        = dct.melt$value.1,
        TTF          = dct.melt$value.2,
        PercentOfDur = dct.melt$value.3,
        PercentOfCou = dct.melt$value.4,
        d.N          = ifelse(is.na(dct.melt$value), "",1),
        c.N          = ifelse(is.na(dct.melt$value.1), "",1),
        t.N          = ifelse(is.na(dct.melt$value.2), "",1)
        
    )
  )
  
  ##metricsinfo    <- data.frame()
  info.df <- data.frame()
  #attdata.table  <- data.frame()
  #meltdata.table <- data.frame()
  for(i in 1:nrow(dct.melt.df)){
    #i<-1
    ##work
    #(A)AOI情報(list)
      (aoiinfo   <- aoilist[dct.melt.df$d.aoi[i],])
    #(B)被験者情報(list)
    if(length(attdata.df$subs)){
      #同じユーザーかつ複数テストを行う場合"subsXXX"でattinfoを抽出する。
      (attinfo   <- attdata.df[dct.melt.df$subs[i],])
    }else{
      (attinfo   <- attdata.df[dct.melt.df$TobiiNo[i],])
    }
    #(C)DI情報(list)(recogantion)(enjoyment)
    if(length(intev.melt)>1){
      intevinfo <- subset( intev.melt, intev.melt$subs==dct.melt.df$subs[i] & intev.melt$aoigroup1==aoiinfo$aoigroup1 )
    }else{
      intevinfo <- NA
    }
    
    info.cbind <- data.frame(cbind(aoiinfo,attinfo,intevinfo))
    info.df    <- data.frame(rbind(info.df, info.cbind))
  }
    ##work
    
    ##ATTDATA  <- attdata.df
    #attdata.get   <- ATTDATA[dct.melt.df$TobiiNo[i],]
    #attdata.table <- rbind(attdata.table, attdata.get)###
    
    ##PRO.SPSS <- spss.table
    ##SELECTED <- rec <- intev[,1:4]
    #selected.melt <- melt(as.matrix(SELECTED), id=rownames(SELECTED))
    #meltdata.get   <- selected.melt[c(PRO.SPSS$subs[i],PRO.SPSS$aoigroup1[i]),]
    #meltdata.table <- rbind(meltdata.table, meltdata.get)###
    
    ##master
    #metricsinfo <- rbind(metricsinfo, aoilist[dct.melt.df$d.aoi[i]==aoilist$duration,])
    
  
  
  #head(spss.table    <- cbind(dct.melt.df, metricsinfo))
  head(spss.table    <- data.frame(cbind(dct.melt.df, info.df)))
  rownames(spss.table) <- NULL
  return(spss.table)
}