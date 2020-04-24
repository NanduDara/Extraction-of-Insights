##################Location Approach 1
H <- c(326, 308, 299, 295) 
M <- c("CHENNAI I","INDORE", "VIJAYAWADA", "MYSORE")

png(file = "1.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="City Name",ylab="Maximum Number of Good Customers"
        ,col="blue", main="Insights from Location")

# Save the file
dev.off()

H <- c(174, 150, 136, 135) 
M <- c("MYSORE","MADURAI", "VIJAYAWADA", "KARIMNAGAR")

png(file = "2.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="City Name",ylab="Maximum Number of Bad Customers"
        ,col="red", main="Insights from Location")

# Save the file
dev.off()

##################Location Approach 2
H <- c(1.00, 1.00, 0.88, 0.83) 
M <- c("KOTA","JHANSI", "PDY", "CHANDIGARH")

png(file = "3.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="City Name",ylab="Number of Good Customers with Maximum Probability"
        ,col=("blue"), main="Insights from Location")

# Save the file
dev.off()

H <- c(1, 0.71, 0.5, 0.46) 
M <- c("GHORAKPUR","VARANASI","ALIGARH","HUBLI")

png(file = "4.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="City Name",ylab="Number of Bad Customers with Maximum Probability"
        ,col=("red"), main="Insights from Location")

# Save the file
dev.off()

##################LoanAmount
H <- c(39.71, 27.44) 
M <- c("> 74%","<= 74%")

png(file = "5.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="LoanAmount compared to Threshold AssetCost",ylab="Percentage of finding Good Customers"
        ,col=("blue"), main="Insights from LoanAmount and AssetCost")

# Save the file
dev.off()

H <- c(20.02, 12.83) 
M <- c("> 74%","<= 74%")

png(file = "6.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="LoanAmount compared to Threshold AssetCost",ylab="Percentage of finding Bad Customers"
        ,col=("red"), main="Insights from LoanAmount and AssetCost")

# Save the file
dev.off()

##################EMI
H <- c(29.12, 37.12) 
M <- c("> 3.37%","<= 3.37%")

png(file = "7.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="EMI compared to Threshold EMI",ylab="Percentage of finding Good Customers"
        ,col=("blue"), main="Insights from EMI and LoanAmount")

# Save the file
dev.off()

H <- c(13.08, 19.77) 
M <- c("> 3.37%","<= 3.37%")

png(file = "8.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="EMI compared to Threshold EMI",ylab="Percentage of finding Bad Customers"
        ,col=("red"), main="Insights from EMI and LoanAmount")

# Save the file
dev.off()

##################Tenure
H <- c(36.92, 30.23) 
M <- c("> 3.8 years","<= 3.8 years")

png(file = "9.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="Tenure compared to Threshold Tenure",ylab="Percentage of finding Good Customers"
        ,col=("blue"), main="Insights from Tenure")

# Save the file
dev.off()

H <- c(0, 13.43) 
M <- c("> 3.8 years","<= 3.8 years")

png(file = "10.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="Tenure compared to Threshold Tenure",ylab="Percentage of finding Bad Customers"
        ,col=("red"), main="Insights from Tenure")

# Save the file
dev.off()

##################Business Stability Approach 1
H <- c(12.89, 54.21) 
M <- c("> 18.6 years","<= 18.6 years")

png(file = "11.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="Business Stabilty comapred to Threshold",ylab="Percentage of finding Good Customers"
        ,col=("blue"), main="Insights from Business Stability")

# Save the file
dev.off()

H <- c(6.21, 26.69) 
M <- c("> 18.6 years","<= 18.6 years")

png(file = "12.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="Business Stabilty comapred to Threshold",ylab="Percentage of finding Bad Customers"
        ,col=("red"), main="Insights from Business Stability")

# Save the file
dev.off()

##################Business Stability Approach 2
H <- c(29.41, 35.29) 
M <- c("> 11.1 years","<= 11.1 years")

png(file = "13.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="Business Stabilty if Stability is Confirmed compared to Threshold",ylab="Percentage of finding Good Customers"
        ,col=("blue"), main="Insights from Business Stability and Stability Confirmed")

# Save the file
dev.off()

H <- c(10.59, 24.71) 
M <- c("> 11.1 years","<= 11.1 years")

png(file = "14.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="Business Stabilty if Stability is Confirmed compared to Threshold",ylab="Percentage of finding Bad Customers"
        ,col=("red"), main="Insights from Business Stability and Stability Confirmed")

# Save the file
dev.off()

##################Address Confirmed
H <- c(65.86, 0.21) 
M <- c("Confirmed","Not Confirmed")

png(file = "15.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="Address Confirmed or Not",ylab="Percentage of finding Good Customers"
        ,col=("blue"), main="Insights from Address Confirmed")

# Save the file
dev.off()

H <- c(32.37, 0.11) 
M <- c("Confirmed","Not Confirmed")

png(file = "16.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="Address Confirmed or Not",ylab="Percentage of finding Bad Customers"
        ,col=("red"), main="Insights from Address Confirmed")

# Save the file
dev.off()

##################Political Link
H <- c(0.71, 64.91) 
M <- c("Yes","No")

png(file = "17.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="There is Political Link or Not",ylab="Percentage of finding Good Customers"
        ,col=("blue"), main="Insights from Political Link")

# Save the file
dev.off()

H <- c(0.56, 31.83) 
M <- c("Yes","No")

png(file = "18.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="There is Political Link or Not",ylab="Percentage of finding Bad Customers"
        ,col=("red"), main="Insights from Political Link")

# Save the file
dev.off()

##################Image Confirmed
H <- c(64.67, 1.31) 
M <- c("Yes","No")

png(file = "19.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="Person's Image taking loan Confirmed or Not",ylab="Percentage of finding Good Customers"
        ,col=("blue"), main="Insights from Image Confirmed")

# Save the file
dev.off()

H <- c(31.95, 0.45) 
M <- c("Yes","No")

png(file = "20.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="Person's Image taking loan Confirmed or Not",ylab="Percentage of finding Bad Customers"
        ,col=("red"), main="Insights from Image Confirmed")

# Save the file
dev.off()

##################EMI and Income
H <- c(18.1, 50.21) 
M <- c("> 35.55%","<= 35.55%")

png(file = "21.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="Percentage of EMI to Income compared to Threshold",ylab="Percentage of finding Good Customers"
        ,col=("blue"), main="Insights from EMI and Income per Month")

# Save the file
dev.off()

H <- c(8.15, 23.54) 
M <- c("> 35.55%","<= 35.55%")

png(file = "22.jpg")

# Plot the bar chart 
barplot(H,names.arg=M,xlab="Percentage of EMI to Income compared to Threshold",ylab="Percentage of finding Bad Customers"
        ,col=("red"), main="Insights from EMI and Income per Month")

# Save the file
dev.off()