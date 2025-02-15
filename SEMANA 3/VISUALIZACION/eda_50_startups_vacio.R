# ubicación 
setwd("C:/Users/57321/Downloads/")

# importar los datos ----
dataset <- `50_Startups` 
dataset
# Codificar las variables categóricas


# Estructura de los datos ----

#Analisis Exploratorio----

## --------VARIABLE "Profit"-----------------

# VARIABLE "Profit" según el estado

#Grafica de profit según el estado


## -----------VARIABLE R.D.Spend-------

#Vamos a hacer un boxplot 

# Resumen Númerico R.D. Spend según el estado

#Grafica R.D. Spend según el estado

## ---------VARIABLE Administration-------

#Vamos a hacer un boxplot 

#vamos a hacer un histograma 

# Resumen Númerico de Administration segun el estado

#Grafica de Administration segun el estado

# ------- VARIABLE Marketing.Spend-------

#Vamos a hacer un boxplot 

#vamos a hacer un histograma 

# Resumen Númerico Marketing.Spend segun el estado

#Grafica Marketing.Spend segun el estado

#----------VARIABLE State------------

#Vamos a crear un gráfico de pastel para State

#Para finalizar realizaremos un gráfico con todas las variables en la base de datos

library(GGally)


dataset %>% 
  ggpairs()
modelo1 <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend + State, data = dataset)
summary(modelo1)


modelo2 <- lm(Profit ~ R.D.Spend + Administration + Marketing.Spend, data = dataset)
summary(modelo2)

anova(modelo1 , modelo2)

modelo3 <- lm(Profit ~ R.D.Spend  + Marketing.Spend, data = dataset)
summary(modelo3)

modelo4 <- lm(Profit ~ R.D.Spend  , data = dataset)
summary(modelo4)


modelo <- step(modelo1 , diretion = 'both')
