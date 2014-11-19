
library(tm)
library(wordcloud)


text <- readLines("data/pi-all-12jun13.txt", encoding="unknown")

myCorpus = Corpus(VectorSource(text))
myCorpus = tm_map(myCorpus, content_transformer(tolower))
myCorpus = tm_map(myCorpus, removePunctuation)
myCorpus = tm_map(myCorpus, removeNumbers)
myCorpus = tm_map(myCorpus, removeWords,
                  c(stopwords("SMART"), "thy", "thou", "thee", "the", "and", "but"))

myDTM = TermDocumentMatrix(myCorpus,
                           control = list(minWordLength = 1))

m = as.matrix(myDTM)

terms<-sort(rowSums(m), decreasing = TRUE)

wordcloud (names(terms), v, scale=c(4,0.5),
              min.freq = 6, max.words=110,
              colors=brewer.pal(8, "Dark2"),
           random.order=TRUE, random.color=FALSE, rot.per=.1,
        ordered.colors=FALSE,use.r.layout=FALSE)
