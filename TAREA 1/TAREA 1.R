#Ejercicio 1 ----
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
# Combinamos los vectores en una matriz 
start_wars_matrix <- rbind(new_hope,empire_strikes,return_jedi)
rownames(start_wars_matrix) <- c('New Hope','The empire Strikes Back','Return of the Jed')
colnames(start_wars_matrix) <- c('US','non-US')
start_wars_matrix
# Renombrar
t(start_wars_matrix)
start_wars_matrix2 <- t(start_wars_matrix)
start_wars_matrix2
# Calcule las cifras de la taquilla mundial
worldwide_vector <- rowSums(start_wars_matrix2) 
worldwide_vector
# Anade worldwide vector
start_wars_matrix2 <- cbind(start_wars_matrix2, 'All Wars Matrix' = worldwide_vector)
start_wars_matrix2
#Ingreso
non_us_all <- sum(start_wars_matrix2['non-US', ])
non_us_all
mean(start_wars_matrix2)


# Ejercicio 2 ----

planet_df <- data.frame(
  name = c('Mercury', 'Venus', 'Earth','Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'),
  type = c('Terrestrial planet', 'Terrestrial planet', 'Terrestrial planet', 
           'Terrestrial planet', 'Gas giant', 'Gas giant', 'Gas giant', 'Gas giant'),
  diameter = c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883),
  rotation = c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67 ),
  rings = c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)
)
#Estructura o resumen
str(planet_df)

#Seleccionar el diametro del planeta Mercurio
mercury_diameter <- planet_df$diameter[planet_df$name == 'Mercury']
print(mercury_diameter)

#Seleccionar todos los datos del planeta Marte
mars_data <- planet_df[planet_df$name == 'Mars',]
print(mars_data)

#Seleccionar e imprimir los primeros cinco valores del diametro

print (planet_df$diameter[1:5])

#Tres formas de seleccionar la variable rings y asignarlo a rings_vector
rings_vector1 <- planet_df$rings
rings_vector2 <- planet_df[,'rings']
rings_vector3 <- planet_df[['rings']]
print(rings_vector1)
print(rings_vector2)
print(rings_vector3)

#seleccionar todos los planetas que tienen anillos
planets_with_rings <- planet_df[planet_df$rings == TRUE, ]
print(planets_with_rings)

#seleccionar planetas con diametro menor al de la tierra
small_planets <- subset(planet_df, diameter< 1)
print(small_planets)

#Ordenar de menor a mayor todos los planetas por el diametro
diameter <- planet_df[order(planet_df$diameter), ]
print(diameter)


# Ejercicio 3 ----
mov <- 'Spider-Man: No Way Home'
act <- c('Tom Holland', 'Zendaya', 'Benedict Cumberbatch', 'Jacob Batalon', 'Willem Dafoe')
rev <- data.frame(scores = c(9.0, 8.5, 9.2), sources = c('IMDB', 'Rotten Tomatoes', 'Metacritic'), comments = c('Amazing movie!', 'Great action sequences', 'Fantastic story'))
sp_man_no_way_home_list <- list( moviename = mov, actors = act, reviews = rev)
sp_man_no_way_home_list
segundo_actor <- sp_man_no_way_home_list$actors[2]
segundo_actor
