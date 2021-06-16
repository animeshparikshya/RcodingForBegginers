# This gets the default working directory
getwd()

#Set Working directory
setwd("C:/Users/Animesh.Parikshya/Documents/IIM Classes/R Classes/Dataset")
retail <- read.csv("retail_sales.csv")
class(retail)
View(retail)
dim(retail)
nrow(retail)
ncol(retail)
head(retail,3)
tail(retail, 1)

a <- 5
b<- 3
 c <- a+b 
 c

5*8

#structure of the dF
str(retail)

str(retail$Supplier)

#all the unique values
unique(retail$Item_Category)


#retail <- read.csv("retail_sales.csv", stringsAsFactors = TRUE)


head(retail)
tail(retail)
dim(retail)
str(retail) #structure

summary(retail)
summary(retail$Item_Category)
names(retail) #Column Names

#adding a col
#Base r
retail$Profit <- retail$Revenue - retail$Cost

#deplyr
retail1 <- mutate(retail,Profit = Revenue - Cost, profit_90Per = 0.9 *(Revenue - Cost) )

head(retail1)
search()

# head(iris)
# library(help = "datasets")
# dim(iris)
# data()

retail1$Profit <- NULL
retail1

retail$Cost <10000
class(retail$Cost <10000)

#df[row,col]
retail[retail$Cost <10000,]

retail[retail$Cost <10000,"Cost"]


retail_new <- retail
summary(retail_new$Cost)
#replacing the cost , where ever the cost is less than 10000
retail_new[retail_new$Cost <10000, c("Cost", "Units_Sold")] <- 10000



summary(retail_new)
retail_new
summary(retail_new$Cost)
retail_new$Cost


sales <-c (100,200,3,NA,4,NA,7,NA,6,8,9,NA,NA)
is.na(sales)
!is.na(sales)
sales[!is.na(sales)]
na_removed <- sales[!is.na(sales)]
na_removed

#with which to remove NA
sales[which(sales>0)]

m <- aggregate(retail$Cost, by=list(retail$Item_Category),mean )
m
class(m)


unique(retail$Item_Category)

class(unique(retail$Item_Category))

mo <- aggregate(retail$Cost, by=list(retail$Month),mean )
mo

us <- aggregate(retail$Units_Sold, by=list(retail$Month),mean )
us

n <- tapply(retail$Cost, (retail$Item_Category),mean)
n

x <- apply(retail,2, max)
x

#lapply & sapply work on list#
lt <- list(a= 1:10 , b = 11:20)
lt


a <- c(1,2,3,4,5,10)
b <- c(2,6,7,8,9)

cbind(a,b)
rbind(a,b)


df1 <- data.frame(CustomerID=c(1:6), Product = c(rep("Toaster",3), rep("Radio",3)) )
df2 <- data.frame(CustomerID=c(2,4,6,7), State = c(rep("Alabama",2), rep("Ohio",2)) )
df1
df2

merge(x=df1, y= df2, by = "CustomerID" , all = TRUE) #Outer Join or full outer join

merge(x=df1, y= df2, by = "CustomerID" , all.x = TRUE) #Left Join or left outer join

merge(x=df1, y= df2, by = "CustomerID" , all.y = TRUE) #Right Join or Right outer join 

merge(x=df1, y= df2, by = "CustomerID" ) #Inner Join/Intersection of both table




library(dplyr)
search()


dat8 <- filter(retail,Item_Category == "Literature")
dat8

dat10 <- select(retail, Item_Category, Cost, Revenue)
dat10

head(select(retail, starts_with("Co")))
head(select(retail, -Cost))

data12 <- mutate(retail, logRevenue = log(Revenue))
data12

retail$Revenue
dat14 <- arrange(retail, Revenue)
dat14
dat14 <- arrange(retail, desc(Revenue))
dat14
dat14 <- arrange(retail, desc(Item_Category),Revenue )
dat14
dat14 <- arrange(retail, Item_Category,desc(Revenue ))
dat14


#Pipe operator
head(select(retail, starts_with("Co")))
retail %>% select(starts_with("Co")) %>% head

retail %>% summarise(avg_Cost = mean(Cost), distinct_Cost = n_distinct(Cost))
retail %>% summarise(avg_Cost = mean(Cost), distinct_Cost = n_distinct(Item_Category))

retail %>% summarise(avg_Cost = mean(Cost), distinct_Cost = n_distinct(Cost), max= max(Cost), Min= min(Cost), 
                     stDev = sd(Cost), Med = median(Cost), Add= sum(Cost), quantile(Cost), total= n())



?summarise

retail %>% group_by(Item_Category) %>% summarise(avg_Cost = mean(Cost), 
                                                 distinct_Cost = n_distinct(Cost), total= n())


























