#Description of the variables on the final dataset for step 4
==================================================================
Project 2 - Getting and Cleaning Data 
dataset for step 4 based on 
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================

#Description:
This dataset is based on a dataset from experiments that have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The original dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

The final version already have the two original datasets merged.
Which dataset have 66 variables regarding all the values from the original one regarding mean and standard desviation.


#Variables:
##variables from the initial saved data (66)
euclideanBodyAccMeanX,euclideanBodyAccMeanY,euclideanBodyAccMeanZ,euclideanBodyAccStdX,euclideanBodyAccStdY,euclideanBodyAccStdZ,euclideanGravityAccMeanX,euclideanGravityAccMeanY,euclideanGravityAccMeanZ,euclideanGravityAccStdX,euclideanGravityAccStdY,euclideanGravityAccStdZ,euclideanBodyAccJerkMeanX,euclideanBodyAccJerkMeanY,euclideanBodyAccJerkMeanZ,euclideanBodyAccJerkStdX,euclideanBodyAccJerkStdY,euclideanBodyAccJerkStdZ,euclideanBodyGyroMeanX,euclideanBodyGyroMeanY,euclideanBodyGyroMeanZ,euclideanBodyGyroStdX,euclideanBodyGyroStdY,euclideanBodyGyroStdZ,euclideanBodyGyroJerkMeanX,euclideanBodyGyroJerkMeanY,euclideanBodyGyroJerkMeanZ,euclideanBodyGyroJerkStdX,euclideanBodyGyroJerkStdY,euclideanBodyGyroJerkStdZ,euclideanBodyAccMagMean,euclideanBodyAccMagStd,euclideanGravityAccMagMean,euclideanGravityAccMagStd,euclideanBodyAccJerkMagMean,euclideanBodyAccJerkMagStd,euclideanBodyGyroMagMean,euclideanBodyGyroMagStd,euclideanBodyGyroJerkMagMean,euclideanBodyGyroJerkMagStd,frequencyBodyAccMeanX,frequencyBodyAccMeanY,frequencyBodyAccMeanZ,frequencyBodyAccStdX,frequencyBodyAccStdY,frequencyBodyAccStdZ,frequencyBodyAccJerkMeanX,frequencyBodyAccJerkMeanY,frequencyBodyAccJerkMeanZ,frequencyBodyAccJerkStdX,frequencyBodyAccJerkStdY,frequencyBodyAccJerkStdZ,frequencyBodyGyroMeanX,frequencyBodyGyroMeanY,frequencyBodyGyroMeanZ,frequencyBodyGyroStdX,frequencyBodyGyroStdY,frequencyBodyGyroStdZ,frequencyBodyAccMagMean,frequencyBodyAccMagStd,frequencyBodyAccJerkMagMean,frequencyBodyAccJerkMagStd,frequencyBodyGyroMagMean,frequencyBodyGyroMagStd,frequencyBodyGyroJerkMagMean,frequencyBodyGyroJerkMagStd

For this variables there is no missing data and they are in the range [-1,1]

##activity
this variable is the description of the six activities taken while using the phone. Possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

##subject
identification of the 30 volunteers. Possible values: 1-30

#Transformations:
* 1.Files containing data were read and idActivity and subject were joined with raw data. Test and training data was row bainded
* 2.Filtered the cols needed for the final dataset. Only descriptions with the word mean and std were selected for the final dataset
* 3.Join the activity descriptions with the main dataset given a full description for each row
* 4.Rename the cols to be fully descriptive and readable.
* 5.Generate the second dataset with one raw for which par subject,activity.

#Summaries:
* The final dataset with summaries have one line for all the the subject, activity and the mean for all the variables.




