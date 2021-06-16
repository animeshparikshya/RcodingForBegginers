#JLC Video 3 module. 
# 1.Base Graphics plotting

# Using plot() to study to continuous variables

ir<-iris
str(ir)

# Syntax
# plot(x=variable to be displayed on x axis, y = variable 
#to be displayed on y axis)
#two continuous variable we use bivariate plot 
#for bivariate plot we use plot command 
plot(x=ir$Petal.Width,y=ir$Petal.Length)

# Adding xlabels, ylables and title
plot(x=ir$Petal.Width,y=ir$Petal.Length,main=
       c("Petal Width Vs Petal Length"),xlab=c("Petal Width"),
     ylab=c("Petal Length"))

# Adding colors, plotting symbols
#Adding colors
plot(x=ir$Petal.Width,y=ir$Petal.Length,
     main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),col="red")

#Adding different plotting symbol
plot(x=ir$Petal.Width,y=ir$Petal.Length,
     main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),col="red",pch=2)

plot(x=ir$Petal.Width,y=ir$Petal.Length,
     main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),col="red",pch=3)

plot(x=ir$Petal.Width,y=ir$Petal.Length,
     main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),col="red",pch=4)

#Adding  more options
plot(x=ir$Petal.Width,y=ir$Petal.Length,
     main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),col="red",pch=4,
     type="p",lwd=2)

# Making a conditional bivariate plot
# Seeing relationship across different species 
#with same symbol and diff. color
plot(x=ir$Petal.Width,y=ir$Petal.Length,
     main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),col=ir$Species)
#with diff symbol and diff. color
plot(x=ir$Petal.Width,y=ir$Petal.Length,
     main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),
     pch=as.numeric(ir$Species),col=ir$Species)
#with same symbol and same color
plot(x=ir$Petal.Width,y=ir$Petal.Length,
     main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),
     pch=as.numeric(ir$Species),col='green')
#with same symbol and same color but different size of symbol
plot(x=ir$Petal.Width,y=ir$Petal.Length,
     main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),
     cex=as.numeric(ir$Species))
#with same symbol but different color and size of symbol
plot(x=ir$Petal.Width,y=ir$Petal.Length,
     main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),
     cex=as.numeric(ir$Species),col=ir$Species)

#Adding a legend
plot(x=ir$Petal.Width,y=ir$Petal.Length,
     main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),
     pch=as.numeric(ir$Species))
unique(ir$Species)
legend(0.2,7,c("Setosa","Versicolor","Verginica"),pch=1:3)

plot(x=ir$Petal.Width,y=ir$Petal.Length,
     main=c("Petal Width Vs Petal Length"),
     xlab=c("Petal Width"),ylab=c("Petal Length"),
     col=ir$Species,pch=as.numeric(ir$Species))
legend(0.2,7,c("Setosa","Versicolor","Verginica"),pch=1:3,col=1:3)


#Studying a continuous variable across groups
#Distribution of Sepal lengths across different species

# Univariate Analysis
#Box plots

boxplot(ir$Petal.Length)
summary(ir$Petal.Length) #Mean<Median, negatively skewed

boxplot(ir$Sepal.Width)
summary(ir$Sepal.Width) #Mean>Median, positively skewed

#Improving the asethetics of boxplot
boxplot(ir$Petal.Length,col="red",main="Distribution of Petal length")

#x is discrete/factor variable y is continuous variable 
plot(x=ir$Species,y=ir$Sepal.Width,xlab="Species",
     main="Sepal Length across sepcies",col="red")

#Using histograms
hist(ir$Sepal.Width,col="orange")
#label of values on top of bars
hist(ir$Sepal.Width,col="orange",labels=TRUE)
#to see the density of the variable , y axis change to density
hist(ir$Sepal.Width,col="orange",freq=FALSE)
#density label 
hist(ir$Sepal.Width,col="orange",labels=TRUE,freq=FALSE)
#to see the plot the density in line
lines(density(ir$Sepal.Width))

#Adding multiple plots in single plotting window
par(mfrow=c(1,2)) # c(row, column)
plot(x=ir$Species,y=ir$Sepal.Width,xlab="Species",
     main="Sepal Width across sepcies",col="red")
plot(x=ir$Species,y=ir$Sepal.Length,xlab="Species",
     main="Sepal Length across sepcies",col="red")
dev.off()

#2. ggplot()
#Grammar of graphics/architecture 
#1) Aesthetic mapping: what components of data appears on X and Y axis
#, how is the color, size, fill and position of elements is related 
#to the data
#2) GEOMS (geometrical objects): what geometrical objects appears on
#the plot: points, lines, polygons, area, box-plot, rectangle, tile etc.
#3)Statistical Transformations: Compute density, counts,
#(Histogram: Need to bin and count data)
#4)Scales and Coordinate system: Discrete scale or continuous.
#Cartesian or spherical/cylindrical. 


##Direct Marketing data
mk<-read.csv("DirectMarketing.csv")
library(ggplot2)

#Understand the relationship between Salary and Amount Spent
p<-ggplot(mk,aes(x=Salary,y=AmountSpent))#aes = Aesthetic mapping
p+geom_point() #to get point geom

#Understanding the conditional relationship based on Gender
q<-p+geom_point(aes(colour=Gender))
q
#for label
q+xlab("Salary in $")+ylab("Expenditure in $")

#Making a trellis plot for both the genders and fitting a tred line
p+geom_point(aes(colour=Gender))+geom_smooth(aes(colour=Gender))

#Creating a trellis plot
(p+geom_point(aes(colour=Gender))+geom_smooth(aes(colour=Gender))
+facet_grid(Gender~.))

#Understanding Univaraites
p<-ggplot(mk,aes(x=AmountSpent))
p+geom_histogram()

#Understanding Gender wise distribution
p+geom_histogram(aes(fill=Gender))

#Modifying the position
p+geom_histogram(aes(fill=Gender,colour=Gender),
                 position="stack",alpha=0.3)

#Alternative, draw a trellis plot
p+geom_histogram(aes(fill=Gender))+facet_grid(Gender~.)

#Polishing the graph
(p+geom_histogram(aes(fill=Gender,colour=Gender),alpha=0.3)
+facet_grid(Gender~.))

#Boxplots
#Aesthetic mapping
#X= A factor variable or X variable
#Y = The variable whose mapping we are interested in Box-plot stats:
#lower, middle, upper, ymax, ymin, Color, fill

#GEOMS
#BOXplot: geom_boxplot()

#Statistical transformation
#Boxplot statistics (to be shown in Y axis) 
p<-ggplot(mk,aes(y=AmountSpent,x=Gender,fill=Gender))
p+geom_boxplot()

#Density plots
#Aesthetic mapping
#X= Variable whose density we are interested in
#Y = Density measurements:Color, fill

#GEOMS: geom_density()

#Statistical transformation
#Density (To be shown on Y axis) 

# Modify global options in R
#to tell R that it should not show scientific notation anymore
options(scipen=999)
#bring back to default
#close and open R or run below.
default_opts <- callr::r(function(){options()}); options(default_opts)
#same as above but changes the output to character
#format(x, scientific = FALSE)     # Apply format function in R


p<-ggplot(mk,aes(x=AmountSpent))
p+geom_density(aes(fill=Gender,colour=Gender),alpha=0.3)

#Conditional density plot
p+geom_density(aes(fill=Gender))

#Improving the plot
p+geom_density(aes(fill=Gender,colour=Gender),alpha=0.4)

#2d counts# 2-dimensional heat map
p<-ggplot(mk,aes(x=Salary,y=AmountSpent))
p+geom_point(aes)
p+geom_bin2d()

#Changing ticks on a continuous scale
p<-ggplot(mk,aes(x=Salary,y=AmountSpent))
p+geom_point()

(p+geom_point()+scale_x_continuous(breaks=seq(0,150000,10000))
  +scale_y_continuous(breaks=seq(0,6000,500)))


#Changing fill behavior
(p+geom_bin2d()+scale_fill_gradientn(colours=c("blue","white","red"))
  +scale_x_continuous(breaks=seq(0,150000,10000))
  +scale_y_continuous(breaks=seq(0,6000,500)))




#3.Visualizing Data using Leaflet (Map data using long and Lat) 
install.packages("leaflet")
library(leaflet)
library(dplyr)
sh<-read.csv("schools.csv")

leaflet()%>%addTiles()
leaflet(sh)%>%addTiles()%>%addCircles(lng=~long,
                                      lat = ~lat, popup = ~category)

#Geo-spatial visualization using google map API (ggMap)
#not working now. 
library(ggmap)
library(ggplot2)
library(dplyr)
library(rgdal)
map<-get_map("bangalore",maptype="hybrid")
ggmap(map)
#Overlaying data on the map from a text file
sh<-read.csv("schools.csv")
head(sh)
ggmap(map)+geom_point(data=sh,aes(x=long,y=lat),colour="red")


#4.Shape file - to extract gepspatial data 
#shape file contains Geo-spatial data (Data + location Data)
#we use shape-file to get these data  either in spatial-Polygons 
#Data-Frame or in spatial points data-frame
#other types of data file :- Spatial lines/pixels/Grid Data-Frame
#Many times the data and location info is not present in same file
#shape file contains @data slot and @coords slot. 

library(dplyr)
library(rgdal)
library(leaflet)

getwd()
(setwd("C:/Users/Animesh.Parikshya/Documents/IIM Classes/R Classes/Dataset"))

shape1=readOGR("Subway",p4s = "+proj=utm")
shape1@data%>%head()
shape1@coords%>%head()
#here the location is saved as Northing and Easting
#leaflet expect the values in logitude and latitude,
#so we have to convert then into Long & Lat

shape2<-spTransform(shape1,CRS("+init=epsg:4326"))
shape2@data%>%head()
shape2@coords%>%head()

leaflet(shape2)%>%addTiles()%>%addCircles()


#https://data.cityofnewyork.us/Health/Health-Areas/5p78-k3zm
#SpatialPolygonsDataFrame
shape3<-readOGR(dsn="nyha_15a","nyha")

class(shape3)

#shape1 data,polygons,plot-Order,b-box,proj-4string

head(shape3@data)
shape3@polygons[1]
#Look at the locations information
shape3@bbox
#Long-lat needs to be converted to proper format
shape4<-spTransform(shape3,CRS("+init=epsg:4326"))
shape4@data%>%head()
shape4@polygons[1]


leaflet(shape4)%>%addTiles()%>%addPolygons(weight = 0.9,
                            popup =~as.character(HealthArea))
shape4@data%>%head()#

#color the polygons and change them as per the magnitude of
#health Area
shape3@data$HealthArea%>%max()
shape3@data$HealthArea%>%min()
shape3@data$HealthArea%>%summary
#adding palate color
pal = colorBin("Reds", bins = 4, domain = c(100,9300))

(leaflet(shape4)%>%addTiles()%>%addPolygons(weight = 0.9,
                    popup =~as.character(HealthArea), 
                    fillColor = ~pal(HealthArea),
                    fillOpacity = 1))
#Add legends
(leaflet(shape4)%>%addTiles()%>%addPolygons(weight = 0.9,
                    popup =~as.character(HealthArea), 
                    fillColor = ~pal(HealthArea),
                    fillOpacity = 1)%>%addLegend(pal = pal
                                            ,values = ~HealthArea))


#Below code is old code used with google map API. 
#currently not used
#extract long-lat data
shape4.f<-fortify(shape1)
head(shape4.f)
head(shape4@data)
dim(shape4.f)
dim(shape4@data)

shape1@data$id<-unique(shape1.f$id)

#Merging the data
shapeM<-merge(shape1.f,shape1@data,by.x="id",by.y="id")

map<-get_map("New York City",maptype="terrain")
ggmap(map)+geom_polygon(data=shapeM,aes(x=long,y=lat,
                                        group=id,fill=Shape_Area),
                        alpha=0.4,colour="black")+
  scale_fill_gradientn(colours = c("red","white","blue"))

options(scipen=999)

## SpatialPointsDataFrame Newyork Subway Entrance Data
shape2<-readOGR(dsn="Subway","DOITT_SUBWAY_ENTRANCE_01_13SEPT2010")
class(shape2)
#Components of shape2 :data, coordinate.nrs, coords,bbox,proj4string
shape2@
dim(shape2@data)
dim(shape2@coords)

#Contents of shape2@coords
head(shape2@coords)

#Data in Northings and Eastings: Convert it into Long-Lat
shape2<-spTransform(shape2,CRS("+init=epsg:4326"))

#Combine data and long latt info as a dataframe
dataC<-data.frame(shape2@data,shape2@coords)
head(dataC)
map<-get_map("New York City",maptype="satellite")
ggmap(map)+geom_point(data=dataC,aes(x=coords.x1,y=coords.x2),
                      colour="red",alpha=0.3)
