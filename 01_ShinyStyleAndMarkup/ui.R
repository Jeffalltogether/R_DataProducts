###Developing Data Products
#First Shiny Program
library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Illustrating Markup"),
        sidebarPanel(
                h1('Sidebar Panel'),
                h1('h1 Text'),
                h2('h2 Text'),
                h3('h3 Text'),
                h4('h4 Text')
        ),
        mainPanel(
                h3('Main Panel Text'),
                code('some code here x>777'),
                p('some ordinary text')
        )
))
