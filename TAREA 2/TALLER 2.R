# Ejercicio 4 ---- urbanpop
# imprime los nombres de todos los sheets de los datos urbanpop.xlsx
urpop <- read_excel('C:/Users/carl_/OneDrive/Escritorio/ESTADISTICA COMPUTACIONAL/TAREA/TAREA 2/urbanpop.xlsx')
print(urpop)
# carga todos los sheet, 1 por 1 y ponlos en una lista: pop_list
urpoph <- ('C:/Users/carl_/OneDrive/Escritorio/ESTADISTICA COMPUTACIONAL/TAREA/TAREA 2/urbanpop.xlsx')
hj <- excel_sheets(urpoph)
print(hj)
sheet1 <- read_excel(urpoph, sheet = 1)  
sheet2 <- read_excel(urpoph, sheet = 2)  
sheet3 <- read_excel(urpoph, sheet = 3)
pop_list <- list(sheet1 = sheet1, sheet2 = sheet2, sheet3 = sheet3)
pop_list
# realiza los anterior con la funcion lapply
sheet <- excel_sheets('C:/Users/carl_/OneDrive/Escritorio/ESTADISTICA COMPUTACIONAL/TAREA/TAREA 2/urbanpop.xlsx')
pop_list <- lapply(sheets, function(sheet) read_excel('C:/Users/carl_/OneDrive/Escritorio/ESTADISTICA COMPUTACIONAL/TAREA/TAREA 2/urbanpop.xlsx', sheet = sheet))
pop_list <- sheets

# muestra la estructura de pop_list
print(pop_list)
str(pop_list)
# Importe la segunda hoja de "urbanpop.xlsx", 
hoja2 <- "C:/Users/carl_/OneDrive/Escritorio/ESTADISTICA COMPUTACIONAL/TAREA/TAREA 2/urbanpop.xlsx"
df_segunda_hoja <- read_excel(hoja2, sheet = 2)
head(df_segunda_hoja)
# pero omita las primeras 21 filas.
h1f21 <- read_excel(hoja2, sheet = 2, skip= 21)
h1f21

#SWINMMING Y HOTDOGS ----
# Ejercicio 1 ----
df <- swimming_pools
# Importar swimming_pools.csv: pools
df
# imprimir la estructura de pools
str(df)
# Ejercicio 2 ----
# Importar hotdogs.txt: hotdogs
df2 <- hotdogs

# Resumen hotdogs
summary(df2)
# Ejercicio 3 ----
# Importe hotdogs.txt file con read.table 
df3 <- read.table('C:/Users/carl_/OneDrive/Escritorio/ESTADISTICA COMPUTACIONAL/TAREA/TAREA 2/hotdogs.txt')
df3
# coloque los titulos a las columnas (type,calories,sodium):hotdogs
colnames(df3) <- c("type", "calories", "sodium")  
colnames(df3)
# Muestre 7 filas de hotdogs
head(df3,7)
# Selecciona el perro caliente con menos calorías (which.min): lily
min_hotdog <- df3[which.min(df3$calories),]
min_hotdog
df3$type[which.min(df3$calories)]
# Selecciona el perro caliente con más calorías (which.max): tom
max_hotdog <- df3[which.max(df3$calories),]
max_hotdog
df3$type[which.max(df3$calories)]


# cargar los datos ----
# Censo de estados unidos del a?o 2015

counties <- readRDS(file = "C:/Users/eveli/OneDrive/Desktop/GitHub/Manipulación/dataset/counties.rds")
counties$state <- factor(counties$state)
file.exists("C:/Users/eveli/OneDrive/Desktop/GitHub/Manipulación/dataset/counties.rds")
# imprimir
counties


# Ejercicio 5 ----
counties %>%
  
  
  library(dplyr)

counties %>%
  # selecciona las columnas (region, state, county, metro, population, walk)
  select(region, state, county, metro, population, walk) %>%
  # realiza grupos por region
  group_by(region) %>%
  # Encuentra el numero m?s grande ciudadanos que caminan para trabajar
  summarize(max_walkers = max(walk, na.rm = TRUE))
## la region con mayor numero de personas que caminan al trabajo es West con 71.2 

library(dplyr)

counties %>%
  # Selecciona las columnas de interés
  select(region, state, county, metro, population, walk, income) %>%
  # Agrupa por región y estado
  group_by(region, state) %>%
  # Calcula el ingreso promedio en cada estado dentro de su región
  summarize(avg_income = mean(income, na.rm = TRUE), .groups = "drop") %>%
  # Encuentra el ingreso más alto por estado en cada región
  slice_max(avg_income, n = 1)

#el ingreso mas alto se encontró en el estado de New Jersey northeast 

# Ejercicio 7 ----


counties %>%
  # Selecciona las columnas necesarias
  select(state, county, population, land_area, metro) %>%
  # Agrupa por estado y metro (para separar áreas metropolitanas y no metropolitanas)
  group_by(state, metro) %>%
  # Suma la población total dentro de cada estado y tipo de área
  summarize(total_population = sum(population, na.rm = TRUE), .groups = "drop") %>%
  # Asegura que solo se extraiga la categoría con mayor población por estado
  slice_max(total_population, n = 1, by = state) %>%
  # Cuenta cuántos estados tienen más población en áreas metropolitanas o no
  count(metro)

##El resultado indica que 44 estados tienen mayor población en áreas metropolitanas y 
#6 estados tienen mayor población en áreas no metropolitanas




#Ejercicio 8 ----

counties %>%
  # Selecciona el estado, el condado, la población y los que terminan en "trabajo
  select(state, county, population, ends_with("work")) %>%
  # Filtrar los condados que tienen al menos el 50% de la población dedicada al trabajo público
  filter(public_work>=50)
#Los datos muestran que en algunos condados de EE.UU., más del 50% de la población activa trabaja en el sector público.  


# Ejercicio 9 ----


counties %>%
  # Cuente el número de condados de cada estado
  count(state) %>%
  # renombrar la columna n por num_counties
  rename(num_counties = n)


# Ejercicio 10 ----


counties %>%
  # Mantenga las columnas de state, state, county, y population,
  # y agregue la columna density (poblacion por metro cuadrado (land_area))
  
  select(state, county, population, land_area) %>%
  mutate(density = population / land_area) %>%
  # Filtrar por county con una población superior a un millón 
  filter(population > 1e6) %>%
  # Ordena la densidad en orden ascendente
  arrange(density)
