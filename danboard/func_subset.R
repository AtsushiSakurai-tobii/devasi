#subset tool
#install.packages("Deducer")
#library("Deducer", lib.loc="C:/Users/asi/Documents/R/R-2.15.1/library")
#deducer(cmd=NULL)

#### work ####
subsetfunc<-function(){
  #aoilist
  excelsheet  <- readline(paste("What is data sheet?(Excel:attlist,aoilist,...) : "))
  #条件数
  expn <- as.numeric(readline("Number of Expression : "))
  subsetseachn <- ""
  for(i in 1:expn){
    #i<-1
    #distance
    subsetobjct  <- readline(paste("What is subset's object?(distance,no,...) [",i,"]:"))
    #==
    subsetlogic  <- readline(paste("What is subset's logical?(==,>...) [",i,"]:"))
    #NEAR
    subsetparam  <- readline(paste("What is subset's parameter? (NEAR,FAR,...)[",i,"]:"))
    #aoilist$distance=="NEAR"
    subsetseach  <- paste(excelsheet,"$",subsetobjct,subsetlogic,paste("'",subsetparam,"'",sep=""),sep="")
    subsetseachn <- paste(subsetseachn,subsetseach,sep="")
  }
  print(subsetseachn)
  
  getsubset   <- eval(parse(text=subsetseachn))
  subset.dat  <- subset(get(excelsheet), getsubset==TRUE)
  print(head(subset.dat))
  print(str(subset.dat))
  print(dim(subset.dat))
  return(subset.dat)
}
test<-subsetfunc()

#### work ####

#
subexpression <- function(SHTDT){
  SHTDT<-"shtdt"
  for(k in 1:ncol(get(SHTDT))){
    message(paste(k, "=>", colnames(get(SHTDT))[k]))
  }
  
  colmn  <- as.numeric(readline(paste("colmun : ")))                           #distance
  expre  <- readline( paste(SHTDT, "$", colnames(shtdt)[colmn], ":" ,sep="") ) #aoilist$distance
  setexp <- paste(SHTDT, "$", colnames(get(SHTDT))[colmn], expre, sep="")      #aoilist$distance=="NEAR"
  
  return(setexp)
}


subsetfunc <- function () {
  
  sheet <- c("attlist","att","queslist","ques","hearlist","hear","aoilist","dur","cou","ttf")
  
  for(i in 1:length(sheet)){
    message(paste(i, "=>", sheet[i]))
  }
  
  #sheetから対象シートを選ぶ
  #shtno <- 7
  shtno <- as.numeric(readline("sheet : "))
  
  #選択したシートを変数にセットする
  shtdt <- get(sheet[shtno])
  
  #検索条件数の指定
  noexpn <- as.numeric(readline("Number of Expression : "))
  logiop <- c("AND","OR","NOT")
  
  getexps <- ""
  for(i in 1:noexpn){
    
    #subexpression関数
    getexp     <- subexpression(shtdt)
    
    for(j in 1:length(logiop)){
      message(paste(h, "=>", logiop[j]))
    }
    
    getlogiop  <- readline(paste("logical operators : "))
    getexps    <- paste(getexps, getexp, getlogiop, sep="")
    
    if(noexp-1==0)break
  }
  setsubset  <- subset("shtd", getexps)
  return(setsubset)
}
subsetfunc()