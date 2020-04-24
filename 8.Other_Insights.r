# This file will extract the insights of attributes ADDRESSCONFIRMED, POLITICALLINK,
# and IMGCONFIRM which are binary attributes

getwd()
setwd("C:/Users/NANDU/Desktop/Assignment")
getwd()

# Reading the original after replacing all the empty values into 'NA'
data <- read.csv("Assignment DS.csv")
data$X <- NULL
rows <- nrow(data)

# To explain the characteristics of Good customers and Bad customers
# we now divivded the data on the basis of Good and Bad values in Data

# Good value is encoded as 'Good' in the Good_Bad Attribute 
Good <- subset(data, Good_Bad=='Good')
# Bad value is encoded as 'Bad' in the Good_Bad Attribute 
Bad <- subset(data, Good_Bad=='Bad')

# Now the Good data frame has only good customers so it will help
# in extracting the insights of good customers and vice-versa.

# we now extract the insights based on ADDRESSCONFIRMED attribute
c1 <- 0; c2 <- 0
for(i in 1:nrow(Good)){
  if(Good$ADDRESSCONFIRMED[i] == 'Y'){
    c1 <- c1+1
  }else if(Good$ADDRESSCONFIRMED[i] == 'N'){
    c2 <- c2+1
  }
}
per1 <- round(c1/nrow(data)*100, digits=2)
per2 <- round(c2/nrow(data)*100, digits=2)

paste("If the address is confirmed then percentage of good customers found is:",per1,"%")
paste("If the address is not confirmed then percentage of good customers found is:",per2,"%")

# Now the Bad data frame has only bad customers so it will help
# in extracting the insights of bad customers and vice-versa.
c1 <- 0; c2 <- 0
for(i in 1:nrow(Bad)){
  if(Bad$ADDRESSCONFIRMED[i] == 'Y'){
    c1 <- c1+1
  }else if(Bad$ADDRESSCONFIRMED[i] == 'N'){
    c2 <- c2+1
  }
}
per1 <- round(c1/nrow(data)*100, digits=2)
per2 <- round(c2/nrow(data)*100, digits=2)

paste("If the address is confirmed then percentage of bad customers found is:",per1,"%")
paste("If the address is not confirmed then percentage of bad customers found is:",per2,"%")

######################################################################################
# Reading the original after replacing all the empty values into 'NA'
data <- read.csv("Assignment DS.csv")
data$X <- NULL
rows <- nrow(data)

# To explain the characteristics of Good customers and Bad customers
# we now divivded the data on the basis of Good and Bad values in Data

# Good value is encoded as '2' in the Target Attribute 
Good <- subset(data, Good_Bad=='Good')
# Bad value is encoded as '1' in the Target Attribute 
Bad <- subset(data, Good_Bad=='Bad')

# Now the Good data frame has only good customers so it will help
# in extracting the insights of good customers and vice-versa.

# we now extract the insights based on POLITICALLINK attribute
c1 <- 0; c2 <- 0
for(i in 1:nrow(Good)){
  if(Good$POLITICALLINK[i] == 'Y'){
    c1 <- c1+1
  }else if(Good$POLITICALLINK[i] == 'N'){
    c2 <- c2+1
  }
}
per1 <- round(c1/nrow(data)*100, digits=2)
per2 <- round(c2/nrow(data)*100, digits=2)

paste("If there is a political link to individual taking loan then percentage of good customers found is:",per1,"%")
paste("If there is no political link to individual taking loan then percentage of good customers found is:",per2,"%")

# Now the Bad data frame has only bad customers so it will help
# in extracting the insights of bad customers and vice-versa.
c1 <- 0; c2 <- 0
for(i in 1:nrow(Bad)){
  if(Bad$POLITICALLINK[i] == 'Y'){
    c1 <- c1+1
  }else if(Bad$POLITICALLINK[i] == 'N'){
    c2 <- c2+1
  }
}
per1 <- round(c1/nrow(data)*100, digits=2)
per2 <- round(c2/nrow(data)*100, digits=2)

paste("If there is a political link to individual taking loan then percentage of bad customers found is:",per1,"%")
paste("If there is no political link to individual taking loan then percentage of bad customers found is:",per2,"%")

######################################################################################
# Reading the original after replacing all the empty values into 'NA'
data <- read.csv("Assignment DS.csv")
data$X <- NULL
rows <- nrow(data)

# To explain the characteristics of Good customers and Bad customers
# we now divivded the data on the basis of Good and Bad values in Data

# Good value is encoded as '2' in the Target Attribute 
Good <- subset(data, Good_Bad=='Good')
# Bad value is encoded as '1' in the Target Attribute 
Bad <- subset(data, Good_Bad=='Bad')

# Now the Good data frame has only good customers so it will help
# in extracting the insights of good customers and vice-versa.

# we now extract the insights based on IMGCONFIRM attribute
c1 <- 0; c2 <- 0
for(i in 1:nrow(Good)){
  if(Good$IMGCONFIRM[i] == 'Y'){
    c1 <- c1+1
  }else if(Good$IMGCONFIRM[i] == 'N'){
    c2 <- c2+1
  }
}
per1 <- round(c1/nrow(data)*100, digits=2)
per2 <- round(c2/nrow(data)*100, digits=2)

paste("If the image of person taking loan is confirmed then percentage of good customers found is:",per1,"%")
paste("If the image of person taking loan is not confirmed then percentage of good customers found is:",per2,"%")

# Now the Bad data frame has only bad customers so it will help
# in extracting the insights of bad customers and vice-versa.
c1 <- 0; c2 <- 0
for(i in 1:nrow(Bad)){
  if(Bad$IMGCONFIRM[i] == 'Y'){
    c1 <- c1+1
  }else if(Bad$IMGCONFIRM[i] == 'N'){
    c2 <- c2+1
  }
}
per1 <- round(c1/nrow(data)*100, digits=2)
per2 <- round(c2/nrow(data)*100, digits=2)

paste("If the image of person taking loan is confirmed then percentage of bad customers found is:",per1,"%")
paste("If the image of person taking loan is not confirmed then percentage of bad customers found is:",per2,"%")
