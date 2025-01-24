% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/WRF.R
\name{WRF}
\alias{WRF}
\title{Weighted Random Forest}
\usage{
WRF(data, weights, k = 5, ntree = 100, prob = 0.8)
}
\arguments{
\item{data}{A data frame that contains the data, with the response variable y being a binary variable of 0 and 1 with 1 being the minority class.}

\item{weights}{A vector that contains the weights that we want to test on. The function uses k-fold CV to find best weight.}

\item{k}{Indicates the number of folds to create during cross validation process. The default is set to 5.}

\item{ntree}{The number of trees used in the balanced random forest model. The default is set to 100.}

\item{prob}{The ratio of training set to the whole data. The default is set to 0.8}
}
\value{
A vector of length 2 that contains the fitted balanced random forest model and the confusion matrix using the test data.
}
\description{
This function utilizes the randomForest library to implement a weighted random forest model on the data.
This function fits a weighted random forest model using k-fold CV on the training data.
Finally, it returns the fitted model and the confusion matrix of the test data.
}
\examples{
# Example Usage
data <- caret::twoClassSim(1000, intercept = -15, linearVars = 15, noiseVars = 5)
names(data)[names(data)=="Class"]="y"
data$y = as.factor(ifelse(data$y=="Class1",0,1))

result <- WRF(data,weights=c(1000,10000,100000),ntree=100,prob=0.8)


}
