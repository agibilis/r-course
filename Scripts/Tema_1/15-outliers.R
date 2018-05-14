ozone.data <- read.csv("Data/Tema1/ozone.csv",header=TRUE,stringsAsFactors = FALSE)

## vamos a intentar detectar los outliers
# empezamos con la variable presión. 

nombres <- names(ozone.data)

outlier_values <- boxplot((ozone.data),
                          varwidth = TRUE,
                          col="orange", ## color fondo de las cajas
                          boxwex =0.5, ## tamaño de las cajas
                          las=2,  ## para hacer que los nombres esten en vertical
                          at = c(1,2,3, 4,5,6, 7,8,9, 10,11,12, 13 )
                                                   )

## Hacemos el boxplot de una sola variable y vemos que pressure_heigth tiene puntos fuera del box

boxplot(ozone.data$pressure_height,
        main="Pressure Heigth",
        boxwex=0.5)

#La caja esta definida por el Q1 y Q3 y la linea interior es la mediana. (la caja contiene siempre a mitad de los valores)
#Los bigotes quedan dentro 1,5 veces del rango intercuartilico  Pero si el maximo supera el rango intercartilico el bigote se queda con este valor.

#Todo lo que se salga de los bigotes son lo que denominamos outliers

#Si queremos ver como se distribuye la presion dentro del año

boxplot(pressure_height ~  Month, 
        data=ozone.data,
        main = "Presure Heigth per Month"
        )

boxplot(ozone_reading ~Month,
        data=ozone.data,
        main="Ozone reading per Month")

#Me puede  sacar los outlier_values

boxplot(ozone.data$pressure_height,
        main="Pressure Heigth",
        boxwex=0.5)$out
# Podemos porner texto al rededor
mtext (boxplot(ozone.data$pressure_height,
               main="Pressure Heigth",
               boxwex=0.5)$out)

# primer enfoque reemplazar los valores de outlier por la media o la mediana. 
# 
impute_outliers <- function(x, removeNA=TRUE){
  quantiles <- quantile(x,c(0.05,0.95),na.rm = removeNA)
  x[x<quantiles[1]] <- mean(x,na.rm = removeNA)
  x[x>quantiles[2]] <- median(x,na.rm=removeNA)
  x
}

imputed_data <- impute_outliers(ozone.data$pressure_height)

par(mfrow = c(1,2))

boxplot(ozone.data$pressure_height, main="Presión con outliers")
boxplot(imputed_data,main="Presión sin outliers")

#podriamos eliminar todo lo que este por encima o por debajo de los bigotes, 
# es decir capar todo lo que este por encima o debajo de 1,5 veces el rango intercuartilico
# lo sustituye por el valor inferior o superior

replace_outliers <-function(x,removeNA = TRUE){
  qrts <- quantile(x,probs=c(0.25,0.75), na.rm= removeNA) # cuartile 1
  caps <- quantile(x,probs =c(0.05, 0.95), na.rm= removeNA) # cuartil 3
  iqr <- qrts[2]-qrts[1] # rango intercuartilico
  h <- 1.5 * iqr
  x[x<qrts[1]-h] <- caps[1]
  x[x>qrts[2]+h] <- caps[2]
  x
}

capped_pressure_height<- replace_outliers(ozone.data$pressure_height,removeNA = TRUE)

par(mfrow=c(1,2))
boxplot(ozone.data$pressure_height, main="Presión con outliers")
boxplot(capped_pressure_height, main="Presión sin outliers")

# transformar tambien puede ayudar a reducir los outliers en los algoritmos de analisis predictivo  se suele enmascarar los outliers por estas trasnformaciones.



