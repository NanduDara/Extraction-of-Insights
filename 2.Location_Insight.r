getwd()
setwd("C:/Users/NANDU/Desktop/Assignment")
getwd()

#Reading the preprocessed data generated from the Preprocessing.r
data <- read.csv("Pre_Data.csv")
data$X <- NULL
rows <- nrow(data)

# To explain the characteristics of Good customers and Bad customers
# we now divivded the data on the basis of Good and Bad values in Data

# Good value is encoded as '2' in the Target Attribute 
Good <- subset(data, Target>1)
# Bad value is encoded as '1' in the Target Attribute 
Bad <- subset(data, Target<2)

# Now the Good data frame has only good customers so it will help
# in extracting the insights of good customers and vice-versa.

# For extracting insights based on Location

library('plyr')
e <- count(data, 'Location')
max(e$freq)

#finding unique values in attribute Location from complete customers data
n <- 0
for(value in unique(e$Location)){
  n <- n+1
}
print(n)
value_l <- rep(0,n)
i <- 1
for(value in unique(data$LOCATIONNAME)){
  value_l[i] <- value
  #print(value_l[i])
  i <- i+1
}

library('plyr')
a <- count(Good, 'Location')
max(a$freq)
tg <- (max(a$freq))/nrow(data)
sort(a$freq, decreasing = TRUE)

#finding unique values in attribute Location from good customers data
n1 <- 0
for(value in unique(a$Location)){
  n1 <- n1+1
}
print(n1)

# Finding the values which is most repeated in attribute Location from good customers data
for(i in 1:n1){
  if(a$freq[i] == max(a$freq)){
    b <- a$Location[i]
  }
}
b <- as.character(b)

library('plyr')
c <- count(Bad, 'Location')
max(c$freq)
tb <- (max(c$freq))/nrow(data)

#finding unique values in attribute Location from bad customers data
n2 <- 0
for(value in unique(c$Location)){
  n2 <- n2+1
}
print(n2)

# Finding the values which is most repeated in attribute Location from bad customers data
for(i in 1:n2){
  if(c$freq[i] == max(c$freq)){
    d <- c$Location[i]
  }
}
d <- as.character(d)

b <- as.numeric(b)
d <- as.numeric(d)
#This approach is judging location with entire data
paste("Good Customers are from the Location:",value_l[b])
paste("Bad Customers are from the Location:",value_l[d])

#The another approach is judging location based on its good and bad 
#customers along with the entire data.

# This is for telling city with large number of good customers and
# and along with high probability of being good

# Finding the good customers probability of every city and storing in 'good_l' data frame
good_l <- data.frame(name <- rep(0, n), count <- rep(0, n), prob <- rep(0, n))
colnames(good_l)[1] <- "name"
colnames(good_l)[2] <- "count"
colnames(good_l)[3] <- "prob"
k <- 1
for(i in 1:n){
  for(j in 1:n1){
    if(e$Location[i] == a$Location[j]){
      good_l$name[k] <- e$Location[i]
      good_l$count[k] <- a$freq[j]
      good_l$prob[k] <- a$freq[j]/e$freq[i]
      k <- k+1
      break
    }
  }
}
max(good_l$prob)

j <- 0
for(i in 1:n){
  if(good_l$prob[i] == max(good_l$prob)){
    j <- j+1
  }
}

# Finding city with high probability of good cusstomers and storing in another data frame 'result_g'
result_g <- data.frame(name <- rep(0, j), count <- rep(0, j))
colnames(result_g)[1] <- "name"
colnames(result_g)[2] <- "count"
j <- 1
for(i in 1:n){
  if(good_l$prob[i] == max(good_l$prob)){
    result_g$name[j] <- good_l$name[i]
    result_g$count[j] <- good_l$count[i]
    j <- j+1
  }
}

# Resulting city with high probability and more number of good customers
for(i in 1:(j-1)){
  if(result_g$count[i] == max(result_g$count)){
    c_name <- result_g$name[i]
    g_customers <- result_g$count[i]
  }
}
paste("Good Customers are from the Location:",value_l[c_name],"with good customers of:",g_customers)

# Finding the bad customers probability of every city and storing in 'bad_l' data frame
bad_l <- data.frame(name <- rep(0, n), count <- rep(0, n), prob <- rep(0, n))
colnames(bad_l)[1] <- "name"
colnames(bad_l)[2] <- "count"
colnames(bad_l)[3] <- "prob"
k <- 1
for(i in 1:n){
  for(j in 1:n2){
    if(e$Location[i] == c$Location[j]){
      bad_l$name[k] <- e$Location[i]
      bad_l$count[k] <- c$freq[j]
      bad_l$prob[k] <- c$freq[j]/e$freq[i]
      k <- k+1
      break
    }
  }
}
max(bad_l$prob)

j <- 0
for(i in 1:n){
  if(bad_l$prob[i] == max(bad_l$prob)){
    j <- j+1
  }
}

# Finding city with high probability of bad cusstomers and storing in another data frame 'result_b'
result_b <- data.frame(name <- rep(0, j), count <- rep(0, j))
colnames(result_b)[1] <- "name"
colnames(result_b)[2] <- "count"
j <- 1
for(i in 1:n){
  if(bad_l$prob[i] == max(bad_l$prob)){
    result_b$name[j] <- bad_l$name[i]
    result_b$count[j] <- bad_l$count[i]
    j <- j+1
  }
}

# Resulting city with high probability and more number of bad customers
for(i in 1:(j-1)){
  if(result_b$count[i] == max(result_b$count)){
    c_name <- result_b$name[i]
    b_customers <- result_b$count[i]
  }
}
paste("Bad Customers are from the Location:",value_l[c_name],"with bad customers of:",b_customers)
