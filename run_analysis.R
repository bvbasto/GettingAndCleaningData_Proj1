############################################################################
#########1

#library(data.table)

fileZip<-"getdata_projectfiles_UCI HAR Dataset.zip";

#test
fileX<-"UCI HAR Dataset/test/X_test.txt";
fileY<-"UCI HAR Dataset/test/y_test.txt";
fileSub<-"UCI HAR Dataset/test/subject_test.txt";

test <- read.table(unz(fileZip, fileX), header=F, stringsAsFactors=F)
test$y <- read.table(unz(fileZip, fileY), header=F, stringsAsFactors=F, row.names=NULL)[,1]
test$Sub <- read.table(unz(fileZip, fileSub), header=F, stringsAsFactors=F, row.names=NULL)[,1]

#train
fileX <- gsub("test", "train", fileX)
fileY <- gsub("test", "train", fileY)
fileSub <- gsub("test", "train", fileSub)

train <- read.table(unz(fileZip, fileX), header=F, stringsAsFactors=F)
train$y <- read.table(unz(fileZip, fileY), header=F, stringsAsFactors=F, row.names=NULL)[,1]
train$Sub <- read.table(unz(fileZip, fileSub), header=F, stringsAsFactors=F, row.names=NULL)[,1]

#rbind
uciHar <- rbind(train, test)

#features
fileFeatures <- "UCI HAR Dataset/features.txt"
features <- read.table(unz(fileZip, fileFeatures), header=F, stringsAsFactors=F)
features <- rbind(features,c(nrow(features) +1  ,"idActivity"))
features <- rbind(features,c(nrow(features) +1  ,"subject"))
colnames(uciHar) <- features[,2]
#head(uciHar)


############################################################################
#########2

uciHar <- uciHar[,c(features[grep("mean[(]{1}|std[(]{1}", features$V2) , 2],"idActivity","subject")]
#head(uciHar)
#ncol(uciHar)


############################################################################
#########3
#activity
fileActivity <- "UCI HAR Dataset/activity_labels.txt"
activity <- read.table(unz(fileZip, fileActivity), header=F, stringsAsFactors=F)
colnames(activity) <- c("idActivity","activity")
uciHar <- merge(uciHar,activity,by.x="idActivity",by.y="idActivity",all=TRUE)
uciHar <- uciHar[,colnames(uciHar)[-1]]
#head(uciHar)
       

############################################################################
#########4
#colnames(uciHar)
colnames(uciHar)<-gsub("[[:punct:]]", "", names(uciHar))
colnames(uciHar)<-gsub("BodyBody", "Body", names(uciHar))
colnames(uciHar)<-gsub("^t", "euclidean", names(uciHar))
colnames(uciHar)<-gsub("^f", "frequency", names(uciHar))
colnames(uciHar)<-gsub("mean", "Mean", names(uciHar))
colnames(uciHar)<-gsub("std", "Std", names(uciHar))
colnames(uciHar)<-gsub("x$", "X", names(uciHar))
colnames(uciHar)<-gsub("y$", "Y", names(uciHar))
colnames(uciHar)<-gsub("z$", "Z", names(uciHar))




############################################################################
#########5
res <- aggregate(. ~ activitY + subject, data=uciHar, FUN=mean)
write.table(res,"step5DataSet.txt",append=FALSE,row.name=FALSE) 




