1) Read all the text files and assign variables
i) features variable contains the column names of the data table created which are received from the accelerometers of the
   Samsung galaxy phone
ii) activity variable contains all the 6 activities performed by various participants
iii) subject_train and subject_test contains the participants number used for training data and test data respectively
iv) x_train and x_test contains 70 percent and 30 percent of the total input data respectively.
v)  y_train and y_test contains 70 percent and 30 percent of the total output data respectively.  

2) Merges the training and the test sets to create one data set.
i) The subject_train and subject_test data are binded row-wise using the bind_rows function and assigned to Total_subject
ii) The x_train and x_test data are binded row-wise using the bind_rows function and assigned to X
iii) The y_train and y_test data are binded row-wise using the bind_rows function and assigned to Y
iv) Finally all the 3 variables(Total_subject, X and Y) are combined column wise

3) Extracts only the measurements on the mean and standard deviation for each measurement.
Selecting only the column names which contain mean and standard deviation as well as the subject and activities which 
is present in the Number variable

4) Uses descriptive activity names to name the activities in the data set
The activitied stored in the number variable are added as a separate column to the tidy data set

5) Appropriately labels the data set with descriptive variable names.
The column names of the tidy_data data frame are changed for a more clear description
Few examples:
i) Freq to frequency
ii) Acc to Accelerometer
iii) Gyro to gyroscope
iv) Mag to magnitude

6) From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
for each activity and each subject.
i) Finally, a separate data set is created by grouping the data_tidy by subject and activities and summarising the 
   entire data frame using the mean function
ii) The new data frame is written onto a separate text file Data_Average.txt
 





 