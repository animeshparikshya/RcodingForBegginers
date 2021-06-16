#R STudio Class#3 -04th October 2020
library(dplyr)
titanic <- read.csv("titanic.csv", sep = '\t', header = TRUE)
head(titanic)

dim(titanic)


summarise(titanic, min_fare = min(Fare), max_Fare = max(Fare), avg_Fare = mean(Fare))
summary(titanic)
summary(titanic$Fare)

sum(titanic$Survived)
137-sum(titanic$Survived)


table(titanic$Survived)
table(titanic$Sex)


names(titanic)

titanic %>% group_by(Pclass) %>% summarise(Avg_Fare=mean(Fare))

dt <- aggregate(titanic$Fare, by=list(titanic$Pclass), mean)
dt


titanic %>% group_by(Sex,Survived) %>% summarise(Total = n())
?summarise

#dt<-dim(titanic)[1]
dt1 <-titanic%>%group_by(Pclass, Survived)%>%summarise(total_sur=n())
#dt1 <- mutate(dt1, Total_Pass =dim(titanic)[1])
dt1 <- mutate(dt1, Per = total_sur *100/dim(titanic)[1])
dt1
  
  
  
View(sum(titanic$Fare))


titanic_class <- arrange(titanic,Pclass)

(is.na(titanic$Age))
titanic_subset <- filter(titanic, !is.na(titanic$Age))

titanic_subset_pipe <- titanic %>% filter(!is.na(Age))


titanic_2 <- titanic
titanic_2[is.na(titanic$Age), "Age"] <- mean(titanic_2$Age, na.rm = TRUE)

View( apply(titanic, 2, min))
View( apply(titanic_2, 2, min))


titanic %>% filter(Survived ==1)
View( titanic %>% filter(Sex =="male" | Survived ==1 ))
View( titanic %>% filter(Sex =="male" & Survived ==1 ))

#Avg age of survived people
#Correct
titanic%>%group_by(Survived)%>%summarise(mean(Age, na.rm = TRUE))


titanic <- mutate(titanic, Total_Fam =SibSp +Parch)

titanic <- titanic %>% mutate(Total_Fam =SibSp +Parch)


dt<-dim(titanic)[1]
dt
titanic <- mutate(titanic, Total_Pass =dim(titanic)[1])

#Date, Strings, Reshape and Function


