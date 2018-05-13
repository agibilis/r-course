library(mice)

housing.data <- read.csv("Data/Tema1/housing-with-missing-value.csv",
             header=TRUE,
             stringsAsFactors= FALSE)

#columnas con problemas
columns <-c("ptratio","rad")

# vamos a inferir informacion que no exsite a traves de un modelo de simulacion
# en particular realizaremos analisis multivariante

imputed_data <- mice(housing.data[,names(housing.data) %in% columns],
                     m=5, # numero de iteraciones
                     maxit= 50, # numero máximo de iteraciones  hasta alcanzar un valor bueno.
                     method= "pmm", # forma de obtener los datos el algoritmo que mas se usa imputacion por media
                     seed= 2018  #semilla para que sea reproducible
                    )
# la funcion mice crea un objeto 
# los objetos son 
## pmm - comparación predictiva de medias 
## logrec - regresión logistica
## polyreg - regresión logística politomíca
## polr - modelo de probabilidades proporcionales. 
##regresion logistica (2 niveles)
##regresion logistica politonica (2 o mas niveles)

summary(imputed_data)

complete.data <- mice::complete(imputed_data)

# le decimos que use el paquete de la libreria mice con los dos puntos dos puntos
# ahora sustituimos los datos originales por la nueva donde se incorpora el modelo predictivo. 
housing.data$ptratio <- complete.data$ptratio
housing.data$rad <- complete.data$rad

# la siguiente intruccion nos busca los NA
anyNA(housing.data)
# nos devuelve false y por tatno nos indica que no tiene valores NA 

# otra funncion que nos permite modelizar e inferir valores NA con el paqute HMISC que nos permitia completar
# valores  de NA segun la media, moda, mediana, etc.  Tambien tiene un funcion similar a la anterior aRegInputed
# con el se puede hace regresiones , bootstrapping, 
library(Hmisc)

housing.data <- read.csv("Data/Tema1/housing-with-missing-value.csv",
                         header=TRUE,
                         stringsAsFactors= FALSE)


impute_arg <- aregImpute(~ptratio+rad,data=housing.data, n.impute = 5)

impute_arg

# incorpora lo bueno que puede ser el valor calculado  y vemos que no son muy buenos estan por 0.2 y cianto más alto mejor. 

impute_arg$imputed$rad

# Necesitamos identificar los valores outliers