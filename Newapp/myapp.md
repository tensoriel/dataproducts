Visualizing the Poison Distribution
========================================================
  
   author: Yamina Touhami
 
 
   date:   25/10/2014


Mood for Statistics???
========================================================
 A Poisson distribution is the probability distribution that results from a Poisson experiment, which is a statistical experiment that has the following properties:

- The experiment results in outcomes that can be classified as successes or failures.
- The average number of successes (μ) that occurs in a specified region is known.
- The probability that a success will occur is proportional to the size of the region.
- The probability that a success will occur in an extremely small region is virtually zero.
- The specified region could take many forms. For instance, it could be a length, an area, a volume, a period of time, etc.


The ui.R file
=================

```r
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
```

<!--html_preserve--><div class="container-fluid">
<div class="row-fluid">
<div class="span12" style="padding: 10px 0px;">
<h1>Visualizing the Poisson Distribution</h1>
</div>
</div>
<div class="row-fluid">
<div class="span4">
<form class="well">
<div>
<label class="control-label" for="obs">Number of observations:</label>
<input id="obs" type="slider" name="obs" value="100" class="jslider" data-from="0" data-to="1000" data-step="1" data-skin="plastic" data-round="FALSE" data-locale="us" data-format="#,##0.#####" data-smooth="FALSE"/>
</div>
<div>
<label class="control-label" for="lambda">vector of non-negative means:</label>
<input id="lambda" type="slider" name="lambda" value="5" class="jslider" data-from="1" data-to="20" data-step="1" data-skin="plastic" data-round="FALSE" data-locale="us" data-format="#,##0.#####" data-scale="|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|;|" data-smooth="FALSE"/>
</div>
</form>
</div>
<div class="span8">
<div id="distPlot" class="shiny-plot-output" style="width: 100% ; height: 400px"></div>
</div>
</div>
</div><!--/html_preserve-->

The server.R file
======================

```r
library(shiny)

shinyServer(function(input,output){
  
  output$distPlot<-reactivePlot(function(){
    
    dist<-rpois(input$obs, input$lambda)
    
    p<-qplot(dist,binwidth=0.02)+geom_vline
    (xintercept=mean(dist))+theme_dpi()
    
    p<-p+coord_cartesian(xlim=c(-5,30))
    +geom_vline(xintercept=median(dist),
                color=I("red"))
    
    print(p)
  })
  
  
})
```


Using the App
========================================================
Specifiy the following using slider bars & dropdown box:
- The number of observations
- The value of the non-negative mean of the Poisson distribution

About
========================================================

This applet was made as a project for Coursera's class on Developing Data Products. 

It was written in R and hosted by shiny apps at https://tensoriel.shinyapps.io/Newapp
