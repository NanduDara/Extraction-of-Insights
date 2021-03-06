getwd()
setwd("C:/Users/NANDU/Desktop/Assignment")
getwd()

# Reading the original after replacing all the empty values into 'NA'
data <- read.csv("Assignment DS.csv")
data$X <- NULL
rows <- nrow(data)

# We eliminate the records which have NA values in EMI attribute
data1 <- data
for(i in 1:nrow(data1)){
  if((is.na(data1$EMI[i]))==TRUE)
  {
    print("This row is gonna eliminated")
    print(i)
    data <- data[!grepl(i, data$UID), ]
  }
}

write.csv(data, "Data6.csv")
data <- read.csv("Data6.csv")
data$X <- data$UID <- NULL
row <- nrow(data)
for(i in 1:row){
  data$UID[i] <- i
}
data1 <- data

# We eliminate the records which have NA values in NETINCOMEPERMONTH attribute
data1 <- data
for(i in 1:nrow(data1)){
  if((is.na(data1$NETINCOMEPERMONTH[i]))==TRUE)
  {
    print("This row is gonna eliminated")
    print(i)
    data <- data[!grepl(i, data$UID), ]
  }
}

write.csv(data, "Data7.csv")
data <- read.csv("Data7.csv")
data$X <- data$UID <- NULL
row <- nrow(data)
for(i in 1:row){
  data$UID[i] <- i
}
data1 <- data

# We eliminate the records which have 0 as a value in NETINCOMEPERMONTH attribute
for(i in 1:nrow(data1)){
  if(data1$NETINCOMEPERMONTH[i] == 0)
  {
    print("This row is gonna eliminated")
    print(i)
    data <- data[!grepl(i, data$UID), ]
  }
}

write.csv(data, "Data8.csv")
data <- read.csv("Data8.csv")
data$X <- data$UID <- NULL
row <- nrow(data)
for(i in 1:row){
  data$UID[i] <- i
}
data1 <- data

# We now have remained with preprosessed data
# We have to extract insight on percent of emi to net income per month
# taken by the customers which leads to good or bad
# Net income per month = income employemnt - total expenses
for(i in 1:nrow(data)){
  data$EtoI_Percent[i] <- ((data$EMI[i])/(data$NETINCOMEPERMONTH[i]))*100
  data$EtoI_Percent[i] <- round(data$EtoI_Percent[i], digits = 2)
}
thres <- round(mean(data$EtoI_Percent), digits=2)

# To explain the characteristics of Good customers and Bad customers
# we now divivded the data on the basis of Good and Bad values in Data

# Good value is encoded as '2' in the Target Attribute 
Good <- subset(data, Good_Bad=='Good')
# Bad value is encoded as '1' in the Target Attribute 
Bad <- subset(data, Good_Bad=='Bad')

# Now the Good data frame has only good customers so it will help
# in extracting the insights of good customers and vice-versa.
c1 <- 0; c2 <- 0
for(i in 1:nrow(Good)){
  if(Good$EtoI_Percent[i] > thres){
    c1 <- c1+1
  }else if(Good$EtoI_Percent[i] <= thres){
    c2 <- c2+1
  }
}
per1 <- round(c1/nrow(data)*100, digits=2)
per2 <- round(c2/nrow(data)*100, digits=2)

paste("If emi to individual's income per month is greater than",thres,"% then percentage of good customers found is:",per1,"%")
paste("If emi to individual's income per month is less than or equal to",thres,"% then percentage of good customers found is:",per2,"%")

# Now the Bad data frame has only bad customers so it will help
# in extracting the insights of bad customers and vice-versa.
c1 <- 0; c2 <- 0
for(i in 1:nrow(Bad)){
  if(Bad$EtoI_Percent[i] > thres){
    c1 <- c1+1
  }else if(Bad$EtoI_Percent[i] <= thres){
    c2 <- c2+1
  }
}
per1 <- round(c1/nrow(data)*100, digits=2)
per2 <- round(c2/nrow(data)*100, digits=2)

paste("If emi to individual's income per month is greater than",thres,"% then percentage of bad customers found is:",per1,"%")
paste("If emi to individual's income per month is less than or equal to",thres,"% then percentage of bad customers found is:",per2,"%")
