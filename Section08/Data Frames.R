# --------------------- Data frames ---------------------
# Matrices only contain elements of the same type
# Data frames can contain elements of different types 
# Data frame columns must contain elements of the same type 

countries_data1 <- data.frame(country=c("Portugal", "France", "UK"),
                              population=c(10280000, 66990000, 66650000),
                              EU=c("Y","N","N"))

#     country population EU
# 1 Portugal   10280000  Y
# 2   France   66990000  N
# 3       UK   66650000  N

# Naming row names with "row.names" 
countries_data2 <- data.frame(population=c(10280000, 66990000, 66650000),
                              EU=c("Y","N","N"),
                              row.names=c("Portugal","France","UK")
                              )

#           population EU
# Portugal   10280000  Y
# France     66990000  N
# UK         66650000  N

countries_data1['Portugal',] # Doesn't work because the rows don't have a name
#     country population   EU
# NA  <NA>    NA           <NA>
  
countries_data2['Portugal',] # Works because the rows have a name
#           population EU
# Portugal   10280000  Y

countries_data2[c("Portugal", "France"), 1]
# [1] 10280000 66990000

summary(countries_data2)
# population            EU           
# Min.   :10280000   Length:3          
# 1st Qu.:38465000   Class :character  
# Median :66650000   Mode  :character  
# Mean   :47973333                     
# 3rd Qu.:66820000                     
# Max.   :66990000 

# --------------------- Lists ---------------------
# Lists are R objects known for their flexibility
# They are able to hold different types of objects and even other R objects in them

list1 = list('Dog', 1, TRUE)

# --------------------- Applying names to a list ---------------------
names(list1) = c("Animal", "Amount", "Alive")

# $Animal
# [1] "Dog"
# 
# $Amount
# [1] 1
# 
# $Alive
# [1] TRUE

# Accessing list elements.  They must be accessed using double square brackets [[]].  Not single square [].
list1[["Animal"]] # "Dog"
list1[["Alive"]] # True
list1[[1]]

countries_data3 <- data.frame(country=c("Portugal", "France", "UK"),
                              population=c(10280000, 66990000, 66650000),
                              EU=c(TRUE, TRUE, FALSE)
)
#    country population    EU
# 1 Portugal   10280000  TRUE
# 2   France   66990000  TRUE
# 3       UK   66650000 FALSE

# --------------------- Structure command ---------------------
str(countries_data3)
# 'data.frame':	3 obs. of  3 variables:
# $ country   : chr  "Portugal" "France" "UK"
# $ population: num  10280000 66990000 66650000
# $ EU        : logi  TRUE TRUE FALSE

# R automatically converts strings to factors unless explicitly set to FALSE
countries_data4 <- data.frame(country=c("Portugal", "France", "UK"),
                              population=c(10280000, 66990000, 66650000),
                              EU=c(TRUE, TRUE, FALSE),
                              stringsAsFactors=FALSE
)

class(countries_data4) # data.frame
typeof(countries_data4) # list

countries_data5 <- data.frame(population=c(10280000, 66990000, 66650000),
                              EU=c(TRUE, TRUE, FALSE),
                              row.names=c("Portugal", "France", "UK"),
                              stringsAsFactors=FALSE
)
#         population    EU
# Portugal   10280000  TRUE
# France     66990000  TRUE
# UK         66650000 FALSE

# --------------------- Indexing ---------------------
countries_data5[1,1] # 10280000

countries_data5[1,]
#         population   EU
# Portugal   10280000 TRUE

countries_data5['France',]
#       population   EU
# France   66990000 TRUE   

countries_data5[c('France', 'Portugal'),]
#         population   EU
# France     66990000 TRUE
# Portugal   10280000 TRUE

# --------------------- Element reassignment ---------------------
countries_data5['Portugal', 'population'] = 1
#         population    EU
# Portugal          1  TRUE
# France     66990000  TRUE
# UK         66650000 FALSE

# --------------------- Expanding data frame ---------------------
spain_data = data.frame(country=c('Spain'),
                        population=c(46754778),
                        EU=c(TRUE),
                        stringsAsFactors=FALSE
)
#   country population   EU
# 1   Spain   46754778 TRUE

countries_data4 = rbind(countries_data4, spain_data)

#    country population    EU
# 1 Portugal   10280000  TRUE
# 2   France   66990000  TRUE
# 3       UK   66650000 FALSE
# 4    Spain   46754778  TRUE

capitals = c('Libson', 'Paris', 'London', 'Madrid')

countries_data4 = cbind(countries_data4, capitals)

#     country population    EU capitals
# 1 Portugal   10280000  TRUE   Libson
# 2   France   66990000  TRUE    Paris
# 3       UK   66650000 FALSE   London
# 4    Spain   46754778  TRUE   Madrid

str(countries_data4)
# 'data.frame':	4 obs. of  4 variables:
# $ country   : chr  "Portugal" "France" "UK" "Spain"
# $ population: num  10280000 66990000 66650000 46754778
# $ EU        : logi  TRUE TRUE FALSE TRUE
# $ capitals  : chr  "Libson" "Paris" "London" "Madrid"

# --------------------- Removing elements from data frame ---------------------
# Removing a row
countries_data4 = countries_data4[-4,]
#    country population    EU capitals
# 1 Portugal   10280000  TRUE   Libson
# 2   France   66990000  TRUE    Paris
# 3       UK   66650000 FALSE   London

# Removing a column
countries_data4[,'EU'] = NULL
#     country population capitals
# 1 Portugal   10280000   Libson
# 2   France   66990000    Paris
# 3       UK   66650000   London

# Alternatively, to remove a row, you could do this:
# countries_data4 = countries_data4[,-3]

# Create a new data frame with 3 columns (name, 
# minutes and type)
# called sports with the following data:
# name should have the rows Football, Hockey, Rugby
# minutes should have the rows: 90, 70 and 80
# type: outdoor, indoor, outdoor

# Store it in an object named sports

sports = data.frame(name=c('Football','Hockey','Rugby'),
                           minutes=c(90,70,80),
                           type=c('outdoor','indoor', 'outdoor')
)

#       name minutes    type
# 1 Football      90 outdoor
# 2   Hockey      70  indoor
# 3    Rugby      80 outdoor

# Create a new data frame with a new sport 
# called Volleyball with 60 minutes 
# and type NA 

# Store it in a variable called volley
volley = data.frame(name=c('Volleyball'), 
                    minutes=c(60), 
                    type=c(NA)
)

#         name minutes type
# 1 Volleyball      60   NA

# Add volley to the sports table 
# store the object in a table called 
# sports_2

# Hint: The order matters! You should add volley 
# to the sports table so volley should be added at the end
# of the table

sports_2 = rbind(sports, volley)

#         name minutes    type
# 1   Football      90 outdoor
# 2     Hockey      70  indoor
# 3      Rugby      80 outdoor
# 4 Volleyball      60    <NA>

# Store the name of the sports in a variable 
# called name_sports

name_sports = sports_2[, 'name']    # [1] "Football"   "Hockey"     "Rugby"      "Volleyball"

# Add row names to sports_2 with the name of
# the sports
row.names(sports_2) = name_sports
#                 name minutes    type
#   Football     Football      90 outdoor
#   Hockey         Hockey      70  indoor
#   Rugby           Rugby      80 outdoor
#   Volleyball Volleyball      60    <NA>


# Remove the name column from sports_2 table
sports_2[,'name'] = NULL

#            minutes    type
# Football        90 outdoor
# Hockey          70  indoor
# Rugby           80 outdoor
# Volleyball      60    <NA>

# Change the type of the volleyball game 
# to "indoor"

# rewrite the sports_2 object
sports_2['Volleyball', 'type'] = 'indoor'

#            minutes    type
# Football        90 outdoor
# Hockey          70  indoor
# Rugby           80 outdoor
# Volleyball      60 indoor

# create a new vector with the following data: 
# 'FIFA', 'IHF', 'IRL', 'FIVB'

# name the vector federation 

federation = c('FIFA', 'IHF', 'IRL', 'FIVB')

# Add the federation to our sports_2 
# object - explicitly let R know that you 
# want the federation to be a character

# rewrite the sports two object 

sports_2 = cbind(sports_2, federation,  stringsAsFactors=FALSE)

#            minutes    type federation
# Football        90 outdoor       FIFA
# Hockey          70  indoor        IHF
# Rugby           80 outdoor        IRL
# Volleyball      60  indoor       FIVB

# Check the mean of the minutes of the four sports 
# store the value in a mean_minutes variable

mean_minutes = mean(sports_2[,'minutes'])
