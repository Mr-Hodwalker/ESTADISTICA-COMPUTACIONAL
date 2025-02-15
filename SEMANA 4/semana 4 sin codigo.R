# Libreria ----
library(readxl)
library(tidyverse)
library(BSDA)
library(effsize)
library(nortest)
library(coin)
library(rstatix)
library(effectsize)
# Comparación de medias poblacionales independientes paramétrica (1) ----

# Datos
# Cargar los datos_medicos (ejercicio)
datos_medicos <- read_excel("C:/Users/carl_/OneDrive/Escritorio/ESTADISTICA COMPUTACIONAL/SEMANA 4/datos_medicos.xlsx")

# Realiza un exploratorio usando tidyverse (ejercicio)



datos_medicos %>% 
  ggplot(aes(x = Presión , y = Valores))+
  geom_boxplot()+
  stat_summary(fun= mean , geom = 'point', color = 'green')+
  theme_bw()

# Verifiquemos si los datos tiene comportamiento normal
presiondiastolisca <- datos_medicos %>%  
  filter(Presión == 'PresionDiastolica')

presionsistolica <- datos_medicos %>% 
  filter(Presión == 'PresionSistolica')
## kolmogorov-smirnov (ejercicio)

ks.test(scale(presiondiastolisca$Valores),'pnorm')

ks.test(scale(presionsistolica$Valores),'pnorm')      

## shapiro-will (ejercicio)
shapiro.test(presiondiastolisca$Valores)
shapiro.test(presionsistolica$Valores)
# grafica de qq (ejercicio)
qqnorm(presiondiastolisca$Valores, 
       las = 1,pch = 18, main = 'Presion Diastolica',
       xlab = 'Cuantiles Teoricos', 
       ylab = 'Cuantiles Muestrales')
qqline(presiondiastolisca$Valores)

qqnorm(presionsistolica$Valores, 
       las = 1,pch = 18, main = 'Presion Sistolica',
       xlab = 'Cuantiles Teoricos', 
       ylab = 'Cuantiles Muestrales')
qqline(presionsistolica$Valores)
# Verifiquemos igualdad de varianzas



# función var.test
# Se utiliza específicamente para realizar una prueba 
# de igualdad de varianzas entre dos o más grupos de datos. 
# Es una prueba que se basa en la comparación de las varianzas
# muestrales de los grupos.

## (Ejercicio)
var.test(presiondiastolisca$Valores, presionsistolica$Valores)

var.test(Valores ~ Presión , data = datos_medicos)
# funcion bartlett.test 
# Prueba de Bartlett (bartlett.test): La prueba de Bartlett 
# también se utiliza para evaluar la igualdad de varianzas 
# entre grupos. El estadistico que usa es chi^2

## (Ejercicio)


bartlett.test(Valores ~ Presión , data = datos_medicos)
# Las pruebas de levene y Fligner-Killeen se usan cuando no hay
# normalidad en los datos para la igualdad de varianza pero
# pero usando la mediana

# funcion leveneTest
# La prueba de Levene se utiliza para evaluar la igualdad de 
# varianzas entre grupos y es menos sensible a la suposición de 
# normalidad en comparación con la prueba F

# Realiza la prueba usando levene.test (ejercicio)
install.packages("car")
library(car)
leveneTest(Valores ~ factor(Presión) , data = datos_medicos, center = mean)

# funcion fligner.test
# La prueba de Fligner-Killeen es otra opción para probar la 
# igualdad de varianzas y es robusta frente a la suposición de 
# normalidad. Usa  la mediana de las desviaciones 
# absolutas de cada valor de la muestra con respecto a la 
# mediana de su grupo y así la aproxima una chi^2

# Realiza la prueba (ejercicio)
fligner.test( Valores ~ factor(Presión) , data= datos_medicos)

# diferencia de medias (ejercicio)
z.test(y = presiondiastolisca$Valores,
       x= presionsistolica$Valores, 
       sigma.y = sd(presiondiastolisca$Valores),
       sigma.x = sd(presionsistolica$Valores))
t.test (presiondiastolisca$Valores,
        presionsistolica$Valores,
        paired = F, 
        var.equal = T)
# calculo del tamaño del efecto (ejercicio)
cohen.d(presionsistolica$Valores , presiondiastolisca$Valores)


# Comparación de medias poblacionales independientes paramétrica (2) ----
datos_economia <- read_excel("C:/Users/carl_/OneDrive/Escritorio/ESTADISTICA COMPUTACIONAL/SEMANA 4/datos_economia.xlsx")
datos_economia
# 1) Exploratorio
datos_economia %>% 
gather(Grupo, Valor,
       Ganancia, Inversion) -> data_gather
data_gather

data_gather %>% 
  group_by(Grupo) %>%
  summarise(n = length (Valor),
             media= mean (Valor),
             ds =sd(Valor),
             mediana = median (Valor),
             minimo = min(Valor),
             Maximo= max(Valor))
# 1) Verificar normalidad
ks.test(scale(datos_economia$Inversion) , 'pnorm')
ks.test(scale(datos_economia$Ganancia), 'pnorm')
# 2) Verifiquemos igualdad de varianzas
var.test(Valor ~ Grupo, data = data_gather)
# 3) Verificar diferencia de medias
t.test (Valor ~ Grupo, data = data_gather,
        paried= F, var.equal= F)
# Comparación de medias poblacionales dependientes paramétrica (pareadas) ----

datos <- data.frame(
  corredor = c(1:10),
  antes = c(12.9, 13.5, 12.8, 15.6, 17.2, 19.2, 12.6, 15.3, 14.4, 11.3),
  despues = c(12.7, 13.6, 12.0, 15.2, 16.8, 20.0, 12.0, 15.9, 16.0, 11.1)
)

# 1) Realizar un analisis descriptivo

# 2) prueba de normalidad
shapiro.test(datos$antes)
shapiro.test(datos$despues)
# 3) diferencia de medias
t.test(x= datos$antes,
       y= datos$despues,
       paired= T)
# 4) tamaño del efecto
cohen.d(d=datos$antes ,
        f=datos$despues,
        paired =T)
# Comparación de medias poblacionales independientes no paramétrica ----
library(births)
data('births')
births
library(openintro)# 1) Realizar el análisis exploratorio 
births

births%>% 
  
  group_by(smoke) %>% 
  summarise(n = length(weight),
            est_ks =ks.test(scale(weight), 'pnorm')$statistic,
            p_ks =ks.test(scale (weight), 'pnorm')$p.value,
            est_sw = shapiro.test(weight)$statistic,
            p_sw = shapiro.test(weight)$p.value,
            est_lt = lillie.test(weight)$statistic, 
            p_lt =lillie.test(weight)$p.value
            )

# 2) Normalidad de los datos

# 3) igualdad de varianza
leveneTest(weight ~ smoke, data = births, 
           center = median)
# 4) Prueba de U de Mann Whitney con la función wilcox.test()
births %>% 
wilcox_test(weight ~ smoke, paired =F
            )

# 5) tamaño del efecto no parametrico 
rank_biserial(weight ~ smoke, data=births)
interpret_r(rank_biserial(weight ~ smoke, data=births), rules = 'cohen'
)
# 6) Use la prueba t.test y porque la usaria (ejercicio)

# Comparación de medias poblacionales dependientes no paramétrica (pareadas) ----
url_dat <- "https://docs.google.com/spreadsheets/d/e/2PACX-1vQaVafuOSuEnOIiJJoB_OLF6GHib4EGqtAPnFBkNXFj29iB8yex4wYXYAAyIW16eA/pub?gid=1616716040&single=true&output=tsv"
datos <- read.delim(url_dat)
datos
# 1) realiza el exploratorio 

# 2) normalidad de los datos
datos%>% 
  group_by(Grupo) %>% 
  summarise(n = length(Q1),
           est_ks =ks.test(scale(Q1), 'pnorm')$statistic,
            p_ks =ks.test(scale (Q1), 'pnorm')$p.value,
            est_sw = shapiro.test(Q1)$statistic,
            p_sw = shapiro.test(Q1)$p.value,
            est_lt = lillie.test(Q1)$statistic, 
            p_lt =lillie.test(Q1)$p.value
  )
# 3) diferencia en pretest y posttest
datos %>% 
wilcox_test(Q1 ~ Experimento, paired =T
)
# 4) tamaño del efecto no parametrico 
rank_biserial(Q1 ~ Experimento, data=datos)
interpret_r(rank_biserial(Q1 ~ Experimento, data=datos)
)
# ANOVA para mas de 2 grupos paramétricas ----
datos <- data.frame(
  Grupo = rep(c("A", "B", "C"), each = 10), # Tres grupos con 10 observaciones cada uno
  Calificaciones = c(75, 78, 80, 82, 85, 88, 90, 92, 95, 98,   # Grupo A
                     68, 70, 72, 74, 76, 78, 80, 82, 84, 86,   # Grupo B
                     60, 63, 66, 69, 72, 75, 78, 81, 84, 87)   # Grupo C
)

# 1) realizar el análisis exploratorio 

# 2) normalidad de los datos
datos%>% 
  group_by(Grupo) %>% 
  summarise(n = length(Calificaciones),
            #est_ks =ks.test(scale(Calificaciones), 'pnorm')$statistic,
            #p_ks =ks.test(scale (Calificaciones), 'pnorm')$p.value,
            est_sw = shapiro.test(Calificaciones)$statistic,
            p_sw = shapiro.test(Calificaciones)$p.value,
            #est_lt = lillie.test(Calificaciones)$statistic, 
            #p_lt =lillie.test(Calificaciones)$p.value
  )
# 3) igualdad de varianzas
bartlett.test(Calificaciones ~ factor(Grupo) , data = datos)
# 4) Realizar un análisis de varianza (ANOVA)
resultado_anova <- aov(Calificaciones ~ factor(Grupo) , data = datos)
summary(resultado_anova)
# 5) prueba post hoc para ver quienes son diferentes
TukeyHSD (resultado_anova)
pairwise.t.test(x= datos$Calificaciones,
              g = datos$Grupo,
              p.adjust.method = ('bonferroni'))
# KW para mas de 2 grupos no parametrica ----
# Un estudio compara el número de huevos que pone un 
# determinado insecto bajo 3 condiciones distintas. 
# ¿Existen diferencias significativas dependiendo de las 
# condiciones?

datos1 <- data.frame(
  condicion = c(rep("condicion1", 18), rep("condicion2", 18), rep("condicion3", 18)),
  n_huevos = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 16, 27, 28, 29, 30, 51, 52, 53, 342, 40,
               41, 42, 43, 44, 45, 46, 47, 48, 67, 88, 89, 90, 91,92, 93, 94, 293,
               19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 25, 36, 37, 58, 59, 60, 71, 72)
)

# 1) realizar el análisis exploratorio
datos1%>% 
  group_by(condicion) %>% 
  summarise(n = length(n_huevos),
            est_ks =ks.test(scale(n_huevos), 'pnorm')$statistic,
            p_ks =ks.test(scale (n_huevos), 'pnorm')$p.value,
            est_sw = shapiro.test(n_huevos)$statistic,
            p_sw = shapiro.test(n_huevos)$p.value,
            est_lt = lillie.test(n_huevos)$statistic, 
            p_lt =lillie.test(n_huevos)$p.value
            )
# 2) igualdad de varianza

# 3) diferencia kruskal-wallis
kruskal.test(n_huevos ~ factor(condicion), data = datos1)
# 4) post hoc
pairwise.wilcox.test(x= datos1$n_huevos,
                     g= datos1$condicion,
                     p.adjust.method = 'BH')
