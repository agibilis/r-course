data <- read.csv("Data/Tema2/auto-mpg.csv",stringsAsFactors = F)

# vamos a ver como extraer un subconjunto
# Index by position
# imaginemos que queremos los 5 primero modelos

# por posicion
data[1:5,8:9]
data[1:5,c(8,9)]
# por el nombre de la columna
data[1:5,c("model_year","car_name")]

# Si queremos obtener los coches que mas y menos consumen. 
## Min/max de mpg

data[data$mpg==max(data$mpg)|data$mpg==min(data$mpg),]


# prodriamos hacer filtros con condiciones

#Para por ejemplo el que consume muy poco
data[data$mpg>30 & data$cylinders==6,c("car_name","mpg")]
# en las filas ponemos las condiciones
# en formato corto
data[data$mpg>30 & data$cyl==6,c("car_name","mpg")]
# mediante subset
subset(data,mpg>30 &  cylinders==6,select = c("car_name","mpg"))

# operadores logicos
# & : AND
# | : OR
# ! : NOT
# == : same

# el fallo mas tipico 
data[data$mpg>30]  #error falta la coma despues de la condicion en filas.

# si queremos excluir columnas 
data[1:5,c(-1,-9)]

data[1:5,-c(1,9)]

# no funcionara con los nombres
data[1:5,-c("car_name")]  # errrr
#Pero de esta forma si
data[1:5, !names(data) %in% c("No","car_name")]

data[data$mpg %in% c(15,20), c("car_name","mpg")]

# uso de operadores booleanos en un vector, por ejemplo los multiplos de 5 

data[c(F,F,F,F,T),c(T,T,F)]


