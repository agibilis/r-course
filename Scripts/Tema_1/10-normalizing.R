# Vamos a utilizar un dataset existente en http://lib.stat.cmu.edu/datasets/boston
# infromacion adicional se puede encontrar aqui https://www.cs.toronto.edu/~delve/data/boston/bostonDetail.htm

housing <- read.csv("Data/Tema1/BostonHousing.csv")

# Normalizamos los valores (normal estandard 0 y colas 1 -1 )  esto es una basura BAD BAD BAD 
housing.z <- scale(housing)
# si se usa scale con variables categoricas fallara por lo tanto todas deben ser del tipo númerico
# esta funcion normaliza los valores 

#sd = sqrt(sum(x^2)/(n-1))
# para normalizar Z=(X-media)/sd  para cada valor de X se obtiene un valor de Z transformado. 

# podemos preparar una funcion para solo escalar determinadas columnas 

scale.many <- function (dataframe,cols) {
  names <- names(dataframe)
  for(col in cols){
    name <- paste (names[col],"z",sep = ".")
    dataframe[name]<-scale(dataframe[,col])
  }
  cat(paste("Hemos normalizado ",length(cols), "variable(s)"))
  dataframe
}

# Ahora aplicamos el reescalado a solo unas columnas 

scale.many(housing,c(1,3,5:8))

#volvemos a aplicar sobre el original para que se añadan las columnas
housing <-scale.many(housing,c(1,3,5:8))

