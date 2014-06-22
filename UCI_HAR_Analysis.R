
# author: Sadiq Saleem Rehmani (sadiqsaleem09)

# Make sure the UCI HAR Dataset folder is present in your working directory

library(data.table)

# Loading general data files related to the test and training data

features<-read.table("UCI HAR Dataset//features.txt")
names(features)<-c("featureid","featurename")
activitylabels<-read.table("UCI HAR Dataset//activity_labels.txt")
names(activitylabels)<-c("label","activity")

# Loading training dataset

training_set<-read.table("UCI HAR Dataset//train//X_train.txt")# training set
training_subjects<-read.table("UCI HAR Dataset//train//subject_train.txt")# training subjects
training_labels<-read.table("UCI HAR Dataset//train//y_train.txt")# training labels

names(training_set)<-features$featurename
names(training_subjects)<-"subject"
names(training_labels)<-"label"

training_data<-cbind(training_subjects,training_labels,training_set)# combining subjects and labels with the dataset

# Loading test dataset

test_set<-read.table("UCI HAR Dataset//test//X_test.txt")# test set
test_subjects<-read.table("UCI HAR Dataset//test//subject_test.txt")# test subjects
test_labels<-read.table("UCI HAR Dataset//test/y_test.txt")# test labels

names(test_set)<-features$featurename
names(test_subjects)<-"subject"
names(test_labels)<-"label"

test_data<-cbind(test_subjects,test_labels,test_set)# combining subjects and labels with the dataset


# Merging the training and test sets to create a combined set

combined_set<-rbind(training_data,test_data)

mean_values<-grep("mean\\(\\)",names(combined_set))# indices of all column names with mean() values
std_values<-grep("std\\(\\)",names(combined_set))# indices of all column names with std() values
my_list<-sort(union(1,union(2,(union(mean_values,std_values)))))

# Extracting measurements on the mean and standard deviation for each measurement
combinedset_limited<-combined_set[,my_list]

# Creating meaningful names
names(combinedset_limited)<-gsub("-","",names(combinedset_limited))
names(combinedset_limited)<-gsub("mean\\(\\)","mean",names(combinedset_limited))
names(combinedset_limited)<-gsub("std\\(\\)","stddeviation",names(combinedset_limited))

# Calculating means for each subject and each activity using data.table package

combined.limited.dt<-data.table(combinedset_limited)
keycols<-c("subject","label")
setkeyv(combined.limited.dt,keycols)

combined.average<-combined.limited.dt[,lapply(.SD,mean),by=key(combined.limited.dt)]
combined.average<-merge(activitylabels,combined.average) # merging activity label names with their labels

# writing data to a text file

write.table(combined.average,"mean_activity_of_subjects.txt", row.names = FALSE)
