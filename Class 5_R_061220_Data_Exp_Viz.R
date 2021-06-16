
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

hist(titanic$Fare)
boxplot(titanic$Fare)

#change to factor
titanic$Sex <- as.factor(titanic$Sex)
titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)

summary(titanic)


#BIVARIATE ANALYSIS ---------

#Box-plot by Group
#correlation b/w Age and Fare

cor(titanic$Age, titanic$Fare)

#scatter plot
plot(titanic$Age, titanic$Fare, pch=5, type = "p", col="red")
?plot

#Multivariate
plot(titanic$Age, titanic$Fare, pch=5, type = "p", col=titanic$Pclass)
plot(titanic$Age, titanic$Fare, pch=5, type = "p", col=titanic$Survived)

plot(titanic$Age, titanic$Fare, pch=as.numeric(titanic$Survived), type = "p", col=titanic$Survived)


#Cat and cont

boxplot(titanic$Age ~titanic$Survived)


boxplot(titanic$Fare ~titanic$Survived)
t.test(titanic$Fare ~titanic$Survived)


#Cat vs cat
#Survival dep on pclass
#survival dependent on gender

#cross tabulation 
table(titanic$Survived, titanic$Pclass)

a <- table(titanic$Survived, titanic$Pclass)

prop.table(a) #overall
prop.table(a,1) #proportional by rows

prop.table(a,2) #proportional by column

#plotting

titanic %>% 
  ggplot(aes(x=factor(Pclass),fill= factor(Survived))) +
  geom_bar()

#Stack is default in position
titanic %>% 
  ggplot(aes(x=factor(Pclass),fill= factor(Survived))) +
  geom_bar(position = "fill") 
?geom_bar

titanic %>% 
  ggplot(aes(x=factor(Survived),fill= factor(Pclass))) +
  geom_bar(position = "fill")


chisq.test(titanic$Survived, titanic$Pclass)

count(filter(titanic$Survived ==1))
count(filter(titanic, Survived ==1))
