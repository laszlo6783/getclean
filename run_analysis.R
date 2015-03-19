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

subte$V1 <- factor(subte$V1)
subtr$V1 <- factor(subtr$V1)
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


xNew <- x[,1:8,with=FALSE]
xNew <- cbind(xNew,x[,43:48,with=FALSE])
xNew <- cbind(xNew,x[,83:88,with=FALSE])
xNew <- cbind(xNew,x[,123:128,with=FALSE])
xNew <- cbind(xNew,x[,163:168,with=FALSE])
xNew <- cbind(xNew,x[,203:206,with=FALSE])
xNew <- cbind(xNew,x[,216:217,with=FALSE])
xNew <- cbind(xNew,x[,229:230,with=FALSE])
xNew <- cbind(xNew,x[,242:243,with=FALSE])
xNew <- cbind(xNew,x[,255:256,with=FALSE])
xNew <- cbind(xNew,x[,268:273,with=FALSE])
xNew <- cbind(xNew,x[,347:352,with=FALSE])
xNew <- cbind(xNew,x[,426:431,with=FALSE])
xNew <- cbind(xNew,x[,505:506,with=FALSE])
xNew <- cbind(xNew,x[,531:532,with=FALSE])
xNew <- cbind(xNew,x[,544:545,with=FALSE])

rm(x)
rm(subte)
rm(subtr)
rm(ytest)
rm(ytrain)
rm(activityFN)

tidyColnames <- paste0("average_",names(xNew)[3:68])

#		This transforms the data in tidy data we want

xTidy <- xNew[,lapply(.SD,mean),by = c("subjectID","activity")]

##		Writing out the tables

write.table(xTidy,"./out/xTidy.txt",row.name=FALSE)
write.table(xNew,"./out/xNew.txt",row.name=FALSE)