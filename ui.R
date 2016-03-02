library(shiny)
library(plotly)
library(dplyr)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Iris data"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      radioButtons("species", 
                  label = h3("Species"),
                  choices = list("Setosa" = "set", "Versicolor" = "ver", "Virginica" = "vir", "All" = "all"), 
                  selected = "set"),
      hr(), 
      radioButtons("part", 
                   label = h3("Part of Flower"),
                   choices = list("Sepal" = 1, "Petal" = 2), 
                   selected = 1)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      textOutput("text"), #description
      plotlyOutput("insertPlot") #plot
      
    )
  )
))
