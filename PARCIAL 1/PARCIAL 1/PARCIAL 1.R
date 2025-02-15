# 1 Genere un vector aleatorio de distribuci´on exponencial con n´umero de observaciones 50 y una tasa (rate) de 0.5. Use set.seed(2025). Realice los siguientes: -----

set.seed(2025)
vector1 <- rexp(50, rate= 0.5)
vector1

#i) Ord´enelos de mayor a menor.

vector_o <- sort(vector1, decreasing = T )
  vector_o

#ii)Extraiga los elementos de las posiciones 5 y 15.
  
invervalo1 <- vector_o[5:15]
invervalo1

#iii)Extraiga los valores de las posiciones pares.

intervalo_p <- vector1[seq(2, length(vector1), by = 2)]
intervalo_p 

#iv) Extraiga los valores que son mayores que 1, pero menores que 4.

intervalo2 <- vector1 [vector1 >  1 & vector1 <  4 ]
intervalo2

#2 Un estudiante busca informaci´on sobre conjuntos de datos de referencia en econom´ıa. Recuerda que sus nombres son: ----

install.packages("carData")
library(carData)
data.frame("Prestige")
df_1 <- Prestige
df_1
 data.frame("longley")
 df_2 <- longley
  df_2
 
#i)Indique en qu´e paquete se encuentran cada uno de estos conjuntos.
 
 library(carData)
 library(datasets)
 

#ii) Describa el prop´osito de cada conjunto y las variables clave que contienen.
  
'Prestige' : Contiene datos sobre ocupaciones en Canadá en 1971. Se usa para analizar la relación entre ingresos, nivel educativo y prestigio ocupacional.

'education': Años promedio de educación para la ocupación.
'income': Ingreso promedio de los trabajadores en la ocupación.
'women': Porcentaje de trabajadores que son mujeres.
'prestige': Puntaje de prestigio de la ocupación basado en encuestas.
'census': Código de la ocupación en el censo canadiense.
'type': Categoría de la ocupación (profesional, manual, etc.).

'longley' : Contiene datos económicos de EE.UU. entre 1947 y 1962. Se usa comúnmente para evaluar modelos de regresión debido a su alta multicolinealidad.

'GNP.deflator': Índice del deflactor del PNB (Producto Nacional Bruto).
'GNP': Producto Nacional Bruto en dólares.
'Unemployed': Número de personas desempleadas.
'Armed.Forces': Número de personas en las fuerzas armadas.
'Population': Población total en miles.
'Year': Año de la observación.
  
  
#iii)Realice una caracterizaci´on de la variable prestige seg´un type en Prestige. Use el paquete dplyr de tidyverse y elimine los valores NA (si lo hay).
install.packages("tidyverse")
install.packages("dplyr")
library(dplyr)
f_df_1 <- tidyr::drop_na(df_1)
  f_df_1
 #RESUME
  
  r_df_1 <- f_df_1 %>%
    group_by(type) %>%
    summarise(
      count = n(),                     
      mean_prestige = mean(prestige, na.rm = TRUE),   
      median_prestige = median(prestige, na.rm = TRUE), 
      sd_prestige = sd(prestige, na.rm = TRUE),       
      min_prestige = min(prestige, na.rm = TRUE),     
      max_prestige = max(prestige, na.rm = TRUE)   
    )  
    
  r_df_1
  
  
  
#PUNTO 3----
  
quote <- "data science is a rapidly evolving field"
chars <- unlist(strsplit(quote, ""))
e <- which(chars == "e")[1]  
c_a <- sum(chars[1:(e - 1)] == "a")
C_a

#PUNTO 4----

set.seed(123)  
# opciones
monedas <- c("C", "S")
count_sss <- 0  
history <- c()
while (count_sss < 5) {
  r <- sample(monedas, 3, replace = TRUE)  
  r_str <- paste(r, collapse = "")  
  history <- c(history, r_str) 
  if (r_str == "SSS") {
    count_sss <- count_sss + 1  
  }
}
history

#Punto 5 ----


r_i_c <- function() {
  set.seed(123)  
datos <- rnorm(50, mean = 0, sd = 1)
datos_or <- sort(datos)
  pos_q1 <- 0.25 * (length(datos_or) + 1)
  pos_q3 <- 0.75 * (length(datos_or) + 1)
  
  # Interpolación lineal para obtener Q1 y Q3
  Q1 <- datos_or[floor(pos_q1)] + 
    (pos_q1 - floor(pos_q1)) * (datos_or[ceiling(pos_q1)] - datos_or[floor(pos_q1)])

  Q3 <- datos_or[floor(pos_q3)] + 
    (pos_q3 - floor(pos_q3)) * (datos_or[ceiling(pos_q3)] - datos_or[floor(pos_q3)])
 # rango intercualitico 
   IQR <- Q3 - Q1
  
  print(paste("El primer cuartil (Q1) es:", round(Q1, 4)))
  print(paste("El tercer cuartil (Q3) es:", round(Q3, 4)))
  print(paste("El rango intercuartílico (IQR) es:", round(IQR, 4)))
}

r_i_c()

  
#PUNTO 6----

#i) Cargue los datos tree growth y muestre las 5 primeras filas.
tree_growth <- read.delim('C:/Users/carl_/OneDrive/Escritorio/ESTADISTICA COMPUTACIONAL/PARCIAL 1/tree_growth.txt')
tree_growth
head(tree_growth, 5)

#ii)) Cambie el nombre codificado de los dos tipos de ´arboles al nombre com´un correspondiente. Use dplyr.
tree_growth <- tree_growth %>%
  mutate(arbol = case_when(
         arbol== 'a51'  ~ 'manzano' ,
         arbol == 'a52' ~ 'peral', 
         T ~ arbol
         ))
tree_growth
#iii) 

new_tree <- tree_growth %>%
filter(altura > 50) %>%  # Filtra altura mayor a 50 cm
  arrange(altura)
new_tree
 
#iv)
suelo <- c("arenoso", "arcilloso", "arenoso", "arcilloso")
fertilizante <- c("fer1", "fer2", "fer3", "fer4")

recomendacion <- data.frame(suelo, fertilizante)
fertilized_growth <- tree_growth %>%
  left_join(recomendacion, by = "suelo")
fertilized_growth


#v)
altura_pro <- fertilized_growth %>%
  group_by(fertilizante) %>%  
  summarise(altura_pro = mean(altura, na.rm = TRUE))  

altura_pro
