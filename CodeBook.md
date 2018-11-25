---
title: Getting and Cleaning Data Course Project
output: html_document
---

This document describes  tidy_dataset.txt file which  provides summary information generated from original source <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> . A full description is available at the site where the data was obtained:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> 

Steps for tidying and summaring the data are described in this repository README.MD file.   

## DATA
Data is provided in an flat file using blank separator and  string delimiter. Header name the 68 variables describe 2 identifiers and 66 measures described below. There are 35 observations  

## VARIABLES

### Identifiers


ACTIVITY_LABEL

Activity label identifiying the diferent activities:

    - WALKING: subject was walking
    - WALKING_UPSTAIRS: subject was walking upstairs
    - WALKING_DOWNSTAIRS: subject was walking downstairs
    - SITTING: subject was sitting
    - STANDING: subject was standing
    - LAYING: subject was laying

SUBJECT

Factor identifiying the 30 different individuals


### Measures

Different signals  were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is  to denote 3-axial signals in the X, Y and Z directions.

In all the cases 2 variables are estimated:
- mean() (mean Value) 
- std() standard deviation, 

The dataset is an average agregation,  using mean(),  for each activity-subject.


#### Body acceleration
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 

Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 


- tBodyAcc-mean()-X-mean()
- tBodyAcc-mean()-Y-mean()          
- tBodyAcc-mean()-Z-mean()

- tBodyAcc-std()-X-mean()           
- tBodyAcc-std()-Y-mean()
- tBodyAcc-std()-Z-mean()           

- tGravityAcc-mean()-X-mean()        
- tGravityAcc-mean()-Y-mean()       
- tGravityAcc-mean()-Z-mean()

- tGravityAcc-std()-X-mean()        
- tGravityAcc-std()-Y-mean()
- tGravityAcc-std()-Z-mean()    

#### Jerk signals
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 


- tBodyAccJerk-mean()-X-mean()       
- tBodyAccJerk-mean()-Y-mean()      
- tBodyAccJerk-mean()-Z-mean()       
- tBodyAccJerk-std()-X-mean()       
- tBodyAccJerk-std()-Y-mean()        
- tBodyAccJerk-std()-Z-mean()       
- tBodyGyro-mean()-X-mean()          
- tBodyGyro-mean()-Y-mean()         
- tBodyGyro-mean()-Z-mean()          
- tBodyGyro-std()-X-mean()          
- tBodyGyro-std()-Y-mean()           
- tBodyGyro-std()-Z-mean()          
- tBodyGyroJerk-mean()-X-mean()      
- tBodyGyroJerk-mean()-Y-mean()     
- tBodyGyroJerk-mean()-Z-mean()      
- tBodyGyroJerk-std()-X-mean()      
- tBodyGyroJerk-std()-Y-mean()       
- tBodyGyroJerk-std()-Z-mean()  

#### Magnitudes
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

- tBodyAccMag-mean()-mean()          
- tBodyAccMag-std()-mean()          
- tGravityAccMag-mean()-mean()       
- tGravityAccMag-std()-mean()       
- tBodyAccJerkMag-mean()-mean()      
- tBodyAccJerkMag-std()-mean()      
- tBodyGyroMag-mean()-mean()         
- tBodyGyrMag-std()-mean()         
- tBodyGyroJerkMag-mean()-mean()     
- tBodyGyroJerkMag-std()-mean() 


#### Fast Fourier Transformation 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

- fBodyAcc-mean()-X-mean()           
- fBodyAcc-mean()-Y-mean()          
- fBodyAcc-mean()-Z-mean()           

- fBodyAcc-std()-X-mean()           
- fBodyAcc-std()-Y-mean()            
- fBodyAcc-std()-Z-mean()           

- fBodyAccJerk-mean()-X-mean()       
- fBodyAccJerk-mean()-Y-mean()      
- fBodyAccJerk-mean()-Z-mean()       
 
- fBodyAccJerk-std()-X-mean()       
- fBodyAccJerk-std()-Y-mean()       
- fBodyAccJerk-std()-Z-mean()       

- fBodyGyro-mean()-X-mean()          
- fBodyGyro-mean()-Y-mean()         
- fBodyGyro-mean()-Z-mean()          

- fBodyGyro-std()-X-mean()          
- fBodyGyro-std()-Y-mean()           
- fBodyGyro-std()-Z-mean()          

- fBodyAccMag-mean()-mean()          
- fBodyAccMag-std()-mean()          

- fBodyBodyAccJerkMag-mean()-mean()  
- fBodyBodyAccJerkMag-std()-mean() 

- fBodyBodyGyroMag-mean()-mean()     
- fBodyBodyGyroMag-std()-mean()     

- fBodyBodyGyroJerkMag-mean()-mean() 
- fBodyBodyGyroJerkMag-std()-mean() 
      
## Transformations

For creating 1st dataset (tidy dataset but not agregated):

1. Download and unzip the project files onz if not already available

2. Read Activity labels and features and asing clear column names

3. Read training and test datasets and join them in a single dataset. 

4. Read training and test labels and join them in a single label dataframe

5. Colnames modify in order to be more clear.

6. Read training and test subject data and join them in a single subject dataframe.

7. Colnames modify in order to be more clear.


8. Filter colums as only mean and std columns are requested. meanfreq is also eliminated ad hoc

9. Merge labels for providing descriptive activities instead of activity codes

For creating the 2nd dataset


1. 1st dataset is grouped using mean agregation function
2. "-Avg() is concatenated to everz single measure column name.
View(dataset2)
3. Finally second  dataset is write as a flat file

##Citation Request
Citation Request:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 
