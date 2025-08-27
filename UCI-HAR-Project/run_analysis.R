install.packages("dplyr")
library(dplyr)

# Read the data: 

features <- read.table("UCI HAR Dataset/features.txt", col.names = c("Number", "Function"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("Activity_Code", "Activity_Name"))

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$Function)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "Activity_Code")

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$Function)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "Activity_Code")

# Initial general observations of how the data is organized in the different data sets:

head(features)
head(activities)
str(subject_train)
str(x_train)
str(y_train)
str(subject_test)
str(x_test)
str(y_test)

# 1. Merge the training and the test sets to create one data set:

x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, y, x)
table(merged_data$Subject) # to check that the merged data set contains 30 subjects
str(merged_data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement:

merged_data_mean_sd <- merged_data %>%
    select(Subject, Activity_Code, contains("mean"), contains("std"))

# 3. Use descriptive activity names to name the activities in the data set:

merged_data_mean_sd <- merge(merged_data_mean_sd, activities, by = "Activity_Code") %>%
    relocate(Activity_Name, .after = Activity_Code)

# 4. Appropriately label the data set with descriptive variable names: 

names(merged_data_mean_sd) <- gsub("^t", "Time", names(merged_data_mean_sd))
names(merged_data_mean_sd) <- gsub("^f", "Frequency", names(merged_data_mean_sd))
names(merged_data_mean_sd) <- gsub("BodyBody", "Body", names(merged_data_mean_sd))
names(merged_data_mean_sd) <- gsub("Acc", "Accelerometer", names(merged_data_mean_sd))
names(merged_data_mean_sd) <- gsub("Gyro", "Gyroscope", names(merged_data_mean_sd))
names(merged_data_mean_sd) <- gsub("Mag", "Magnitude", names(merged_data_mean_sd))

colnames(merged_data_mean_sd) # to verify the changes in the variable names

# 5. Independent tidy data set with the average of each variable for each activity and each subject:

tidy_data <- merged_data_mean_sd %>%
    group_by(Activity_Name, Activity_Code, Subject) %>%
    summarise_all(mean) %>%
    ungroup()

write.table(tidy_data, "TidyData.txt", row.name = FALSE)
