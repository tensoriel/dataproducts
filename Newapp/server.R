library(shiny)

shinyServer(function(input,output){
  
  output$distPlot<-reactivePlot(function(){
    
    dist<-rpois(input$obs, input$lambda)
    
    p<-qplot(dist,binwidth=0.02)+geom_vline(xintercept=mean(dist))+theme_dpi()
    
    p<-p+coord_cartesian(xlim=c(-5,30))+geom_vline(xintercept=median(dist),color=I("red"))
    
    print(p)
  })
  
  
})