# Vamos a tratar los objetos que devuelven los webserver (objetos json)
# importamos la libreria jsonlite
# cargaremos dos ficheros 
# cargaremos un objeto desde internet para comprobar el funcionamiento. 

install.packages("jsonlite")
library(jsonlite)


dat.1 <- fromJSON('Data/Tema1/students.json')
dat.2 <- fromJSON('Data/Tema1/student-courses.json')

url <- "http://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote?format=json"
currencies <- fromJSON(url)

#buscamos la informacion de los campos de moneda
currency.data <- currencies$list$resources$resource$fields
head(currency.data,3)

#obtener el campo email
dat.1$Email

#Obtener la fila de la 1 a la 5 y las dos primeras coolumnas
currency.data[1:5,1:2]

#Obtener las columnas 2,5 y 8 unicamente
dat.1[c(2,5,8),]
dat.1[,c(2,5)]
