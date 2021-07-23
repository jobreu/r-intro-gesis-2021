if (!require(easypackages)) { install.packages("easypackages")}

library(easypackages)

easypackages::packages(
  "knitr",
  "rmarkdown",
  "gadenbuie/xaringanExtra",
  "gadenbuie/tweetrmd",
  "hadley/emo",
  "sctyner/memer"
)
