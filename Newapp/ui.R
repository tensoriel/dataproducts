library(shiny)
library(ggplot2)
library(eeptools)
shinyUI(pageWithSidebar(
  
  # Title
  headerPanel("Visualizing the Poisson Distribution"),
  
  sidebarPanel(
    sliderInput("obs","Number of observations:",
                min=0,max=1000,value=100),
    sliderInput("lambda","vector of non-negative means:",
                min=1,max=20,value=5)
    
    ),
  
  # GGPLOT
  
  mainPanel(
    plotOutput("distPlot")
  )
  
  
  
))