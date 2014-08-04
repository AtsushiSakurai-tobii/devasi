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
#aoigroup3: 09-1st vs FL3.0
FunctionGroupOfObject("durget","duration","aoilist","aoigroup3")
FunctionGroupOfObject("couget","count","aoilist","aoigroup3")
FunctionGroupOfObject("ttfget","ttf","aoilist","aoigroup3")
#Observation: per AOI
FunctionGroupOfObject("durget","duration","aoilist","aoigroup6")
FunctionGroupOfObject("couget","count","aoilist","aoigroup6")
FunctionGroupOfObject("ttfget","ttf","aoilist","aoigroup6")

###Group of Attribute
## 被験者属性(Attribute) "dp" に対して出力する
#  dp       :durget(rawdata) or dp
#  duration :object of aoilist sheet
#  att      :Attribute data sheet
#  att04    :exp)Age group
##
#att07: Per RecordingNo
FunctionGroupOfAttribute("durget","duration","att","att07")
FunctionGroupOfAttribute("couget","count","att","att07")
FunctionGroupOfAttribute("ttfget","ttf","att","att07")
#intev001:P Recognition 3:Best 2:Soso 1:Bad
#FunctionGroupOfAttribute("dp","duration","intev","intev001")

###Percent of Group Object
## 選択したAOI属性のグループAOIの合計を母数としたときのパーセントで算出する
#  durget   :Only rawdata
#  duration :attribute of aoilist sheet
#  aoilist  :list sheet
#  aoigroup1:exp)P,Q,R,T
FunctionPercentOfGpObject("durget","duration","aoilist","aoigroup3")
FunctionPercentOfGpObject("couget","count","aoilist","aoigroup3")
FunctionPercentOfGpObject("ttfget","ttf","aoilist","aoigroup3")

###Percent of Group Attribute
## 選択した被験者属性のグループAOIの合計を母数としたときのパーセントで算出する
#  durget   :Only rawdata
#  duration :attribute of aoilist sheet
#  att      :Attribute data sheet
#  att04    :exp)Age group
FunctionPercentOfGpAttribute("durget","duration","att","att44")
FunctionPercentOfGpAttribute("couget","count","att","att44")
FunctionPercentOfGpAttribute("ttfget","ttf","att","att44")
