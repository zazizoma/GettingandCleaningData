README file describing  Course Project submission for Getting and Cleaning Data
March 2015

The following analysis was performed on the UCI HAR Dataset downloaded from the course site. The script assumes the working directory to be the UCI HAR Dataset folder.

The objectives of the project were:   
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

The script performs the following functions to meet the project objectives:

1. import test and train files (use ./test/X_test.txt and ./train/X_train.txt)

2. merge train and test data tables

3. import feature names and select mean and std columns (use ./features.txt)

4. select like indexed columns from merged test/train file

5. combine feature list and test/train dataframe into single dataframe with features as names

6. read and merge subject information (use ./subject_test.txt)

7. read and merge label information (use ./y_test.txt)

8. get descriptive label names (use activity_labels.txt)

9. add subject and activity to test/train dataframe

10.calculate average values of variables per subject per activity

The script output was saved via write.table(row.name=FALSE) to tidydatastep5.txt.

The submission includes this README.md file, the data in tidydatastep5.txt, CodeBook.txt to describe the data variables, and the script run_analysis.R.
