#dp<-FunctionPercent(durget)
#cp<-FunctionPercent(couget)
#tp<-FunctionPercent(ttfget)

###Group of Object
## AOI属性(Object:aoigroup1) "dp" に対して出力する
#  dp       :durget(rawdata) or dp
#  duration :object of aoilist sheet
#  aoilist  :list sheet
#  aoigroup1:exp)P,Q,R,T
##
#aoigroup4: Image vs Movies vs AD
FunctionGroupOfObject("durget","duration","aoilist","aoigroup4")
FunctionGroupOfObject("couget","count","aoilist","aoigroup4")
FunctionGroupOfObject("ttfget","ttf","aoilist","aoigroup4")
#Observation: per AOI
FunctionGroupOfObject("durget","duration","aoilist","aoiname1")
FunctionGroupOfObject("couget","count","aoilist","aoiname1")
FunctionGroupOfObject("ttfget","ttf","aoilist","aoiname1")
#aoigroup2: A vs B
FunctionGroupOfObject("durget","duration","aoilist","aoigroup2")
FunctionGroupOfObject("couget","count","aoilist","aoigroup2")
FunctionGroupOfObject("ttfget","ttf","aoilist","aoigroup2")

###Group of Attribute
## 被験者属性(Attribute) "dp" に対して出力する
#  dp       :durget(rawdata) or dp
#  duration :object of aoilist sheet
#  att      :Attribute data sheet
#  att04    :exp)Age group
##
#att02: each sex
FunctionGroupOfAttribute("durget","duration","att","att02")
FunctionGroupOfAttribute("couget","count","att","att02")
FunctionGroupOfAttribute("ttfget","ttf","att","att02")
#intev001:P Recognition 3:Best 2:Soso 1:Bad
#FunctionGroupOfAttribute("dp","duration","intev","intev001")

#att10: Heavy vs Light
FunctionGroupOfAttribute("durget","duration","att","att10")
FunctionGroupOfAttribute("couget","count","att","att10")
FunctionGroupOfAttribute("ttfget","ttf","att","att10")
#att11: each task
FunctionGroupOfAttribute("durget","duration","att","att11")
FunctionGroupOfAttribute("couget","count","att","att11")
FunctionGroupOfAttribute("ttfget","ttf","att","att11")
#att12: A vs B
FunctionGroupOfAttribute("durget","duration","att","att12")
FunctionGroupOfAttribute("couget","count","att","att12")
FunctionGroupOfAttribute("ttfget","ttf","att","att12")

###Percent of Group Object
## 選択したAOI属性のグループAOIの合計を母数としたときのパーセントで算出する
#  durget   :Only rawdata
#  duration :attribute of aoilist sheet
#  aoilist  :list sheet
#  aoigroup1:exp)P,Q,R,T
## ES072では使用していない
## FunctionPercentOfGpObject("durget","duration","aoilist","aoigroup3")
## FunctionPercentOfGpObject("couget","count","aoilist","aoigroup3")
## FunctionPercentOfGpObject("ttfget","ttf","aoilist","aoigroup3")

###Percent of Group Attribute
## 選択した被験者属性のグループAOIの合計を母数としたときのパーセントで算出する
#  durget   :Only rawdata
#  duration :attribute of aoilist sheet
#  att      :Attribute data sheet
#  att04    :exp)Age group
## ES072では使用していない
## FunctionPercentOfGpAttribute("durget","duration","att","att44")
## FunctionPercentOfGpAttribute("couget","count","att","att44")
## FunctionPercentOfGpAttribute("ttfget","ttf","att","att44")
