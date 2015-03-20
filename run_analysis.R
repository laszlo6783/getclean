##      setwd("C:\\Users\\User\\Documents\\GetAndClean")

##	Removing golbal environmental variables

rm(list=ls())

##		Loading libraries

library(dplyr)
library(data.table)

# 		The library where the results will be

if(!file.exists("./out")){dir.create("./out")}

mainLibrary <- ".\\UCI HAR Dataset\\"
testLibrary <- ".\\UCI HAR Dataset\\test\\"
trainLibrary <- ".\\UCI HAR Dataset\\train\\"


activityFN <- paste0(mainLibrary,"activity_labels.txt")
featuresFN <- paste0(mainLibrary,"features.txt")

##		Test filenames

subteFN <- paste0(testLibrary,"subject_test.txt")
xtestFN <- paste0(testLibrary,"X_test.txt")
ytestFN <- paste0(testLibrary,"y_test.txt")

##		Train filenames

subtrFN <- paste0(trainLibrary,"subject_train.txt")
xtrainFN <- paste0(trainLibrary,"X_train.txt")
ytrainFN <- paste0(trainLibrary,"y_train.txt")

##		Reading files in tables

activityX <- read.table(activityFN,header=F)
activityX <- paste0(activityX$V2,"")
featuresX <- read.table(featuresFN,header=F)
featuresX <- paste0(featuresX$V2,"")

subte <- as.data.table(read.table(subteFN,header=F))
subtr <- as.data.table(read.table(subtrFN,head=F))

xtest <- as.data.table(read.table(xtestFN,head=F))
xtrain <- as.data.table(read.table(xtrainFN,head=F))

ytest <- as.data.table(read.table(ytestFN,head=F))
ytrain <- as.data.table(read.table(ytrainFN,head=F))

ytest$V1 <- factor(ytest$V1)
ytrain$V1 <- factor(ytrain$V1)

setnames(subte,"V1","subjectID")
setnames(subtr,"V1","subjectID")

setnames(ytest,"V1","activity")
setnames(ytrain,"V1","activity")

setnames(xtrain,featuresX)
setnames(xtest,featuresX)


xtrain <- cbind(subtr,ytrain,xtrain)
xtest <- cbind(subte,ytest,xtest)

##		Merging the test and the train data

x <-rbind(xtrain,xtest)
rm(xtrain)
rm(xtest)

##

x$activity <- factor(x$activity,levels = levels(x$activity),labels=activityX)

newLabels1 <- names(x)[grep("mean()",names(x))]
newLabels2 <- names(x)[grep("std()",names(x))]
xn <-c(newLabels1,newLabels2)


xNew <- x[,1:2,with=FALSE]
xNew <- cbind(xNew,x[,xn,with=FALSE])

rm(x)
rm(subte)
rm(subtr)
rm(ytest)
rm(ytrain)
rm(activityFN)

#		This transforms the data in tidy data we want

xTidy <- xNew[,lapply(.SD,mean),by = c("subjectID","activity")]

##		Writing out the tables

write.table(xTidy,"./out/xTidy.txt",row.name=FALSE)
write.table(xNew,"./out/xNew.txt",row.name=FALSE)


