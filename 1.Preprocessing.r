#Hepls in setting the working directory which further 
#helps in storing the output files in particular location
getwd()
setwd("C:/Users/NANDU/Desktop/Assignment")
getwd()

#Read the csv file and formed the data frame named "data"
data <- read.csv("Assignment DS.csv")
row <- nrow(data)
#colname has been changed to "target"
colnames(data)[colnames(data)=="Good_Bad"] <- "target"
data[data == ''] <- NA

#unique function retreive the next value present in that attribute
#Here 'n' gives a count of total number of unique value present in the mentioned attribute
n <- 0
for(value in unique(data$target)){
  n <- n+1
}
print(n)

#Here storing all the unique values in the mentioned attribute in the 
#vector named "values" which further helps in one hot encoding of the 
#mentioned attribute 
values <- c(rep(0,n))
i <- 1
for(value in unique(data$target)){
  
  # The commented paet helps in varifying whether the attribute 
  #is having empty or NA values
  # if((value == "")  || is.na(value)){
  #   print("Yes")
  #   break;
  # }
  
  values[i] <- value
  print(values[i])
  i <- i+1
}

#Here we encoded the target attribute ("target") and stored all the corresponding
#encoded values in new attribute named ("Target")
#This is the method used for one hot encoding rather than using inbuilt functions
for(i in 1:nrow(data)){
  for(j in 1:n){
    if(data$target[i] == values[j]){
      data$Target[i] <- j
      break;
    }
  }
}

# This part will remove tuples having NA values in LOCATIONNAME attribute
data$LOCATIONNAME[data$LOCATIONNAME == " "] <- NA
data1 <- data
for(i in 1:nrow(data)){
  if((is.na(data1$LOCATIONNAME[i]))==TRUE)
  {
    print("This row is gonna eliminated")
    print(i)
    data <- data[!grepl(i, data$UID), ]
  }
}

write.csv(data, "Data.csv")
data <- read.csv("Data.csv")
data$X <- data$UID <- NULL
row <- nrow(data)
for(i in 1:row){
  data$UID[i] <- i
}
data1 <- data

#The following chunk of code helps in one hot encoding
#of attribute "LOCATIONNAME" and named new attribute
#"Location" which helps in further work
n1 <- 0
for(value in unique(data$LOCATIONNAME)){
  n1 <- n1+1
}
print(n1)

value_l <- rep(0,n1)
i <- 1
for(value in unique(data$LOCATIONNAME)){
  value_l[i] <- value
  print(value_l[i])
  i <- i+1
}

# This part of code eliminates the records having values in
# LOCATIONNAME attribute other than character type
# Because some values numeric in this attribute which is not fair 
for(i in 1:nrow(data)){
  for(j in 1:n1){
    if(data1$LOCATIONNAME[i] == value_l[j])
    {
      z <- as.character(data1$LOCATIONNAME[i])
      y <- as.numeric(z)
      print(y)
      check <- is.na(y)
      if(check == FALSE){
        print("This row is gonna eliminated")
        data <- data[!grepl(i, data$UID), ]
        break
      }
    }
  }
}
write.csv(data, "Data1.csv")
data <- read.csv("Data1.csv")
data$X <- data$UID <- NULL
row <- nrow(data)
for(i in 1:row){
  data$UID[i] <- i
}
data1 <- data
#And this preprocessing the LOCATIONNAME is remained with 9625 values instead of 10000 values.

n1 <- 0
for(value in unique(data$LOCATIONNAME)){
  n1 <- n1+1
}
print(n1)
for(i in 1:nrow(data)){
  for(j in 1:n1){
    if(data$LOCATIONNAME[i] == value_l[j]){
      data$Location[i] <- j
      break;
    }
  }
}

# The following code helps in replacing the empty and NA values of any attribute
# to the maximum repeating or mean value in that attribute
#install.packages('plyr')
library(plyr)
#count function from "plyr" library gives frequency of every value in mentioned Attribute
colnames(data)[colnames(data)=="Good_Bad"] <- "target"
a <- count(data, 'target')
max(a$freq)

#Printing value with maximum frequency i.e 6747
for(i in 1:n)
{
  if(a$freq[i] == max(a$freq))
  {
    b <- a$target[i]
  }
}
print(b)

#Replacing'NA' value to value with maximum frequency i.e '2'(Good)
#We assign NA to 'Good' value due to its high Frequency 
for(i in 1:row)
{
  if(is.na(data$target[i]) == "TRUE")
  {
    data$target[i] <- b
  }
}
print("Done")

for(i in 1:row){
  for(j in 1:n){
    if(data$target[i] == values[j]){
      data$Target[i] <- j
      break;
    }
  }
}

write.csv(data, "Pre_Data.csv")
