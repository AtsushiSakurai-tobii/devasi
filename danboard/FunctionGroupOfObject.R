#FunctionGroupOfObject(OBJECT,METRIX,LIST,ATTRIBUTE)
#FunctionGroupOfObject("durget","duration","aoilist","aoigroup1")
FunctionGroupOfObject<-function(OBJECT,METRIX,LIST,ATTRIBUTE){
  #OBJECT <- "durget"
  #METRIX <- "duration"
  #LIST   <- "aoilist"
  #ATTRIBUTE <- "aoigroup1"
  
  attribute <- eval(parse(text=paste(LIST,"$",ATTRIBUTE,sep="")))
  attribute.unique <- unique(attribute)
  
  for(i in 1: length(attribute.unique)){
    #i<-1
    #durget[,c(aoilist[aoilist$aoigroup1=="P",]$duration)]
    aoidata.group <- eval(parse(text=paste(OBJECT, "[, c(", LIST, "[attribute==attribute.unique[", i, "],]$", METRIX, ")]", sep="")))
    
    ###
    ##Generate plots
    #
    #Histgram with Boxplot
    png(paste(getwd(),"/usr/out/",projectname,"/FunctionGroupOfObject_", projectname, "_Hist-Boxplot_",OBJECT,"_Group-",ATTRIBUTE,"_",attribute.unique[i],".png",sep=""), width=1280, height=1024)
    HistAndBoxplot(aoidata.group, paste("Histgram of", OBJECT, ".aoidata.group[", attribute.unique[i],"]", sep=""))
    dev.off()
    
    #QQnorm
    png(paste(getwd(),"/usr/out/",projectname,"/FunctionGroupOfObject_", projectname, "_QQnormplot_",OBJECT,"_Group-",ATTRIBUTE,"_",attribute.unique[i],".png",sep=""), width=1280, height=1024)
    qqnorm( aoidata.group , main=paste("Norm Q-Q Plot of", OBJECT, ".aoidata.group[", attribute.unique[i],"]", sep=""))
    qqline( aoidata.group, lwd=2, col="red" )
    dev.off()
    
    #Scatterplot
    xx<-ifelse(is.na(aoidata.group),0,aoidata.group)
    png(paste(getwd(),"/usr/out/",projectname,"/FunctionGroupOfObject_", projectname, "_Scatterplot_",OBJECT,"_Group-",ATTRIBUTE,"_",attribute.unique[i],".png",sep=""), width=1280, height=1024)
    pairs.panels(xx, main=paste("Scatterplot of", OBJECT, ".aoidata.group[", attribute.unique[i],"]", sep=""))
    dev.off()
    
  }
}