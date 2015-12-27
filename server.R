library(shiny)
bodyMassIndex <- function(height, h1, weight, w1) {
  bmi=0
  if (h1=="meters") height=height*1 else height=height*0.0254
  if (w1=="kilograms") weight=weight*1 else weight=weight*0.454
  bmi=weight/(height*height)
  return (bmi)
}

healthStatus <- function(bmi){
  if (bmi < 18.5) status="see the doctor immediately, you are underweight!" 
  else if (bmi > 18.5 & bmi < 24.9) status="keep going with the balanced diet and exercise!"
  else if (bmi > 25 & bmi < 29.9) status="consult about the balanced diet and exercise!"
  else if (bmi > 30) status="see the doctor immediately, you are at your health risk!"
  return (status)
}

shinyServer(
  function(input, output) {
    output$height <- renderPrint({input$height})
    output$h1 <- renderPrint({input$h1})
    output$weight <- renderPrint({input$weight})
    output$w1 <- renderPrint({input$w1})
    output$bmi <- renderPrint({bodyMassIndex(input$height, input$h1, input$weight, input$w1)})
    output$status <- renderPrint({healthStatus(bodyMassIndex(input$height, input$h1, input$weight, input$w1))})
  }
)