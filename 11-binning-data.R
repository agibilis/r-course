#Puede ser interesante pasar valore numericos a categoricos por ejemplo la clasificacion navi-bayes 
#requiere que todas las variables las dependientes e independientes deben ser categoricas.

#podemos querer tomar la variable dependiente como categorica para realizar la clasificación 
students <- read.csv("Data/Tema1/data-conversion.csv")
# vamos a crear una clasificacion hasta 10000 ingressos bajos, 10000 a 31000 medios y por encima altos
breakpoint <- c(-Inf,10000,31000,Inf)
#catalogamos cada grupo
names <-c("Low","Average","High")
# con la funcion cut me permite hacer cortes por una variable
students$Income.categoric <-cut(students$Income,breaks = breakpoint,labels=names)
# la funcion cut es cerrrada a la derecha y abierta por la izq

#si no se añaden etiquetas el valor del nombre lo genera automaticamente. 
students$Income.categoric2 <-cut(students$Income,breaks = breakpoint)

# A veces nos puede interesar que R nos gestione el número de cortes.  R intenta crear cortes siempre de la misma anchura
# Ahora usamos 4 blques


students$Income.categoric3<-cut(students$Income,
                                breaks = 4, 
                                labels=c("level_1","level_2","level_3","level_4")
                                )

# vamos a usar variables ficticias sobre las que categorizar pero con numeros
# dummy variables
students <- read.csv("Data/Tema1/data-conversion.csv")     
# por ejemplo el genero lo tenemos que pasar a numero y el estado igual 
install.packages("dummies")
library(dummies)

students.dummy <-dummy.data.frame(students, sep=".")
names(students.dummy)
# vemos que las variables antiguas categoricas se han sustituido por columnas y con numeros.
# una de las columnas en cada variable categorica sobre por ejemplo Gender.F y Gender.M una de las dos sobra. 
# se crean variables ficiticias para cada factor categorico.

# si solo quisieramos convertir una variable categorica
dummy(students$State,sep=".")
# se peuden crear un subconjunto y crear solo dummy para las especificadas
dummy.data.frame(students, names=c("State"), sep=".")
