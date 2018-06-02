install.packages("caret", dependencies = c("Depends", "Suggests"))

install.packages("ddalpha")

install.packages("CVST")

install.packages("caret")

library(caret)

data <- read.csv("Data/Tema2/BostonHousing.csv")

# vamos a dividir en dos o tres particiones. Utilizaremos una de las variables para particionar
# emplearemos la variable mdev 

# usamos el 80% de los datos para entrenar y para validar el 20% restante

training.ids <- caret::createDataPartition(data$MEDV, p=0.8, list=F)

# lo que a preparado es un listado de id 
data.training <- data[training.ids,]
data.validation <- data[-training.ids,]

# si queremos 3 particiones por ejemplo 70 para entrenar y el resto dividido en 2 
training.ids.2 <- caret::createDataPartition(data$MEDV, p=0.7, list = F)
data.training.2 <-data[training.ids.2,]
temp <- data[-training.ids.2,]

validation.id.2 <- createDataPartition(temp$MEDV,p=0.5, list=F)
data.validation.2 <-temp[validation.id.2,]
data.testing <-temp[validation.id.2,]

# la funcion createdatapartition  en caso de dar un vector numerico aplica un proceso aleatorio basado en percentiles
# por defecto lo hace en 5 grupos y son configuralebles
# si la variable no es numerica  sino categorica lo que va a realizar es asegurarse que tengamos registros de todos los tipos. 


# vamos a usar un nuevo dataframe

data2 <- read.csv("Data/Tema2/boston-housing-classification.csv")
# se han preparado dos categorias para la columna MDEV con dos niveles. 

training.ids.3 <- createDataPartition(data2$MEDV_CAT,p=0.8,list=F)
data.training.3 <- data2[training.ids.3,]
data.validation.3 <- data2[-training.ids.3]

training.ids.4 <- createDataPartition(data2$MEDV_CAT,p=0.7, list=F)
data.training.4 <- data2[training.ids.4,]
temp2 <-data2[-training.ids.4,]

validation.id.3 <- createDataPartition(temp2$MEDV_CAT,p=0.5,list=F)
data.validation.4 <-temp2[validation.id.3,]
data.testing.4 <-temp2[-validation.id.3,]

# nos convendria automatizar este trabajo

rda.cb.partition2 <- function(dataframe, target.index, prob){
  library(caret)
  # se obtienen los id para particionar el dataframe original
  training.ids <- createDataPartition(dataframe[,target.index],p=prob,list = FALSE)
  #devuelvo dos listas. una con el conjunto de entrenamiento y otra con el resto
  list(train=dataframe[training.ids,], val=dataframe[-training.ids,])
}

rda.cb.partition3 <- function(dataframe, target.index, prob.train, prob.val){
  library(caret)
  training.ids <- createDataPartition(dataframe[,target.index],p=prob.train,list = FALSE)
  train.data <- dataframe[training.ids,]
  temp <- dataframe[-training.ids,]
  validation.ids <- createDataPartition(temp[,target.index],p=prob.val,list=FALSE)
  list(train = train.data, val = temp[validation.ids,], test = temp[-validation.ids,])
}


data1 <- rda.cb.partition2(data,14, 0.8)

data1

data2 <- rda.cb.partition3(data,14, 0.7,0.5)

head(data2$train)

# si queremos sacar una muestra aleatoria con o sin reemplazos (si es replace=F son siempre diferentes y por tanto menores que el dataframe original)
sample1 <- sample(data$CRIM, 40, replace = F)

sample1
