###Developing Data Products
#First Shiny Program
library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Learning Curve Plot ---- Please Give Us 30 Seconds to Process Data ----"),
        sidebarPanel(
                h3('The Learning Curve'),
                h3('Learning curves are used in machine learning to predict the number of training cases need to obtain the highest achievable prediction accuracy.'),
                h4('This slider bar will allow you to select the number of training samples to include in your predictive model.'),
                sliderInput('cases', 'Select the number of cases for training',value = 14, min = 12, max = 45, step = 1)
        ),
        mainPanel(
                h3('These figures display the Iris data set used for training the machine learning model, and the accuracy of the predictive model given your subset of the Iris data.'),
                h4('The figure below is a visualization of the data you included in your model.'),
                h4('As you move the slider, you will notice the number of Iris data points increases or decreases.'),
                plotOutput('plot2'),         
                h4('This figure shows your \'in-sample\' model accuracy given the input training data above.'),
                h4('The model we trained was a linear discriminant analysis (LDA) to predict the Iris species based on four features measured from each species.'),
                h4('Additionally in this figure, the blue line attempts to predict the highest obtainable accuracy if more data was included.'),
                h4('As you increse the number of training cases, you will notice the accuracy converges to about 98%'),
                plotOutput('plot1'),
                h4('Data is expensive and time consuming to obtain. Therefore, 
                estimations of training data size are necessary to predict the time 
                and cost for building machine learning products. Researchers have 
                devised a much better models for predicting sample size compared to 
                what is used in this example. For more information please refer 
                to \"Figueroa, et al. 2012. BMC Medical Informatics and Decision 
                Making. 12:8.\" and \"Beleites et al. 2013. Analytica Chimica 
                Acta. 760(14) 25-33.\"')
        )
))