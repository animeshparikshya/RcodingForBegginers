library(sp)
data <- meuse
head(data)


#q3
?Orange

library(ggplot2)

or<-Orange
head(or)
p<-ggplot(or,aes(x=age,y=circumference))

q <- p+geom_point(aes(color=Tree))
q

?par


library(ggplot2)

p<-ggplot(diamonds,aes(x=carat))
p+geom_histogram(aes(fill=as.factor(cut)))
p+geom_histogram(aes(fill=as.factor(cut)),position="dodge")

What is the use of "position=dodge" in this command?