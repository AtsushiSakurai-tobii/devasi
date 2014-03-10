#対話式

#プロジェクト名の指定
myfunc <- function () {
  Str <- readline("Enter : ")
  #as.numeric(unlist(strsplit(Str, ",")))
  
  #プロジェクトディレクトリの作成
  dir.create(paste("C:/R/dev/apps/datacheck/", Str, "/", sep=""), showWarnings = TRUE)
  dir.create(paste("C:/R/dev/apps/danboard/usr/out/", Str, "/", sep=""), showWarnings = TRUE)
  
  return(Str)
  
}
