# en ocasiones o habitualmente nos vamos a encontrar con registros con algun dato inexistente
# tendremos siempre qque tratar estos registros con nulos
# las posibilidades que aporta R son
# Borrar los gegistros con algun NA
# Borrar la columna con algun NA
# Sustituir el NA por algun estadistico (media,mediana,moda)

housing.data<- read.csv("Data/Tema1/housing-with-missing-value.csv", header = TRUE, stringsAsFactors = FALSE)
# el stringAsFactors es para que los NA no los interprete como texto sino como estado de valor de una columna.


# lo primero es hacer un summary
summary(housing.data)

# la variable rad y ptratio tiene 40 valores con NA
# ¿podrian estar estos NA relacionados?

# para hacer desaparecer las filas na.omit
# Eliminar todas las observaciones que contengan algún NA
housing.data.1 <- na.omit(housing.data)
summary(housing.data.1)

# otra posibilidad es eliminar los NA  pero de alguna columna por ejemplo rad
#Eliminar las NAs de ciertas columnas
drop_na<-c("rad")
housing.data2 <- housing.data[
  complete.cases(housing.data[,!(names(housing.data))%in% drop_na]),]
# al eliminar los registros tenemos diferencias entre los dataframes. 
summary(housing.data2)

# seguimos teniendo NA
# eliminamos una coluna 
housing.data$rad <-NULL
summary(housing.data)
# si quiero borrar las dos columnas por ejempo si tiene muchos datos incorrectos
drops<- c("rad","ptratio")
housing.data.3<- housing.data[,!(names(housing.data) %in% drops)]
summary(housing.data.3)

#la siguiente libreria es MUY UTIL
install.packages("Hmisc")
library(Hmisc)
# quiero reemplazar los NA por otros valores.  La libreria impute me va a permitir hacer este reemplazo.
housing.data<- read.csv("Data/Tema1/housing-with-missing-value.csv", header = TRUE, stringsAsFactors = FALSE)
summary(housing.data)
housing.data.copy1 <- housing.data

housing.data.copy1$ptratio <- impute(housing.data.copy1$ptratio, mean)
housing.data.copy1$rad <- impute(housing.data.copy1$rad, mean)
summary(housing.data.copy1)

housing.data.copy2 <- housing.data
housing.data.copy2$ptratio <- impute(housing.data.copy2$ptratio, median)
housing.data.copy2$rad <- impute(housing.data.copy2$rad, median)
summary(housing.data.copy2)

housing.data.copy3 <- housing.data
housing.data.copy3$ptratio <- impute(housing.data.copy3$ptratio, 18)
housing.data.copy3$rad <- impute(housing.data.copy3$rad, 7)
summary(housing.data.copy3)

# Vemo con los anteriores datos 

#Si tenemos muchas observaciones  eliminar las observaciones con na no introduce mucho problema.  Habria que ver cuatos NA existen
#Si la variable tiene muchos NA esa variable probablemente no sera muy importante para el negocio por lo que se puede eliminar directamente

# si el dataset no es muy grande tendriamos que ir hacia el reemplazo de los NA por un valor. 
# Estos rellenados de datos puede no dar problemas

# siempre antes debemos conocer el patron para ver una idea de como son los datos.  Existe una libreria que nos puede ayudar
install.packages("mice")
library(mice)
# con la funcion md.pattern nos da una idea de como esta la variable 
md.pattern(housing.data)
# vemos que 431 registros tienen todos los datos. 35 no tienen valor de rad y 35 no tienen valor en ptratio y 5 no tienen valor
# en rad y ptratio. En total faltan 80 observaciones. 

# otra libreria grafica  para ver los datos en VIM
install.packages("VIM")
library(VIM)

aggr(housing.data,
     col= c('green','red'),
     numbers = TRUE,
     sortVars = TRUE)

# si es casi imposible de leer parametro cex.axis =1.0 normal, bajarlo

aggr(housing.data,
     col= c('green','red'),
     numbers = TRUE,
     sortVars = TRUE,
     cex.axis = 0.75)

# gap hueco entre los dos dibujos estandard = 4

aggr(housing.data,
     col= c('green','red'),
     numbers = TRUE,
     sortVars = TRUE,
     cex.axis = 0.75,
     gap = 1)

# para dar la etiqueta 

aggr(housing.data,
     col= c('green','red'),
     numbers = TRUE,
     sortVars = TRUE,
     cex.axis = 0.75,
     gap = 1,
     ylab=c("Histogramas de NA´s","Patrón"))


# cuanto mejores graficos y que sea auto explicable mejor