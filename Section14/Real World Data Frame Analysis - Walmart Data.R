# Easy Exercises - these exercises are really beginner level
# and you should be able to complete them with one or two lines of
# code.

# Load the walmart_data and walmart_features files 
walmart_data = read.csv(file='C:/Users/DTran/Desktop/R Programming/Section14/data/walmart_data.csv')
walmart_features = read.csv(file='C:/Users/DTran/Desktop/R Programming/Section14/data/walmart_features.csv')
  
# Store the number of rows of walmart_data in a variable called 
# n_rows 
n_rows = nrow(walmart_data)

# Print the first 5 rows of the dataframe walmart_data
head(walmart_data, 5)

# Count the number of rows per store using the Table
# command and store the resulting object in R with the name
# rows_per_store
rows_per_store = table(walmart_data$Store)

# Convert rows_per_store to a data frame - Rewrite
# the object
rows_per_store = as.data.frame(rows_per_store)

# Medium Level Exercises

# Which store has the most rows? Retrieve this value using R code
rows_per_store[order(-rows_per_store$Freq),][1,]

# Sum the sales by store on walmart_data
# and store the data in a sum_by_store object
sum_by_store = aggregate(
  walmart_data$Weekly_Sales,
  by = list(walmart_data$Store),
  FUN=sum
)

# rename the columns of the data frame produced
# above as store_number and total_sales

colnames(sum_by_store) <- c('store_number','total_sales')

# Plot bar plot using base r with sorting total sales 
# from sales with most sales to stores least sales 
# Give a title to the plot "Sales By Store" 
# and color the bars darkgreen
# ignore the x labels for now
barplot(sum_by_store[order(-sum_by_store$total_sales),]$total_sales,
        main = "Sales by Store",
        col = "darkgreen")

# Compute the mean of every column in walmart_features
sapply(walmart_features, mean)

# Create a new column in walmart features called 
# standardized_cpi subtracting the mean and dividing by the 
# standard deviation
# Note: CPI has NAS!

walmart_features$sd_cpi = (
  (walmart_features$CPI - mean(walmart_features$CPI, na.rm=TRUE))/
    sd(walmart_features$CPI, na.rm=TRUE)
)

# Produce a line plot for sales of store number 1 for every department
# Add labels to x and y

# Hint: Check the function lines
store_1 = walmart_data[walmart_data$Store==1,]

store_1_total = aggregate(
  store_1$Weekly_Sales,
  list(store_1$Date),
  FUN=sum
)

plot(store_1_total$Group.1, 
     store_1_total$x,
     xlab='Weekly Sales',
     ylab='Date')

lines(store_1_total$Group.1, 
      store_1_total$x)


# Use GGPlot to plot the total sales per week for store 20
# add points to your plot
# use as.Date on the x value in aes to format the x-axis labels
store_20 = walmart_data[walmart_data$Store==20,]

store_20_sales = aggregate(
  store_20$Weekly_Sales,
  list(store_20$Date),
  FUN=sum
)

library(ggplot2)

(
  ggplot(store_20_sales, 
         aes(x=as.Date(store_20_sales$Group.1), y=store_20_sales$x, group=1)) 
  + geom_line(color='orange') + geom_point(color='darkorange')
  + xlab('Date') + ylab('Sales')
)


# Plot the sales for the top 5 departments with more sales
# for store 2 with ggplot2 with different colors
# Plot a line per department
# Hint: Use the Group on aes to plot different time series

store_2 = walmart_data[walmart_data$Store==2, ]

sales_by_dept = aggregate(
  store_2$Weekly_Sales,
  list(store_2$Dept),
  FUN=sum
)

top_depts = sales_by_dept[order(-sales_by_dept$x),'Group.1'][1:5]

top_5_dept_sales = store_2[store_2$Dept %in% top_depts,]

ggplot(
  top_5_dept_sales, 
  aes(x=Date, y=Weekly_Sales, group=Dept, color=Dept)
) + geom_line()


# In the graph above, convert the Dept to a factor and
# the date to a date type column

ggplot(
  top_5_dept_sales, 
  aes(x=as.Date(Date), y=Weekly_Sales, group=Dept, color=as.factor(Dept))
) + geom_line()

# Open question (no need to code) -
# Which department shows a more seasonal trend? 