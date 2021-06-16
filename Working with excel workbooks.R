#Class 04 - Importing & Exporting Data in R
#Topic 4 - Working with excel workbooks

###Dataset Details
##Customer data with information related to first name, last name, 
##city, country, state and zip
##File names: customers.xlsx and customers.xls
##File type: Excel Workbooks
##Sheets: newyork, california, others

###Using XLConnect R package
##Reading from excel files
#Loading Library

install.packages("readxl")

library(readxl)

getwd()

setwd("C:/Users/Animesh.Parikshya/Documents/IIM Classes/R Classes/Dataset")

#Load the workbook
wb = read_excel("customers.xlsx")

#get the sheet names in excel workbook
excel_sheets("customers.xlsx") 
#[1] "newyork"    "california" "others"     "new sheet" 

california = read_excel("customers.xlsx", sheet = "california")
head(california)
head(wb) #by default it will store 1st worksheet i.e. newyork

#to get the data in sheet 3 i.e. others
others <- read_excel("customers.xlsx", sheet = 3)
head(others)

#to import first 5 rows from new sheet
newsheet <- read_excel("customers.xlsx", sheet = "new sheet", n_max = 5)
head(newsheet)

#import from cell range
cellrange <- read_excel("customers.xlsx", range = "C1:E4")
head(cellrange)

#readxl includes several example files
readxl_example()

xls <- readxl_example("deaths.xls")
death <- read_excel(xls) 
                    #.name_repair = "universal", 
                    #range = "A4:F18", col_names = TRUE)

?read_excel
excel_sheets(xls)
head(death)
dim(death)
names(death)

#replace the 60 as NA
death <- read_excel(xls, na = c(60, "Age"))
head(death, 18)

library(XLConnect)

#Loading Excel Workbook
wb<-loadWorkbook("customers.xlsx")

#Reading "newyork" sheet from workbook connection
newyork<-readWorksheet(wb,
                       "newyork",
                       header=T)

#Reading "california" sheet from workbook connection
california<-readWorksheet(wb,
                          "california",
                          header=T)

#Reading "newyork" sheet directly from excel file
newyork<-readWorksheetFromFile("customers.xlsx",
                               "newyork",
                               header=T)

#Using .xls excel file
newyork<-readWorksheetFromFile("customers.xls",
                               "newyork",
                               header=T)

##Writing to excel files
#Using createSheet for creating a new worksheet in excel file
createSheet(wb,"new sheet")

#Writing R data frame object 
writeWorksheet(wb,newyork,"new sheet")

#Saving the workbook
saveWorkbook(wb,"customers.xlsx")

###Using xlsx R package
##Reading from excel files
#Loading Library
library(xlsx)

#Reading a sheet from .xlsx excel file into R data frame
newyork<-read.xlsx("customers.xlsx",
                   sheetName="newyork")

#Reading a sheet from .xls excel file into R data frame
newyork<-read.xlsx("customers.xls",
                   sheetName="newyork")

##Writing to excel files
#Export a data frame into excel file
write.xlsx(newyork,
           "customers_newyork.xlsx",
           sheetName="newyork",
           row.names=F)

###Using gdata R package
##Reading from excel files
#Loading Library
library(gdata)

#Reading a sheet from .xlsx excel file
newyork<-read.xls("customers.xlsx",
                  sheet="newyork")

#Reading a sheet from .xls excel file
newyork<-read.xls("customers.xls",
                  sheet="newyork")
                  