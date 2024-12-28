# Comparison of the overall performances of two dishwasgher detergents
A consumer products company has conducted a marketing experiment before launching a new dishwashing detergent. Two test detergents were randomly distributed to 549 households by mail. Each of them used their received products and returned a survey regarding the detergent's performance. The survey asked the following questions which can be called the response variables in the study:

1. Does the product provide value for money? (1:Poor, 3:Excellent)
2. How would you rate the product overall? (1:Poor, 3:Excellent)
3. How do you rate the product with respect to its performance (cleaning dishes)? (1:Poor, 3:Excellent)
4. Do you like the scent (perfume) of the product? (1:Poor, 3:Excellent)
5. Does use of the product irritate your hand? (1:A lot, 3:Not at all)
6. Did you like the color of the product? (1: Not at all, 2: Very much)
7. Are you satisfied with the packaging? (1:Not at all, 3: Extremely satisfied)
8. How much effort did you spend in dispensing the detergent? (1:A lot of effort, 3: It was very easy)
9. Did you think the package was filled as per your expectation: (1:Poor, 3:Excellent)

Each household answered the questions on a scale of 1-3, with 1 being worst and 3 being the best.
Note that the first two questions represent the users’ overall evaluation of the product, whereas the other questions represent their views on specific aspects of the product. The response on the overall rating ofthe product (question no.2) is the one of primary interest to the management.

The survey also collected covariate information that are given below:
10. Do you place the product directly under a running stream of water? (Yes/No)
11. How do you wash dishes (1= only by hand; 2=most of them by hand but some in machine; 3=some by hand but most of them in machine; 4= equally by hand and machine; 5=only in machine)
12. Have you been using brand X of dishwashing detergent during the past six months (prior to this survey)? (Yes/No)
13. Household income (nominal variable with 11 levels)
14. Age of the person primarily responsible for washing dishes in the house (nominal variable with 6 levels, each level measuring an interval, e.g. 15-24.)
15. Number of hand washes per week (discrete variable)
16. Hispanic? (Yes/No)

The questions of interest here are:
1. Is it possible to predict the overall performance measures (question 1 and 2) from the remaining performance measures (question 3-9)? That is, do the ratings on specific features like performance, perfume, color, packaging, effect on hand, ease of dispensing, extent to which the package is filled, affect the overall performance measures? If so, fit appropriate models (individual model for each overall performance measure) for each product, and compare them.
2. How well can you predict the overall performance measures for each product from the covariates? Fit appropriate statistical models (individual model for each overall performance measure) and compare them for the two products.
3. Does it appear that the two test products differ significantly with respect to the response of primary interest (overall rating)? If they do, which is better?