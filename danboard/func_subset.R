#subset tool
#install.packages("Deducer")
#library("Deducer", lib.loc="C:/Users/asi/Documents/R/R-2.15.1/library")
#deducer(cmd=NULL)

#
subexpression <- function(SHTDT){
  for(i in 1:ncol(SHTDT)){
    message(paste(i, "=>", colnames(SHTDT)[i]))
  }
  
  colmn  <- readline(paste("colmun : "))                          #distance
  expre  <- readline(paste(SHTDT,"$",colnames(shtdt)[colmn],":")) #aoilist$distance
  setexp <- paste(SHTDT,"$",colnames(shtdt)[colmn],expre, sep="") #aoilist$distance=="NEAR"
  
}
sheet <- c("attlist","att","queslist","ques","hearlist","hear","aoilist","dur","cou","ttf")
subsetfunc <- function () {
  
#  sheet <- c("attlist","att","queslist","ques","hearlist","hear","aoilist","dur","cou","ttf")
  
  for(i in 1:length(sheet)){
    message(paste(i, "=>", sheet[i]))
  }
  
  #sheetから対象シートを選ぶ
  #shtno <- 7
  print(shtno <- readline("sheet : "))
  
  #選択したシートを変数にセットする
  shtdt <- get(sheet[shtno])

  #検索条件数の指定
  noexpn <- readline("Nomber of Expression : ")
  logiop <- c("AND","OR","NOT")
  
  getexps <- ""
  for(i in 1:noexp){
    
    getexp     <- subexpression(shtdt)
    
    for(h in 1:length(logiop)){
      message(paste(h, "=>", logiop[i]))
    }
    
    getlogiop  <- readline(paste("logical operators : "))
    getexps    <- paste(getexps, getexp, getlogiop, sep="")
    
    if(noexp-1==0)break
  }
  setsubset  <- subset(shtd, getexps)
}
subsetfunc()