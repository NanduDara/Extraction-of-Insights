getwd()
setwd("C:/Users/NANDU/Desktop/Assignment")
getwd()

#Reading the preprocessed data generated from the Preprocessing.r
data <- read.csv("Pre_Data.csv")
data$X <- NULL
rows <- nrow(data)

# We eliminate the records which have NA values in ASSETCOST attribute
data1 <- data
for(i in 1:nrow(data1)){
  if((is.na(data1$ASSETCOST[i]))==TRUE)
  {
    print("This row is gonna eliminated")
    print(i)
    data <- data[!grepl(i, data$UID), ]
  }
}

write.csv(data, "Data2.csv")
data <- read.csv("Data2.csv")
data$X <- data$UID <- NULL
row <- nrow(data)
for(i in 1:row){
  data$UID[i] <- i
}
data1 <- data

# We eliminate the records which have 0 as a value in ASSETCOST attribute
for(i in 1:nrow(data1)){
  if(data1$ASSETCOST[i] == 0)
  {
    print("This row is gonna eliminated")
    print(i)
    data <- data[!grepl(i, data$UID), ]
  }
}

write.csv(data, "Data3.csv")
data <- read.csv("Data3.csv")
data$X <- data$UID <- NULL
row <- nrow(data)
for(i in 1:row){
  data$UID[i] <- i
}
data1 <- data

# We have to extract insight on loan amount taken by the customers which leads to good or bad
total <- 0
for(i in 1:nrow(data)){
  data$Amount_Percent[i] <- ((data$LOANAMOUNT[i])/(data$ASSETCOST[i]))*100
  data$Amount_Percent[i] <- round(data$Amount_Percent[i], digit = 1)
}
thres <- round(mean(data$Amount_Percent), digit=1)

# To explain the characteristics of Good customers and Bad customers
# we now divivded the data on the basis of Good and Bad values in Data

# Good value is encoded as '2' in the Target Attribute 
Good <- subset(data, Target>1)
# Bad value is encoded as '1' in the Target Attribute 
Bad <- subset(data, Target<2)

# Now the Good data frame has only good customers so it will help
# in extracting the insights of good customers and vice-versa.
c1 <- 0; c2 <- 0
for(i in 1:nrow(Good)){
  if(Good$Amount_Percent[i] > thres){
    c1 <- c1+1
  }else if(Good$Amount_Percent[i] <= thres){
    c2 <- c2+1
  }
}
per1 <- round(c1/nrow(data)*100, digits=2)
per2 <- round(c2/nrow(data)*100, digits=2)

paste("If loan amount given is greater than",thres,"% of asset cost then percentage of good customers found is:",per1,"%")
paste("If loan amount given is less than or equal to",thres,"% of asset cost then percentage of good customers found is:",per2,"%")

# Now the Bad data frame has only bad customers so it will help
# in extracting the insights of bad customers and vice-versa.
c1 <- 0; c2 <- 0
for(i in 1:nrow(Bad)){
  if(Bad$Amount_Percent[i] > thres){
    c1 <- c1+1
  }else if(Bad$Amount_Percent[i] <= thres){
    c2 <- c2+1
  }
}
per1 <- round(c1/nrow(data)*100, digits=2)
per2 <- round(c2/nrow(data)*100, digits=2)

paste("If loan amount given is greater than",thres,"% of asset cost then percentage of bad customers found is:",per1,"%")
paste("If loan amount given is less than or equal to",thres,"% of asset cost then percentage of bad customers found is:",per2,"%")
