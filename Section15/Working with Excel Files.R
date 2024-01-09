# Loading libraries
library(readxl)

# Retrieve data
crime_data = read_xls('C:/Users/DTran/Desktop/R Programming/Section15/data/FBI Crime Data.xls')

# Fix column names
colnames(crime_data) = crime_data[3,]

# Create a new column with numeric value of years
crime_data['converted_index'] = sapply(crime_data[,1], as.numeric)

# Filter out NA's from data frame
# The exclamation mark removes rows with NA
crime_data_filter = (
  crime_data[!is.na(crime_data['converted_index']), ]
)

# View the years
crime_data_filter[,'Year']

# Clean up "20156" year at index 19
# substr(crime_data_filter[,'Year'][[1]][19], 1, 4)
# Alternatively:
# substr(crime_data_filter$Year[19], 1, 4)

# Clean up all years to 4 integers
years = substr(crime_data_filter[,'Year'][[1]], 1, 4)

# Drop columns
remove_col = c('Year', 'converted_index')
crime_data_filter_remove = crime_data_filter[,!colnames(crime_data_filter) %in% remove_col]

# Summary of data frame
summary(crime_data_filter)

crime_data_filter['Year'] = NULL
crime_data_filter['converted_index'] = NULL

# Convert data frame to numeric
numeric_crime_data = sapply(crime_data_filter, as.numeric)

# Assign row names
rownames(numeric_crime_data) = years

# View element for a specific year (index)
numeric_crime_data['2015', 'Robbery'] # 328109

# Automating column selection
rate_crime_data = (
  numeric_crime_data[,grepl('rate', colnames(numeric_crime_data))] # See which column names contain 'rate'
)

nominal_crime_data = (
  numeric_crime_data[,!grepl('rate', colnames(numeric_crime_data))] # See which column names don't contain 'rate'
)

# Manually naming columns 
colnames(nominal_crime_data) = c('Population',
                                 'Violent Crime',
                                 'Murder',
                                 'Robbery',
                                 'Aggravated Assault',
                                 'Property Crime',
                                 'Burglary',
                                 'Theft',
                                 'Motor Theft'
                                 )

# Aggregating data and bar plotting
means_crime = as.data.frame(
  sapply(as.data.frame(nominal_crime_data), mean)
)

colnames(means_crime) = 'mean_value'

# Remove a row
means_crime[2:nrow(means_crime),]
means_crime = tail(means_crime,-1)

install.packages("ggplot2")
library(ggplot2)

ggplot(data=means_crime/1000000,
       aes(x=rownames(means_crime),
           y=mean_value)) + geom_bar(stat='identity', fill='darkred') +
  theme(axis.text.x = element_text(angle=90, vjust=0.5, hjust=1))

