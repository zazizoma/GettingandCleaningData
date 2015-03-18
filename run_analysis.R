# Script to perform tasks required by Getting and Cleaning Data Course Project.
# 17 March 2015

# import test and train files
testfile=read.table("./test/X_test.txt", comment.char="")
trainfile=read.table("./train/X_train.txt", comment.char="")

# merge train and test data tablesl
mergefile=rbind(trainfile, testfile)
rm(testfile, trainfile)

# import feature names and select mean and std columns
features=read.table("features.txt", as.is=TRUE)
indices=grep("mean|std", features$V2)

# select like indicied columns from merged file
goodfile=mergefile[,indices]

# combine to make single dataframe with feature names
goodfeatures=(features[indices,"V2"])
names(goodfile)=goodfeatures
#rm(indices,mergefile,features, goodfeatures)

# read and merge subject information
testsubject=read.table("test/subject_test.txt")
trainsubject=read.table("train/subject_train.txt")
mergesubject=rbind(trainsubject, testsubject)
#rm(testsubject, trainsubject)

# read and merge label information
testlabels=read.table("test/y_test.txt")
trainlabels=read.table("train/y_train.txt")
mergelabels=rbind(trainlabels, testlabels)
#rm(testlabels, trainlabels)

# get descriptive label names
labelnames=read.table("activity_labels.txt", as.is=TRUE)
for (i in 1:nrow(mergelabels)) mergelabels[i,]=labelnames[mergelabels[i,],'V2'];

# add subject and activity data
betterfile=cbind(mergesubject, mergelabels, goodfile);
names(betterfile)=c("Subject", "Activity", names(goodfile));
#rm(goodfile, labelnames, mergelabels, mergesubject);

# calculate average values of variables per subject per activity
step5 = aggregate(. ~ Subject + Activity, data=betterfile, mean);