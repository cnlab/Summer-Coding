 



##### data types 

char_type <- "This is a character type!"
char_type
class(char_type)
numeric_type <- 3.1459
numeric_type
interger_type <- 1L
interger_type
class(interger_type)
logical_type <- TRUE
class(logical_type)


#### data structures 
###vectors, matricies, arrays, lists, data frames
#vector can only put one data type into one vector 
numeric_vector <- c(0,3,4,6)
numeric_vector
char_vector <- c("omar", "rachel", "kate")
char_vector
num_vector2 <- 1:100
num_vector2
num_vector3 <- seq(from = 1, to = 100, by = 3)
num_vector3




length(num_vector2)
class(num_vector2)
min(num_vector3)

integer_vector <- c(1L, 2L, 3L)
class(integer_vector)

interger_vector <- as.numeric(c(1L, 2L, 3L))
class(integer_vector)


integer_vector
class(interger_vector)
 

###lists ... can contain different data types 
first_list <- list(TRUE, 2.56, 1L, "Steven")
first_list
list2 <- list(5:10,c(FALSE, TRUE, FALSE), "Steven", c(3.14, 2.96))
list2


####Loops
#for loops and while loops
 




vector_a <- 1:100
vector_a
####for loops cat means to print 

for(element in vector_a){
  cat("this is the current number being looped through:", element, "\n")
}



list_a <- list(c(TRUE, FALSE, TRUE), c("Steven", "Omar", "Kate"), 1:10)
list_a


for (element in list_a) {
  print(element)
}




for(element in list_a){
  for(el in element) {
  
    if(is.logical(el)){
      if(el == TRUE){
        print("I made it to the True value")
      }
      else{
        print("This is a false value")
    }
    
    }
  }
}



#matricies are 2X2 arrays
#arrays vectors but are of two dimensions 

#array = [1,2,3,
         4,5,6,
         7,8,9]



#data frame is a list of vectors (columns are vectors)

df <- data.frame(x = 1:3, y = c("a", "b", "c"), o = c(4, 8, 6), logical = c(TRUE, FALSE, FALSE))
df
 ###columns have to have same length, can have number as a column names
#tidyr can gather separate unite and spread

df_ex <- data.frame(name = c("Omar Olivarez", "Steven Mesquiti", "Andrea Weyland"), 
                    x2019 = c(10, 20, 30),
                    x2020 = c(20, 50 ,100), 
                    Team = c("red", "blue", "red"))
str(df_ex)


df_ex$improvement = df_ex$x2020 - df_ex$x2019

str(df_ex)
df+ex
df_ex


#separating columns out, piping through data frame, spaces are non-alpha numeric

df_ex %>% separate(name, c("Firstname", "Lastname"))

df_ex


df_gathered <- gather(df_ex, "year", "score", x2019, x2020)

df_gathered 
str(df_gathered)


###substituting 

df_gathered$year <- gsub("x", "", df_gathered$year)
df_gathered 

df_gathered$year <- as.numeric(df_gathered$year)
df_gathered
str(df_gathered)



plot <- ggplot(df_gathered, aes(x = year, y =score)) + 
  geom_point(aes (fill = name, color = name), size = 12) + 
  geom_line(aes(group = name))

plot


###dplyr 


