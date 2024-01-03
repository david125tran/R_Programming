# ----------------- Loading R example data set -----------------
data()
data(mtcars)

# ----------------- Looking at metadata of metadata -----------------
# "?mtcars" This only works for data sets loaded into R
mtcars 
dim(mtcars) # 32 11
ncol(mtcars) # 11
nrow(mtcars) # 32
# View(mtcars)
head(mtcars)
head(x=mtcars, n=7)
tail(mtcars)
tail(x=mtcars, n=2)
str(mtcars)
rownames(mtcars)
colnames(mtcars)
summary(mtcars)

# View() is not recommended for viewing large data sets because it can
# cause your cpu to crash if the file is large.  Instead look at the
# head and tail of the table

# ----------------- Filtering -----------------
mtcars[,'cyl'] # [1] 6 6 4 6 8 6 8 4 4 6 6 8 8 8 8 8 8 4 4 4 4 8 8 8 8 4 4 4 8 6 8 4
mtcars$cyl     # [1] 6 6 4 6 8 6 8 4 4 6 6 8 8 8 8 8 8 4 4 4 4 8 8 8 8 4 4 4 8 6 8 4

mtcars[,'cyl'] == 4
# [1] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
# [17] FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE

# Single condition
mtcars[mtcars[,'cyl'] == 4,]
#                 mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Datsun 710     22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
# Merc 240D      24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
# Merc 230       22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
# Fiat 128       32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
# Honda Civic    30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
# Toyota Corolla 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
# Toyota Corona  21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
# Fiat X1-9      27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
# Porsche 914-2  26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
# Lotus Europa   30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
# Volvo 142E     21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

# Multiple conditions
mtcars[(mtcars[,'cyl'] == 4) | (mtcars[,'cyl'] == 6),]
#                 mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4      21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag  21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710     22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive 21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
# Valiant        18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
# Merc 240D      24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
# Merc 230       22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
# Merc 280       19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
# Merc 280C      17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
# Fiat 128       32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
# Honda Civic    30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
# Toyota Corolla 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
# Toyota Corona  21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
# Fiat X1-9      27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
# Porsche 914-2  26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
# Lotus Europa   30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
# Ferrari Dino   19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
# Volvo 142E     21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

# Multiple conditions across multiple columns
mtcars[(mtcars[,'cyl'] == 4) | (mtcars[,'gear'] == 3),]
#                       mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
# Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
# Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
# Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
# Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
# Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
# Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
# Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
# Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
# Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
# Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
# Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
# Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
# Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
# Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
# Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
# Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
# AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
# Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
# Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
# Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
# Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
# Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
# Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

# Multiple conditions 
mtcars[(mtcars[,'cyl'] == 4) & (mtcars[,'gear'] == 3),]
#                      mpg cyl  disp hp drat    wt  qsec vs am gear carb
# Toyota Corona       21.5   4 120.1 97  3.7 2.465 20.01  1  0    3    1

# Returning rows where something is not a value
mtcars[mtcars[,'cyl'] != 4,] 

# Multiple conditions
# Alternatively to search for multiple conditions you can build a list with 
# all of the conditions and pass it into a filter
cyl_list = c(4,6)
mtcars[mtcars[,'cyl'] %in% cyl_list,]
#                 mpg cyl  disp  hp drat    wt  qsec vs am gear carb
# Mazda RX4      21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
# Mazda RX4 Wag  21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
# Datsun 710     22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
# Hornet 4 Drive 21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
# Valiant        18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
# Merc 240D      24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
# Merc 230       22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
# Merc 280       19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
# Merc 280C      17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
# Fiat 128       32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
# Honda Civic    30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
# Toyota Corolla 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
# Toyota Corona  21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
# Fiat X1-9      27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
# Porsche 914-2  26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
# Lotus Europa   30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
# Ferrari Dino   19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
# Volvo 142E     21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2

mtcars[(mtcars[,'hp'] >100) & (mtcars[,'hp'] < 110),] 
#             mpg cyl disp  hp drat   wt  qsec vs am gear carb
# Valiant    18.1   6  225 105 2.76 3.46 20.22  1  0    3    1
# Volvo 142E 21.4   4  121 109 4.11 2.78 18.60  1  1    4    2

# ----------------- Creating new columns -----------------
mtcars[,'hp_wt'] = mtcars[,'hp']/mtcars[,'wt']

head(x=mtcars, n=3)
#                mpg cyl disp  hp drat    wt  qsec vs am gear carb    hp_wt
# Mazda RX4     21.0   6  160 110 3.90 2.620 16.46  0  1    4    4 41.98473
# Mazda RX4 Wag 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4 38.26087
# Datsun 710    22.8   4  108  93 3.85 2.320 18.61  1  1    4    1 40.08621

mtcars[,'hp_squared'] = mtcars[,'hp'] **2
head(x=mtcars, n=3)
#                mpg cyl disp  hp drat    wt  qsec vs am gear carb    hp_wt hp_squared
# Mazda RX4     21.0   6  160 110 3.90 2.620 16.46  0  1    4    4 41.98473      12100
# Mazda RX4 Wag 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4 38.26087      12100
# Datsun 710    22.8   4  108  93 3.85 2.320 18.61  1  1    4    1 40.08621       8649

mtcars[,'model'] = rownames(mtcars)
head(x=mtcars, n=3)
#                mpg cyl disp  hp drat    wt  qsec vs am gear carb    hp_wt hp_squared         model
# Mazda RX4     21.0   6  160 110 3.90 2.620 16.46  0  1    4    4 41.98473      12100     Mazda RX4
# Mazda RX4 Wag 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4 38.26087      12100 Mazda RX4 Wag
# Datsun 710    22.8   4  108  93 3.85 2.320 18.61  1  1    4    1 40.08621       8649    Datsun 710

# ----------------- Apply family -----------------
data(iris)

# Sometimes you have to specify columns because the data frame puts characters
# or factors into the function instead of the actual integer values of the elements 
apply(X=iris[,1:4], MARGIN=2, FUN=mean)
lapply(X=iris, FUN=mean)
lapply(X=iris[,1:4], FUN=sum)
sapply(X=iris[,1:4], FUN=sum)

# ----------------- New column with Sapply -----------------
models = strsplit(x=mtcars[,'model'], split=' ')
# [[1]]
# [1] "Mazda" "RX4"  
# 
# [[2]]
# [1] "Mazda" "RX4"   "Wag"  
# 
# [[3]]
# [1] "Datsun" "710"   
# 
# [[4]]
# [1] "Hornet" "4"      "Drive" 
# 
# [[5]]
# [1] "Hornet"     "Sportabout"
# 
# [[6]]
# [1] "Valiant"
# 
# [[7]]
# [1] "Duster" "360"   
# 
# [[8]]
# [1] "Merc" "240D"
# 
# [[9]]
# [1] "Merc" "230" 
# 
# [[10]]
# [1] "Merc" "280" 
# 
# [[11]]
# [1] "Merc" "280C"
# 
# [[12]]
# [1] "Merc"  "450SE"
# 
# [[13]]
# [1] "Merc"  "450SL"
# 
# [[14]]
# [1] "Merc"   "450SLC"
# 
# [[15]]
# [1] "Cadillac"  "Fleetwood"
# 
# [[16]]
# [1] "Lincoln"     "Continental"
# 
# [[17]]
# [1] "Chrysler" "Imperial"
# 
# [[18]]
# [1] "Fiat" "128" 
# 
# [[19]]
# [1] "Honda" "Civic"
# 
# [[20]]
# [1] "Toyota"  "Corolla"
# 
# [[21]]
# [1] "Toyota" "Corona"
# 
# [[22]]
# [1] "Dodge"      "Challenger"
# 
# [[23]]
# [1] "AMC"     "Javelin"
# 
# [[24]]
# [1] "Camaro" "Z28"   
# 
# [[25]]
# [1] "Pontiac"  "Firebird"
# 
# [[26]]
# [1] "Fiat" "X1-9"
# 
# [[27]]
# [1] "Porsche" "914-2"  
# 
# [[28]]
# [1] "Lotus"  "Europa"
# 
# [[29]]
# [1] "Ford"    "Pantera" "L"      
# 
# [[30]]
# [1] "Ferrari" "Dino"   
# 
# [[31]]
# [1] "Maserati" "Bora"    
# 
# [[32]]
# [1] "Volvo" "142E" 

sapply(X=models, FUN='[', n=1)
# '[' passed into function (FUN) makes it so that it doesn't do anything
# n=1 grabs the 1st element 

# [1] "Mazda"    "Mazda"    "Datsun"   "Hornet"   "Hornet"   "Valiant"  "Duster"   "Merc"    
# [9] "Merc"     "Merc"     "Merc"     "Merc"     "Merc"     "Merc"     "Cadillac" "Lincoln" 
# [17] "Chrysler" "Fiat"     "Honda"    "Toyota"   "Toyota"   "Dodge"    "AMC"      "Camaro"  
# [25] "Pontiac"  "Fiat"     "Porsche"  "Lotus"    "Ford"     "Ferrari"  "Maserati" "Volvo"  

mtcars$brand = sapply(X=models, FUN='[', n=1)
# It is important to use sapply instead of lapply.  Because lapply will result
# in a list.  Whereas sapply will result in a vector.  When you aggregate data,
# it is recommended to store the data as vectors.  

head(x=mtcars[10:15], n=3)
#               gear carb    hp_wt hp_squared         model  brand
# Mazda RX4        4    4 41.98473      12100     Mazda RX4  Mazda
# Mazda RX4 Wag    4    4 38.26087      12100 Mazda RX4 Wag  Mazda
# Datsun 710       4    1 40.08621       8649    Datsun 710 Datsun

# ----------------- Aggregating and sorting -----------------
# Mean of horsepower by brand
hp_brands = aggregate(
  x=mtcars[,'hp'],
  by=list(mtcars[,'brand']),
  FUN=mean
)

colnames(hp_brands) = c('brand', 'mean_hp')
head(hp_brands)

#      brand mean_hp
# 1      AMC     150
# 2 Cadillac     205
# 3   Camaro     245
# 4 Chrysler     230
# 5   Datsun      93
# 6    Dodge     150

hp_brands[order(-hp_brands[,'mean_hp']),] # Descending
hp_brands[order(hp_brands[,'mean_hp']),] # Ascending

hp_brands = hp_brands[order(-hp_brands[,'mean_hp']),]
head(hp_brands)
#       brand mean_hp
# 15 Maserati     335
# 10     Ford     264
# 3    Camaro     245
# 7    Duster     245
# 4  Chrysler     230
# 13  Lincoln     215

# ----------------- Merging data frames/Joining tables -----------------
# Removing columns
mtcars[,'model'] = NULL
mtcars[,'hp_squared'] = NULL
mtcars[,'hp_wt'] = NULL

# Adding  a column
mtcars[,'car_model'] = rownames(mtcars)

# Create a table that shares a column
brands_origin = data.frame(
  brand = c("Mazda", "Toyota", "Fiat", "Volvo", "Skoda"),
  country = c("Japan", "Japan", "Italy", "Sweden", "Czech Republic")
)

#       brand        country
# 1     Mazda          Japan
# 2    Toyota          Japan
# 3      Fiat          Italy
# 4     Volvo         Sweden
# 5     Skoda Czech Republic

# Inner Join 
mtcars_origin = merge(x=mtcars, y=brands_origin, by="brand")

# Left Join 
mtcars_origin_left = merge(x=mtcars, y=brands_origin, by="brand", all.x=TRUE)

# Right Join 
mtcars_origin_right = merge(x=mtcars, y=brands_origin, by="brand", all.y=TRUE)

# Full Outer Join
mtcars_origin_full = merge(x=mtcars, y=brands_origin, by="brand", all=TRUE)

# ----------------- Merging data frames/Joining tables using a SQL like library -----------------
install.packages("sqldf")
library(sqldf)

sql_df = sqldf('SELECT a.*, b.* 
                FROM mtcars as a
                INNER JOIN brands_origin as b
                USING (brand)
               ')

#    mpg cyl  disp  hp drat    wt  qsec vs am gear carb  brand      car_model  brand country
# 1 21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4  Mazda      Mazda RX4  Mazda   Japan
# 2 21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4  Mazda  Mazda RX4 Wag  Mazda   Japan
# 3 32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1   Fiat       Fiat 128   Fiat   Italy
# 4 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1 Toyota Toyota Corolla Toyota   Japan
# 5 21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1 Toyota  Toyota Corona Toyota   Japan
# 6 27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1   Fiat      Fiat X1-9   Fiat   Italy
# 7 21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2  Volvo     Volvo 142E  Volvo  Sweden

# ----------------- Plotting -----------------
# Removing columns
mtcars[,'brand'] = NULL
mtcars[,'car_model'] = NULL

# Scatter plot
plot(x=mtcars[,'hp'], 
     y=mtcars[,'wt'], 
     main='Scatter Plot HorsePower vs. Weight'
     )

# Bar plot
count_cyl = table(mtcars[,'cyl'])
# 4  6  8 
# 11  7 14

barplot(count_cyl, 
        main='Barplot of Count of Cars by Cylinder',
        xlab='Number of Cylinders',
        ylab='Count of Cars',
        col=c('darkred', 'green', 'orange')
        )

# Box plot
boxplot(hp~gear, 
        data=mtcars,
        main='Boxplot of HorsePower vs. Gear'
        )

# Histogram
hist(x=mtcars[,'hp'],
     main='Histogram of HorsePower',
     col=c('darkgreen'),
     breaks=20,
     xlab='hp'
     )

# ----------------- GGPlot2 Overview -----------------
install.packages('ggplot2')
library(ggplot2)

ggplot(
  data=mtcars,
  aes(x=hp),
) + geom_histogram(fill="salmon", 
                   color="black", 
                   binwidth=20
                   )

# ----------------- Practice problems -----------------
# Load the swiss dataset from R - don't forget
# that you don't need to assign it to a variable
# as it is an internal dataset from R
data()
data(swiss)

# Extract dimensions of the dataframe and store
# it in a variable called dim_swiss
dim_swiss = dim(swiss)

# Create a column in the swiss dataframe
# with the rownames of the table
# called municipality
swiss[,'municipality'] = rownames(swiss)

# Filter rows on the swiss dataset with 
# agriculture less than 10 and store the 
# result in a dataframe called low_agriculture
low_agriculture = swiss[swiss[,'Agriculture'] <10,]

# Extract the rows of the dataframe that have 
# the column Education with the values 6, 8 and
# 10 - store them in a data frame called 
# education_levels 
cyl_list = c(6, 8, 10)
education_levels = swiss[swiss[,'Education'] %in% cyl_list,]

# Extract the rows of the dataframe that have 
# education higher than 10 and catholic less than or equal 
# to 50 - store the rows in a filter_3 named object
filter_3 = swiss[(swiss[,'Education'] > 10) & (swiss[,'Catholic'] <= 50),]

# Check the mean of the first 6 variables in the swiss dataset
# Hint: Use one of the apply family functions!

mean_swiss = sapply(X=swiss[,1:6], FUN=mean)

# Sort the dataframe swiss by the column Infant.mortality 
# in a descending order - store it in a dataframe called 
# sorted_swiss
sorted_swiss = swiss[order(-swiss[,'Infant.Mortality']),]

# Create a new dataframe with two columns
# that maps the municipality 
# to it's canton with the data:
# municipality = c('ValdeTravers','Boudry','Sion','Orbe','Lavaux')
# canton = c('Neuchatel','Neuchatel','Valais','Vaud','Vaud')

# Store the resulting object in a data frame called cantons
cantons = data.frame(
  municipality = c('ValdeTravers','Boudry','Sion','Orbe','Lavaux'),
  canton = c('Neuchatel','Neuchatel','Valais','Vaud','Vaud')
)

# Perform a left merge between swiss and the cantons dataset 
# and store the resulting object in a left_swiss named object

# Hint: you can use the municipality to connect both datasets!

left_swiss = merge(x=swiss, y=cantons, by="municipality", all.x=TRUE)

# Perform an inner merge between cantons and the swiss dataset 
# and store the resulting object in a inner_swiss named object

inner_swiss = merge(x=swiss, y=cantons, by="municipality")

# Check the maximum value of Education by Canton 
# Hint: Use the aggregate function!

# Store the object in a max_education_canton

max_education_canton = aggregate(x=inner_swiss[,'Education'], 
                                 by=list(inner_swiss[,'canton']),
                                 FUN=max)
