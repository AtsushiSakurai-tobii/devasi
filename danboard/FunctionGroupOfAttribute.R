#FunctionGroupOfAttribute(OBJECT,METRIX,LIST,ATTRIBUTE)
#FunctionGroupOfAttribute("durget","duration","att","att04")
FunctionGroupOfAttribute<-function(OBJECT,METRIX,LIST,ATTRIBUTE){
  #OBJECT <- "dp"
  #METRIX <- "duration"
  #LIST   <- "att"
  #ATTRIBUTE <- "att04"
  
  if(projectname=="MORINAGACM"&LIST=="att"){
    LIST<-"att[1:11,]"
  }
  attribute <- eval(parse(text=paste(LIST,"$",ATTRIBUTE,sep="")))
  attribute.unique <- unique(attribute)
  
  for(i in 1: length(attribute.unique)){
    #i<-1
    #durget[rownames(att[att$att04=="1",]),]
    aoidata.group <- eval(parse(text=paste(OBJECT, "[rownames(", LIST, "[attribute==attribute.unique[", i, "],]),]", sep="")))
    
    ###
    ##Generate plots
    #
    #Histgram with Boxplot
    text.iconv <- iconv(attribute.unique[i],'UTF-8','SHIFT_JIS')
#    png(paste(getwd(),"/usr/out/",projectname,"/FunctionGroupOfAttribute_", projectname, "_Hist-Boxplot_",OBJECT,"_Group-",ATTRIBUTE,"_",attribute.unique[i],".png",sep=""), width=1280, height=1024)
    png(paste(getwd(),"/usr/out/",projectname,"/FunctionGroupOfAttribute_", projectname, "_Hist-Boxplot_",OBJECT,"_Group-",ATTRIBUTE,"_",text.iconv,".png",sep=""), width=1280, height=1024)
    HistAndBoxplot(aoidata.group, paste("Histgram of", OBJECT, ".aoidata.group[", attribute.unique[i],"]", sep=""))
    dev.off()
    
    #QQnorm
#    png(paste(getwd(),"/usr/out/",projectname,"/FunctionGroupOfAttribute_", projectname, "_QQnormplot_",OBJECT,"_Group-",ATTRIBUTE,"_",attribute.unique[i],".png",sep=""), width=1280, height=1024)
#    qqnorm( aoidata.group , main=paste("Norm Q-Q Plot of", OBJECT, ".aoidata.group[", attribute.unique[i],"]", sep=""))
#    qqline( aoidata.group, lwd=2, col="red" )
#    dev.off()
    
    #Scatterplot
#    xx<-ifelse(is.na(aoidata.group),0,aoidata.group)
#    png(paste(getwd(),"/usr/out/",projectname,"/FunctionGroupOfAttribute_", projectname, "_Scatterplot_",OBJECT,"_Group-",ATTRIBUTE,"_",attribute.unique[i],".png",sep=""), width=1280, height=1024)
#    pairs.panels(xx,main=paste("Scatterplot of", OBJECT, ".aoidata.group[", attribute.unique[i],"]", sep=""))
#    dev.off()
    
  }
}