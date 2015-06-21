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


tidy<-rename(tidy, c("tBodyAcc.mean...X"="TimeBodyAccelerationMeanX", "tBodyAcc.mean...Y"="TimeBodyAccelerationMeanY", "tBodyAcc.mean...Z"="TimeBodyAccelerationMeanZ", "tBodyAcc.std...X"="TimeBodyAccelerationStandardDeviationX", "tBodyAcc.std...Y"="TimeBodyAccelerationStandardDeviationY", "tBodyAcc.std...Z"="TimeBodyAccelerationStandardDeviationZ", "tGravityAcc.mean...X"="GravityAccelerationMeanX", "tGravityAcc.mean...Y"="GravityAccelerationMeanY", "tGravityAcc.mean...Z"="GravityAccelerationMeanZ", "tGravityAcc.std...X"="GravityAccelerationStandardDeviationX", "tGravityAcc.std...Y"="GravityAccelerationStandardDeviationY", "tGravityAcc.std...Z"="GravityAccelerationStandardDeviationZ", "tBodyAccJerk.mean...X"="TimeBodyAccelerationJerkMeanX", "tBodyAccJerk.mean...Y"="TimeBodyAccelerationJerkMeanY"))

tidy<-rename(tidy, c("tBodyAccJerk.mean...Z"="TimeBodyAccelerationJerkMeanZ", "tBodyAccJerk.std...X"="TimeBodyAccelerationJerkStandardDeviationX", "tBodyAccJerk.std...Y"="TimeBodyAccelerationJerkStandardDeviationY", "tBodyAccJerk.std...Z"="TimeBodyAccelerationJerkStandardDeviationZ", "tBodyGyro.mean...X"="TimeBodyGyroscopeMeanX", "tBodyGyro.mean...Y"="TimeBodyGyroscopeMeanY", "tBodyGyro.mean...Z"="TimeBodyGyroscopeMeanZ", "tBodyGyro.std...X"="TimeBodyGyroscopeStandardDeviationX", "tBodyGyro.std...Y"="TimeBodyGyroscopeStandardDeviationY", "tBodyGyro.std...Z"="TimeBodyGyroscopeStandardDeviationZ", "tBodyGyroJerk.mean...X"="BodyGyroscopeJerkMeanX", "tBodyGyroJerk.mean...Y"="BodyGyroscopeJerkMeanY", "tBodyGyroJerk.mean...Z"="BodyGyroscopeJerkMeanZ"))

tidy<-rename(tidy, c("tBodyGyroJerk.std...X"="BodyGyroscopeJerkStandardDeviationX", "tBodyGyroJerk.std...Y"="BodyGyroscopeJerkStandardDeviationY", "tBodyGyroJerk.std...Z"="BodyGyroscopeJerkStandardDeviationZ", "tBodyAccMag.mean.."="TimeBodyAccelerationMagMean", "tBodyAccMag.std.."="TimeBodyAccelerationMagStandardDeviation", "tGravityAccMag.mean.."="GravityAccelerationMagMean", "tGravityAccMag.std.."="GravityAccelerationMagStandardDeviation", "tBodyAccJerkMag.mean.."="TimeBodyAccelerationJerkMagMean", "tBodyAccJerkMag.std.."="TimeBodyAccelerationJerkMagStandardDeviation", "tBodyGyroMag.mean.."="TimeBodyGyroscopeMagMean"))

tidy<-rename(tidy, c("tBodyGyroMag.std.."="TimeBodyGyroscopeMagStandardDeviation", "tBodyGyroJerkMag.mean.."="TimeBodyGyroscopeJerkMagMean", "tBodyGyroJerkMag.std.."="TimeBodyGyroscopeJerkMagStandardDeviation", "fBodyAcc.mean...X"="FFTBodyAccelerationMeanX", "fBodyAcc.mean...Y"="FFTBodyAccelerationMeanY", "fBodyAcc.mean...Z"="FFTBodyAccelerationMeanZ", "fBodyAcc.std...X"="FFTBodyAccelerationStandardDeviationX", "fBodyAcc.std...Y"="FFTBodyAccelerationStandardDeviationY", "fBodyAcc.std...Z"="FFTBodyAccelerationStandardDeviationZ", "fBodyAcc.meanFreq...X"="BodyAccelerationMeanFreqX"))

tidy<-rename(tidy, c("fBodyAcc.meanFreq...Y"="BodyAccelerationMeanFreqY", "fBodyAcc.meanFreq...Z"="BodyAccelerationMeanFreqZ", "fBodyAccJerk.mean...X"="FFTBodyAccelerationJerkMeanX", "fBodyAccJerk.mean...Y"="FFTBodyAccelerationJerkMeanY", "fBodyAccJerk.mean...Z"="FFTBodyAccelerationJerkMeanZ", "fBodyAccJerk.std...X"="FFTBodyAccelerationJerkStandardDeviationX", "fBodyAccJerk.std...Y"="FFTBodyAccelerationJerkStandardDeviationY", "fBodyAccJerk.std...Z"="FFTBodyAccelerationJerkStandardDeviationZ", "fBodyAccJerk.meanFreq...X"="BodyAccelerationJerkMeanFreqX", "fBodyAccJerk.meanFreq...Y"="BodyAccelerationJerkMeanFreqY"))

tidy<-rename(tidy, c("fBodyAccJerk.meanFreq...Z"="BodyAccelerationJerkMeanFreqZ", "fBodyGyro.mean...X"="FFTBodyGyroscopeMeanX", "fBodyGyro.mean...Y"="FFTBodyGyroscopeMeanY", "fBodyGyro.mean...Z"="FFTBodyGyroscopeMeanZ", "fBodyGyro.std...X"="FFTBodyGyroscopeStandardDeviationX", "fBodyGyro.std...Y"="FFTBodyGyroscopeStandardDeviationY", "fBodyGyro.std...Z"="BodyGyroscopeStandardDeviationZ", "fBodyGyro.meanFreq...X"="BodyGyroscopeMeanFreqX", "fBodyGyro.meanFreq...Y"="BodyGyroscopeMeanFreqY", "fBodyGyro.meanFreq...Z"="BodyGyroscopeMeanFreqZ", "fBodyAccMag.mean.."="FFTBodyAccelerationMagMean"))

tidy<-rename(tidy, c("fBodyAccMag.std.."="FFTBodyAccelerationMagStandardDeviation", "fBodyAccMag.meanFreq.."="FFTBodyAccelerationMagMeanFreq", "fbodyAccJerkMag.mean.."="FFTBodyAccelerationJerkMagMean", "fbodyAccJerkMag.std.."="FFTBodyAccelerationJerkMagStandardDeviation", "fbodyAccJerkMag.meanFreq.."="FFTBodyAccelerationJerkMagMeanFreq", "fbodyGyroMag.mean.."="FFTBodyGyroscopeMagMean", "fbodyGyroMag.std.."="FFTBodyGyroscopeMagStandardDeviation", "fbodyGyroMag.meanFreq.."="FFTBodyGyroscopeMagMeanFreq", "fbodyGyroJerkMag.mean.."="FFTbodyGyroscopeJerkMagMean", "fbodyGyroJerkMag.std.."="FFTBodyGyroscopeJerkMagStandardDeviation", "fbodyGyroJerkMag.meanFreq.."="FFTBodyGyroscopeJerkMagMeanFreq"))

tidy_melt <- melt(tidy, id.vars = c("activity", "subject"))
tidy_melt<-cast(activity + variable ~ subject, data = tidy_melt, fun = mean)

