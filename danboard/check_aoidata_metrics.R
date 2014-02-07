#DataCheck
allmtx_df <- data.frame()
for(i in 1:ncol(durget)){
  #i <- 1
  allmtx     <- data.frame(durget[,i],couget[,i],ttfget[,i])
  colmunName <- c(colnames(durget)[i],colnames(couget)[i],colnames(ttfget)[i])
  colnames(allmtx) <- colmunName
  if(i==1){
    allmtx_df  <- allmtx
  }else{
    allmtx_df  <- cbind(allmtx_df, allmtx) 
  }
}
(allmtx_df)
dim(allmtx_df)

#保存ディレクトリを作成する
dir.create(paste("C:/R/dev/apps/datacheck/", projn, "_/", sep=""), showWarnings = TRUE)

#保存ファイル名
projc   <- paste("C:/R/dev/apps/datacheck/", projn, "/Export_", projn, "_AOIData_Checked.csv" , sep="")

#ファイルを保存する
write.csv(allmtx_df, file=projc, append=T, quote=T, col.names=T)