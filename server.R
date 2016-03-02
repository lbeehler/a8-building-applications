library(shiny)
library(plotly)
library(dplyr)

shinyServer(function(input, output) {

  output$insertPlot<- renderPlot({
    num <- input$part # either 1 (sepal) or 2 (petal)
    
    if (num == 1){
      length <- select(iris, Species, contains("Sepal.length"))
      width <- select(iris, Species, contains("Sepal.width"))
    } else {
      length <- select(iris, Species, contains("Petal.length"))
      width <- select(iris, Species, contains("Petal.width"))
    }
    
    if (input$species == "vir"){
      flower <- filter(iris, Species == "virginica")
    } else if (input$species == "ver"){
      flower <- filter(iris, Species == "versicolor")
    } else {
      flower <- filter(iris, Species == "setosa")
    }
    
    
    plot_ly(data = flower, 
            x = length, 
            y = width, 
            mode = "markers", 
            color = Species)
    
  })
})
