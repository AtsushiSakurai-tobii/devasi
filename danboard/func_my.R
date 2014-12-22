#対話式

#プロジェクト名の指定
myfunc <- function () {
  Str <- readline("Enter : ")
  #as.numeric(unlist(strsplit(Str, ",")))
  
  #プロジェクトディレクトリの作成
  #/danbordをカレントディレクトリとして相対パスを指定（再帰的(recursive=TRUE)）
  dir.create(paste("../datacheck/", Str, "/", sep=""), showWarnings = TRUE, recursive = TRUE)
  dir.create(paste("./usr/out/", Str, "/", sep=""), showWarnings = TRUE, recursive = TRUE)
  dir.create(paste("./usr/lib/", sep=""), showWarnings = TRUE, recursive = TRUE) #libディレクトリもここで作成
  
  return(Str)
  
}
