character_variable = "name"
numeric_float_variable = 1
numeric_integer_variable = as.integer(1)
logical_true_variable = TRUE
logical_false_variable = FALSE
logical_true_variable_integer = as.integer(TRUE) # 1
logical_false_variable_integer = as.integer(FALSE) # 0

# Conversion functions
# as.numeric()
# as.integer()
# as.character()
# as.logical()

number = 1

# Retrieve data type
class(number) # numeric
typeof(number) # double

my_date = as.Date('2019-01-01')
class(my_date) # Date
typeof(my_date) # Double

word = "newspaper"

typeof(word) # character

class(1L) # integer
class(1) # numeric

# integers occupy less memory than numeric

numeric_vector = c(1, 2, 3, 4)
typeof(numeric_vector) # double

is.numeric(12) # TRUE
is.numeric("12") # FALSE
is.character(12) # FALSE
is.character("12") # TRUE
is.logical(TRUE) # TRUE

number = 23
word = as.character(23)
typeof(word) # character

numeric_vector = c(1, 2, 3, 4)
character_vector = as.character(numeric_vector)

years_vector = c("2001", "2002", "not a year")
new_vector = as.numeric(years_vector) # 2001, 2002, NA

logical_vector = c(TRUE, TRUE, FALSE)
logical_vector = as.numeric(logical_vector) # 1 1 0

labels = c("Asia", "Oceania", "Antarctica", "Europe", "Africa", "North America", "South America", "Africa")

# Distinct labels
factor_labels = factor(labels)

typeof(factor_labels) # integer of first letter of elements of label

nlevels(factor_labels) # 7

altitude_levels = c('High', 'Low', 'Medium', 'Low', 'High', 'Low')
factor(altitude_levels) # Levels: High Low Medium
factor(altitude_levels, order=TRUE) # Levels: High < Low < Medium
altitude_factor = factor(altitude_levels, order=TRUE, levels=c('Low', 'Medium', 'High')) # Levels: Low < Medium < High

as.integer(altitude_factor) # 3 1 2 1 3 1

# Classifying as a date:
dates = c('2019-01-01', '2019-01-02')
class(dates) # character

dates = as.Date(c('2019-01-01', '2019-01-02'))
class(dates) # Date
typeof(dates) # Double
as.numeric(dates) # 17897 17898 <-- Returns days since Jan-1-1970

# Date format conversion
as.Date(c('2019-01-01')) # "2019-01-01"
as.Date(c('01/01/2019'), format='%d/%m/%Y') # "2019-01-01"
example_date = as.Date(c('01Jan2019'), format='%d%b%Y') # "2019-01-01"

format(example_date, '%d') # "01"
format(example_date, '%b') # "Jan"
format(example_date, '%Y') # "2019"





