
library(tm)         # tm: Text Mining Package

library(wordcloud)   # wordcloud: Word Clouds


library(memoise)   # memoise: Memoise functions

# Cache the results of a function so that when you call it again
# with the same arguments it returns the pre-computed value.



if (!require(devtools))
  install.packages("devtools")
devtools::install_github("rstudio/shiny-incubator")

book <- c ("summer")
sprintf("./%s.txt.gz", book)
