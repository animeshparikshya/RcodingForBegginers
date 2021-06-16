#Class 04 - Importing & Exporting Data in R
#Topic 7 - Working with web data


#install.packages("XML")
library(XML)

x <- (readHTMLTable("http://apps.saferoutesinfo.org/legislation_funding%20/state_apportionment.cfm"))
str(x)

state = as.data.frame(x[1])
dim(state)
head(state)

names(state)#getting the name of col.

#renaming the col
names(state) <- c("State", paste0('Actual-', 2005:2012), "Total")
head(state)

#writing the data into CSV
#Base R function
getwd()
write.csv(state, "state.csv", row.names = FALSE)

###File Details
##Information: Customer data with information related to first name, last name, city, county, state and zip
##File Details: customersJSON.txt, customers.xml
##URL Links: 1) http://www.gutenberg.org/cache/epub/2701/pg2701.txt
##           2) http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/taxon.txt      

###Using file and url options to directly read data from URL links
##Using readLines function
data<-url("http://www.gutenberg.org/cache/epub/2701/pg2701.txt")
webText<-readLines(data,n=50)

##Using read.table function
plants<-read.table("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/taxon.txt",
                      sep="",
                      header=T,
                      stringsAsFactors=F)

dim(plants)
str(plants)
head(plants)

##Downloading files from URL links (simple text file)
download.file("http://www.bio.ic.ac.uk/research/mjcraw/therbook/data/taxon.txt",
              "sample.txt")

###Handling json files
##Loading jsonlite library
library(jsonlite)

##Reading json files to R
customers<-fromJSON("customersJSON.txt")
class(customers)
head(customers)
##Writing json files from R
output<-toJSON(customers, pretty=TRUE)
cat(output)
writeLines(output,"customers_json.txt")

#FROM WEB
web1<-fromJSON("http://api.glassdoor.com/api/api.htm?v=1&format=json&t.p=47699&t.k=g9GdVHlQ1eM&action=employers&q=pharmaceuticals&userip=192.168.43.42&useragent=Mozilla/%2F4.0")
class(web1)
str(web1) #has 4 objects and 4th object "response" is again a list of 5 (the dots give the clue about hierarchy)
length(web1)
web1$response
class(web1$response)
length(web1$response)
web1[4] #4th object is response
web1[5] #there is no 5th object in response
web1$response[1]
web1$response[5]
web1$response$employers
length(web1$response$employers)
names(web1$response$employers)
names(web1$response$employers$featuredReview) #goes on and on as list inside a list

###Handling xml files
##Loading XML library
library(XML)

##XML file
xmlfile<-"customers.xml"

##Use the xmlTreePares-function to parse xml file
xmlparse<-xmlTreeParse(xmlfile)
class(xmlparse)

##Use the xmlRoot-function to access the top node
xmltop<-xmlRoot(xmlparse)

##Extract the XML-values from the document, use xmlSApply
customers<-xmlSApply(xmltop, function(x) xmlSApply(x, xmlValue))
customers

##Get the data in a data-frame
customers_df<-data.frame(t(customers),row.names=NULL)
head(customers_df)

###Web scraping using RCurl and XML packages
###Website: https://stat.ethz.ch/pipermail/r-help/2009-January/date.html
###The site consists of January 2009 R help Archives sorted by date
###The goal is to extract Authors info and identify the biggest contributor

##Loading library
#install.packages("RCurl")
library(RCurl)
library(XML)

##Getting the html content from URL
htmlContent<-getURL("https://stat.ethz.ch/pipermail/r-help/2009-January/date.html",
                    ssl.verifypeer = FALSE)

##Parsing the html tree structure from html content
htmlParsed<-htmlTreeParse(htmlContent,
                          useInternal = TRUE)
authorsOuput<-unlist(xpathApply(htmlParsed, '//i', xmlValue))
authorsOuput<-gsub('\\n',' ',authorsOuput)

##Converting the output to data frame object
output<-data.frame(table(authorsOuput))
output<-output[order(-output$Freq),]
head(output)


#Getting tables from web pages
#Many web pages contain tabular data as comma separated or tab separated
#UCI Abalone data set
web2<-read.csv("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data",header=FALSE)
head(web2)# Column names are missing

#Use the documentation on the page to figure out the column names

name<-c("Sex","Length","Diameter","Height","Whole.Weight","Shuclked.Weight","Viscera.Weight","Shell.Weight","Rings")
names(web2)<-name
head(web2)
str(web2)






#to get all above in HTML/MS Word/PDF format install knitr
#install.packages("knitr")
#then Go to --> File --> Knit document --> it may ask to update few
#packages, click OK --> In Report Output format select HTML/MS Word/
# PDF as per requirement-->Click OK




#R mailer lists
#https://www.r-project.org/mail.html
#click on web interface in each of the section in above link to get the relevant mail address
#Also contains information about R package development support

#List of R packages by tasks (ex:- Bayesian, clustering, optimization etc.)
#https://cran.r-project.org/web/views/

#Establishing jdbc connection with oracle
#https://www.linkedin.com/pulse/connect-oracle-database-r-rjdbc-tianwei-zhang/
#creating and modifying tables in oracle
#https://stackoverflow.com/questions/31796649/rjdbc-r-to-oracle-cannot-delete-or-drop-table

#webservices
#fromJSON taught in the class to get data from webservice
#to send data to webservice: https://stackoverflow.com/questions/32383473/using-r-to-call-a-web-service-send-data-and-get-the-result-table-back-in-r