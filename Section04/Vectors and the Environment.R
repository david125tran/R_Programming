# Vectors
c(1, 2, 3)

# Vector assignment
class_size <- c(10, 20, 21, 33)

cities_population = c(10000, 20000, 4000, 3000)

# Remove vector object
rm(class_size)

# Vectors can only hold one data type.  
# All of these will be converted to string type
char_cities_population = c(10000, 20000, 4000, "3000")

sum(cities_population)

# Indexing by position
# Indexes start at 1 in R
melons = c(1.2, 1.4, 2.4, 3.4)

melons[1] # Returns 1.2

melons[4] # Returns 3.4

melons[5] # Returns NA

# Slicing
melons[1:3] # Returns 1.2 1.4 2.4

melons[3:5] # Returns 2.4 3.4 NA

melons[c(1:2)] # Returns 1.2 1.4

# Vector operations
melons[1] + melons[2] + melons[3] + melons[4] # Returns 8.4

sum(melons) # Returns 8.4

melons * 2 # Returns 2.4 2.8 4.8 6.8 

melons + melons # Returns 2.4 2.8 4.8 6.8

sqrt(melons) # Returns 1.095445 1.183216 1.549193 1.843909

adjusted_weight = c(1.2, 1.2, 1.4, 1.4)

melons * adjusted_weight # Returns 1.44 1.68 3.36 4.76

mean(melons)

length(melons)

median(melons)

sd(melons)

sort(melons) # Returns 1.2 1.4 2.4 3.4

sort(melons, decreasing = TRUE) # Returns 3.4 2.4 1.4 1.2

mean_melons = mean(melons)

reverse_melons = sort(melons, decreasing = TRUE)

new_melons = c(1.2, 1.4, 2.4, 3.4, NA)

sum(new_melons, na.rm = TRUE) # Returns 8.4

# See function documentation
# help(sum)

new_melons = c(1.2, 1.4, 2.4, 3.4, NaN)

sum(new_melons, na.rm = TRUE) # Returns 8.4

new_melons = c(1.2, 1.4, 2.4, 3.4, Inf)

sum(new_melons, na.rm = TRUE) # Returns Inf

melons > 2 # Returns FALSE FALSE TRUE TRUE

melons[1] > melons[2] # Returns FALSE

melons[melons > 2] # Returns 2.4 3.4

melons == 1.4 # Returns FALSE TRUE FALSE FALSE

melons != 1.4 # Returns TRUE FALSE TRUE TRUE

which(melons > 2) # Returns 3 4

countries = c(10276617, 67545757, 670020000)

names(countries) = c('Portugal', 'United Kingdom', 'France')

countries['Portugal']

countries[c('Portugal', 'France')]

names(countries)

names(which(countries > 20000000))

melons[1] = 2

melons # Returns 2.0 1.4 2.4 3.4

melons[2:4] = c(3, 4, 5)

melons # Returns 2, 3, 4, 5

melons[5] = 6 

melons # Returns 2, 3, 4, 5, 6

melons = c(1.2, 1.4, 2.4, 3.4, 1.2)

melons[melons > 2] = 2 # melons = 1.2, 1.4, 2, 2, 1.2

melons = c(1, 2, 3, 4, 5)

# "-c" excludes at a specific index
new_melons = melons[-c(2, 4)] # new_melons = 1 3 5

vector_a = c(1, 2, 3, 4, 5)

mean(vector_a)

max(vector_a)

var(vector_a)

vector_discount = c(0.2, 0.2, 0.1, 0.05, 0.05) 

vector_a * (1 - vector_discount) # Returns 0.80 1.60 2.70 3.80 4.75

