#load library
library(tidyverse)
library(meta)
#Create Data Set from CSV values 
R<- c(-0.9210787533, -0.8676261289,-0.8545791735, 
      -0.7091774793,-0.838, -0.5358)
N<- c(12,12,12,
      12,15,15)
S<- LETTERS[1:6]
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
