matrix1 = matrix(data=1:4, nrow=10, ncol=4)

#       [,1] [,2] [,3] [,4]
#  [1,]    1    3    1    3
#  [2,]    2    4    2    4
#  [3,]    3    1    3    1
#  [4,]    4    2    4    2
#  [5,]    1    3    1    3
#  [6,]    2    4    2    4
#  [7,]    3    1    3    1
#  [8,]    4    2    4    2
#  [9,]    1    3    1    3
# [10,]    2    4    2    4

matrix2 = matrix(data=1:4, nrow=10, ncol=4, byrow=TRUE)

#       [,1] [,2] [,3] [,4]
#  [1,]    1    2    3    4
#  [2,]    1    2    3    4
#  [3,]    1    2    3    4
#  [4,]    1    2    3    4
#  [5,]    1    2    3    4
#  [6,]    1    2    3    4
#  [7,]    1    2    3    4
#  [8,]    1    2    3    4
#  [9,]    1    2    3    4
# [10,]    1    2    3    4

matrix3 = array(data=1:4, dim=c(10,4))

#       [,1] [,2] [,3] [,4]
#  [1,]    1    3    1    3
#  [2,]    2    4    2    4
#  [3,]    3    1    3    1
#  [4,]    4    2    4    2
#  [5,]    1    3    1    3
#  [6,]    2    4    2    4
#  [7,]    3    1    3    1
#  [8,]    4    2    4    2
#  [9,]    1    3    1    3
# [10,]    2    4    2    4

matrix1 == matrix3

#       [,1] [,2] [,3] [,4]
#  [1,] TRUE TRUE TRUE TRUE
#  [2,] TRUE TRUE TRUE TRUE
#  [3,] TRUE TRUE TRUE TRUE
#  [4,] TRUE TRUE TRUE TRUE
#  [5,] TRUE TRUE TRUE TRUE
#  [6,] TRUE TRUE TRUE TRUE
#  [7,] TRUE TRUE TRUE TRUE
#  [8,] TRUE TRUE TRUE TRUE
#  [9,] TRUE TRUE TRUE TRUE
# [10,] TRUE TRUE TRUE TRUE

class(matrix1) # "matrix" "array" 
class(matrix2) # "matrix" "array" 
class(matrix3) # "matrix" "array" 

# If you are going to make a matrix to a 3rd or higher dimension, it's easier to use the array command
# Matrices are easier to construct 2 dimensions or less 

dim(matrix1) # 10 4
dim(matrix2) # 10 4
dim(matrix3) # 10 4

nrow(matrix1) # 10
ncol(matrix1) # 4

nrow(matrix2) # 10
ncol(matrix2) # 4

nrow(matrix3) # 10
ncol(matrix3) # 4

matrix4 = matrix(1:4, nrow=2, ncol=2)

#       [,1] [,2]
# [1,]    1    3
# [2,]    2    4

matrix5 = matrix(200:203, nrow=2, ncol=2)

      # [,1] [,2]
# [1,]  200  202
# [2,]  201  203

matrix4 * matrix5

#       [,1] [,2]
# [1,]  200  606
# [2,]  402  812

dim(matrix4) # 2 2
dim(matrix5) # 2 2

matrix4 + matrix5

#       [,1] [,2]
# [1,]  201  205
# [2,]  203  207

matrix4 / matrix5

#             [,1]       [,2]
# [1,] 0.005000000 0.01485149
# [2,] 0.009950249 0.01970443

matrix6 <- matrix(1:6, nrow=2, ncol=3, byrow=TRUE)

#       [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6

matrix7 <- matrix(7:12, nrow=3, ncol=2, byrow=TRUE)

#       [,1] [,2]
# [1,]    7    8
# [2,]    9   10
# [3,]   11   12

# Dot product
matrix6 %*% matrix7

#       [,1] [,2]
# [1,]   58   64
# [2,]  139  154

# Create a matrix with 5 rows and three columns 
# named pokemons
# Feed the following data: 
# c(120, 100, 40, 50, 80, 36, 40, 10, 25, 30,
# 3, 1, 1, 1, 2)
# Leave the default byrow argument

pokemons = matrix(data=c(120,100,40,50,80,36,40,10,25,30,3,1,1,1,2), nrow=5, ncol=3)

#       [,1] [,2] [,3]
# [1,]  120   36    3
# [2,]  100   40    1
# [3,]   40   10    1
# [4,]   50   25    1
# [5,]   80   30    2

# Rename our row names as "Blastoise", "Moltres", "Pikachu", "Pidgey"
# and Charmeleon and our columns as "HP", "Level", "Stage"
dimnames(pokemons) = list(c('Blastoise','Moltres','Pikachu','Pidgey','Charmeleon'), c('HP','Level','Stage'))

# Alternatively:
# dimnames(pokemons)[[1]] = c("Blastoise", "Moltres", "Pikachu", "Pidgey", "Charmeleon")
# dimnames(pokemons)[[2]] = c("HP", "Level", "Stage")

#             HP Level Stage
# Blastoise  120    36     3
# Moltres    100    40     1
# Pikachu     40    10     1
# Pidgey      50    25     1
# Charmeleon  80    30     2

# Create a new pokemon in a single row matrix - this pokemon should 
# be Dragonite with 150 HP, level 50 and stage 3 
# store it in an object named dragonite
# Add dragonite to our pokemons matrix - 
# write the new object in a full_pokemons named 
# variable
pokemons1 = matrix(data=c(150, 50, 3), nrow=1, ncol=3)
full_pokemons = rbind(pokemons, pokemons1)
dimnames(full_pokemons)[[1]][6] = c("Dragonite")

#             HP Level Stage
# Blastoise  120    36     3
# Moltres    100    40     1
# Pikachu     40    10     1
# Pidgey      50    25     1
# Charmeleon  80    30     2
# Dragonite  150    50     3

# Calculate the difference between Dragonite HP 
# and Pikachu HP - store it in an object named
# dif_hp 

dif_hp = full_pokemons['Dragonite','HP']-full_pokemons['Pikachu','HP']

# Alternatively:
# dif_hp = full_pokemons[6][1] - full_pokemons[3][1]

# Create an object called attack_power where you multiply the HP by
# the level and the stage of each Pokemon in a new variable

attack_power = full_pokemons[,'HP']*full_pokemons[,'Stage']*full_pokemons[,'Level']

# Add the attack power to the full_pokemons matrix, store it in an object
# called full_pokemons_attack_pwr

# Hint: cbind might come in handy!
full_pokemons_attack_pwr = cbind(full_pokemons, attack_power)

#             HP Level Stage attack_power
# Blastoise  120    36     3        12960
# Moltres    100    40     1         4000
# Pikachu     40    10     1          400
# Pidgey      50    25     1         1250
# Charmeleon  80    30     2         4800
# Dragonite  150    50     3        22500

# Check which pokemons has the lowest attack power 
# store it in a variable called low_attack_pkmn

# Hint: which might come in handy!
low_attack_pkmn = which(full_pokemons_attack_pwr[,'attack_power'] == min(full_pokemons_attack_pwr[,'attack_power']))

# Alternatively:
# low_attack_pkmn = which(full_pokemons_attack_pwr[1:6,4] == min(full_pokemons_attack_pwr[1:6,4]))

# Create the following matrix in R: 
# [1, 0, 0, 0]
# [0, 1, 0, 0]
# [0, 0, 1, 0]
# [0, 0, 0, 1]

# Store the object in a identity_matrix object 

identity_matrix = matrix(c(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1), ncol=4, nrow=4, byrow=TRUE)

#       [,1] [,2] [,3] [,4]
# [1,]    1    0    0    0
# [2,]    0    1    0    0
# [3,]    0    0    1    0
# [4,]    0    0    0    1
# Create a matrix of 10 rows and 4 columns 
# called log_values with the logarithm 
# with the following vector as input: 
# 1:5 

# apply the logarithm to every element of the matrix

log_values = log(matrix(1:5,nrow=10, ncol=4))

#             [,1]      [,2]      [,3]      [,4]
# [1,]  0.0000000 0.0000000 0.0000000 0.0000000
# [2,]  0.6931472 0.6931472 0.6931472 0.6931472
# [3,]  1.0986123 1.0986123 1.0986123 1.0986123
# [4,]  1.3862944 1.3862944 1.3862944 1.3862944
# [5,]  1.6094379 1.6094379 1.6094379 1.6094379
# [6,]  0.0000000 0.0000000 0.0000000 0.0000000
# [7,]  0.6931472 0.6931472 0.6931472 0.6931472
# [8,]  1.0986123 1.0986123 1.0986123 1.0986123
# [9,]  1.3862944 1.3862944 1.3862944 1.3862944
# [10,] 1.6094379 1.6094379 1.6094379 1.6094379

# Compute the dot product between identity_matrix 
# and log_values 

# Hint: One of the matrixes must come first in the 
# calculation!
# save the returning object in a dot_log object

dot_log = log_values %*% identity_matrix



