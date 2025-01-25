# Ejemplo 6 ----
x < - c(2.1,4.2,3.3,5.4)
x[c(TRUE,FALSE)]
# Ejemplo 6 ----
x< - c(2.1,4.2,3.3,5.4)
# Ejemplo 6 ----
x < - c(2.1,4.2,3.3,5.4)
# Ejemplo 6 ----
x
x <- c(2.1,4.2,3.3,5.4)
x [c(TRUE,FALSE)]
x[c(TRUE,FALSE,NA,FALSE)]
x[c(TRUE,NA)]
y <- setNames(X,letters[1;4])
y <- setNames(X,letters[1;4])
y <- setNames(X,letters[1:4])
y[c("a","b","d")]
y <- setNames(X,letters[1:4])
x <- c(2.1,4.2,3.3,5.4)
y <- setNames(X,letters[1:4])
y <- setNames(x,letters[1:4])
y[c("a","b","d")]
x[y[c("a","a","a")]]
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c('Monday' , 'Tuesday', 'Wednesday' , 'Thursday',
                 'Friday')
sport(poker_vector)
sort(poker_vector)
names(poker_vector) =  c('Monday' , 'Tuesday', 'Wednesday' , 'Thursday',
                         'Friday')
poker_vector
sport( x = poker_vector, descreasing = FALSE)
sort( x = poker_vector, descreasing = FALSE)
sport( x = poker_vector, descreasing = TRUE)
sort( x = poker_vector, descreasing = TRUE)
names(roulette_vector) <- days_vector
names(roulette_vector) <- days_vector
total_diario <- poker_vector+roulette_vector
total_diario
total_poker <- sum(poker_vector)
total_roulette <- sum(roulette_vector)
total_week <- total_poker+total_roulette
total_week
mean(poker_vector,[2:4] )
(poker_vector,[2:4])
mean(poker_vector,[2:4])
mean(poker_vector [2:4])
8 + 2
*3
x <- 8
x+2
(x+2)*3
y <- (x+2)*3
y
y-6
z <- y-6
y-6
z/3
x <- c(3, 4, 6, 9, 3, 9, 10, 7, 7, 2)
n <- length(x)
n
(1/n-1)*suma(x)
(1/n-1)*sum(x)
(1/(n-1))*sum(x)
a < b
'a' < 'b'
'carlos' > 'vel'
'hola' <= 'holi'
'carlos' >
  'hola' < 'holi'
'carlos' > 'vel'
'hola'  <  'holi'
poker_vector > 0
poker_vector [poker_vector > 0]
roulette_vector > 0
roulette_vector [roulette_vector > 0]
roulette_vector < 0
roulette_vector [roulette_vector < 0]
x[x > 3]
seq(1,10)
1:10
seq(1,10, by=2)
rep(1:4,2)
rep(c('x','y','z'),3)
mu <- 10
sigma <- 2
rnorm(n=10, mean = 10, sd= 2)
set.seed(12)
rnorm(n=10, mean = 10, sd= 2)
A <- matrix(1:9, nrow = 3, byrow =  TRUE)
A
dim(A)
B <- matrix(c(1,2,3,-1,2,-5,8,3,2), nrow = 3, ncol = 3, byrow = FALSE)
B
dim(B)
A[2,1]
A[3,1]
A[1,]
A[,2]
A[C(1,2),C(1,2)]
A[c(1,2),c(1,2)]
A[-3, -3]
A + B
A-B
2*A + B
A%*%B
det(A)
det(B)
solve(B)
D <- matrix(C(1,1,3,-2), nrow = 2 , ncol = 2 , byrow = T)
D <- matrix(c(1,1,3,-2), nrow = 2 , ncol = 2 , byrow = T)
D <- matrix(c(1, 3), nrow = 2 , ncol = 1 , byrow = T)
D <- matrix(c(1,1,3,-2), nrow = 2 , ncol = 2 , byrow = T)
R <- matrix(c(1, 3), nrow = 2 , ncol = 1 , byrow = T)
det(D)
solve(D)%*%R
solve(D,R)
# Ejemplo 12 ----
sex vector < − c(”Male”,”female”,”female”,”Male”,”Male”)
# Ejemplo 12 ----
sex vector < - c(”Male”,”female”,”female”,”Male”,”Male”)
# Ejemplo 12 ----
sex_vector < - c(”Male”,”female”,”female”,”Male”,”Male”)
# Ejemplo 12 ----
sex_vector < - c('Male','female','female','Male','Male')
# Ejemplo 12 ----
sex_vector < - c('Male','female','female','Male','Male')
sex_vector  < - c('Male','female','female','Male','Male')
sex_vector  <- c('Male','female','female','Male','Male')
factor_sex_vector <- factor(sex_vector)
summary(factor_sex_vector)
temperature vector < − c('High', 'Low', 'High','Low', 'Medium')
temperature_vector <- c('High', 'Low', 'High','Low', 'Medium')
factor_temperature_vector <- factor(temperature_vector, levels = c('low', 'Medium' , 'High'))
factor_temperature_vector
factor_temperature_vector <- factor(temperature_vector, levels = c('Low', 'Medium' , 'High'))
factor_temperature_vector
factor(temperature_vector, levels = c('Low', 'Medium' , 'High'))
factor_temperature_vector
factor_temperature_vector <- (temperature_vector, ordered = TRUE,levels = c('Low', 'Medium' , 'High'))
factor_temperature_vector <- factor(temperature_vector, ordered = TRUE,levels = c('Low', 'Medium' , 'High'))
factor_temperature_vector
#EJEMPLO 13 ----
mtcars
#EJEMPLO 13 ----
mtcars
df<- mtcars
df
df$cyl <= 5
df[df$cyl <= 5]
df[df$cyl <= 5,]
df[df$cyl 5|6]
df$cyl 5|6
df$cyl [5,|,6]
df$cyl >= 5,| df$cyl <= ,6]
df$cyl >= 5,| df$cyl <= ,6]
df[df$cyl >= 5| df$cyl <= 6,]
df[df$cyl == 5| df$cyl == 6,]
df$mpg[1] <- 25
View(df)
my_dt <- mtcars[1:10,]
my_vector <- 1:10
my_matrix <-  matrix(1:9, ncol=3)
my_dt <- mtcars[1:10,]
my_list <- list(my_vector, my_matrix,my_df)
my_matrix <-  matrix(1:9, ncol=3)
my_df <- mtcars[1:10,]
my_list <- list(my_vector, my_matrix,my_df)
my_list <- list(vec=my_vector,mat=my_matrix,df=my_df)
my_list
