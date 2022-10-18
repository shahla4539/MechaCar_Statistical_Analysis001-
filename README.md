# MechaCar_Statistical_Analysis001-

Module-15

## Linear Regression to Predict MPG
linear regression is a statistical model that is used to predict a continuous dependent variable based on one or more independent variables fitted to the equation of a line. It can be used as an extension of correlation analysis. In contrast to correlation analysis, which asks whether a relationship exists between variables A and B, linear regression asks if we can predict values for variable A using a linear model and values from variable B.

### Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
For illustration, we have used **vehicle_weight** as a variable that provides a non-random amount of variance to the **mpg** values in the dataset. The Pearson correlation coefficient is denoted as "r" in mathematics and is used to quantify a linear relationship between two numeric variables. We calculated r = 0.09 which indicated the positive correlation. When two variables are positively correlated, they move in the same direction. In other words, when the variable on the x-axis increases, the variable on the y-axis increases as well:

![image](https://user-images.githubusercontent.com/105535250/195490384-d62462b1-c82c-4fec-b866-14125528f89f.png)

### Is the slope of the linear model considered to be zero? Why or why not?
linear regression tests the following hypotheses:
* H0 : The slope of the linear model is zero, or m = 0
* Ha : The slope of the linear model is not zero, or m ≠ 0

If there is no significant linear relationship, each dependent value would be determined by random chance and error. Therefore, our linear model would be a flat line with a slope of 0. But in our case, as you can see in the image below our slope is not a flat line. We have created a graph where you can visualize the fitted line against our dataset using ggplot2. It is an example of an positive correlation. When two variables are positively correlated, they move in the same direction. In other words, when the variable on the x-axis increases, the variable on the y-axis increases as well:

![image](https://user-images.githubusercontent.com/105535250/195487022-7e769257-6cf4-4ca3-9fc7-0ec3bce2e84e.png)

From our linear regression model, the r-squared value is 0.008223, which means that roughly 0.82% of the variablilty of our dependent variable (mpg) is explained using this linear model. Compared to the Pearson correlation coefficient between mpg and vehicle_weight of 0.09, we can confirm that our r-squared value is approximately the square of our r-value. 
In addition, the p-value of our linear regression analysis is 0.5311, which is much bigger than our assumed significance level of 0.05%. Therefore, we can state that there is sufficient evidence to reject our null hypothesis, which means that the slope of our linear model is not zero.

![image](https://user-images.githubusercontent.com/105535250/195498801-b62d77b4-678c-41ae-ab5e-35d21f132023.png)


### Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

In a simple linear regression model, the higher the correlation is between two variables, the more that one variable can explain/predict the value of the other. As been calculated above our correlation value is 0.09. Also from our linear regression model, the r-squared value is 0.008223, which means that roughly 0.82% of the variablilty of our dependent variable (mpg) is explained using this linear model.
Using our visualization in combination with our calculated p-value and r-squared value, we have determined that there is a significant relationship between vehicle_weight and mpg.

Although the relationship between both variables is statistically significant, this linear model is not ideal. According to the calculated r-squared value, using only vehicle_weight to predict miles per gallon is roughly as accurate as guessing using a coin toss. In other words, the variability we observed within our mpg data must come from multiple sources of variance. To accurately predict future mpg observations, we need to use a more robust model.

## Summary Statistics on Suspension Coils
The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. 


### total summary
![image](https://user-images.githubusercontent.com/105535250/195501858-d5de42a5-e03c-4445-8a0d-1a12de7bf49f.png)

The current manufacturing data meet this design specification for all manufacturing lots in total lot summary because this variance is based on a over all large data which proves that majority of the lots did meet the specification.

### lot summary

![image](https://user-images.githubusercontent.com/105535250/195501988-e21f701b-382c-4ae1-8389-08f434834e89.png)

This summary is based on individual lots. For lot1 and lot2 the specification were met but according to the results lot3 has a variance 170 which did not meet the criteria of keeping the variance upto 100 pounds per square inch.

## T-Tests on Suspension Coils
We can use the one-sample t-test to assert the similarities or differences in our data.the t.test()function should produce our test statistic "t" along with our p-value, which we can use to evaluate our null hypothesis.

![image](https://user-images.githubusercontent.com/105535250/195765495-7c24abf3-1789-40a9-b2f5-df638e394b48.png)

There are a number of metrics produced from the t.test()function, but for now we will only concern ourselves with the calculated p-value. Assuming our significance level was the common 0.05 percent, our p-value is above our significance level. Therefore, we do not have sufficient evidence to reject the null hypothesis, and we would state that the two means are statistically similar. If your p-value is lower than the significance level, you would have sufficient evidence to reject the null hypothesis and state that the two means are statistically different.

### T-Tests on lot individually

![image](https://user-images.githubusercontent.com/105535250/195766428-04843fcc-825a-428f-b58b-a90e165c03b0.png)

The results are same for t-test individually on lots. The p-value is above our significance level 0.05 percent. Therefore, we do not have sufficient evidence to reject the null hypothesis, and we would state that the two means are statistically similar.

## Study Design: MechaCar vs Competition

### Data required
To run this analysis we need mechacar car miles per gallon data and the mean mile per gallon of our competitor's cars

### T-Tests
In statistics, we use a t-test to compare the mean of one dataset to another under a few assumptions. The one-sample t-test will be used to determine whether there is a statistical difference between the means of a mechacar dataset and a hypothesized, competitor dataset. In other words, a one-sample t-test is used to test the following hypotheses:

H0 : There is no statistical difference between the observed sample mean and its presumed population mean.

Ha : There is a statistical difference between the observed sample mean and its presumed population mean.

### Null hypothesis or alternative hypothesis
We can also use a one-sided t-test by changing our alternative hypothesis to state that our sample mean is significantly less or significantly more than our presumed population mean.

Before we can apply any statistical test to our data, we must check if there are any assumptions regarding our input dataset. When it comes to our one-sample t-test there are five assumptions about our input data:

* The input data is numerical and continuous. This is because we are testing the distribution of two datasets.
* The sample data was selected randomly from its population data.
* The input data is considered to be normally distributed.
* The sample size is reasonably large. Generally speaking, this means that the sample data distribution should be similar to its population data distribution.
* The variance of the input data should be very similar.

As long as our input data satisfies (or mostly satisfies) the above assumptions, we can use the one-sample t-test to assert the similarities or differences in our data.

To use the t.test()function to perform our one-sample t-test, we have to use a few arguments:

* *x*  is the numeric vector of sample data.
* *mu* is the calculated mean of the population data.
* *alternative* tells the t.test() function if the hypothesis is one-sided (one-tailed) or two-sided (two-tailed). The options for the alternative argument are “two.sided,” “less,” or “greater.” By default, the t.test() function assumes a two-sided t-test.

By setting all three of these arguments, the t.test()function should produce our test statistic "t" along with our p-value, which we can use to evaluate our null hypothesis.

For our study we want to test if the miles per gallon from our Mechacar dataset is statistically different from the miles per gallon in our Competitor data, we would use our t.test()function as follows:

 #compare Mechacar versus Competitor means.
>t.test(log10(mechacar_table$mpg),mu=mean(log10(competitor_table$mpg)))

### Metrics: p-value
There are a number of metrics produced from the t.test()function, but for now we will only concern ourselves with the calculated p-value. Assuming our significance level was the common 0.05 percent, if our p-value is above our significance level we would not have sufficient evidence to reject the null hypothesis, and we would state that the two means are statistically similar.
On the other hand, If our p-value is lower than the significance level, we would have sufficient evidence to reject the null hypothesis and state that the two means are statistically different. 

