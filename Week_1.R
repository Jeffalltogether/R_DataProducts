###Week 1 Developing Data Products

######################### Manipulate ###########################################
library(manipulate)

#plot 1
manipulate(plot(1:x), x=slider(1,100))

#plot 2
library(UsingR)

myHist <- function(mu){
        hist(galton$child, col="blue", breaks=100)
        lines(c(mu, mu), c(0,150), col="red", lwd=5)
        mse <- mean((galton$child - mu)^2)
        text(63, 150, paste("mu = ", mu))
        text(63, 140, paste("MSE = ", round(mse, 2)))
}

manipulate(myHist(mu), mu = slider(62, 74, step = 0.5))

#Example with `ggplot2`
library(ggplot2)
library(manipulate)

xvals <- 1:100
yvals <- rnorm(100)
data <- data.frame(xvals,yvals)

manipulate({
        #define plotting function 
        ggplot(data,aes(xvals,yvals)) +
                geom_smooth(method="loess",span=span.val) +
                geom_point()},
        #define variable that will be changed in plot
        span.val=slider(0.1,1)
)


######################### rCharts ##############################################
# install.packages("devtools")
# install.packages("base64enc")
# devtools::install_github("ramnathv/rCharts")

library(rCharts)

haireye <- as.data.frame(HairEyeColor)

n1 = nPlot(Freq ~ Hair, group = "Eye", type = "multiBarChart",
           data = subset(haireye, Sex == "Male"))

n1

data(economics, package = "ggplot2")
econ = transform(economics, date = as.character(date))
m1 = mPlot(x = "date", y = c("psavert", "uempmed"), type = "Line", data = econ)
m1$set(pointSize = 0, lineWidth = 1)
m1

# m1$print("chart1") # print out the js
# m1$save('myPlot.html') #save as html file
# m1$publish('myPlot', host = 'gist') # save to gist, rjson required
# m1$publish('myPlot', host = 'rpubs') # save to rpubs

##################### Google Vis ###############################################
# install.packages("googleVis")
library(googleVis)

M = gvisMotionChart(Fruits, "Fruit", "Year", options = list(width=600, height = 400))
plot(M)

# Here are some different types of plots and the function to create them
# Motion charts: gvisMotionChart
# Interactive maps: gvisGeoChart
# Interactive tables: gvisTable
# Line charts: gvisLineChart
# Bar charts: gvisColumnChart
# Tree maps: gvisTreeMap

###Examples can be found here...
#https://cran.r-project.org/web/packages/googleVis/vignettes/googleVis_examples.html

#Ex. a
require(datasets)
states <- data.frame(state.name, state.x77)
GeoStates <- gvisGeoChart(states, "state.name", "Illiteracy",
                          options=list(region="US", 
                                       displayMode="regions", 
                                       resolution="provinces",
                                       width=600, height=400))
plot(GeoStates)

#Ex. b
GeoMarker <- gvisGeoChart(Andrew, "LatLong", 
                          sizevar='Speed_kt',
                          colorvar="Pressure_mb", 
                          options=list(region="US"))
plot(GeoMarker)

#Ex. c
AndrewMap <- gvisMap(Andrew, "LatLong" , "Tip", 
                     options=list(showTip=TRUE, 
                                  showLine=TRUE, 
                                  enableScrollWheel=TRUE,
                                  mapType='terrain', 
                                  useMapTypeControl=TRUE))
plot(AndrewMap)

#################### leaflet - for creating interactive maps ###################
library(leaflet)

m = leaflet() %>%
        addTiles() %>%
        addMarkers(lat=39.298113, lng=-76.590248, popup="Where Brian works")
m

hopkins = data.frame(
        lat = c(39.298113,39.299838),
        lng=c(-76.590248,-76.593143),
        labels=c("BSPH", "KKI")
)
m = leaflet(hopkins) %>% addTiles %>% addMarkers(popup=~labels)
m


######################### Plot.ly ##############################################
# require(devtools)
# install_github("ropensci/plotly")
library(plotly)

# Sys.setenv("plotly_username"="jeffalltogether")
# Sys.setenv("plotly_api_key"="API_key_here")

plotly:::verify("username")
plotly:::verify("api_key")

library(plotly)
p <- plot_ly(midwest, x = percollege, color = state, type = "box")
p

plot_ly(mtcars, x = hp, y = mpg,
        mode = "markers",
        color = wt,
        text=paste("Weight:", wt))

library(ggplot2)
g = ggplot(mtcars, aes(x=wt,y=mpg))
g = g + geom_point(aes(color=factor(cyl)))
carggplot <- ggplotly(g)

data(volcano)
## Show a static 3D plot in R
persp(z = volcano)
## Show the dynamic 3D plot in plotly
volcanoPlot <- plot_ly(z = volcano, type = "surface")

###Publish your graphs
plotly_POST(carggplot, filename = "testGGplot2")
plotly_POST(volcanoPlot, filename = "testVolcano")
