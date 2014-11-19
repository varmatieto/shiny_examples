# MY wordcloud


library(shiny)
library(shinyIncubator)

shinyUI(fluidPage(
  progressInit(),
  
  # Application title
  headerPanel("Word Cloud"),
  
  # Sidebar with a slider and selection inputs
  sidebarPanel(width = 5,
               fileInput('myfile', 'Choose txt File',
                         accept=c('text/csv',
                                  'text/comma-separated-values,text/plain',
                                  '.csv')),
               tags$hr(),
               sliderInput("freq", 
                           "Minimum Frequency:", 
                           min = 1,  max = 50, value = 15),
               sliderInput("max", 
                           "Maximum Number of Words:", 
                           min = 1,  max = 300,  value = 100)
  ),
  
  # Show Word Cloud
  mainPanel(
    plotOutput("plot", width = "100%", height = "400px")
  )
))
