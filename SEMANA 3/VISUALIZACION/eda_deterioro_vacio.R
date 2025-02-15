# 03 de febrero de 2023

#libreria----
library(tidyverse)

# datos ----
library(ggplot2)
url_dat <-"https://docs.google.com/spreadsheets/d/e/2PACX-1vTxMFXeL7DtF7ie6hEjdQqdNV3-KYtdEyVkZfCtpV0l65X-nLp1dEqEbSkUcG0HJGGuDKyFhslbzfIz/pub?gid=0&single=true&output=tsv"
datos <- read.delim(url_dat)
datos$Grupo <- factor(datos$Grupo,levels=c("DCLA","DCLNA","Control"))
datos

# estructura de los datos ----


# Edad ----


# Edad seg?n los niveles de deterioro----


# diagrama de cajas de la edad ----


# sexo ----


# diagrama de barras seg?n los niveles ----



# diagrama de caja de la edad
datos %>%
  ggplot(aes(y= Grupo, x=Edad)) +
  geom_violin()+
  geom_boxplot(width= 0.1)+
  stat_summary(fun= mean, geom= 'point', colors = 'red')+
  theme_bw()



datos %>%
  ggplot(aes(y= Edad, x=Sexo)) +
  geom_boxplot()+
  stat_summary(fun= mean, geom= 'point', colors = 'red')+
  theme_bw()+
  facet_grid(.~Grupo)
# sexo
datos %>% 
  count(Sexo) %>% 
  mutate(porcentaje = (n/sum(n))*100)
datos


datos_sexo %>%
     
     ggplot(aes(y= porcentaje , x=Sexo , fill=Sexo)) +
     geom_col(position = 'dodge')+ 
    scale_fill_manual(values= c('#542e6b', '#cdcf55'))+
     facet_grid(.~Grupo)+
     geom_text(aes(label = paste(round (porcentaje, 1), '%')),
                +             vjust= -0.5)
  theme_bw()