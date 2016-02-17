# CodeBook


The script contained in the file run_analysis.R excecture the following steps:

1) Merges the training and the test sets to create one data set.

2) Extracts only the measurements on the mean and standard deviation for each measurement.

3) Uses descriptive activity names to name the activities in the data set

4) Appropriately labels the data set with descriptive variable names.

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



##Variables:

activities is combination of `activities_test` and `activities_train` activities

`activity_labels` contains the activities

`features` is the combination of `features_test` and `features_train`

`featuresNames` are the names of all the features

`featuresWanted` is a subset of the `featuresNames`, subsetting for mean and std

`subject` is the combination of `subject_test` and `subject_train`

`data` is the final dataset

`data2` is the second indipendent tidy dataset
