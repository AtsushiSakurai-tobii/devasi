FunctionPercent <- function(OBJECT){
  #被験者に対する合計
  (object.sum     <- apply(OBJECT, 1, sum, na.rm=TRUE))
  #被験者に対するパーセント
  (object.percent <- round(OBJECT / object.sum *100, 2))
}