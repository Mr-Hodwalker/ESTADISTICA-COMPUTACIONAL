# Ejercicio 1 ----
# Codifique la construccion de flujo de control
li <- 15 
fb <- 9
if (--- & ---) {
  sms <- 2*(li + fb)
} --- (---) {
  sms <- 0.5*(li + fb)
} else {
  sms <- ---
}
# imprime el resultado sms
---


# Ejercicio 2 ----
# inicio de la variable speed
speed <- 64
# codigo del ciclo while
while (---) {
  ---
  ---
}

# Imprime la variable speed
---

# Ejercicio 3 ----
# inicio de la variable speed
speed <- 64
# Ampliar/adaptar el ciclo while
while (speed >30) {
  print (paste("Su velocidad es",speed))
  if (---) {
    ---
    --- <- ---
  } else {
    ---
    --- <- ---
  }
}

# Ejercicio 4 ----
# inicio i en 1
i <- 1
# Codigo del ciclo while
while ( i <= 10) {
  ---
  if ( ---) {
    ---
  }
  i <- i + 1
}


# Ejercicio 5 ----
cities <- c("New York","Paris","London", "Tokyo", "Rio de Janeiro","Cape Town")
# ciclo for usando indice
---

# Ejercicio 6 ----
nyc <- list(pop = 8405837,
            boroughs = c("Manhattan", "Bronx", "Brooklyn", "Queens", "Staten
                         Island"),
            capital = FALSE)
# ciclo version 1
---
# ciclo version 2
---

# Ejercicio 7 ----
ttt <-matrix(c("O",NA,"X",NA,"O","O", 
               "X",NA,"X"),nrow=3)
for (--- in ---) {
  for (--- in ---) {
    print(---)
  }
}

# Ejercicio 8 ----
linkedin <- c(16, 9, 13, 5, 2, 17, 14)
# Si el valor del elemento del vector es superior a 10, imprime ”¡Eres popular!”

# Si el valor del elemento del vector no excede de 10, imprime ”¡S´e m´as visible!”

# Ejercicio 9 ----
---

# Ejercicio 10 ----
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit (rquote , split = "") [[1]]
# inicio rcount
---
# Finaliza el ciclo for
for (char in chars) {
  ---
}

# imprime rcount
---

# funciones ----
---

# funcion lapply ----

# ejercicio 13
pioneros <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
# Dividir los nombres a partir del a\˜no de nacimiento. Use la funcion
# strsplit () . Llamalo split
---
# Convertir el texto en minusculas. Use la funcion tolower () . Llamelo split low
---
# Echa un vistazo a la estructura de split low
---


# ejercicio 14
pioneers <- c("GAUSS:1777", "BAYES:1702", "PASCAL:1623", "PEARSON:1857")
split <- ---
split_low <- ---
select_primero <- function(x) {
  x[1]
}

# Aplicar select primero() sobre los elementos de split low con lapply () y
# asignar el resultado a una nueva variable llamada names.
---
# Realizar el codigo para los a\˜nos
---

# expresiones regulares ----

# ejercicio 16
# Correos electronicos
emails <- c("john.doe@ivyleague.edu","education@world.gov",
            "dalai .lama@peace.org","invalid .edu","quant@bigdatacollege.edu",
            "cookie.monster@sesame.tv")
# Use grepl() para generar un vector logico que indique los correos que contienen
# ".edu".
---

# Haz lo mismo con grep(). Guardar en hits .
---

# Selecciona los correos que contengan ".edu"
---

# Con esta expresion regular "@.∗\\.edu$", utilice sub() y reemplazce por
# "@uninorte.edu.co"
---

today <- Sys.Date()
class (today)
now <- Sys.time()
class (now)
my_date <- as.Date("1985-01-07")
class (my_date)
my_date <- as.Date("1985-14-07",format="%Y %d %m")
my_time <- as.POSIXct("1985−01−07 11:25:15")
as.Date("1982−01−13”)