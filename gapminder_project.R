gapminder <- read.table(file = "output/combined_gapMinder.tsv", sep = "\t", header = T) 

##sep = "\t" means that text file is separated by tabs; header = T is that the table has a header

## understanding your data
str(gapminder)  ## will show the data frame of your dataframe
typeof(gapminder$year)  ## will show certain details of the data
length(gapminder) ## number of columns
ncol(gapminder)   ## number of columns
nrow(gapminder)   ## number of rows
dim(gapminder)    ## the dimension of the data, so number of rows and number of columns 
colnames(gapminder)  ## show the names of the columns
head(gapminder)       ## show the first 10 lines
tail(gapminder)       ## show the last 10 lines


## Subsetting Dataset
head(gapminder[3])            ## subsetting by index, look at column 3
head(gapminder[["lifeExp"]])  ## subsetting my name, going into the table
head(gapminder$year)          ## by "$"
head(gapminder[gapminder$continent == "Africa", "gdpPercap"]) ## go into the table, give me only [] x (Africa),y (percap column)
head(gapminder[gapminder$continent == "Africa",])  ## show everything from Africa
africa <- gapminder[gapminder$continent == "Africa", ]  ## define and set it as a dataframe to use it later
gapminder[gapminder$lifeExp > 80,]
gapminder[,-c(1:4)]         ## show all columns except 1-4
gapminder[1, c(4,5)]        ## show 4 and 5 column from first row
gapminder[gapminder$year == 2002 | gapminder$year == 2007,] ## extract rows that contain information for 2002 and 2007
gapminder[gapminder$year %in% c(2002, 2007),]  ## extract rows that contain information for 2002 - 2007, | means 'or'
write.table(africa, file = "africa.txt", sep = ",",quote=F,row.names = F)

## subsetting by dplyr
install.packages("dplyr")

library("dplyr")    ## load the package (need to load it everytime you code with R studio but only install once on your pc)
year_country_gdp <- select(gapminder, year, country, gdpPercap)  ## select which columns you want (if you want specific columns use the combine function c(x,t,w) )
year_country_gdp <- select(gapminder, 1:3)
year_country_gdp <- select(gapminder, year, country, gdpPercap)
year_country_gdp2 <- gapminder %>% select(year, country, gdpPercap)  ## piping -> whatever is on the left and taking the output to give it on the right
year_country_gdp_euro <- gapminder %>%  
                              filter(continent == "Europe") %>%
                              select(year, country, gdpPercap)  ## get from European countries only the year, country and gdpPercap data in a new dataframe
lifeExp_country_year_Africa <- gapminder %>%
                                filter(continent == "Africa") %>%
                                select(lifeExp, country, year)

gapminder_by_continent <- gapminder %>% group_by(continent)  ## group the data by continent

gdp_bycontinents <- gapminder %>%
                    group_by(continent) %>%
                    summarize(mean_gdpPercap=mean(gdpPercap))


## conditions

x <- 3 == 3
if(x){
  "3 equals 3"
}

if(nrow(gapminder[(gapminder$year == 2002),]) >= 1){
    print("Record(s) for the year 2002 found.")
}       ## if condition that when there is any data for 2002 found then print a message

if(any(gapminder$year == 2002)){
  print("Record(s) for the year 2002 found.")
}          ## same as above but shorter with the any command


## for loop

output_vector <- c()

for(i in 1:5){
    print(i) 
}

for(i in 1:5){
  for(j in c("a","b","c","d","e")){
       print(paste(i,j))
  } 
}



for(i in 1:5){
  for(j in c("a","b","c","d","e")){
     temp_vector <- paste(i,j)
     output_vector <- c(output_vector,temp_vector)
  } 
}
output_vector


for(i in 1:5){
  for(j in c(1:5)){
    temp_vector <- paste(i,j)
    output_vector[i,j] <- temp_vector
  } 
}
output_vector


