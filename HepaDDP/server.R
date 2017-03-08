library(shiny)

shinyServer( function(input, output) {
  output$plot1 <- renderPlot({
  map.df1 <- subset(map.df, year== input$year)
  ggplot(map.df1, aes(x=long,y=lat,group=group))+
    geom_polygon(aes(fill=incidence_per_capita))+
    geom_path()+ 
    scale_fill_gradientn("incidence per 100,000 people",colours=rev(heat.colors(10)),na.value="grey90")+
    coord_map()
  })
  output$plot2 <- renderPlot({
    
    hepatitis1 <- subset(hepatitis, year==input$year)

    g <- ggplot(hepatitis1, aes(x=state, y = incidence_per_capita))
    g + geom_boxplot() + theme_dark() +  ggtitle('Hepatitis A year incidence per 100,000 people')
    
  })
  output$table <- renderDataTable({
    hepatitis2 <- subset(hepatitis, year==input$year) 
    })
} )

