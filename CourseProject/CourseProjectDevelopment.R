###Course Project Development
# Goal -train linear ML algorithm and report accuracy (kappa) and predict the 
# learning curve for the predicsion on the set of data where user inputs the 

library(caret)

data(iris)
iris <- iris

iris$Species <- as.factor(iris$Species)

### separate data into training and test data
set.seed(1177)
# trainIndex <- createDataPartition(iris$Species, p = 0.70, list=FALSE)
# training <- iris[trainIndex,]
# testing <- iris[-trainIndex,]

training <- iris

### Train lda Classifier
#fit model

# slider... n should be from 2 - 90
n <- 30
z <- 9
training_cases <- rep(0, n-z)
in_sample <- rep(0, n-z)
out_sample <- rep(0, n-z)
allRows <- vector("list", n)

for (i in z:n){
        classA <- grep("setosa", training$Species)
        classB <- grep("versicolor", training$Species)
        classC <- grep("virginica", training$Species)

        x <- floor(i/3)+ceiling(i/3)+ceiling(i/3)
        y <- floor(i/3)+floor(i/3)+ceiling(i/3)
        
        #Separate the input number of training data cases into three integers
        if (x == i){
                numRowsToSelect = c(floor(i/3),ceiling(i/3),ceiling(i/3))
        }
        
        if (y == i){
                numRowsToSelect = c(floor(i/3),floor(i/3),ceiling(i/3))
        }
        
        Acases = numRowsToSelect[1]
        Bcases = numRowsToSelect[2]
        Ccases = numRowsToSelect[3]
        
        #determine if the A class has adequate training cases to suppor the desired number
        if (numRowsToSelect[1] > length(classA)){
                Acases = length(classA)
        }
        
        #determine if the B class has adequate training cases to suppor the desired number
        if (numRowsToSelect[2] > length(classB)){
                Bcases = length(classB)
        }
        
        #determine if the C class has adequate training cases to suppor the desired number
        if (numRowsToSelect[3] > length(classC)){
                Ccases = length(classB)
        }
        
        rm(includeRows)
        includeRows <- c(classA[1:Acases], classB[1:Bcases], classC[1:Ccases])
        
        #store all the rows used for each training subset
        allRows[[i]] <- list(includeRows)
        
        #Train Model - LDA
        Lda <- train(Species ~ ., method="lda", data=training[includeRows,])

        training_cases[i-z] <- length(includeRows)
        in_sample[i-z] <- as.numeric(Lda$results$Kappa)
        # out_sample[i-z] <- as.numeric(result$overall[1])
}

rm(x,y)

learningData <- data.frame(training_cases, in_sample)
colnames(learningData) <- c("training_cases", "in_sample")


#plot of actual accuracy and predicted accuracy
p1 <- ggplot(learningData[1:4,], aes(training_cases, I(100*in_sample))) + 
        geom_point(size = 2, alpha = 0.5, color="forestgreen", fill ="forestgreen") +
        geom_line(color = "forestgreen") +
        scale_x_continuous(breaks = c(0, 5, 10, 15, 20, 25, 30, 50, 80), limits = c(9,80)) +
        geom_smooth(method = "lm", formula = y ~ I(1/x^9), fullrange = TRUE) +
        geom_hline(yintercept = 100) +
        xlab("Number of Training Data Samples") +
        ylab("In-sample Accuracy [%]\nDetermined by 25-Fold Bootstrap Samples")
p1

p2 <- ggplot(iris[allRows[[10]][[1]],], aes(Sepal.Length, Petal.Length, color = Species)) + 
        geom_point()
p2
