# wordcloud 



library(shiny)
library(shinyIncubator)

#


shinyServer(function(input, output, session) {
  
   
    
   
  output$plot <- renderPlot({
    
    inFile <- input$myfile
    if (is.null(inFile))
      return(NULL)
    
    text <- readLines(inFile$datapath, encoding="unknown")
    
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
    
    wordcloud(names(terms), terms, scale=c(4,0.5),
                  min.freq = input$freq, max.words=input$max,
                  colors=brewer.pal(8, "Dark2"))
  })
})
