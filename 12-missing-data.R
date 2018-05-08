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
