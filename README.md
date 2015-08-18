---
title: "README"
---
=========================================

The REPO includes the following files:

1. 'README.md'

2. CodeBook.md: Shows information about the experiment where data comes from,  the variables measured and used to generate the output datasets of the script.

3. 'run_analysis.R': the script to tidy the original data.[1] 

4. 'dataset.txt': txt file containing the data frame ouput of the script.[2]

5. 'meanTable.txt': file containing the table output from the script.[3]

#run_analysis script
The script "run_analysis.R" creates one Data Frame (dataset), one table (meanTable) and two txt files containing the data in the Data Frame and 
Table (dataset.txt and meanTable.txt).
The first Data Set (dataset) contains the mean and standard deviation for each measurement specified in "Variable Information" section.
The table (meanTable) contains information about the same variables but it is group by the the subject doing the experiment (subject ID form 1-30) 
and the activity. The vlaues asigned to these groups is the mean of the values of the original records in the group.
###STEP1.
The script is prepared to run as long as the original data set is in the working directory. After running the script you have to download the raw data and put it in your working directory.
Bellow fyou have the R code to download the file 

```fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile = "./getdata-projectfiles-UCI HAR Dataset.zip", method = "curl")```

###STEP2.
The script load the dplyr package. You have to install this package before running the sript
```
library(dplyr)
```

###STEP3.
The script automatically unzip the file in a directory "data" in your working directory (the directory is only created if it doesn't exist).Data Sets are included in the "./data/UCI HAR Dataset" Directory.
```
unzip("./getdata-projectfiles-UCI HAR Dataset.zip", exdir = "./data")
```

###STEP4.
The scritpt loades The files containing the data into a List of Data Frames in R (Fich). These files are loaded:
-"./test/subject_test.txt"   
-"./test/X_test.txt"         
-"./test/y_test.txt"        
-"./train/subject_train.txt" 
-"./train/X_train.txt"       
-"./train/y_train.txt" 
And also the features and activity data.
```
setwd("./data/UCI HAR Dataset/")
list <- c(list.files("./test",pattern= "*.txt",full.names = TRUE),
          list.files("./train",pattern= "*.txt",full.names = TRUE))
n=1
Fich=list(1:length(list))
for (file in list){
  Fich[[n]]<-read.table(file, sep="",header=FALSE)
   n=n+1
}
read.table("./features.txt", sep="", header=FALSE)->features
read.table("./activity_labels.txt", sep="",header=FALSE)->activities
```

###STEP5.
The script join the data in the training and data set all together trough rbind and cbind.it also removes the List and data frames no longer needed.
```
rbind(Fich[[1]],Fich[[4]])->subject
rbind(Fich[[2]], Fich[[5]])->dataset
rbind(Fich[[3]],Fich[[6]])->activ
rm(Fich)
cbind(subject,activ,dataset)->dataset 
colnames(dataset)<- c(1:length(dataset))
rm(subject,activ)
```

###STEP6.
The script load in the list "elegidas" the variables of the mean and Standard Deviation we want to downselect. There are some original variables containing "mean" in the name but not realted to the mean of measurements, so in importan to use "fixed=TRUE" and "ignore.case=TRUE" as arguments of grep command. Also it's important to rename the original column names as there are replicated names because of the merge of the data.
```
elegidas <- c(grep("mean()",features[,2], fixed=TRUE, value=FALSE, ignore.case = FALSE),
grep("std()",features[,2],fixed=TRUE, value=FALSE,ignore.case = FALSE))
select(dataset, c(1,2,elegidas+2))->dataset

```
###STEP7.
Now the script labels the data set with descriptive variable names contained in features file. Previously we use "makes.names" function to clean up some incorrect character "(),-"
```
make.names(c("ID","Activity",
             grep("mean()",features[,2], fixed=TRUE, value=TRUE, ignore.case = FALSE),
             grep("std()",features[,2], fixed=TRUE, value=TRUE,ignore.case = FALSE)))->names(dataset)
```
###STEP8.
Then set descriptive activity names in the data set according to "activity_labels.txt" in the original data.
```
factor(dataset[,2], labels = activities[,2])-> dataset[,2]
```
###STEP9.
Noe the script summarize the data, creating a table with the mean of each variable grouped by Subject ID & Activity.
```
group_by(dataset, ID,Activity) %>% summarise_each(funs(mean(.)))-> meanTable

```
###STEP10.
And finally writting the data to txt files (datset.txt, meanTable.txt)
```
write.table(meanTable, file="../meanTable.txt", row.names=FALSE)
write.table(dataset, file="../dataset.txt", row.names=FALSE)
```


