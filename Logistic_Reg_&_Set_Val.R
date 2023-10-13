

#### estimate the test error of the logistic regression model for default using the validation set approach.

library("ISLR")
#### This library contains a collection of data-sets

fix(Default) # allows to edit the data
attach(Default) # eliminates the need of refering to a variable like Weekly$variable.

summary(Default)

#### Fit a logistic regression model that uses income and balance to predict default.
#### "family=binomial" selects a logistic regression.
glm.fit = glm(default ~ income + balance, data = Default, family = binomial)
summary(glm.fit)

#### income 2.081e-05 
#### balance 5.647e-03

#### Lets set a seed so anyone replicating this project gets the same results.
set.seed(1)

#### Now I use the validation set approach to estimate the test error of this model.
#### Split the sample set into a training set and a validation set and then fit the multiple logistic regression model using only the training observations.
#### After that, I obtain a prediction of default status for each individual in the validation set by computing the posterior probability of default for that individual, and classifying the individual to the default category if the posterior probability is greater than 0.5.
Approach = function() {
  train = sample(dim(Default)[1], dim(Default)[1]/2)
  glm.fit = glm(default ~ income + balance, data = Default, family = binomial,
                subset = train)
  glm.pred = rep("No", dim(Default)[1]/2)
  glm.probs = predict(glm.fit, Default[-train, ], type = "response")
  glm.pred[glm.probs > 0.5] = "Yes"
  return(mean(glm.pred != Default[-train, ]$default))
}
set.seed(1)
Approach()
#### 0.0286% test error rate from the validation set approach.
#### The model seems to predict the probability of default pretty well.

#### Lets repeat the process
Approach()
#### 0.0236%
Approach()
####  0.028%
#### It averages 0.026%

#### Now lets see if including a dummy variable for student leads to a reduction in the test error rate.

set.seed(1)
train = sample(dim(Default)[1], dim(Default)[1]/2)
glm.fit = glm(default ~ income + balance + student, data = Default, family = binomial,
              subset = train)


glm.probs = predict(glm.fit, Default[-train, ], type = "response")

glm.pred = rep("No", dim(Default)[1]/2)
glm.pred[glm.probs > 0.5] = "Yes"

mean(glm.pred != Default[-train, ]$default)
#### 0.0288% test error rate.
#### It does not add much to the reduction of the error rate







































































