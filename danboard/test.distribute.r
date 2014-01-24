##正規性の検定
#シャピロ-ウィルク検定を採用

for (i in 2:length(att)){
  att.norm<-shapiro.test(att[,i])
  print(att.norm)
}

#以下p-valueが0.05以上の変数をTRUEそうでないものをFALSEとする。
