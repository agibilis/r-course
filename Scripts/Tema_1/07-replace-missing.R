
data <- read.csv("Data/Tema1/missing-data.csv", na.strings = "")
#vamos a sustituir los datos que falten por la media
data$Income.mean <- ifelse(is.na(data$Income),
                           mean(data$Income,na.rm=TRUE),
                           data$Income) # es como el decode

# ahora el data tiene una columna mas con el valor de NA sustituido por la media. 
# esto sólo es valido para volores numéricos

# Otra aproximación más utilizada es sustituir el valore  de NA por una valora aleatorio de entre los existentes en 
# la muestra que no es NA

# x es un vector de datos que puede contener NA
rand.impute <- function(x){
  missing <- is.na(x) # vector de valores TRUE/FALSE dependiendo del NA
  n.missing <-sum(missing)# al sumar un vector de verdadros o falsos me dice cuantos valores son NA
  x.obs <-x[!missing]# valores que tienen dato difererte a los que tienen NA es decir quienes no tienen NA
  imputed <- x
  #donde exista un valor que falte se reemplza por una muestra de los que si son conocidos (y con reemplazo para que el resultado pueda repetirse)
  imputed[missing]<- sample(x.obs,n.missing,replace=TRUE)
  return(imputed)
} 

random.impute.data.frame <- function(dataframe,cols){
  names <-names(dataframe)
for(col in cols){
  name <-paste(names[col], ".imputed",sep="") # concateno el nombre de la columna para darle un nuevo nombre de columna
  dataframe[name]=rand.impute(dataframe[,col]) #crea la nueva  columna en el dataframe
  }
  dataframe # para que devuelva el dataframe 
}

#volvemos a crear el dataframe original data 
data <- read.csv("Data/Tema1/missing-data.csv", na.strings = "")
# aplicamos la funcion 
random.impute.data.frame(dataframe = data,cols = c(1,2))

data.new <-random.impute.data.frame(dataframe = data,cols = c(1,2))

# si tambien queremos poner los datos de lo simportes a cero como NA
data$Income[data$Income==0]<-NA 

data.new <-random.impute.data.frame(dataframe = data,cols = c(1,2))

