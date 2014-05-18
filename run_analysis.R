# 1. Read and merge data files
train=read.table("UCI\ HAR\ Dataset/train/X_train.txt")
test=read.table("UCI\ HAR\ Dataset/test/X_test.txt")
data=rbind(train,test)

# 2. Read and merge label files
trainlabel=read.table("UCI\ HAR\ Dataset/train/y_train.txt")
testlabel=read.table("UCI\ HAR\ Dataset/test/y_test.txt")
label=c(trainlabel[,1],testlabel[,1])

# 3. Read and merge subject files
trainsubjects=read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
testsubjects=read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
subjects=c(trainsubjects[,1],testsubjects[,1])

# 4. Descriptive activity names 
activities=c("walking","walkingUpstairs","walkingDownstairs","sitting","standing","laying")
label=activities[label]

# 5. Extracts mean and std columns
f=c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266,271,345:350,424,429,503,504,516,517,529,530,542,543)
data=data[,f]

# 6. Creates descriptive activity names for the columns
features=read.table("UCI\ HAR\ Dataset/features.txt",stringsAsFactors =FALSE)
features=features[f,2]
features=gsub("-","_",gsub("\\)","",gsub("\\(","",features)))

# 7. Creates interactions subjects-label
interac=interaction(subjects,label,drop=TRUE)

# 8. Creates a two column data.frame with all the interactions activity-subject
kk=strsplit(names(tapply(data[,1],interac,mean)),"\\.")
kk=(unlist(kk))
dim(kk)=c(2,length(kk)/2)
kk=as.data.frame(t(kk))
kk[,1]=as.numeric(kk[,1])

# 9. For each variable add, to the data.frame, a column with its mean per activity-subject combination 
for (i in 1:dim(data)[2]){
     kk=cbind(kk,as.numeric(tapply(data[,i],interac,mean)))
}

# 10. Attach the column names to the data.frame
names(kk)=c("subject","activity",features)

# 11. Write the tidy data table
write.table(kk,"tidyData.txt",row.names=FALSE,quote =FALSE,sep=";")


