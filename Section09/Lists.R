# ------------------------ Lists ------------------------
my_vector1 = c(1, 2, '3')
typeof(my_vector1) # character

my_list1 = list(1, 2, '3')
typeof(my_list1) # list

multi_object1 = list(c(1, 2, 3),
                     array(1:4, dim=c(2,2)),
                     TRUE
)

typeof(multi_object1) # list

# ------------------------ Adding names to list ------------------------
names(multi_object1) = c('Vector', 'Array', 'Logical')

names(multi_object1) # 'Vector', 'Array', 'Logical'

length(multi_object1) # 3

str(multi_object1)
# List of 3
# $ Vector : num [1:3] 1 2 3
# $ Array  : int [1:2, 1:2] 1 2 3 4
# $ Logical: logi TRUE

rm(my_vector1)
rm(my_list1)
rm(multi_object1)

multi_object2 = list("Vector" = c(1, 2, 3),
                     "Array" = array(1:4, dim=c(2,2)),
                     "Logical" = TRUE
)

# $Vector
# [1] 1 2 3
# 
# $Array
# [,1] [,2]
# [1,]    1    3
# [2,]    2    4
# 
# $Logical
# [1] TRUE

# ------------------------ Indexing lists ------------------------
# To obtain the stored object in a list, you have to use a double square bracket [[index n]] 

multi_object2[1]  # This is wrong and gets the sublist
# $Vector
# [1] 1 2 3

multi_object2[[1]]
# [1] 1 2 3

multi_object2[[2]]
#       [,1] [,2]
# [1,]    1    3
# [2,]    2    4

multi_object2[[2]][1,1]
# 1

multi_object2[[2]][2,2]
# 4

multi_object2[[3]]
# [1] TRUE

multi_object2[["Vector"]]
# [1] 1 2 3

multi_object2$Vector
# [1] 1 2 3

rm(multi_object2)

# ------------------------ Adding and changing elements to lists ------------------------
my_list3 = list(c('a','b','c'),
                array(1:10, dim=c(2,5))
)

# [[1]]
# [1] "a" "b" "c"
# 
# [[2]]
#       [,1] [,2] [,3] [,4] [,5]
# [1,]    1    3    5    7    9
# [2,]    2    4    6    8   10

my_list3[[3]] = c(1,2,3)

# [[1]]
# [1] "a" "b" "c"
# 
# [[2]]
#       [,1] [,2] [,3] [,4] [,5]
# [1,]    1    3    5    7    9
# [2,]    2    4    6    8   10
# 
# [[3]]
# [1] 1 2 3

my_list3[[2]] = TRUE

# [[1]]
# [1] "a" "b" "c"
# 
# [[2]]
# [1] TRUE
# 
# [[3]]
# [1] 1 2 3

# ------------------------ Removing elements from lists ------------------------
my_list3[[3]] = NULL 

# [[1]]
# [1] "a" "b" "c"
# 
# [[2]]
# [1] TRUE
rm(my_list3)

# ------------------------ Combining lists ------------------------
my_list4 = list(c(1,2), "A")

# [[1]]
# [1] 1 2
# 
# [[2]]
# [1] "A"

my_list5 = list(c(10,11), matrix(1:10, nrow=5, ncol=2))

# [[1]]
# [1] 10 11
# 
# [[2]]
#       [,1] [,2]
# [1,]    1    6
# [2,]    2    7
# [3,]    3    8
# [4,]    4    9
# [5,]    5   10

concat_list = c(my_list4, my_list5)

# [[1]]
# [1] 1 2
# 
# [[2]]
# [1] "A"
# 
# [[3]]
# [1] 10 11
# 
# [[4]]
# [,1] [,2]
# [1,]    1    6
# [2,]    2    7
# [3,]    3    8
# [4,]    4    9
# [5,]    5   10

# Create a list with 3 elements: 
# - a character with the element "John"
# - a vector with the values 100, 250, 300, 25
# - a matrix with the values (1,1,0,0) with 
# two rows and two cols

# store the returning object in an object 
# called customer

customer = list("John",
                c(100,250,300,25),
                matrix(c(1,1,0,0), nrow=2, ncol=2)
)

# Add a fourth element to our list customer 
# the value 2015

customer[[4]] = 2015

# Add names to our list elements 
# The names of our elements should be: 
# "Name", "Balance", "Products", "Opening Date"

names(customer) = c("Name", "Balance", "Products", "Opening Date")

# Change the customer last Balance value to 10
# Change the customer object itself

customer[[2]][4] = 10

# Store the products matrix in an object called
# products 

products = customer[['Products']]

# Create a new customer (a list) with two 
# elements - a character with "Anne"
# and a vector with c(400, 232, 294, 593)

# name the object new_customer and give names
# to the list elements with name "Name_2" and "Balance_2"

new_customer = list("Anne",
                    c(400,232,294,593)
)
names(new_customer) = c("Name_2", "Balance_2")

# Join the two lists in a new list called 
# final_list 

final_list = c(customer, new_customer)

