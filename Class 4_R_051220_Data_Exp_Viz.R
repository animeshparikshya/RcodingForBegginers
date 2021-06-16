#Working on a project
#Step 1 :- Business Problem - Define Problem 
#Step 2 :- Factors and hypothesis
#Step3: Data - Data dictionary/meta data
#Step4: Data Understanding - row/cols/data types/ missing values............
#Step5: Data manipulations/ cleaning
#Step6: Data Exploration and Viz - univariante and Bivariate 
#Step7: Create Model/ Validate Model

#Import dplyr lib
install.packages("dplyr")
library(dplyr)

#Install a new package
install.packages("ggplot2")
library(ggplot2)

#Set Working directory
setwd("C:/Users/Animesh.Parikshya/Documents/IIM Classes/R Classes/Dataset")
# use either / (one forward slash) or \\ (double back slash) for folder paths

#Read a csv file
titanic <- read.csv("titanic.csv")
titanic_Original <- titanic

#to check the string as factor
default.stringsAsFactors()



dim(titanic)
nrow(titanic)
ncol(titanic)

#names of the fields
names(titanic)

#data type
str(titanic)

#change to factor
titanic$Sex <- as.factor(titanic$Sex)
str(titanic)

#to check about a function 
?read.csv

#missing Values
is.na(titanic$Age)
sum(is.na(titanic$Age))
#column wise missing value
colSums(is.na(titanic))

#creating a temp vector

vec1 <- c(1,2,3,NA,4,NA,"")
is.na(vec1)

sum(is.na(vec1))
#NULL is different than NA
#double quotes "" are also counted as data points

#Data Manipulation 
#Filtering, Selecting data, deleting Col, Creating a new col, order, Grouping, 
#Merging

#Filtering
#dplyr

#Filter data for 3rd class Male passenger
maleClass3 <- filter(titanic,Pclass == 3 & Sex == "male")

#Base R , to get the rows
head(which(titanic$Pclass ==3 & titanic$Sex =="male"))

titanic1 <- titanic[titanic$Pclass ==3 & titanic$Sex =="male",]

#Select command
maleClass3_4col <-select(filter(titanic,Pclass == 3 & Sex == "male"), Name, Sex, Pclass, Fare)

#adding col Base r 
titanic$totPass <- titanic$Siblings.Spouses.Aboard + titanic$Parents.Children.Aboard +1

#dplyr
titanic <- mutate(titanic, totPass_dp = Siblings.Spouses.Aboard + Parents.Children.Aboard +1, disFare_dp = 0.9 * Fare)

#delete colm
#base R
titanic <- titanic[,-11] #to remove the 11th row

#deplyr
del_dp <-select(titanic, -Name, -Fare, -Survived)

#arrange, order data , by default ascending

#arrange data by desc fare
arr_dp <- arrange(titanic, desc(Fare)) #or arr_dp <- arrange(titanic, -(Fare))

#Group By
#1. Group by - at what level you want to roll up the data
#2. which variable to roll up 
#3. what aggregation - mean, median, mode, max....

#depylr
#avg fare by each passenger class

avgPas_byclass <- summarize(group_by(titanic,Pclass), mean(Fare))

#avg fare by each passenger class w.r.t to sex
avgPas_byclass_sex <- summarize(group_by(titanic,Pclass, Sex), mean(Fare))

#avg fare and age by each passenger class w.r.t to sex
avgPas_age_byclass_sex <- summarize(group_by(titanic,Pclass, Sex), mean(Fare), mean(Age))


#Data Exploration and Viz
#Univariant and Bivariant 

#Univariant - Do analysis one variable at a time 

#Bivariant - two variable , How is one variable is impacting the other variable 
# or what is the relationship b/w 2 variable. 
# terminology is there Y and X . Y = Target or dependent variable 
# and X is set of independent variable

#in titanic df Y is survival, X is all others checked one by one. 
# first variable :- Check if class is dependent 

#these depend upon the data type. check notebook

#UNIVARIANTES FOR CONT DATA

#AGE
#summary Function 

summary(titanic$Age)

#Viz
hist(titanic$Age)

boxplot(titanic$Age, col = "blue", main = "Box Plot of Age")
boxplot(titanic$Fare)

#Univariant for Catagory
table(titanic$Survived)/nrow(titanic)

table(titanic$Sex)/nrow(titanic)

table(titanic$Pclass)/nrow(titanic)

titanic%>%filter(Pclass == 3 & Sex == "male")%>%mean()
