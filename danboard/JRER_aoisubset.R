setwd("C:/R/apps/danboard/modules/templates/")
#対象データの抽出
#aoilistからTTF,Step1/2,FAR/NEARを抽出する
Far.Stp1 <- subset(aoilist, aoilist$distance == "FAR"  & aoilist$step == "Step1" & aoilist$name != "No Modifier")
Far.Stp2 <- subset(aoilist, aoilist$distance == "FAR"  & aoilist$step == "Step2" & aoilist$name != "No Modifier")
Ner.Stp1 <- subset(aoilist, aoilist$distance == "NEAR" & aoilist$step == "Step1" & aoilist$name != "No Modifier")
Ner.Stp2 <- subset(aoilist, aoilist$distance == "NEAR" & aoilist$step == "Step2" & aoilist$name != "No Modifier")

source("funcaoi.r")

ttf.df1 <- data.frame(aoidf(Far.Stp1, ttf, "t."))
ttf.df2 <- data.frame(aoidf(Far.Stp2, ttf, "t."))
ttf.df3 <- data.frame(aoidf(Ner.Stp1, ttf, "t."))
ttf.df4 <- data.frame(aoidf(Ner.Stp2, ttf, "t."))

dur.df1 <- data.frame(aoidf(Far.Stp1, dur, "d."))
dur.df2 <- data.frame(aoidf(Far.Stp2, dur, "d."))
dur.df3 <- data.frame(aoidf(Ner.Stp1, dur, "d."))
dur.df4 <- data.frame(aoidf(Ner.Stp2, dur, "d."))

cou.df1 <- data.frame(aoidf(Far.Stp1, cou, "c."))
cou.df2 <- data.frame(aoidf(Far.Stp2, cou, "c."))
cou.df3 <- data.frame(aoidf(Ner.Stp1, cou, "c."))
cou.df4 <- data.frame(aoidf(Ner.Stp2, cou, "c."))

#Ver5
#Step1と2を合算して出力する
Far.Stp1_2 <- subset(aoilist, aoilist$distance == "FAR"  & aoilist$name != "No Modifier")
Ner.Stp1_2 <- subset(aoilist, aoilist$distance == "NEAR" & aoilist$name != "No Modifier")

#durf.df <- data.frame(aoisumdf(Far.Stp1_2, dur, "d."))
#durn.df <- data.frame(aoisumdf(Ner.Stp1_2, dur, "d."))

#couf.df <- data.frame(aoisumdf(Far.Stp1_2, cou, "c."))
#coun.df <- data.frame(aoisumdf(Ner.Stp1_2, cou, "c."))
