library(dplyr)
features <- read.table("features.txt")
names(features) <- c("No", "parameters")
activity <- read.table("activity_labels.txt")
names(activity) <- c("Number", "activity")
subject_test <- read.table("test/subject_test.txt")
names(subject_test) <- c("subject")
x_test <- read.table("test/X_test.txt", col.names = features$parameters)
y_test <- read.table("test/y_test.txt")
names(y_test) <- c("Number")
subject_train <- read.table("train/subject_train.txt")
names(subject_train) <- c("subject")
x_train <- read.table("train/X_train.txt", col.names = features$parameters)
y_train <- read.table("train/y_train.txt")
names(y_train) <- c("Number")
Total_subject <- bind_rows(subject_train, subject_test)
Y <- bind_rows(y_train, y_test)
X <- bind_rows(x_train, x_test)
data_combined <- bind_cols(Total_subject, Y, X)
data_tidy <- data_combined %>% select(subject, Number, contains("mean"), contains("std"))
data_tidy$Number <- activity[data_tidy$Number, 2]

names(data_tidy)<-gsub("[Mm]ean", " Mean", names(data_tidy))
names(data_tidy)<-gsub("std", " Standard Deviation", names(data_tidy))
names(data_tidy)<-gsub("[Ff]req", " Frequency", names(data_tidy))
names(data_tidy)<-gsub("Acc", " Accelerometer", names(data_tidy))
names(data_tidy)<-gsub("tBody", "Time Body", names(data_tidy))
names(data_tidy)<-gsub("Gyro", " Gyroscope", names(data_tidy))
names(data_tidy)<-gsub("Jerk", " Jerk", names(data_tidy))
names(data_tidy)<-gsub("BodyBody", "Human", names(data_tidy))
names(data_tidy)<-gsub("Mag", " Magnitude", names(data_tidy))
names(data_tidy)<-gsub("^t", " Time ", names(data_tidy))
names(data_tidy)<-gsub("^f", " Frequency ", names(data_tidy))

Data_Average <- data_tidy %>% group_by(subject, Number) %>% summarise_all(funs(mean))
write.table(Data_Average, "Data_Average.txt", row.name = FALSE)

