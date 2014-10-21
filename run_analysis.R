############################################################################
#########1 Merges the training and the test sets to create one data set.

#library(data.table)

fileZip<-"getdata_projectfiles_UCI HAR Dataset.zip";


#read test data
#set internal paths
fileX<-"UCI HAR Dataset/test/X_test.txt";
fileY<-"UCI HAR Dataset/test/y_test.txt";
fileSub<-"UCI HAR Dataset/test/subject_test.txt";
#read main data
test <- read.table(unz(fileZip, fileX), header=F, stringsAsFactors=F)
#read and adding two new columns with features and subjects 
test$y <- read.table(unz(fileZip, fileY), header=F, stringsAsFactors=F, row.names=NULL)[,1]
test$Sub <- read.table(unz(fileZip, fileSub), header=F, stringsAsFactors=F, row.names=NULL)[,1]

#read train data
#re-set variables with paths
fileX <- gsub("test", "train", fileX)
fileY <- gsub("test", "train", fileY)
fileSub <- gsub("test", "train", fileSub)
#read - same idea as test data
train <- read.table(unz(fileZip, fileX), header=F, stringsAsFactors=F)
train$y <- read.table(unz(fileZip, fileY), header=F, stringsAsFactors=F, row.names=NULL)[,1]
train$Sub <- read.table(unz(fileZip, fileSub), header=F, stringsAsFactors=F, row.names=NULL)[,1]
#union of the train and test dataset
uciHar <- rbind(train, test)

#join the features loaded from another file with the main dataset
fileFeatures <- "UCI HAR Dataset/features.txt"
features <- read.table(unz(fileZip, fileFeatures), header=F, stringsAsFactors=F)
#add new columns added in the previous step. 
features <- rbind(features,c(nrow(features) +1  ,"idActivity"))
features <- rbind(features,c(nrow(features) +1  ,"subject"))
#reset columnnames
colnames(uciHar) <- features[,2]
#head(uciHar)


############################################################################
#########2 Extracts only the measurements on the mean and standard deviation for each measurement. 

#filter main dataset columns to use only the required ones(mean and std) plus the descriptions (idActivity,subject)
uciHar <- uciHar[,c(features[grep("mean[(]{1}|std[(]{1}", features$V2) , 2],"idActivity","subject")]
#head(uciHar)
#ncol(uciHar)


############################################################################
#########3 Uses descriptive activity names to name the activities in the data set
#activity

#read activity labels from file and change columnames
fileActivity <- "UCI HAR Dataset/activity_labels.txt"
activity <- read.table(unz(fileZip, fileActivity), header=F, stringsAsFactors=F)
colnames(activity) <- c("idActivity","activity")
#join datasets through the id Activity present on both
uciHar <- merge(uciHar,activity,by.x="idActivity",by.y="idActivity",all=TRUE)
#there is no need to retain idActivity, remove first column
uciHar <- uciHar[,colnames(uciHar)[-1]]
#head(uciHar)
       

############################################################################
#########4 Appropriately labels the data set with descriptive variable names

#reset columnname following general rules
#specila atention to the ones on the 4.1 slide: descriptive, lowerCase, not duplicated, no specila chars
#colnames(uciHar)

#removing special chars like ()
colnames(uciHar)<-gsub("[[:punct:]]", "", names(uciHar))
#on the metadata this one have workds replicated
colnames(uciHar)<-gsub("BodyBody", "Body", names(uciHar))
#more descriptive names
colnames(uciHar)<-gsub("^t", "euclidean", names(uciHar))
colnames(uciHar)<-gsub("^f", "frequency", names(uciHar))
#individual words, more readable
colnames(uciHar)<-gsub("mean", "Mean", names(uciHar))
colnames(uciHar)<-gsub("std", "Std", names(uciHar))
colnames(uciHar)<-gsub("x$", "X", names(uciHar))
colnames(uciHar)<-gsub("y$", "Y", names(uciHar))
colnames(uciHar)<-gsub("z$", "Z", names(uciHar))




############################################################################
#########5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#aggregate all the variables per activitY and subject using function mean
#res will have one row for activitY/subject and all the averages for which variable
res <- aggregate(. ~ activitY + subject, data=uciHar, FUN=mean)
write.table(res,"step5DataSet.txt",append=FALSE,row.name=FALSE) 




