#load library
library(tidyverse)
library(meta)
#Create Data Set from CSV values 
R<- c(0.4497969437, 0.7797435476,
      0.6526867549, 0.7899367063,
      0.6503845017, 0.3741657387,
      0.3224903099, 0.6755,
      0.1958, 0.497,
      0.4242640687, 0.5074,
      0.5071297543, 0.3648795178)
N<- c(181, 25, 15, 21,
      16, 15, 10, 15, 15,
      231, 33, 34, 92, 55)
S<- LETTERS[1:14]
data <- tibble(S, N, R)
#Do meta analysis
meta <- metacor(cor = R,
                n = N,
                sm = "zcor",
                studlab = S,
                data = data,
                comb.fixed = FALSE,
                comb.random = TRUE)
#see results
summary(meta)
