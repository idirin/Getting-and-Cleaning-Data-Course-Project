install.packages("dplyr")
library(dplyr)

#Download and unzip the project files onz if nt alreadz available

if(!file.exists("UCI HAR Dataset/activity_labels.txt")){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile = "getdata_projectfiles_FUCI_AR_Dataset.zip")
  unzip("getdata_projectfiles_FUCI_AR_Dataset.zip")
}


# read Activity labels and features and asing clear column names

activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt")

colnames(activity_labels)<-c("ID_ACTIVITY","DESC_ACTIVITY")


features<-read.table("UCI HAR Dataset/features.txt")

#read training and test datasets and join them in a single dataset. 
#Colnames modify in order to be more clear.
training_dataset<-read.table("UCI HAR Dataset/train/X_train.txt")
test_dataset<-read.table("UCI HAR Dataset/test/X_test.txt")

dataset<-rbind(training_dataset,test_dataset)
colnames(dataset)<-features[,2]


#read training and test labels and join them in a single label dataframe.
#Colnames modify in order to be more clear.

training_labels<-read.table("UCI HAR Dataset/train/Y_train.txt")
test_labels<-read.table("UCI HAR Dataset/test/Y_test.txt")

labels<-rbind(training_labels,test_labels)
colnames(labels)<-"ID_ACTIVITY"


#read training and test subject data and join them in a single subject dataframe.
#Colnames modify in order to be more clear.

subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")

subject<-rbind(subject_train,subject_test)
colnames(subject)<-"SUBJECT"

# only mean and std columns are requested. meanfreq is also eliminated
dataset<-dataset[,grepl("mean|std",features[,2])] 
dataset<-dataset[,!grepl("meanFreq",colnames(dataset))] 

#Merge labels for providing descriptive activities
labels<-merge(x=labels,y=activity_labels,by.x="ID_ACTIVITY",by.y="ID_ACTIVITY")

dataset1<-cbind(subject,labels [,"DESC_ACTIVITY"],dataset )
colnames(dataset1)[1:2]<-c("SUBJECT","DESC_ACTIVITY")

View(dataset1)
#dataset1 has the 1st tidy dataset

#group dataset1 using mean agregation function, then concatenate Avg()
dataset2<- dataset1 %>% group_by(dataset1$`DESC_ACTIVITY`,dataset1$`SUBJECT`) %>% summarise_all("mean")
dataset2<-dataset2[,-c(3,4)]
colnames(dataset2)[1:2]<-c("DESC_ACTIVITY","SUBJECT")
colnames(dataset2)[3:ncol(dataset2)]<-paste(colnames(dataset2)[3:ncol(dataset2)],"-Avg()",sep="")
#dataset2 has the 2nd tidy dataset
View(dataset2)
