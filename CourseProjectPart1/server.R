library(shiny)
library(datasets)

dataset <- mtcars
dataset$am <- factor(dataset$am, labels = c("AUTO", "MANU"))

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  formulaTextPoint <- reactive({
    paste("mpg ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=dataset)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$mpgPlot <- renderPlot({
    with(dataset, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })
  
})


