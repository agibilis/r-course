data <- read.csv("Data/Tema2/auto-mpg.csv", 
                 header=T, 
                 stringsAsFactors = F)

# podemos resumir los datos utilizando la funcion summarize

data$cylinders <- factor(data$cylinders,
                         levels=c(3,4,5,6,8),
                         labels=c("3cil","4cil","5cil","6cil","8cil"))
# con la siguiente instruccion tenemos el resumen de todas las columnas
summary(data)
# con esta otra funcion nos dice como se estructura la informacion 
str(data)
#podemos quedarnos solo con una columna. 
summary(data$cylinders)

summary(data$mpg)
str(data$cylinders)

# instalamos 3 paquetes
install.packages(c("modeest","raster","moments"))
library(modeest) #moda
library(raster) #quantiles, cv
library(moments) #asimetría, curtosis

x = data$mpg

### Medidas de Centralización
# Media aritmetica
mean(x) #sum(x)/length(x)
# Mediana
median(x)
# Moda muestra que más aparece
mfv(x) # e la moda del paquete modeest
#Percentiles
quantile(x)

#### Medidas de Dispersión 
# varianza (muestral trabajamos con datos dividimos por n-1)
#S^2
var(x)
#desviacion tipica
#S
sd(x)
#coeficiente de variación (porcentaje variabilidad relativa entre la media y la desviacion típica)
cv(x) #(sd(x)/mean(x))*100

#### Momento de orden r 

El coeficiente de asimetria de Fisher se basa en los elementos de orden 3 (se basan en los momentos respecto a la media)

El coeficiente de asimetia de curtois se basa en los elementos de orden 4

Cuanto mas positivo mas desplazada hacia la izquierda. 

En el caso de courtosis si es cero es de tipo mesocurtica si es negativa seria platicurtica

#utililzaremos las mediadas en base a documentos.
#Media de asimetria
skewness(x)
kurtosis(x)

hist(x)
