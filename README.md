# How to tell if our model predicts well?

Probably two of the main reasons to create models: 1) to calculate how a factor interacts with other factors and 2) to predict future values.
For the second point: How can we know if our model predicts future values well? We can use the Validation Set Approach to test for this.

In the Validation Set Approach, we separate the dataset into two pieces: the training set (what we use to train the model), and the test set (what we use to test if the the model predicts well).
If the predicted values of the model using the training set are similar to the values of the test set, then we have a good model.
I used the ISLR library that contains a collection of datasets for this project. I fitted a Logistic Regression model (a regression model that gives a binary outcome) that uses income and balance to predict default.
Then I calculate the test error rate, which will tell if the model of this regression predicted the test set well. If the error is low then the model works.
