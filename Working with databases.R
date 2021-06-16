#Class 04 - Importing & Exporting Data in R
#Topic 6 - Working with databases

###File Details
##Database Engine: SQLite
##Database Name: customersDB
##Tables: newyork, california, others
##Information: Customer data with information related 
#to first name, last name, city, county, state and zip

###Using RSQLite Package - A specific SQLite related database package
##Interacting with SQLite database tables
##Loading Library
library(RSQLite)

##Database connectivity
sqlite<-dbDriver("SQLite")
customersdb<-dbConnect(sqlite,"customersDB.db")

##Listing tables
dbListTables(customersdb)

##Listing fields from a table
dbListFields(customersdb,"newyork")

##Running SQL queires
dbGetQuery(customersdb,
           "select count(*) from newyork")

dbGetQuery(customersdb,
           "select * from newyork limit 10")

dbGetQuery(customersdb,
           "select city,count(*) as cnt from newyork group by
           city order by cnt desc")

##Reading data from SQLite to R
newyork<-dbReadTable(customersdb, "newyork")
head(newyork)

##Writing data from R to SQLite
dbWriteTable(customersdb,"newyork1",newyork)

##Disconnecting database connection
dbDisconnect(customersdb)

###Using RODBC Package - A general purpose database package
##Interacting with SQLite database tables
##Loading Library
library(RODBC)

##Create a data source name on system under ODBC connections
##Install SQLite driver
##Update SQLite db details under ODBC connections

##Database connectivity
##Opening ODBC connection
customers<-odbcConnect("customersdb",
                       believeNRows = FALSE,
                       rows_at_time = 1)

##Information about current database connection
odbcGetInfo(customers)

##Listing the tables present in the database
sqlTables(customers)

##Running SQL queries
sqlQuery(customers,
         "select count(*) from newyork")

sqlQuery(customers,
           "select * from newyork limit 10")

sqlQuery(customers,
           "select city,count(*) as cnt from newyork group 
         by city order by cnt desc")

##Closing ODBC connection
odbcClose(customers)

#If mysql is the sql engine to be connected then RMySql can be
#used to connect R to sql

# 1. Library
library(RMySQL)

# 2. Settings
db_user <- 'root'
db_password <- 'Chetan@127' #Sys.getenv("MYSQL_PASSWORD")
db_name <- 'northwind'
db_table <- 'customers'
db_host <- 'localhost' # for local access
db_port <- 3306

# 3. Read data from db
mydb <-  dbConnect(MySQL(), user = db_user, password = db_password,
                   dbname = db_name, host = db_host, port = db_port)
s <- paste0("select * from ", db_table)
rs <- dbSendQuery(mydb, s)
df <-  fetch(rs, n = -1)
on.exit(dbDisconnect(mydb))

con<-dbConnect(MySQL(),dbname="localhost:3306",username="root",password="Chetan@127")

dbListTables(con) #list tables in the database

import.sql1<-dbGetQuery(con,"SELECT * FROM city") 
#select * from one of the tables from the database (city)

class(import.sql1) #dataframe

dbDisconnect(con)




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