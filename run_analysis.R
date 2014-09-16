setwd("E://rwork//hw")

#1.Merges the training and the test sets to create one data set.
dat<-rbind(read.table("X_train.txt",as.is=T),  
           read.table("X_test.txt",as.is=T)) 
subject<-rbind(read.table("subject_train.txt",as.is=T),
               read.table("subject_test.txt",as.is=T))
activity<-rbind(read.table("y_train.txt",as.is=T),
                read.table("y_test.txt",as.is=TE))

#3.Uses descriptive activity names to name the activities in the data set
#4.Appropriately labels the data set with descriptive variable names. 
col_names<-c(read.table("features.txt",as.is=T)[,2],"subject","activity")
activity_label<-read.table("activity_labels.txt",as.is=T)
dat<-cbind(dat,subject,activity)
colnames(dat)<-col_names
dat$activity<-factor(dat$activity,levels = activity_label[,1],
                     labels = activity_label[,2])

#2.Extracts only the measurements on the mean
# and standard deviation for each measurement. 
tidy_dat<-dat[,c(grep("mean()|std()",col_names),562,563)]

#5.From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable
# for each activity and each subject.
mean_tidy_dat<-aggregate(.~subject+activity,data=tidy_dat,mean)
write.table(mean_tidy_dat,"tidy_dat.txt",row.names = F) 
