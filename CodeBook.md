Transformations.

input:	activity_labels.txt		output:	activityX data frame (6*2)
input:	activityX dataframe(6*2)	output: activityX string vector (6*1)	only activity names
input:	features.txt			output:	featuresX data frame (561*2)
input:	featuresX dataframe		output: featuresX string vector (561*1)	only feature names
input:	subject_test.txt		output: subte (data.table) (2947*1)
input:	subject_train.txt		output: subtr (data.table) (7352*1)
input:	X_test.txt			output: xtest (data.table) (2947*561)
input:	X_train.txt			output: xtrain (data.table) (7352*561)
input:	y_test.txt			output: ytest (data.table) (2947*1)
input:	y_train.txt			output: ytrain (data.table) (7352*1)

input:	subte(2947*1)			output: subte with column1: "subjectID"
input:	subtr(7352*1)			output: subtr with column1: "subjectID"
input:	ytest(2947*1)			output:	ytest with column1: "activity"
input:	ytrain(7352*1)			output:	ytrain with column1: "activity"
input:	xtrain(7352*561)		output:	xtrain with columnV1:V561 replacing with features
input:	xtest(2947*1)			output:	xtest with columnV1:V561 replacing with features

input:	xtrain(7352*561)		output xtrain(7352*563), adding the subjectID and activity to the beginning
input:	xtest(2947*561)			output xtest(2947*563), adding the subjectID and activity to the beginning

input: xtrain(7352*561),xtest(2947*561)	output x(10299*563) merging the data

deleting from the workspace the unnecessary xtrain and xtest
