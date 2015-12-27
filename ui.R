# setwd("C:/Users/postdoc/Desktop/Data Science/DevDataProd/")
# install.packages("shiny")
library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Welcome to calculate your health status App!"),
  sidebarPanel(    
    numericInput('height', 'Please enter your height', 1.80, min = 0.00, max = 1000.00, step = 0.01),
    checkboxGroupInput("h1", "in standard or metric system",
                       c("inches" = "inches",
                         "meters" = "meters"), selected = "meters"),
    numericInput('weight', 'Please enter your weight', 75.00, min = 0.00, max = 1000.00, step = 0.01),
    checkboxGroupInput("w1", "in standard or metric system",
                       c("pounds" = "pounds",
                         "kilograms" = "kilograms"), selected = "kilograms"),
    submitButton('Submit')
  ),
    mainPanel(      
      h3('On the left-hand side you will need to enter your height and weight in any unit system!
          The default values (height = 1.80 meters and weight = 75.0 kg) are in metric system, however they easily can be overwritten by making
          selections of your choice. For example, you may want to enter your height in meters 
          (click "meters" button and unclick the "inches" one) and your weight in pounds (click "pounds" 
          button and unclick "kilograms" one). Please be careful and do not select both units for the one 
          measurement. Press "Submit" button and the App will suggest the action you need to take to improve your health.'),
      
      h3('You have entered'),
      h4('your height'),
      verbatimTextOutput("height"),
      h4('in'),
      verbatimTextOutput("h1"),
      h4('your weight'),
      verbatimTextOutput("weight"),
      h4('in'),
      verbatimTextOutput("w1"),
      h4('which resulted in body mass index of '),
      verbatimTextOutput("bmi"),
      h4('We recommend you to'),
      verbatimTextOutput("status")
    )
))