# Vamos a utilizar un dataset existente en http://lib.stat.cmu.edu/datasets/boston
# infromacion adicional se puede encontrar aqui https://www.cs.toronto.edu/~delve/data/boston/bostonDetail.htm

housing <- read.csv("Data/Tema1/BostonHousing.csv")

# Normalizamos los valores (normal estandard 0 y colas 1 -1 )  esto es una basura BAD BAD BAD 
housing.z <- scale(housing)
# si se usa scale con variables categoricas fallara.  

#sd = sqrt(sum(x^2)/(n-1))
