if (!require(easypackages)) {
  install.packages("easypackages")
}

library(easypackages)

easypackages::packages(
  "knitr", "rmarkdown", "tidyverse", "readr", "readxl", "haven", "hadley/emo", "xaringanExtra",
  prompt = FALSE
)

options(htmltools.dir.version = FALSE)

opts_chunk$set(echo = TRUE, fig.align = "center", message = FALSE)

