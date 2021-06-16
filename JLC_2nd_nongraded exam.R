library(lubridate)
library(datasets)
data()
lakers1<- lakers

names(lakers)
colnames(lakers)
dim(lakers)
nrow(lakers)
ncol(lakers)
head(lakers)
tail(lakers)

lakers1$Month <- month(lakers1$Month)

library(arules)
install.packages("arules") 
data(AdultUCI) 
 adultx <- AdultUCI
 
 nrow(filter(adultx, age ==38 & adultx$`marital-status` == "Divorced"))

 summarize(group_by(filter(adultx,race=="White" & sex=="Female" & adultx$`hours-per-week`<25),income), mean(age))

 
 data(mtcars)
mt <- mtcars 
summarise(group_by(mt, gear), mean(mpg)) 

nrow(filter(lakers1, team ==  "LAL" & opponent == "POR"))

lake<-lakers 
lake$Date<-paste(as.character(lake$date),lake$time) #date+time
lake$Date<-ymd_hm(lake$Date) 
lake%>%filter(player=="Pau Gasol",opponent=="POR",weekdays(Date)=="Sunday")%>%nrow()

lake%>%group_by(Month=months(Date))%>%summarize(Number=n())%>%filter(Month=="October"|Month=="December"|Month=="January"|Month=="April")

lake%>%filter(hour(Date)==12,weekdays(Date)=="Monday")%>%nrow()
