install.packages("tidyr")
library(tidyr)

crime.data<- read.csv("Data/Tema1/USArrests.csv",
                      stringsAsFactors = FALSE)
rownames(crime.data)

View(crime.data)
# añadimos una columna adicional con el estado de cada fila
crime.data<- cbind(state=rownames(crime.data),crime.data)
# vamos a unir dos columnas 
crime.data.1 <- gather(crime.data, 
                       key="crime_type",
                       value="arrest_estimate",
                       Murder : UrbanPop
                       )
# esto se llama array asociativo pero en realidad es un unpivot de las columnas Murder y UrbanPop

# podemos colapsar todas las columnas menos una

crime.data.2<- gather (crime.data,key="crime_type",
                       value="arrest_estimate",
                       -state)

# todos los valores se han volcado en la columna arrest_stimate

crime.data.3<- gather(crime.data,
                     key="crime_type",
                     value="arrest_estimate",
                     Murder, Assault)

# reunir dos o mas variables puede ser util para trabajar en un modo más ordenado.

# la funcion contraria es decir pivotar se realiza con la funcion spread. 

crime.data.4<-spread(crime.data.2,
                     key = "crime_type",
                     value = "arrest_estimate")
# si queremos unir distintas columnas se realizaria mediante la funcion unite
crime.data.5<-unite(crime.data, col="Murder_Assault",
                    Murder, Assault,
                    sep="-")

# para separar

crime.data.6<- separate(crime.data.5,
                        col="Murder_Assault",
                        into = c("Murder","Assault"),
                        sep="-")



