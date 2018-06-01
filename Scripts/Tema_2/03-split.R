# split / unsplit
data <- read.csv("Data/Tema2/auto-mpg.csv", stringsAsFactors = F)

# vamos a dividir segun los valores de cilynders

carlist <- split(data,data$cylinders)

# en catlist tenemos una lista de dataframes

carlist[1]

carlist[2]

# para obtener el objeto
carlist[[1]]

# obtiene para todos elementos de la lista el valor de la primera fila y cuarta columna 
lapply(carlist,"[[",1, 4)

# en formato vector el valor de la columna 1
lapply(carlist,"[[",1)

#en formato columna el valor de la columna 1
lapply(carlist,"[",1)

carlist

str(carlist)

###############
#Una parte de la informacion se usa para construir el modelo y otra parte para evaluar
          