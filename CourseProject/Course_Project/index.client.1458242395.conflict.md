---
title       : A Simple Exploration of the Machine Learning "Learning Curve"
subtitle    : Developing Data Products Course Project
author      : Jeff Thatcher
job         : Student
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
## Slide 1 - Why Inderstand the Learning Curve?
Data is expensive and time consuming to obtain. Therefore, estimations of training data size are necessary to predict the time and cost for building machine learning products.

* This presentation demonstrats how learning curves are one technique for predicting this size of a training data set.

* Consider using this technique during product development for applications and devices from which little data is available.

---
## Slide 2 - Linear Discriminant Analysis Learning Curve Example
* Learning curves are used in machine learning to predict the number of training cases need to obtain the highest achievable prediction accuracy.

* In this presentation, we explore this concept using the Iris data set.

* The model we trained was a linear discriminant analysis (LDA) to predict the Iris species based on four features measured from each species.

Table. Subset of the Iris data set showing the four features and the three classes of species that the LDA algorithm will predict.

<!-- html table generated in R 3.2.3 by xtable 1.8-2 package -->
<!-- Thu Mar 17 13:28:13 2016 -->
<table border=1>
<tr> <th>  </th> <th> Sepal.Length </th> <th> Sepal.Width </th> <th> Petal.Length </th> <th> Petal.Width </th> <th> Species </th>  </tr>
  <tr> <td align="right"> 1 </td> <td align="right"> 5.10 </td> <td align="right"> 3.50 </td> <td align="right"> 1.40 </td> <td align="right"> 0.20 </td> <td> setosa </td> </tr>
  <tr> <td align="right"> 20 </td> <td align="right"> 5.10 </td> <td align="right"> 3.80 </td> <td align="right"> 1.50 </td> <td align="right"> 0.30 </td> <td> setosa </td> </tr>
  <tr> <td align="right"> 75 </td> <td align="right"> 6.40 </td> <td align="right"> 2.90 </td> <td align="right"> 4.30 </td> <td align="right"> 1.30 </td> <td> versicolor </td> </tr>
  <tr> <td align="right"> 100 </td> <td align="right"> 5.70 </td> <td align="right"> 2.80 </td> <td align="right"> 4.10 </td> <td align="right"> 1.30 </td> <td> versicolor </td> </tr>
  <tr> <td align="right"> 125 </td> <td align="right"> 6.70 </td> <td align="right"> 3.30 </td> <td align="right"> 5.70 </td> <td align="right"> 2.10 </td> <td> virginica </td> </tr>
  <tr> <td align="right"> 150 </td> <td align="right"> 5.90 </td> <td align="right"> 3.00 </td> <td align="right"> 5.10 </td> <td align="right"> 1.80 </td> <td> virginica </td> </tr>
   </table>




---
## Slide 3 - The Data Used
This figure displays a subset of the Iris data set used for training the machine learning model.



![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png)

---
## Slide 4 - Learning Curve Characteristics

This slide shows the Learning Curve.

* x-axis - is the number of Irises included in the training data (i.e., number of rows)

* y-axis - is the accuracy of the LDA algorithm corresponding to the number of Irises used for training.

* Blue curve - is a smoothing function used to predict the future accuracy of the model when given more training data.

![plot of chunk unnamed-chunk-4](assets/fig/unnamed-chunk-4-1.png)


--- 
## Slide 5 - How the Learning Curve is Applied
As we change the size of the training data, we see an increase in classifier accuracy. Research shows that this trend holds true in data sets where classification algorithms work well.

* Here we present the results from  12, 15, and 20 data points used to train our LDA classifier

![plot of chunk unnamed-chunk-5](assets/fig/unnamed-chunk-5-1.png)

---
## Slide 6 - Final Thoughts and Further Reading
Researchers have devised a much better model for predicting sample size compared to what is used in this example. Specifically, they use an inverse power law to predict the learning rate of a classifier.

* Data scientists might consider developing learning curves as a technique during product development for applications and devices from which little data is available.

For more information please refer to the following references:

Figueroa et al.: Predicting sample size required for classification performance. BMC Medical Informatics and Decision Making 2012 12:8.

Beleites et al.: Sample size planning for classification models. Analytica Chimica Acta, 2013, 760 (Special Issue: Chemometrics in Analytical Chemistry 2012), 25-33

