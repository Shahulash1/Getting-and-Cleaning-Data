---
title: "Code Book"
author: "Shahul Hameed Abdul"
date: "August 2, 2017"
output:
  html_document: default
  pdf_document: default
---

## Features in the dataset

The features are the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) being captured at a constant rate of 50 Hz. The acceleration signals are separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using filters. 

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

  - tBodyAcc-XYZ
  - tGravityAcc-XYZ
  - tBodyAccJerk-XYZ
  - tBodyGyro-XYZ
  - tBodyGyroJerk-XYZ
  - tBodyAccMag
  - tGravityAccMag
  - tBodyAccJerkMag
  - tBodyGyroMag
  - tBodyGyroJerkMag
  - fBodyAcc-XYZ
  - fBodyAccJerk-XYZ
  - fBodyGyro-XYZ
  - fBodyAccMag
  - fBodyAccJerkMag
  - fBodyGyroMag
  - fBodyGyroJerkMag

## Statistics of the features

The set of variables that were estimated from these signals are: 

  - mean(): Mean value
  
  - std(): Standard deviation
  
  - mad(): Median absolute deviation 
  
  - max(): Largest value in array
  
  - min(): Smallest value in array
  
  - sma(): Signal magnitude area
  
  - energy(): Energy measure. Sum of the squares divided by the number of values. 
  
  - iqr(): Interquartile range 
  
  - entropy(): Signal entropy
  
  - arCoeff(): Autorregresion coefficients with Burg order equal to 4
  
  - correlation(): correlation coefficient between two signals
  
  - maxInds(): index of the frequency component with largest magnitude
  
  - meanFreq(): Weighted average of the frequency components to obtain a mean frequency
  
  - skewness(): skewness of the frequency domain signal 
  
  - kurtosis(): kurtosis of the frequency domain signal 
  
  - bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
  
  - angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean
  
Out of these parameters, only mean and standard deviation was considered for the final tidy data set


## About the Code
The following were created as part of the code:

1. xtrain       : Feature measurements from the training set
2. ytrain       : The activity number from the training set
3. subjecttrain : The subject number from the training set
4. xtest        : Feature measurements from the test set
5. ytest        : The activity number from the test set
6. subjecttest  : The subject number from the test set
7. xdata        : Merged test and training feature measurements
8. ydata        : Merged activities from the training and test sets
9. subject      : Combined subject information from training and test sets
10. features    : Features is the data table that contains the 561 varible names / the features
11. xdata_msd   : Subset of features that contain only the mean and standard deviation estimates
12. combined    : Combined data of features, activity and subjects
13. tidydata    : Final subset of the mean value of the featured grouped by subject and activity

