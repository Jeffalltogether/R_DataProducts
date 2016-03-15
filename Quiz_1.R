### Quiz 1

#Q1
library(manipulate)
myPlot <- function(s) {
        plot(cars$dist - mean(cars$dist), cars$speed - mean(cars$speed))
        abline(0, s)
}
manipulate(myPlot(s), s = slider(0, 2, step = 0.1))

#A: manipulate(myPlot(s), s = slider(0, 2, step = 0.1))

#Q2 
# install.packages("devtools")
# install.packages("base64enc")
# devtools::install_github("ramnathv/rCharts")
require(base64enc)
library(devtools)
require(rCharts)
data("airquality")
table1 <- dTable(airquality, sPaginationType = "full_numbers")
table1$save("C:/Users/jeffthatcher/Cloud Drive/RRepos/09_DataProducts/DataProductsRepo/fig.html", standalone=TRUE)

#A: dTable(airquality, sPaginationType = "full_numbers")

#Q3
#A: Missing a comma in the sidebar panel

#Q4
#A: 