auto <- read.csv ("Data/Tema2/auto-mpg.csv",stringsAsFactors = FALSE)
auto$cylinders = factor(auto$cylinders,
                        levels = c(3,4,5,6,8),
                        labels = c("3C","4C","5C","6C","8C")
                      )
install.packages("lattice")
library(lattice)

#boxplot
bwplot(~auto$mpg | auto$cylinders,  ## solo ponemos la parte de la y
       main="MPG según la ciclindrada",
       xlab="MIllas por Galon")

#scattterplot
xyplot(mpg~weight | cylinders, data=auto,
       main = "Peso vs Consumo vs Cilindrada",
       xlab="Peso (kg)", ylab="Consumo (mpg)")

## graficos de lattice
# bwplot, xyplot, densityplot, splom
 # x~y formula primero  y luego la barra separa los factores si existen, el data es para poner el dataframe
# la personalizacion se hace mediante esquemas o temas y afecta a todos 

trellis.par.set(theme=col.whitebg())


bwplot(~auto$mpg ,  ## solo ponemos la parte de la y
       main="MPG según la ciclindrada",
       xlab="MIllas por Galon")

#boxplot
bwplot(~auto$mpg | auto$cylinders,  ## solo ponemos la parte de la y
       main="MPG según la ciclindrada",
       xlab="MIllas por Galon",
       layout=c(2,3),aspect=1)
