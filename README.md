# Logistic Regression model, Cart Trees, Random Forest and Cross Validation

## Why do best and experienced people leave?

### AIMS:

- To show the accuracy of Logistic Regression model, Cart Trees, Random Forest and Cross Validation.
- To choose the best approach of prediction of people that will leave the job.

Summary of the best LOGISCTIC REGRESSION model.
All variables are HIGHLY significant. The ACCURACY of the model 82%. AIC: 9823. 

|     AIC: 12927     Probability: 82%      |      Estimate     |     Std. Error    |      t value      |     Pr(>\|t\|)    |            |
|------------------------------------------|:-----------------:|:-----------------:|:-----------------:|:-----------------:|:----------:|
|     Intercept                            |     -1.5508132    |      0.1717124    |       -9.031      |      <   2e-16    |     ***    |
|     Satisfaction level                   |     -4.1307434    |      0.0977270    |     -42.268       |     <   2e-16     |     ***    |
|     Last evaluation                      |      0.7264817    |      0.1486903    |        4.886      |      1.03e-06     |     ***    |
|     Number of   projects                 |     -0.3149832    |      0.0212517    |       -14.822     |      <   2e-16    |     ***    |
|     Average monthly     hours            |      0.0044558    |      0.0005144    |        8.662      |      <   2e-16    |     ***    |
|     Time spend   in     company          |     -0.2612599    |      0.0153833    |       16.983      |      <   2e-16    |     ***    |
|     Work accidents                       |     -1.5368679    |      0.0894349    |       -17.184     |     <   2e-16     |     ***    |
|     Promotion   during last 5   years    |     -1.4828491    |      0.2559823    |       -5.793      |      6.92e-09     |     ***    |
|     Low salary                           |      2.0054295    |      0.1275116    |       15.727      |     <   2e-16     |     ***    |
|     Medium salary                        |      1.4708288    |      0.1283351    |       11.461      |     <   2e-16     |     ***    |

Summary of the best CART TREE model.The ACCURACY of the model 97%. As you can see The Satisfaction level of an employer affects significantly on the decision of leaving the job

![alt text](https://raw.githubusercontent.com/ramapitecusment/employees_lr_ct_rf_cv_models/master/images/Rplot01.jpeg)

Summary of the best CART TREE model, which were improved by CROSS VALIDATION.The ACCURACY of the model 98%. As you can see, the accuracy of the model has been improved. CP = 0.001. Note, that the penalty error is also lower

![alt text](https://raw.githubusercontent.com/ramapitecusment/employees_lr_ct_rf_cv_models/master/images/Rplot02.jpeg)

Summary of the best RANDOM FOREST model.The ACCURACY of the model 99%.
 
Note, that the penalty error is also higher, because it is better to predict that an employee leave the job, but he will not leave, than otherwise.
Moreover, Random forest is more difficult to interpret than other types of trees.

|     Accuracy                   |     0.991                 |
|--------------------------------|---------------------------|
|     95%   CI                   |     (0.9828,   0.9903)    |
|     No   Information Rate      |     0.7619                |
|     P-Value   [Acc   > NIR]    |     <   2.2e-16           |
|     Kappa                      |     0.9733                |
|     Sensitivity                |     0.9996                |
|     Specificity                |     0.9462                |
|     Pos   Pred   Value         |     0.9835                |
|     Neg   Pred   Value         |     0.9988                |
|     Prevalence                 |     0.7619                |
|     Detection   Rate           |     0.7616                |
|     Detection   Prevalence     |     0.7744                |
|     Balanced   Accuracy        |     0.9829                |


## Conclusion

The answer to the question: “Why do best and experienced people leave?” could be answered using CART TREE, which was improved by Cross Validation because:

- It is easy to interpret the results of CART Tree than Random Forest’s.
- CART Tree shows us lower amount of penalty error.
- It Has really big percentage of accuracy.

### The key indicators to watch out for are:
- The employees who have left have had a satisfaction level < 0.5.
- Average monthly hours > 200 have resulted in employees leaving the company.
- Employees also leave after spending average 4 years of time in the company.


