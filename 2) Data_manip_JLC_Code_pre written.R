getwd()
setwd("C:/Users/Animesh.Parikshya/Documents/R Classes/Dataset")

oj <- read.csv("oj.csv")
str(oj)
dim(oj)

#dataframe[rows,columns]
oj[1,3]
oj[c(1,2,8,456),c(1,3,6)]
oj[c(1:5),"brand"]
oj[,"store"]; oj$store; oj[,1]

#Logical Sub-setting
#Selecting only those rows where brand bought is tropicana
dat<-oj[oj$brand=='tropicana',]
head(dat)
dim(dat)

#Using Or condition, brand bought is tropicana or dominicks
dat1<-oj[oj$brand=='tropicana'|oj$brand=='dominicks',]
head(dat1)
dim(dat1)

#Using And condition, brand bought is tropicana and 
#no feature advertisement is run
dat2<-oj[oj$brand=='tropicana' & oj$feat==0,]
head(dat2)
dim(dat2)

#Sub-setting using which() operator
#which statement will remove the NA rows automatically
index<-which(oj$brand=="dominicks")
head(index)
dat3<-oj[index,]
head(dat3)
dim(dat3)

#Selecting Columns
dat4<-oj[,c("week","brand")]
head(dat4)
dim(dat4)

#Seleecting+Subsetting
dat5<-oj[oj$brand=='tropicana' & oj$feat==0,c("week","store")]
head(dat5)
dim(dat5)

#Adding new columns
oj$logInc<-log(oj$INCOME)
head(oj)
dim(oj)

#Revenue Column
head(oj$logmove)
head(exp(oj$logmove))
oj$revenue<-exp(oj$logmove)*oj$price
dim(oj)

#Sorting data
numbers<-c(10,100,5,8)
order(numbers)
order(-numbers)

dat6<-oj[order(oj$week),]
head(dat6)
min(oj$week)

dat7<-oj[order(-oj$week),]
head(dat7)
max(oj$week)

##Group by summaries
class(oj$brand)
unique(oj$brand)

#Mean price of juice across brands

#Summarize-Price
#Summarize by-Brand (factor)
#Summarize how-Mean

#Syntax aggregate(variable to be summarized, 
#by=list(variable by which grouping is to be done),function)
aggregate(oj$price,by=list(oj$brand),mean)
class(aggregate(oj$price,by=list(oj$brand),mean))

tapply(oj$price,oj$brand,mean)
class(tapply(oj$price,oj$brand,mean))

#Mean income of people by brand
#Summarize-Income
#Summarize by-Brand
#Summarize how-Mean
aggregate(oj$INCOME,by=list(oj$brand),mean)
class(aggregate(oj$INCOME,by=list(oj$brand),mean))
tapply(oj$INCOME,oj$brand,mean)
class(tapply(oj$INCOME,oj$brand,mean))

#Cross tabulations/ contingency table 
#we do contingency table when we have 2 categorical variable
# Units of different brands sold based on 
#if feature advertisement was run or not
table(oj$brand,oj$feat)
class(table(oj$brand,oj$feat))

xtabs(oj$INCOME~oj$brand+oj$feat)

#dplyr
#dplyr only work with data frame variable
library(dplyr)

#filter
dat8<-filter(oj,brand=="tropicana")
dim(filter(oj,brand=="tropicana"))

dat9<-filter(oj,brand=="tropicana"|brand=="dominicks")
dim(filter(oj,brand=="tropicana"|brand=="dominicks"))

#Selecting Columns
dat10<-select(oj,brand,INCOME,feat)
dat11<-select(oj,-brand,-INCOME,-feat)# to drop the column

#Creating a new column
dat12<-mutate(oj,logIncome=log(INCOME))

#Arranging data 
dat13<-arrange(oj,INCOME)
dat14<-arrange(oj,desc(INCOME))
dat14<-arrange(oj,-INCOME)

#Group Wise summaries
gr_brand<-group_by(oj,brand)
summarize(gr_brand,mean(INCOME),sd(INCOME))

#Pipelines
#Base R code
mean(oj[oj$INCOME>=10.5,"price"])

#dplyr code
summarize(filter(oj,INCOME>=10.5),mean(price))

#Pipe operator 
oj%>%filter(INCOME>=10.5)%>%summarize(mean(price))
(oj%>%filter(price>=2.5)%>%mutate(logIncome=log(INCOME))
          %>%summarize(mean(logIncome),median(logIncome),sd(logIncome)))

##-------------------Date------------------------------##

#?as.Date
library(dplyr)

foo <-  factor("1/15/2006 0:00:00")
class(foo)
foo <- as.Date(foo, format = "%m/%d/%Y %H:%M:%S")
as.Date(foo, "%m/%d/%Y")  %>% class()
foo
class(foo)

x <- factor("1/jan/1960", "2/jan/1960", "31/mar/1960", "30/jul/1960")
class(x)
z <- as.Date(x, "%d-%m-%Y")
class(z)
z


fd<-read.csv("Fd.csv")
str(fd)
fd$FlightDate<-as.Date(fd$FlightDate,"%d-%b-%y")
str(fd)

#%B & %b is not working with 
str(fd)
fd$FlightDate <- as.Date(fd$FlightDate,"%d-%m-%Y")

dim(fd)
View(fd)
head(fd, 2)
tail(fd)
nrow(fd)
ncol(fd)
summary(fd)
summary(fd$AirlineID)
str(fd$FlightDate)

class(fd$FlightDate)
fd$FlightDate %>% class()

head(months(fd$FlightDate))
unique(months(fd$FlightDate))

head(weekdays(fd$FlightDate))
unique(weekdays(fd$FlightDate))

#Finding time interval
fd$FlightDate[60]-fd$FlightDate[900]
difftime(fd$FlightDate[3000],fd$FlightDate[90],units = "weeks")
difftime(fd$FlightDate[3000],fd$FlightDate[90],units = "days")
difftime(fd$FlightDate[3000],fd$FlightDate[90],units = "hours")

#Sub-setting data based on time information
#Subset the data for day=Sunday
dim(fd)
fd_s<-fd%>%filter(weekdays(FlightDate)=="Sunday")
dim(fd_s)

#Find the number of flights on Sundays for destination Atlanta
fd%>%filter(weekdays(FlightDate)=="Sunday",
            DestCityName=="Atlanta, GA")%>%nrow()
#Find the number of flights on Sundays for all cities
(fd%>%filter(weekdays(FlightDate)=="Sunday")
%>%group_by(DestCityName)%>%summarize(n()))


sales <- read.csv("100 Sales Records.csv")
str(sales)
str(sales$OrderDate)
sales$OrderDate <- as.Date(sales$OrderDate, "%d-%m-%y")
sales$ShipDate <- as.Date(sales$ShipDate, "%d-%m-%y")
# sales$OrderDate2 <- sales$OrderDate
str(sales$OrderDate)
head(months(sales$OrderDate))
head(months(sales$ShipDate))
unique(months(sales$OrderDate))
head(weekdays(sales$OrderDate))
unique(weekdays(sales$OrderDate))

#difference in date
sales$OrderDate[39] - sales$OrderDate[35]
difftime(sales$OrderDate[39], sales$OrderDate[32], units = "weeks")
difftime(sales$OrderDate[39], sales$OrderDate[32], units = "days")
difftime(sales$OrderDate[39], sales$OrderDate[32], units = "hours")
dim(sales)
sales_Sunday <- sales %>%filter(weekdays(OrderDate)=="Sunday")
dim(sales_Sunday)

sales_Sunday_Europe <- sales %>%filter(weekdays(OrderDate)=="Sunday", Region == "Europe")
dim(sales_Sunday_Europe)
sales %>%filter(weekdays(OrderDate)=="Sunday", Region == "Europe")%>%nrow()
nrow(sales_Sunday_Europe)


#PISIXct and POSIXlt
date1<-Sys.time()
date1
class(date1)
weekdays(date1)
months(date1)

#POSIXlt is same as POSIXct but with POSIXlt the diff parts of date
#can be separately accessed. 
date2<-as.POSIXlt(date1)
date2
str(date2)
unclass(date2)
date2$wday
date2$zone
date2$hour
date2$min
date2$sec
date2$mday
date2$mon
date2$year +1900 #years since 1900.
date2$yday
date2$isdst
date2$gmtoff #The offset in seconds from GMT: positive values are East of the meridian. Usually NA if unknown, but 0 could mean unknown.

mins <- date2$gmtoff/60
mins
hours <- mins/60
hours

library(lubridate)
#install.packages("lubridate")
#library(lubridate)

date3 <- today()
today() %>% class
date3  %>% class

year(date3)
month(date3)
day(date3)

wday(date3)
wday(date3,label = TRUE)
wday(date3,label = TRUE)  %>% class
class(wday(date3,label = TRUE))
this_time <- Sys.time()
this_momment <- now()

hour(this_time)
minute(this_time)
second(this_time)

hour(this_momment)
minute(this_momment)
second(this_momment)

data <- "1/15/2006 01:15:00"
class(data)

mydate <- mdy_hms(data)
mydate
class(mydate)

data <- factor("1/15/2006 01:15:00")
mydate <- mdy_hms(as.character(data))
mydate
class(mydate)

data <- factor("1/15/2006")# 01:15:00")
mydate <- mdy(as.character(data))
mydate
class(mydate)

fd<- read.csv("fd.csv")
str(fd)
dim(fd)
fd$FlightDate <- dmy(fd$FlightDate)
fd$FlightDate <- fd %>% dmy(FlightDate) %>% class
str(fd$FlightDate)
fd$FlightDate[8000] - fd$FlightDate[3]
fd_Sunday1 <- fd %>% filter(wday(FlightDate)==1)
dim(fd_Sunday1)
nrow(fd_Sunday1)
ncol(fd_Sunday1)

sales <- read.csv("100 Sales Records.csv")
str(sales)
sales$OrderDate <- dmy(sales$OrderDate)
str(sales)
class(sales$OrderDate)
sales$ShipDate <- dmy(sales$ShipDate)
sales$ShipDate %>% class


##-----------------Merging data---------------------##
##Joins using Merge
df1 = data.frame(CustomerId=c(1:6),
                 Product=c(rep("Toaster",3),rep("Radio",3)))
df2 = data.frame(CustomerId=c(2,4,6),
                 State=c(rep("Alabama",2),rep("Ohio",1)))

merge(x = df1, y = df2, by = "CustomerId", all = TRUE)#Outer join:

merge(x = df1, y = df2, by = "CustomerId", all.x=TRUE)#Left join

merge(x = df1, y = df2, by = "CustomerId", all.y=TRUE)#Right join

merge(x=df1,y=df2,by="CustomerId")#Inner Join/Intersection 
#of both tables

#Missing values
a<-c(1,2,3,4,5,6,NA,NA,NA,7,8,9)
is.na(a)
sum(is.na(a))

air<-airquality
head(air)

sum(is.na(air$Ozone))
sum(is.na(air$Solar.R))

summary(air)

#Imputing Missing values
air$Ozone[is.na(air$Ozone)]<-45
summary(air)

air$Solar.R[is.na(air$Solar.R)]<-mean(air$Solar.R,na.rm=TRUE)
summary(air)


##--------------------reshape2()------------------------##
library(reshape2)
person<-c("Sankar","Aiyar","Singh")
age<-c(26,24,25)
weight<-c(70,60,65)
wide<-data.frame(person,age,weight)
wide

melt(wide,id.vars="person")
melt(wide,id.vars="person",value.name ="Demo_Value" )
melted<-melt(wide,id.vars="person",value.name ="Demo_Value" )
dcast(melted,person~variable,value.var = "Demo_Value")
melt()


##---------------String manipulation--------------------##
a<-"Batman"
substr(a,start=2,stop=6)

nchar(a)
tolower(a)
toupper(a)

b<-"Bat-Man"
strsplit(b,split="-")
c<-"Bat/Man"
strsplit(c,split="/")

paste(b,split=c)
c(b,c)

grep("-",c(b,c))
c(b,c)
grepl("/",c(b,c))

c(c,b)
grepl("/",c(c,b))

b
sub("-","/",b)
d<-"Bat-Ma-n"
sub("-","/",d)
gsub("-","/",d)


##--------------sqldf-------------------##
library(sqldf)
#Using SELECT statement
oj_s<-sqldf("select brand, income, feat from oj ")
#Subseting using where statement
oj_s<-sqldf("select brand, income, feat from oj where price<3.8 and income<10")
#Order by statement
oj_s<-sqldf("select store,brand,week,logmove,feat,price, income from oj order by income asc")
#distinct
sqldf("select distinct brand from oj")
#Demo sql functions
sqldf("select avg(income) from oj")
sqldf("select min(price) from oj")


person <- c("A","B", "C")
age <- c(21,45,34)
weight <- c(60, 70, 55)


wide <- data.frame(person,age,weight)
#Select query
oj_s <- sqldf("select person, age from wide")
oj_s
#select query with which statement
oj_s1 <- sqldf("select * from wide where age > 30 and weight >50")
oj_s1
#select query with which statement and order by statement
oj_s2 <- sqldf("select * from wide where age > 30 and weight >50 order by age asc")
oj_s2

