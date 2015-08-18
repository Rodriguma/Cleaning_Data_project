## Check if the raw data file exists
if(!file.exists("./getdata-projectfiles-UCI HAR Dataset.zip"))
{stop(call.=TRUE,"You should download the data to your working directory from the URL\n
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip") }

if(!file.exists("./data")){dir.create("./data")}

## Bellow you have the code to download the file 
##fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## download.file(fileURL,destfile = "./getdata-projectfiles-UCI HAR Dataset.zip", #
##              method = "curl")   
## load the needed R packages
library(dplyr)
## Unzip the file
unzip("./getdata-projectfiles-UCI HAR Dataset.zip", exdir = "./data")
## Then we'll read the files into R as different elements of a List(Fich)
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
## Merging the Test And Training Data Set values
rbind(Fich[[1]],Fich[[4]])->subject
rbind(Fich[[2]], Fich[[5]])->dataset
rbind(Fich[[3]],Fich[[6]])->activ
rm(Fich)
cbind(subject,activ,dataset)->dataset 
colnames(dataset)<- c(1:length(dataset))
rm(subject,activ)
## Extract the measurements on the mean and Standar Deviation(std)
elegidas <- c(grep("mean()",features[,2], fixed=TRUE, value=FALSE, ignore.case = FALSE),
grep("std()",features[,2],fixed=TRUE, value=FALSE,ignore.case = FALSE))
select(dataset, c(1,2,elegidas+2))->dataset
## Labelling the data set with descriptive variable names
make.names(c("ID","Activity",
             grep("mean()",features[,2], fixed=TRUE, value=TRUE, ignore.case = FALSE),
             grep("std()",features[,2], fixed=TRUE, value=TRUE,ignore.case = FALSE)))->names(dataset)
## Set descriptive activity names in the data set
factor(dataset[,2], labels = activities[,2])-> dataset[,2]
rm (activities, features)
## Creating a dataset containing the mean of each variable grouped by Subject ID
## & Activity.
group_by(dataset, ID,Activity) %>% summarise_each(funs(mean(.)))-> meanTable
## Write the output datasets to a txt file
write.table(meanTable, file="../meanTable.txt", row.names=FALSE)
write.table(dataset, file="../dataset.txt", row.names=FALSE)