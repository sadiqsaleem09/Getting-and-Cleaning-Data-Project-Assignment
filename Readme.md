# Introduction
=================================================================================================

This repo contains two files:
- UCI_HAR_Analysis.R file
- CodeBook

The R script utilizes the data from the study titled **Human Activity Recognition Using Smartphones Data Set**. (* Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012*)


The group developed Human Activity Recognition database from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone. 

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


# Instructions
=================================================================================================
- Make sure the folder UCI HAR Dataset is present in your working directory. The UCI HAR Dataset contains the unzipped raw data obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

- Execute UCI_HAR_analysis.R

- The name of the output file is mean_activity_of_subjects.txt

- The output file will be generated in the working directory

**Step by step explanation is provided in the CodeBook document**
