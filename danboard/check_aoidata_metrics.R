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

savefunc(1,allmtx_df)
