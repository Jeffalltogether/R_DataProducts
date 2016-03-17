###Developing Data Products
#First Shiny Program
library(shiny)

shinyUI(pageWithSidebar(
        #Application Title
        headerPanel("Diabetes Prediction"),
        
        sidebarPanel(
                numericInput("glucose", "Glucose mg/dl", 90, min=50, max=200, step=5),
                submitButton("Submit")
        ),
        
        mainPanel(
                h3("Results of Prediction"),
                h4("You entered"),
                verbatimTextOutput("inputValue"),
                h4("which resulted in a prediciton of "),
                verbatimTextOutput("prediction")
        )
))