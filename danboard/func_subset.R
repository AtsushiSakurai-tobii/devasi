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