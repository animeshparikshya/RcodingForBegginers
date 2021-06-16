#Practice from JLC video - #Starting R Studio Class 27-09-2020  10:00am

#to print anything in console window.
print("Hello World")

a<-("Hello World")
a

#can do simple math functions
3+4 
2^2 +5
2+2*5
2*2
sum(2,3,4)
x<- 2
y<- 3
x+y

pi #PI values = 3.141593
pi*2
b= 20
b
e <- b # to assign  
color <- ("Red")
color

sqrt(25)

ln(10)
log(10)
log10(10)
log(16)

exp(10) 

#when we define a variable at the command prompt like this,
#the variable is held in the workplace
ab <- -10
ab

x<- 7 
x*5
x<5 #Logical output [true or false]
x<8

z <- 3^2+4^2 #(BODMAS - O is orders like sqrt(x), ^2)
z

# over writing a variable
x<- "jigsaw"
x
class(x) # to get the type of variable

x <- x*5#will give error

x<- 7
x <- x*5
x
class(x)

?class
class(x) # "numeric"
oldClass(x) # NULL
inherits(x, "a") #FALSE
class(x) <- c("a", "b")
inherits(x,"a") #TRUE
inherits(x, "a", TRUE) # 1
inherits(x, c("a", "b", "c"), TRUE) # 1 2 0

class( quote(pi) )           # "name"
## regular calls
class( quote(sin(pi*x)) )    # "call"
## special calls
class( quote(x <- 1) )       # "<-"
class( quote((1 < 2)) )      # "("
class( quote( if(8<3) pi ) ) # "if"

.class2(pi)               # "double" "numeric"
.class2(matrix(1:6, 2,3)) # "matrix" "array" "integer" "numeric"


#List all the variable created
ls()

#to get the structure of all the variable created
ls.str()

#Remove all the variables
rm(x)
rm(color)

ls()

#to create vectors
price<- c(100,200)

ls()

x <- c(1,2,3,4)
x
q <- c(1,29,-4,81,5)
q
class(q)
#length of vector
length(q)

#to include 2 vectors into one
a1 <- c(1,1,1)
a2 <- c(2,2,3)
a2
c(a1,a2)

#Missing Values
price<- c(12, 34, NA)
price 
length(price) #3

#checking for NA/missing value 
is.na(price) #FALSE FALSE  TRUE

#to get position/index using which clause
which(is.na(price)) #3rd position

which(price==12) # 1st Position

#creating list of same data type
y<-list(1,2,3,4)
y

#to check data type of the variables
class(y) #list
class(x) # numeric

p <-c(1, "s")
p
class(p)
c = TRUE
class(c)
c <- TRUE 
class(c)

arr <- array(1:3, c(2,4)) # recycle 1:3 "2 2/3 times"
arr
class(arr)
ar <- array(1:8, c(2,2,2))
ar
class(ar)
?array

#Vectors cannot contain mixed data type
#char type, char is preferred than boolean/int for data type
m<-c(1,2,"g")
class(m)
m*3
n<-c(TRUE,FALSE,"g")
class(n)
n
h<-c(TRUE,FALSE, 3,4)
h
class(h)
class(c(TRUE,FALSE,"g"))

#Computing basic statistics
# mean(x), median(x), sd(x), var(x), cor(x,y)

vec1 <- c(1,0,2,1,3,5,6,9,10)
mean(vec1)
median(vec1)

#to get a sequence of numbers use colon (:)
10:15 
n <- 6
n
0:5
0:n
0:(n-1)
0:n-1 #0:n, -1 #this means start from -1 till n-1
seq0 <- seq(2000, 2010)
seq0 
seq1 <- seq(from=1, to= 5, by=0.5)#default by =1
seq1
seq(from=10, to=15, by=2)
seq(from=10,to=15)
seq(from=0, to=20, length.out=5)

#repeat values
rep1 <- rep(1,5) # repeat 1 , 5 times. 
rep1

#to get mode/type of a vector
color <- c(1,2,3,4,5,6,6,6)
color[3]
color[1] # first element has an index 1 (not 0)
color[0] #vector starts from 1 so 0 will not give any value
color[-3] #to view data except the 3 index value
color_new <- color[-3]
color_new
# use vector indexing for selecting multiple elements
color[2:4]
color[-(2:4)] #invert sign to exclude
#Use of logical vector for selecting the element
color=="red"
color==20
color==2
mode(color) # Ans = "numeric"
?mode

# modulo operator
num <- c(1,2,3,4,5)
num
num %%2==0  # it is true whenever number is even, %% is the modulo
num[num%%2==0]
num>median(num)
num[num>median(num)]
names(num)<- c("n1", "n2","n3","n4","n5") # assigning names
# to the vector elements
num
num["n1"] # we can refer an element by name
num[1]
num[c("n2","n4")]
x <- names(num)
x[1]

#to order numbers in vector
num <- c(2, 23,1,6,63)
num1 <- order(num)
num

numbers <- c(100,45,6,90)
order(numbers)
order(-numbers)

#plot simple plot
m<-plot(x=1:20,y=1:20)
m
class(m) #NULL

personId<-c(1,2,3,4,5)
personWt<-c(60,70,80,65,75)

person<-data.frame(personId,personWt)
person

plot(person)

#creating a matrix, make sure the no.of data point = 
#(no. of row * no. of col)
B= matrix(c(2,4,3,5,7,23),
          nrow = 3,
          ncol = 2)
B[1,]
B[,2]
B[2,2]
B[3,1]
B[3,2]

m <- matrix(1:12, nrow = 3, ncol = 4)
m
mr <- matrix(1:12, nrow = 3)
mr
mc <- matrix(1:12,  ncol = 4)
mc
mx <- matrix(1:12, nrow = 12)
mx

m[,2]
m[1,3]
ls()

#Creating List of different vectors/data type (not a data frame)
my.list <- list(name = c("Ro","Emm"), age = c (65,54), 
                retired = c(TRUE,FALSE))
my.list
#retrieving data from list
my.list$age
my.list["age"]
my.list["age"][1]
my.list[["age"]][1] #to retrieve individual data point
my.list[[3]][2]
my.list[[1]][2]

mylist <- list(m,a, color)
class(mylist)
mylist

vec <- 1:10
vec
mat <- matrix(1:10,5,5)
mat
char <- "jigsaw"
mylist1 <- list(vec,mat,char)
class(mylist1)
mylist1

#object inside the list is a list
m <- list(list(3,4), list(1,2), 'three') 
m #3 rows. 1st row is the main list. 2nd row, 
#1st element is the position of sub-list inside the main list
#2nd row, 2nd element is the position of element inside the sub-list 
m[1]
m[[1]]
m[2] #Note the first row is still [[1]] instead of [[2]] 
#when we call because now the sub list is m[[2]] is the 
#first listing the results
#therefore the numbers don't tell actual position but 
#the position in the result
m[[2]] 
m[[2]][[1]]
m[[1]]

m <- list('one', c(1,2), 'three') #object inside the list is a vector

m <- list(list(list(5,6),list(3,4)), list(1,2), 'three')
m

#single bracket returns a list
m
m[1]
m[2]

#double bracket returns the elements in the object inside the list
m[[2]]
class(m[[2]]) 

#to access vector items within a list (2nd element, 1)
m[[2]][1] #returns as a list for 1st element inside 2nd element 
m[[2]][2] #returns as a list for 2nd element inside 2nd element 


#Creating a Data-Frame

exampledata <- data.frame(names = c("Amit","ss","dd"),
                          income = c(100,200,300),
                          Gender = c("M","F","M"))
exampledata
exampledata$Gender

#using attach and detach keywords
attach(exampledata)
names
detach(exampledata)

#to write into a csv. 
mn<-write.csv(exampledata, file = "exampledata.csv")

#to get data using sql queries
#install.packages("sqldf")
#sql queries in R
library(sqldf)
x <- sqldf("select * from exampledata where Gender = 'M'")
exampledata
x


library() #to know all the available data-set in Base R
search() #to know all the packages in the current instance of R
library(dplyr) #to load dplyr package in current instance of R
install.packages("dplyr") #to install dplyr package in this system
library("dplyr") #to load dplyr package in current instance of R
search()

library(help=MASS)# to know more about MASS package
library(help="dplyr")# to know more about dplyr package
library(datasets) #to load data-set library into R instance
data() #to see all the R data - set available in this system
data(iris) # Load iris Data-set/frame in R instance
names(iris) # to see all column names
colnames(iris)# to see all column names
dim(iris) #to see the dimension of the data frame (DF)
nrow(iris) #number of row
ncol(iris) #no. of column
head(iris) # first 6 rows of the DF
tail(iris) # last 6 rows of the DF
str(iris) # Structure of DF
?iris # to know more about any function/DF
class(iris) #to know data type of each column

#to use the column directly and not through $ as iris$Sepal.Length
#only 1 DF can be attached at one time
attach(iris) 
head(Species)
detach(iris) #to remove attached data set

#to get the default directory in this system
getwd()

#to set the default directory in this system
setwd("C:/Users/Animesh.Parikshya/Documents/IIM Classes/R Classes/Dataset")
#my notes: When copying the link for the working directory
#from windows change the backward slashes to forward slashes 
#or include double backward slashes saving the workspace

#to read a csv file, header is true and separator is ","
iris<- read.csv("Iris.csv",header = T,sep=",")
head(iris,10) # first 10 rows of the DF

#to get all the summary of DF such as 
#For integers Data type, Min,  Length,1st Quadrant, Median, Mean, 
#3rd Quadrant,Max.  
#For character, length of rows ,data type, Mode
summary(iris)  

#to read from csv
dat <- read.csv("iris.csv")
dim(dat) # dimension of data frame , no. of rows and column 

#class of DF
class(dat)
class(dat$Sepal.Length)

#to check the value at specific row, column 
dat[1,3]

#creating a new DF , with only specific rows and column
dat1<-dat[c(1,3,122,145),c(3,4,5)]
dat1

#structure of DF, i.e data type and few data points
str(dat)
str(dat1)

#to retrieve row 1 to 5 for column "Species"
dat[c(1:5),"Species"]

#conditional retrieval of DF
dat2<-dat[dat$Species=="setosa",]
dat2

dat3 <- dat[dat$Species=="setosa"| dat$Sepal.Length>5,]
dat3

dat4 <- dat[dat$Species=="setosa"& dat$Sepal.Length>5,]
dat4
head(dat4,10)

#to get index using which clause
index <- which(dat$Species=="setosa")
head(index)

#to make new DF using Index
dat5 <- dat[index,]
dat5

#to get all row of specified column
dat6 <- dat[,c("Species" , "Sepal.Length")]
dat6

head(dat6)# first 6 rows
tail(dat6)# last 6 rows

dat7 <- dat[dat$Species=="setosa"& dat$Sepal.Length>5,
            c("Species" , "Sepal.Length")]
dat7

head(dat7)
tail(dat7)
max(dat7)
max(dat7$Sepal.Length)
min(dat7$Sepal.Length)

#create a new column
dat7$LenMul <- dat7$Sepal.Length * 10
head(dat7)

#create a new column
head(dat)
dat$SepalArea <- dat$Sepal.Length * dat$Sepal.Width
head(dat)

#creating new DF after sorting , ascending 
dat8 <- dat[order(dat$Sepal.Length),]
head(dat8)

#creating new DF after sorting , descending  
dat9 <- dat[order(-dat$Sepal.Length),]
head(dat9)

#to find maximum in a vector / column of a DF
max(dat$Sepal.Length)

#group by species and find mean of each grouped 
#output in DF
aggregate(dat$Sepal.Length, by=list(dat$Species),mean)
class(aggregate(dat$Sepal.Length, by=list(dat$Species),mean))

#group by species and find mean of each grouped 
#output in array
tapply(dat$Sepal.Length, dat$Species, mean)
class(tapply(dat$Sepal.Length, dat$Species, mean))

#Cross Tabulation--------------
#Create a contingency table (optionally a sparse matrix) 
#from cross-classifying factors, usually contained in a 
#data frame, using a formula interface.
head(xtabs(dat$Petal.Length~dat$Sepal.Length+dat$Sepal.Width))
?xtabs


#displaying the list of packages currently loaded in R
library()
search()
library(dplyr) #loading dplyr library
#install.packages("dplyr") #to install
library(dplyr)
search()
detach(package:dplyr) #unloading a package from current session of R
search()
library(help=MASS)
library(MASS)
library("dplyr")

#to only view specific col
dat10 <- select(dat, Petal.Length, Sepal.Length,Sepal.Width)

#to view columns except few ones
dat11 <- select(dat, -Petal.Length, -Sepal.Length,-Sepal.Width)

#to add new col using dplyr
dat12 <- mutate(dat, AreaPetal = Petal.Length * Petal.Width)

#to sort col, default is ascending 
dat14 <- arrange(dat, desc(Petal.Width))
#OR
dat14a <- arrange(dat, -(Petal.Width))

#to get grouped by aggregate functions 
gr_Species <- group_by(dat, Species)
summarise(gr_Species, mean(Petal.Length), sd(Petal.Length))
summarise(group_by(dat,Species),mean(Sepal.Length))

#to use filter and pipeline function
dat%>%filter(Petal.Length > 3)%>%summarise(mean(Petal.Width))

#to use multiple command in single line using piped function %>%
dat15 <- (dat%>%filter(Petal.Length > 3)
%>%mutate(AreaPetal = Petal.Length * Petal.Width)
%>%summarise(mean(AreaPetal), median(AreaPetal), sd(AreaPetal)))

#Histogram
library(gains)

detach(package:MASS)
hist.FD(Aids2$age) # will give error as package is not loaded 
library(MASS)
hist.FD(Aids2$age)
library(help=MASS)

head(Aids2)
head(Aids2$age)
hist.FD(Aids2$age)
Aids2
summary(Aids2$age)
dim(Aids2)
hist(Aids2$age)
hist(Aids2$age, breaks = 30)
hist(Aids2$age, breaks = 9)

#The bins don't correspond to exactly the number you put in, 
#because of the way R runs its algorithm to break up the data 
#(see the breaks, they are too clean) 
#but it gives you generally what you want. 
#If you want more control over exactly the breakpoints between bins, 
#you can be more precise with the breaks() option and give it a 
#vector of breakpoints, like this
hist(Aids2$age, breaks = c(0,20,40,60,80,100))

#convert as Date
example <- as.Date("1-Jan-2020", "%d-%b-%Y")
str(example)

#to save this page in the working directory
save.image("all_work.RData")
# saves in a specified file
save.image(file="C:/Users/Animesh.Parikshya/Documents/IIM Classes/R Classes/Dataset/image.RData") 

load("C:/Users/Animesh.Parikshya/Documents/IIM Classes/R Classes/Dataset/image.RData")

rm(list = ls()) #removes all the objects in R
#Cnrl+L to clear the console

#to Quit this R sessions
q()
quit()