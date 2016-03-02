library(shiny)
library(plotly)
library(dplyr)

shinyServer(function(input, output) {

  output$text <- renderText("Use the widgets to control the species of iris and the aspect of the flower that you're interested in.")
  
  output$insertPlot<- renderPlotly({

    if (input$species == "vir"){
      flower <- filter(iris, Species == "virginica")
    } else if (input$species == "ver"){
      flower <- filter(iris, Species == "versicolor")
    } else if (input$species == "set"){
      flower <- filter(iris, Species == "setosa")
    } else {
      flower <- iris
    }

    if (input$part == 1){
      length <- select(flower, contains("Sepal.length"))
      width <- select(flower, contains("Sepal.width"))
    } else {
      length <- select(flower, contains("Petal.length"))
      width <- select(flower, contains("Petal.width"))
    }

    plot_ly(data = flower, 
            x = length[,1], 
            y = width[,1], 
            mode = "markers", 
            color = Species) 
    
  })
})
