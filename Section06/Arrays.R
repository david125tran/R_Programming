example_matrix0 = array(data=c(1,2,3,4,5,6,7,8), 
                      dim=c(2,2,2),
                      dimnames=list(c('Row 1', 'Row 2'),
                                    c('Col 1', 'Col 2'),
                                    c('Matrix 1', 'Matrix 2'))
                      )
#   Matrix 1
#
#       Col 1 Col 2 
# Row 1 [ 1 ] [ 3 ]
# Row 2 [ 2 ] [ 4 ]
#
#   Matrix 2
#
#       Col 1 Col 2 
# Row 1 [ 5 ] [ 7 ]
# Row 2 [ 6 ] [ 8 ]
#
example_matrix0[1, 1, 2] # 5
example_matrix0[2, 1, 2] # 6
example_matrix0[1, 2, 2] # 7 

example_matrix1 = array(data=c(1,2,3,4), dim=c(2,2))
example_matrix2 = matrix(data=c(1,2,3,4), nrow=2, ncol=2)

my_vector1 = 1:4
my_vector1[1] # 1

my_array0 = array(data=my_vector1, dim=c(2,2))
#       [,1] [,2]
# [1,]    1   3
# [2,]    2   4

my_array0[1,] # 1 3
my_array0[,2] # 3 4

class(my_array0) # "matrix" "array"

my_array1 = array(1:8, dim=c(4,4))
my_array1

#      [,1] [,2] [,3] [,4]
# [1,]    1    5    1    5
# [2,]    2    6    2    6
# [3,]    3    7    3    7
# [4,]    4    8    4    8

my_array1[,2] # 5 6 7 8
my_array1[2,] # 2 6 2 6
my_array1[2:3,3] # 2 3
my_array1[2:3,2] # 6 7
my_array1[1:2,1] # 1 2
my_array1[,1] = 100
my_array1

#      [,1] [,2] [,3] [,4]
# [1,]  100    5    1    5
# [2,]  100    6    2    6
# [3,]  100    7    3    7
# [4,]  100    8    4    8

my_array1[1:2,] = array(c(1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000),
                        dim=c(2,4))
my_array1

#      [,1] [,2] [,3] [,4]
# [1,] 1000 1000 1000 1000
# [2,] 1000 1000 1000 1000
# [3,]  100    7    3    7
# [4,]  100    8    4    8

my_array2 = array(data=c(100,100,100), 
                  dim=c(3,3,2))
my_array2
# , , 1
# 
#       [,1] [,2] [,3]
# [1,]  100  100  100
# [2,]  100  100  100
# [3,]  100  100  100
#
# , , 2
#
#       [,1] [,2] [,3]
# [1,]  100  100  100
# [2,]  100  100  100
# [3,]  100  100  100

my_array2[,,1] = sqrt(my_array2[,1,1])
my_array2

# , , 1
# 
#       [,1] [,2] [,3]
# [1,]  10   10   10
# [2,]  10   10   10
# [3,]  10   10   10
#
# , , 2
#
#       [,1] [,2] [,3]
# [1,]  100  100  100
# [2,]  100  100  100
# [3,]  100  100  100

my_array2[,2,] = my_array2[,2,]**2
my_array2

# , , 1
# 
#       [,1]  [,2]  [,3]
# [1,]  10   100    10
# [2,]  10   100    10
# [3,]  10   100    10
#
# , , 2
#
#       [,1]  [,2]  [,3]
# [1,]  100  10000  100
# [2,]  100  10000  100
# [3,]  100  10000  100

# Dimension names (dimnames)
countries_data = array(c(200,200,300,340,230,120,540,400), 
                  dim=c(2,2,2),
                  dimnames=list(
                    c('Portugal', 'UK'), 
                    c('Population', 'GDP'), 
                    c('2018', '2019')
                    )
                  )

# , , 2018
#
#          Population GDP
# Portugal        200 300
# UK              200 340
#
# , , 2019
#
#          Population GDP
# Portugal        230 540
# UK              120 400

countries_data['Portugal', 'Population', '2018'] # 200
countries_data['Portugal', 'Population', '2019'] # 230
countries_data['Portugal', 'Population', c('2018', '2019')] # 200 230
dimnames(countries_data)[[1]] = c('Portugal', 'Spain')
countries_data

# , , 2018
#
#          Population GDP
# Portugal        200 300
# Spain           200 340
#
# , , 2019
#
#          Population GDP
# Portugal        230 540
# Spain           120 400

nrow(countries_data) # 2
ncol(countries_data) # 2

my_array3 = array(1:4, dim=c(2,2))
#       [,1] [,2]
# [1,]    1    3
# [2,]    2    4

my_array4 = array(10:14, dim=c(2,2))
#       [,1] [,2]
# [1,]   10   12
# [2,]   11   13

rbind(my_array3, my_array4)
#       [,1] [,2]
# [1,]    1    3
# [2,]    2    4
# [3,]   10   12
# [4,]   11   13

dim(rbind(my_array3, my_array4)) # 4 2

cbind(my_array3, my_array4)
#       [,1] [,2] [,3] [,4]
# [1,]    1    3   10   12
# [2,]    2    4   11   13


# Create a 4 dimensional array based on the vector 
# 1:4 and with 3, 4, 5 and 2 elements on each dimension,
# by this order
# save the array on a multidim named object
multidim = array(1:4, dim = c(3,4,5,2))

# , , 1, 1
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4
# 
# , , 2, 1
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4
# 
# , , 3, 1
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4
# 
# , , 4, 1
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4
# 
# , , 5, 1
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4
# 
# , , 1, 2
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4
# 
# , , 2, 2
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4
# 
# , , 3, 2
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4
# 
# , , 4, 2
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4
# 
# , , 5, 2
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4

# Save the vector with the number of dimensions 
# of our array in a dimensions_n object
dimensions_n = dim(multidim) # 3 4 5 2

# Remove the second element of the fourth 
# dimension and store the resulting array in 
# a three_dim named object
three_dim = multidim[,,,-c(2)]

# , , 1
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4
# 
# , , 2
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4
# 
# , , 3
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4
# 
# , , 4
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4
# 
# , , 5
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4

# Remove the third, fourth and fifth elements 
# of the third dimension of the three_dim
# object, write the object in an array 
# named three_dim_2
three_dim_2  = three_dim[,,-c(3,4,5)]

# , , 1
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4
# 
# , , 2
# 
#       [,1] [,2] [,3] [,4]
# [1,]    1    4    3    2
# [2,]    2    1    4    3
# [3,]    3    2    1    4

# Apply the logarithm to the last column 
# of the multi dimensional array 
# hint: remember that columns are in the second
# dimensions! 
# modify our three_dim_2 array 
three_dim_2[,4,]  = log(three_dim_2[,4,])

#           [,1]      [,2]
# [1,] 0.6931472 0.6931472
# [2,] 1.0986123 1.0986123
# [3,] 1.3862944 1.3862944


# Raise every element of the first row of 
# our three_dim_2 array to the power of 5 
# rewrite the three_dim_2 object
three_dim_2[1,,]  = three_dim_2[1,,]**5

#               [,1]         [,2]
# [1,]    1.0000000    1.0000000
# [2,] 1024.0000000 1024.0000000
# [3,]  243.0000000  243.0000000
# [4,]    0.1600027    0.1600027


# Assign the following dimension names to 
# our three_dim_2 vector: 
# Dimension 1 : 'Player 1','Player 2','Player 3'
# Dimension 2: 'Dexterity','Strength','Intelligence','Speed'
# Dimension 3: "House Stark", "House Lannister"
dimnames(three_dim_2) <- list(c('Player 1','Player 2','Player 3'),
                              c('Dexterity','Strength','Intelligence','Speed'),
                              c("House Stark", "House Lannister"))

# [[1]]
# [1] "Player 1" "Player 2" "Player 3"
# 
# [[2]]
# [1] "Dexterity"    "Strength"     "Intelligence" "Speed"       
# 
# [[3]]
# [1] "House Stark"     "House Lannister"


# Store the Intelligence of Player 3 from House Lannister 
# on a variable called player_3_lan_int
player_3_lan_int  = three_dim_2['Player 3','Intelligence','House Lannister'] # 1

# Create an array with the values c('A','B','C','D') in 
# a 2 by 2 dimensional format and an
# an array with the values c('E','F','G','H') in 
# a 2 by 2 format
# Store them in a alpha_1 and alpha_2 variables, 
# respectively 
alpha_1 = array(c('A','B','C','D'), dim=c(2,2))

#     [,1] [,2]
# [1,] "A"  "C" 
# [2,] "B"  "D"

alpha_2 = array(c('E','F','G','H'), dim=c(2,2))

    # [,1] [,2]
# [1,] "E"  "G" 
# [2,] "F"  "H" 

# Combine alpha_1 and alpha_2, row wise and store
# the resulting object in a combined_alpha named
# object
combined_alpha = rbind(alpha_1, alpha_2)

#      [,1] [,2]
# [1,] "A"  "C" 
# [2,] "B"  "D" 
# [3,] "E"  "G" 
# [4,] "F"  "H"