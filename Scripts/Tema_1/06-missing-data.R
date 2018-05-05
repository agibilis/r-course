# cargo el fichero pero tiene espacios vacios
data<-read.csv("Data/Tema1/missing-data.csv",na.strings = "")
# los espacios vacios se les asigna el valor de nulo NA
data
# podemos eliminar aquellos registros que tienen datos nulos. 
data.cleaned<-na.omit(data)
# existe una funcion que evalua si es nulo el dato
is.na(data[4,2])
# podemos evaluar la columna completa y devuelve un vector 
is.na(data$Income)
# si ahora quiero obtener todos las filas salvo las que tienen ingresos NA
data.income.cleaned<-data[!is.na(data$Income),]
data.income.cleaned

# otra forma es mediante una funcion que evalua toda la fila si en sus columnas presenta NA
complete.cases(data)
# otra forma de limpiar datos que hemos visto anteriormente. 
data.cleaned.2<-data[complete.cases(data),]
# Vamos a convertir los 0 en ingresos en NA
data$Income[data$Income == 0] <- NA
# Veamos como usan los NA las distintas funciones 
# Parametros de posicion y dispersion
mean(data$Income)
# obtenemos un NA porque no puede evaluar la media al existir nulos
# si le indicamos a la función que no tenga en cuenta los datos con NA 
mean(data$Income,na.rm=T)
# la desviacion tipica
sd(data$Income)
# no funciona por lo que tengo que indicar que no tenga en cuenta los NA
sd(data$Income,na.rm=T)
