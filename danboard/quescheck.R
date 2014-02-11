(q1list)
(q2list)
(q3list)

#quessubsetからquesの対象データを抽出する
q1 <- ques[, q1list$Index]
q2 <- ques[, q2list$Index]
q3 <- ques[, q3list$Index]

#データのチェック
sapply(ques, table, exclude=NULL)
sapply(q1, table, exclude=NULL)
sapply(q2, table, exclude=NULL)
sapply(q3, table, exclude=NULL)
