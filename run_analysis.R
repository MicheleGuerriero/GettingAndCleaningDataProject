library(reshape)


trainset<-read.table("UCI HAR Dataset/train/X_train.txt")
testset<-read.table("UCI HAR Dataset/test/X_test.txt")

subjects_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
subjects_train<-rename(subjects_train,c("V1"="subject"))

subjects_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
subjects_test<-rename(subjects_test,c("V1"="subject"))


activities_train<-read.table("UCI HAR Dataset/train/y_train.txt")

activities_train$V1[which(activities_train$V1 == "1")] <- "WALKING"
activities_train$V1[which(activities_train$V1 == "2")] <- "WALKING_UPSTAIRS"
activities_train$V1[which(activities_train$V1 == "3")] <- "WALKING_DOWNSTAIRS"
activities_train$V1[which(activities_train$V1 == "4")] <- "SITTING"
activities_train$V1[which(activities_train$V1 == "5")] <- "STANDING"
activities_train$V1[which(activities_train$V1 == "6")] <- "LAYING"

activities_train<-rename(activities_train,c("V1"="activity"))


activities_test<-read.table("UCI HAR Dataset/test/y_test.txt")

activities_test$V1[which(activities_test$V1 == "1")] <- "WALKING"
activities_test$V1[which(activities_test$V1 == "2")] <- "WALKING_UPSTAIRS"
activities_test$V1[which(activities_test$V1 == "3")] <- "WALKING_DOWNSTAIRS"
activities_test$V1[which(activities_test$V1 == "4")] <- "SITTING"
activities_test$V1[which(activities_test$V1 == "5")] <- "STANDING"
activities_test$V1[which(activities_test$V1 == "6")] <- "LAYING"

activities_test<-rename(activities_test,c("V1"="activity"))


features<-read.table("UCI HAR Dataset/features.txt")
features<-features[,2]

names(trainset)<-features
names(testset)<-features

testset<-cbind(subjects_test,activities_test,testset)
trainset<-cbind(subjects_train,activities_train,trainset)
merged<-rbind(testset,trainset)
tidy<-merged[grep("mean|std|subject|activity", colnames(merged))]

tidy_melt <- melt(tidy, id.vars = c("activity", "subject"))
tidy_melt<-cast(activity + variable ~ subject, data = tidy_melt, fun = mean)

