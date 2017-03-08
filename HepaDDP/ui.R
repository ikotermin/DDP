#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Hepatitis A incidence overtime in USA"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("year",
                   "select year:",
                   choices = hepatitis$year,
                   selected = "1975")),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
       
        
        tabPanel("BoxPlot", plotOutput("plot2")),
        tabPanel("US map", plotOutput("plot1")),
        tabPanel("Summary", dataTableOutput("table"))
   
    ))
  )
)
)