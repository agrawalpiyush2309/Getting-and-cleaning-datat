#**************************************Getting and Cleaning Data Course Project********************************************#
#**************************************John Hopkins University Data Science Track Coursera*********************************#


# Setting the working directory
setwd("C:\\Users\\piyush\\Looking At Data\\Project Assignment\\UCI HAR Dataset")

# 1. Check If "dyplr" package is installed in the machine or not, If not, Install the package

if("dplyr" %in% rownames(installed.packages())== FALSE) {install.packages("dplyr")};library(dplyr)
if("tidyr" %in% rownames(installed.packages())== FALSE) {install.packages("tidyr")};library(tidyr)
if("stringr" %in% rownames(installed.packages())== FALSE) {install.packages("stringr")};library(stringr)


# 2. Read test Data in the corresponding variables
subjects_test<- read.table("test\\subject_test.txt",col.names="Subjects")
Activities_test<- read.table("test\\y_test.txt",col.names="Activities")
Readings_test<- read.table("test\\X_test.txt")
combined_test_data<-cbind(Readings_test,subjects_test,Activities_test)

# 3. Read Train Data in the corresponding variables
subjects_train<- read.table("train\\subject_train.txt",col.names="Subjects")
Activities_train<- read.table("train\\y_train.txt",col.names="Activities")
Readings_train<- read.table("train\\X_train.txt")
combined_train_data<-cbind(Readings_train,subjects_train,Activities_train)

# 4. Combine train and test data to create combined data set
combined_data<-rbind(combined_train_data,combined_test_data)

# 5. Read features data
features<-read.table("features.txt",col.names=c("Id","Features"))

# 6. Refinging Feature names for descriptive names
features[,"Features"]<-str_replace(features[,"Features"], "^t", "TimeOf")
features[,"Features"]<-str_replace(features[,"Features"], "^f", "FrequencyOf")
features[,"Features"]<-str_replace(features[,"Features"], "BodyBody", "Body")
features[,"Features"]<-str_replace(features[,"Features"], "\\(\\)", "")
features[,"Features"]<-str_replace(features[,"Features"], "\\(", "")
features[,"Features"]<-str_replace(features[,"Features"], "\\)", "")
features[,"Features"]<-str_replace(features[,"Features"], "\\-", "")
features[,"Features"]<-str_replace(features[,"Features"], "Acc", "acceleration")
features[,"Features"]<-str_replace(features[,"Features"], "Mag", "Magnitude")

# 7. Filtering the measurements on the mean and standard deviation
g_features<-grep("mean[^Freq]|std",features[,"Features"])

# 8. Combining additional columns for Subjects and Activity
g_features1<-c(g_features,c(562,563))

# 9. Filtering data from combined_data based on Features filtered in step number 6
filtered_data<-combined_data[,g_features1]

# 10. Assigning Column names to the filtered Data
colnames(filtered_data)<-c(features[g_features,"Features"],"Subjects","Activity")

# 11. Creating a tidy data set with the average of each variable for each activity and each subject.
tidy_data<-filtered_data %>% group_by(Subjects,Activity) %>% summarise_each(funs(mean),1:57)

# 12. Converting data to data frames
tidier_data<-as.data.frame(tidy_data)

# 13. Save the dataset
write.table(tidier_data, file="tidy_data.txt", row.name=FALSE)