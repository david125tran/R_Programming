# --------------------------- Get working directory ---------------------------
getwd() # "C:/Users/DTran/Desktop/R Programming/Section13"

# --------------------------- Set working directory ---------------------------
# Root directory
# setwd('../')  

# ./R directory
# setwd('./R')

directory = "C:/Users/DTran/Desktop/R Programming/Section13"
# R likes only forward slashes 
setwd(directory)

# --------------------------- Reading csv files ---------------------------
# Create the file path string
relative_file_path1 = './data/NYC temperature data.csv'
absolute_file_path1 = 'C:/Users/DTran/Desktop/R Programming/Section13/data/NYC temperature data.csv'

# Create the dataframe by loading the csv file
rel_nyc_temp = read.csv(file=relative_file_path1)
abs_nyc_temp = read.csv(file=absolute_file_path1)

# --------------------------- Reading xls files ---------------------------
# Install and load the readxl library
install.packages('readxl')
library(readxl)

# Create the file path string
relative_file_path2 = './data/FBI Crime Data.xls'
absolute_file_path2 = 'C:/Users/DTran/Desktop/R Programming/Section13/data/FBI Crime Data.xls'

# Create the dataframe by loading the xls file
rel_fbi_crime = read_excel(path=relative_file_path2)
abs_fbi_crime = read_excel(path=absolute_file_path2)

# --------------------------- Loading MySQL database ---------------------------
# There are multiple ways to do this.  

# Install and load the RMySQL library
install.packages("RMySQL")
library(RMySQL)

# Make the connection string
mysqlconnection = dbConnect(RMySQL::MySQL(),
                            dbname='fishing_trip',
                            host='localhost',
                            port=3306,
                            user='root',
                            password='************')

# List the tables
dbListTables(mysqlconnection)

# Write some queries
sql_query = "SELECT * FROM fishing_poles;"
result = dbSendQuery(mysqlconnection, sql_query)

# Print the results
data.frame = fetch(result, n=5)
print(data.frame)

#   id         brand
# 1  1    Abu Garcia
# 2  2         Daiwa
# 3  3 Okuma Fishing
# 4  4         Orvis
# 5  5          Penn