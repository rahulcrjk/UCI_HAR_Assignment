## Code book for the UCI HAR data set
=====================================

### Background

This task involves tidying up the data collected from the accelerometers from the Samsung Galaxy S smart phone used for Human Activity Recognition (HAR). Two independent data sets are prepared which will be used for further analysis. 


### Study Design

The data was collected using the accelerometer and gyroscope of the Samsung Galaxy S smart phone. The data for this experiment is available from the below link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data is in zip format and is unzipped into the current working directory for processing. 

The actual method by which the data was collected can be found at the below link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


### Code book

The unzipped folder has different relevant files as described below: 

* UCI HAR Dataset\test\subject_test – Gives details of the subjects used for obtaining test data. 
* UCI HAR Dataset\test\X_test  - Gives the values of the various measurements taken. 
* UCI HAR Dataset\test\y_test – Gives the activity that was performed represented as a number.
* UCI HAR Dataset\train\subject_test – Gives details of the subjects used for obtaining train data. 
* UCI HAR Dataset\train\X_test  - Gives the values of the various measurements taken. 
* UCI HAR Dataset\train\y_test – Gives the activity that was performed represented as a number.
* features_info.txt - Shows info about the variables used on the feature vector.
* features.txt: List of all features.
* activity_labels.txt: Links the class labels with their activity name.

Other folders are irrelevant for this current activity. 

Description of Variables
========================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean



### Summary Choices

Two data sets are prepared in the tidying up activity of this data. 

Data set 1(finalDataSet1.txt)
=============================

In this task:
 
* All the training and test data are merged to form one big data set. 
* This is then matched with the subject and the activity being performed while the measurement was being taken. 
* The activity numbers are then replaced with a more detailed activity name. 
* From this data set only the measurements pertaining to mean(indicated by the 'mean()' naming convention) and standard deviation (indicated by the 'std()' naming convention) are retained and the rest are removed. 
* Appropriate sorting is performed, first on the basis of subject number and then on the basis of Activity. 
* The tidied data frame is then written to a file named finalDataSet1.txt

Data set 2 (finalDataSet2.txt)
==============================

In this task:

* All the training and test data are merged to form one big data set. 
* This is then matched with the subject and the activity being performed while the measurement was being taken. 
* The activity numbers are then replaced with a more detailed activity name. 
* This data is then summarized to show the mean of each measurement for each activity for each subject is made. 
* Appropriate sorting is performed, first on the basis of subject number and then on the basis of Activity. 
* The tidied up data set is then written to a file named finalDataSet2.txt
