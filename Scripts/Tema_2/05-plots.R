auto <- read.csv("Data/Tema2/auto-mpg.csv")

auto$cylinders <- factor(auto$cylinders,
                         levels = c(3,4,5,6,8),
                         labels=c("3cil","4cil","5cil","6cil","8cil")
                         )

# para poder.fijar el data frame.  A partir de ahora todas las columnas son del dataframe auto
attach(auto)
head(cylinders)
#Histograma de frecuencias
hist(acceleration,
     col=rainbow(12),
     xlab="Aceleración",
     ylab = "Frecuencia",
     main="Histograma de aceleraciones",
     breaks=12 # numero de divisiones
     )
#Boxplot podemos darle un vector o dataframe entero
boxplot(mpg,
        xlab='Millas por Galón')

boxplot(mpg~model_year,
        xlab='Millas por Galón por año')

boxplot(mpg~cylinders,
        xlab="Consumo por número de cilindros")
# la caja de 6 y 8 son pequenas y tienen outliers por lo que cuidado con los datos.

# es recomendable no pintar todas las variables en un boxplot ya que algunas no tienen sentido 

#Scatterplot comparacion entre dos variables
plot(mpg~horsepower)

# es interesante utilizar una matriz de scaterplot donde vemos como se relacionan las variables.
pairs(~mpg+displacement+horsepower+weight)


# las funciones de desnsidad no se usan sueltas sino que se pintan encima de los histogramas

hist(mpg,
     breaks=20,
     prob=T)
lines(density(mpg)) # la funcion de densidad se calcula como linea

#Es muy util pintar en el scatterplot la recta de regresion veamos un ejemplo
plot(mpg ~ horsepower)
linearmodel <- lm(mpg ~ horsepower)
linearmodel
abline(linearmodel,
       col="red")

# nos puede interesar pintar grupos de puntos igual podemos añadir una nueva variable
# por ejemplo vamos a usar el numero de cilindros.

plot(mpg ~ horsepower, type="n") # la caja vacia
linearmodel
abline(linearmodel,
       col="black")
#agregar colores para cada cilindrada
with(subset(auto,cylinders=="8cil"),
     points(horsepower,mpg, col="red"))
with(subset(auto,cylinders=="6cil"),
     points(horsepower,mpg, col="yellow"))
with(subset(auto,cylinders=="5cil"),
     points(horsepower,mpg, col="green"))
with(subset(auto,cylinders=="4cil"),
     points(horsepower,mpg, col="blue"))
with(subset(auto,cylinders=="3cil"),
     points(horsepower,mpg, col="black"))

#Combinación de plots con par
old.par <- par()
old.par

par(mfrow=c(1,2)) # 1 fila 2 columnas 

with(auto,{
  plot(mpg~weight, main="Peso vs Consumo")
  plot(mpg~acceleration,main="Aceleración vs Consumo")
}
     )

par(old.par)
par(mfrow=c(1,1))

detach(auto)