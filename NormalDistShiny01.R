#install.packages('shiny')

#Define shiny, ggplot2 and scales libraries
library(shiny)
library(ggplot2)
library(scales)

#User Input
#Define the UI for application that draws a distribution plot
ui <-shinyUI(fluidPage(
  
  #Name the Title of the applicationh
  titlePanel("Normal distribution"),
  
  #Create a sidebar with a slider input and selection input
  sidebarLayout(
    sidebarPanel(
      numericInput("lrange", 
                   "Lower bound of the range", 
                   value = -10),
      numericInput("urange", 
                   "Upper bound of the range", 
                   value = 10),
      numericInput("mean", 
                   "Mean", 
                   value = 0),
      numericInput("std", 
                   "Standard deviation", 
                   value = 1),
      sliderInput("n","Sample size", min = 0,max = 10000,value = 100),
    ),
    
    #Select objects to display in the main panel
    mainPanel(
      plotOutput("PdfPlot"),plotOutput("CdfPlot"),plotOutput("Histogram")
    )
  )
))


#Shiny Application, Server
server <- shinyServer(function(input, output) {
  
  #1.
  
  #Derive element common for several outputs - arguments for PDF and CDF
  x_var <- reactive({
    seq(input$lrange, input$urange, by = 0.1)
  })
  
  #2.
  
  #PDF plot
  output$PdfPlot <- renderPlot({
    
    #Assign arguments based on input
    x<-x_var()
    
    #Find the PDF function values for selected range of arguments
    y <- dnorm(x, mean = input$mean, sd = input$std)
    
    #Draw the plot
    plot(x,y,main='Probability density function')
  })
  
  #CDF plot
  output$CdfPlot <- renderPlot({
    
    #Assign arguments based on input
    x<-x_var()
    
    #Find the PDF function values for selected range of arguments
    y <- pnorm(x, mean = input$mean, sd = input$std)
    
    #Draw the plot
    plot(x,y,main='Cumulative distribution function')
  })
  
  
  #Histogram
  output$Histogram <- renderPlot({
    
    #Random draws
    #set.seed(5)
    x <- rnorm(input$n,mean = input$mean, sd = input$std)
    
    #Draw the histogram
    hist(x, main = "Histogram of sampled data")
    text("3")
  })
  
})

# Return a Shiny app object
shinyApp(ui = ui, server = server)