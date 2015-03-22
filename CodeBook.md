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
input:	xtest(2947*561)			output:	xtest with columnV1:V561 replacing with features

input:	xtrain(7352*561)		output xtrain(7352*563), adding the subjectID and activity to the beginning
input:	xtest(2947*561)			output xtest(2947*563), adding the subjectID and activity to the beginning

input: xtrain(7352*561),xtest(2947*561)	output x(10299*563) merging the data

deleting from the workspace the unnecessary xtrain and xtest tables

input: x(10299*563)			output: x(10299*563) with column activity with names: WALKING etc.
input: column names of x		output: newLabels1 containing labels with "mean()" inside character vector(46)
input: column names of x		output: newLabels2 containing labels with "std()" inside character vector (33)
input: newLabels1, newLabels2		output: xn labels with "mean()" AND "std()"inside character vector(79=46+33)
input: x (10299*563)			output: xNew (10299*2), the subjectID and the activity labels
input: xNew, x with the column		output: xNew(10299*81)
	labels xn containing mean() and std()

deleting the x,subte,subtr,ytest,ytrain and activityFN tables and variable

input:	xNew(10299*81)			output: xTidy(180*81) creating the tidy dataset

It is obvious the dataset row dimension because activities*subjects	6*30=180

The colmun names are the same than in the original work, except the first 2 column names:

subjectID and activity
