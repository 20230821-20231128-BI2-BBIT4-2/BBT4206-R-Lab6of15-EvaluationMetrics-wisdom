Lab-Submission-Markdown.Rmd
================
Wisdom
2023-10-27

- [Student Details](#student-details)
- [Setup Chunk](#setup-chunk)
  - [ggplot2 —-](#ggplot2--)
  - [caret —-](#caret--)
  - [mlbench —-](#mlbench--)
  - [STEP 2. Load the Datasets —-](#step-2-load-the-datasets--)
    - [The Boston Housing Dataset —-](#the-boston-housing-dataset--)
- [Execute the following to load the “BostonHousing” dataset which is
  offered](#execute-the-following-to-load-the-bostonhousing-dataset-which-is-offered)
- [in the “mlbench” package:](#in-the-mlbench-package)
  - [1.b. Determine the Baseline Accuracy
    —-](#1b-determine-the-baseline-accuracy--)
  - [1.c. Split the dataset —-](#1c-split-the-dataset--)
- [Define a 75:25 train:test data split of the
  dataset.](#define-a-7525-traintest-data-split-of-the-dataset)
- [That is, 75% of the original data will be used to train the model
  and](#that-is-75-of-the-original-data-will-be-used-to-train-the-model-and)
- [25% of the original data will be used to test the
  model.](#25-of-the-original-data-will-be-used-to-test-the-model)
- [Define a 75:25 train-test split](#define-a-7525-train-test-split)

# Student Details

|                                              |           |
|----------------------------------------------|-----------|
| **Student ID Number**                        | …         |
| **Student Name**                             | …         |
| **BBIT 4.2 Group**                           | .WISDOM.. |
| **BI Project Group Name/ID (if applicable)** | …         |

# Setup Chunk

## ggplot2 —-

## caret —-

## mlbench —-

``` r
if (require("ggplot2")) {
    require("ggplot2")
} else {
    install.packages("ggplot2", dependencies = TRUE, repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: ggplot2

``` r
if (require("caret")) {
    require("caret")
} else {
    install.packages("caret", dependencies = TRUE, repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: caret

    ## Loading required package: lattice

``` r
if (require("mlbench")) {
    require("mlbench")
} else {
    install.packages("mlbench", dependencies = TRUE, repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: mlbench

``` r
if (require("pROC")) {
    require("pROC")
} else {
    install.packages("pROC", dependencies = TRUE, repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: pROC

    ## Type 'citation("pROC")' for a citation.

    ## 
    ## Attaching package: 'pROC'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     cov, smooth, var

## STEP 2. Load the Datasets —-

### The Boston Housing Dataset —-

# Execute the following to load the “BostonHousing” dataset which is offered

# in the “mlbench” package:

``` r
data("BostonHousing")
```

## 1.b. Determine the Baseline Accuracy —-

\# Identify the number of instances that belong to each class
(distribution or \# class breakdown).

\# The result should show that 65% tested negative and 34% tested
positive \# for diabetes.

``` r
data("BostonHousing")
boston_housing_medv <- BostonHousing$medv
cbind(frequency = table(boston_housing_medv), percentage = prop.table(table(boston_housing_medv)) *
    100)
```

    ##      frequency percentage
    ## 5            2  0.3952569
    ## 5.6          1  0.1976285
    ## 6.3          1  0.1976285
    ## 7            2  0.3952569
    ## 7.2          3  0.5928854
    ## 7.4          1  0.1976285
    ## 7.5          1  0.1976285
    ## 8.1          1  0.1976285
    ## 8.3          2  0.3952569
    ## 8.4          2  0.3952569
    ## 8.5          2  0.3952569
    ## 8.7          1  0.1976285
    ## 8.8          2  0.3952569
    ## 9.5          1  0.1976285
    ## 9.6          1  0.1976285
    ## 9.7          1  0.1976285
    ## 10.2         3  0.5928854
    ## 10.4         2  0.3952569
    ## 10.5         2  0.3952569
    ## 10.8         1  0.1976285
    ## 10.9         2  0.3952569
    ## 11           1  0.1976285
    ## 11.3         1  0.1976285
    ## 11.5         1  0.1976285
    ## 11.7         2  0.3952569
    ## 11.8         2  0.3952569
    ## 11.9         2  0.3952569
    ## 12           1  0.1976285
    ## 12.1         1  0.1976285
    ## 12.3         1  0.1976285
    ## 12.5         1  0.1976285
    ## 12.6         1  0.1976285
    ## 12.7         3  0.5928854
    ## 12.8         1  0.1976285
    ## 13           1  0.1976285
    ## 13.1         4  0.7905138
    ## 13.2         1  0.1976285
    ## 13.3         3  0.5928854
    ## 13.4         4  0.7905138
    ## 13.5         2  0.3952569
    ## 13.6         2  0.3952569
    ## 13.8         5  0.9881423
    ## 13.9         2  0.3952569
    ## 14           1  0.1976285
    ## 14.1         3  0.5928854
    ## 14.2         1  0.1976285
    ## 14.3         2  0.3952569
    ## 14.4         2  0.3952569
    ## 14.5         3  0.5928854
    ## 14.6         2  0.3952569
    ## 14.8         1  0.1976285
    ## 14.9         3  0.5928854
    ## 15           3  0.5928854
    ## 15.1         1  0.1976285
    ## 15.2         3  0.5928854
    ## 15.3         1  0.1976285
    ## 15.4         2  0.3952569
    ## 15.6         5  0.9881423
    ## 15.7         1  0.1976285
    ## 16           1  0.1976285
    ## 16.1         3  0.5928854
    ## 16.2         2  0.3952569
    ## 16.3         1  0.1976285
    ## 16.4         1  0.1976285
    ## 16.5         2  0.3952569
    ## 16.6         2  0.3952569
    ## 16.7         2  0.3952569
    ## 16.8         2  0.3952569
    ## 17           1  0.1976285
    ## 17.1         3  0.5928854
    ## 17.2         3  0.5928854
    ## 17.3         1  0.1976285
    ## 17.4         3  0.5928854
    ## 17.5         3  0.5928854
    ## 17.6         1  0.1976285
    ## 17.7         1  0.1976285
    ## 17.8         5  0.9881423
    ## 17.9         1  0.1976285
    ## 18           1  0.1976285
    ## 18.1         1  0.1976285
    ## 18.2         3  0.5928854
    ## 18.3         2  0.3952569
    ## 18.4         3  0.5928854
    ## 18.5         4  0.7905138
    ## 18.6         2  0.3952569
    ## 18.7         3  0.5928854
    ## 18.8         2  0.3952569
    ## 18.9         4  0.7905138
    ## 19           2  0.3952569
    ## 19.1         4  0.7905138
    ## 19.2         2  0.3952569
    ## 19.3         5  0.9881423
    ## 19.4         6  1.1857708
    ## 19.5         4  0.7905138
    ## 19.6         5  0.9881423
    ## 19.7         2  0.3952569
    ## 19.8         3  0.5928854
    ## 19.9         4  0.7905138
    ## 20           5  0.9881423
    ## 20.1         5  0.9881423
    ## 20.2         2  0.3952569
    ## 20.3         4  0.7905138
    ## 20.4         4  0.7905138
    ## 20.5         3  0.5928854
    ## 20.6         6  1.1857708
    ## 20.7         2  0.3952569
    ## 20.8         3  0.5928854
    ## 20.9         2  0.3952569
    ## 21           3  0.5928854
    ## 21.1         2  0.3952569
    ## 21.2         5  0.9881423
    ## 21.4         5  0.9881423
    ## 21.5         2  0.3952569
    ## 21.6         2  0.3952569
    ## 21.7         7  1.3833992
    ## 21.8         2  0.3952569
    ## 21.9         3  0.5928854
    ## 22           7  1.3833992
    ## 22.1         1  0.1976285
    ## 22.2         5  0.9881423
    ## 22.3         2  0.3952569
    ## 22.4         2  0.3952569
    ## 22.5         3  0.5928854
    ## 22.6         5  0.9881423
    ## 22.7         2  0.3952569
    ## 22.8         4  0.7905138
    ## 22.9         4  0.7905138
    ## 23           4  0.7905138
    ## 23.1         7  1.3833992
    ## 23.2         4  0.7905138
    ## 23.3         4  0.7905138
    ## 23.4         2  0.3952569
    ## 23.5         1  0.1976285
    ## 23.6         2  0.3952569
    ## 23.7         4  0.7905138
    ## 23.8         4  0.7905138
    ## 23.9         5  0.9881423
    ## 24           2  0.3952569
    ## 24.1         3  0.5928854
    ## 24.2         1  0.1976285
    ## 24.3         3  0.5928854
    ## 24.4         4  0.7905138
    ## 24.5         3  0.5928854
    ## 24.6         2  0.3952569
    ## 24.7         3  0.5928854
    ## 24.8         4  0.7905138
    ## 25           8  1.5810277
    ## 25.1         1  0.1976285
    ## 25.2         1  0.1976285
    ## 25.3         1  0.1976285
    ## 26.2         1  0.1976285
    ## 26.4         2  0.3952569
    ## 26.5         1  0.1976285
    ## 26.6         3  0.5928854
    ## 26.7         1  0.1976285
    ## 27           1  0.1976285
    ## 27.1         2  0.3952569
    ## 27.5         4  0.7905138
    ## 27.9         2  0.3952569
    ## 28           1  0.1976285
    ## 28.1         1  0.1976285
    ## 28.2         1  0.1976285
    ## 28.4         2  0.3952569
    ## 28.5         1  0.1976285
    ## 28.6         1  0.1976285
    ## 28.7         3  0.5928854
    ## 29           2  0.3952569
    ## 29.1         2  0.3952569
    ## 29.4         1  0.1976285
    ## 29.6         2  0.3952569
    ## 29.8         2  0.3952569
    ## 29.9         1  0.1976285
    ## 30.1         3  0.5928854
    ## 30.3         1  0.1976285
    ## 30.5         1  0.1976285
    ## 30.7         1  0.1976285
    ## 30.8         1  0.1976285
    ## 31           1  0.1976285
    ## 31.1         1  0.1976285
    ## 31.2         1  0.1976285
    ## 31.5         2  0.3952569
    ## 31.6         2  0.3952569
    ## 31.7         1  0.1976285
    ## 32           2  0.3952569
    ## 32.2         1  0.1976285
    ## 32.4         1  0.1976285
    ## 32.5         1  0.1976285
    ## 32.7         1  0.1976285
    ## 32.9         1  0.1976285
    ## 33           1  0.1976285
    ## 33.1         2  0.3952569
    ## 33.2         2  0.3952569
    ## 33.3         1  0.1976285
    ## 33.4         2  0.3952569
    ## 33.8         1  0.1976285
    ## 34.6         1  0.1976285
    ## 34.7         1  0.1976285
    ## 34.9         3  0.5928854
    ## 35.1         1  0.1976285
    ## 35.2         1  0.1976285
    ## 35.4         2  0.3952569
    ## 36           1  0.1976285
    ## 36.1         1  0.1976285
    ## 36.2         2  0.3952569
    ## 36.4         1  0.1976285
    ## 36.5         1  0.1976285
    ## 37           1  0.1976285
    ## 37.2         1  0.1976285
    ## 37.3         1  0.1976285
    ## 37.6         1  0.1976285
    ## 37.9         1  0.1976285
    ## 38.7         1  0.1976285
    ## 39.8         1  0.1976285
    ## 41.3         1  0.1976285
    ## 41.7         1  0.1976285
    ## 42.3         1  0.1976285
    ## 42.8         1  0.1976285
    ## 43.1         1  0.1976285
    ## 43.5         1  0.1976285
    ## 43.8         1  0.1976285
    ## 44           1  0.1976285
    ## 44.8         1  0.1976285
    ## 45.4         1  0.1976285
    ## 46           1  0.1976285
    ## 46.7         1  0.1976285
    ## 48.3         1  0.1976285
    ## 48.5         1  0.1976285
    ## 48.8         1  0.1976285
    ## 50          16  3.1620553

## 1.c. Split the dataset —-

# Define a 75:25 train:test data split of the dataset.

# That is, 75% of the original data will be used to train the model and

# 25% of the original data will be used to test the model.

# Define a 75:25 train-test split

``` r
set.seed(123)  # For reproducibility
train_index <- createDataPartition(BostonHousing$medv, p = 0.75, list = FALSE)
boston_housing_train <- BostonHousing[train_index, ]
boston_housing_test <- BostonHousing[-train_index, ]
```

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.
