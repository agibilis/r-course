 install.packages("scales")
library(scales) 
students <- read.csv("Data/Tema1/data-conversion.csv")

# vamos a escalar los datos de ingresos para que varien entre 0 y 1 (por defecto)
students$Income.rescaled <- rescale(students$Income)
# este reescalado es equivalente a la siguiente funcion 

(students$Income-min(students$Income))/(max(students$Income)-min(students$Income))

# si queremos reescalar entre 0 y 100 

rescale(students$Income,to=c(0,100))

#Ahora vamos a reescalar en bloque varias columnas

rescale.many <- function(dataframe,cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col],"rescaled",sep = ".")
    dataframe[name]<-rescale(dataframe[,col])
  }
  cat(paste("Hemos reescalado ",length(cols)," variable(s)"))
  dataframe
}

rescale.many(students,c(1,4))

students.all.rescaled <-rescale.many(students,c(1,4))

