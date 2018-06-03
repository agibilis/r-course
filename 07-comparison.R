data <- read.csv("Data/Tema2/daily-bike-rentals.csv",header = T)

# preparamos mejor los datos 
# vamos a factorizar los datos de las estaciones, 
# si es un dia de trabajo y la situaciond el tiempo


data$season <- factor(data$season, levels=c(1,2,3,4),
                      labels=c("Invierno","Primavera","Verano","Otoño"))
data$workingday <- factor(data$workingday,levels=c(0,1),labels=c("Festivo","De trabajo"))
data$weathersit <-factor(data$weathersit,levels=c(1,2,3),
                         labels = c("Despejado","Nublado","Lluvia/Nieve ligera"))

attach(data)

par(mfrow=c(2,2))
# trabajaremos con cuatro subdataframes por estación
winter <- subset(data,season=="Invierno")$cnt
spring <- subset(data,season=="Primavera")$cnt
summer <- subset(data,season=="Verano")$cnt
fall <- subset(data,season=="Otoño")$cnt

#dibujo el histograma
hist(winter, prob=T, 
     xlab="Alquiler diario en invierno",main="")
#pongo las lineas de densidad sobre el diagrama
lines(density(winter))
#añado una linea vertical en la media 
abline(v=mean(winter),col="red")
#añado una linea vertical en la mediana
abline(v=median(winter),col="blue")

hist(spring, prob=TRUE,
     xlab="Alquiler diario en primavera",main="")
lines(density(spring))
abline(v=mean(spring),col="red")
abline(v=median(spring),col="blue")

hist(summer, prob=TRUE,
     xlab="Alquiler diario en Verano",main="")
lines(density(summer))
abline(v=mean(summer),col="red")
abline(v=median(summer),col="blue")

hist(fall, prob=TRUE,
     xlab="Alquiler diario en Otoño",main="")
lines(density(fall))
abline(v=mean(fall),col="red")
abline(v=median(fall),col="blue")

##################
# Grafico de judias (beanplot)

install.packages("beanplot")
library(beanplot)

par(mfrow=c(1,1))
beanplot(data$cnt ~ data$season, col=c("blue","red","yellow"))
# en rojo es cada ocurrencia
# cada vaina atravesada por una linea que es la media

#####################
# vamos a ver si podemos explicar alguna causalidad
# por ejemplo cuado hace mal tiempo decae (podemos contraastarla?)

#la fecha me la ha convertido a un factor y deberia pasarla a fecha

data$dteday <- as.Date(data$dteday, format="%Y-%m-%d") #
attach(data)

# causalidad
library(lattice)

bwplot(cnt ~ weathersit, data = data,
       layout = c(1,1),
       xlab="Prónostoico del tiempo",
       ylab="Frecuencias",
       par.settings = list(box.rectangle = list(fill = c('red','yellow','green'))))

# podemos añadir informacion dentro del grafico

bwplot(cnt ~ weathersit, data = data,
       layout = c(1,1),
       xlab="Prónostoico del tiempo",
       ylab="Frecuencias",
       panel = function(x,y,...){
         panel.bwplot(x,y,...)
         panel.stripplot(x,y,jitter.data=T,...)
       },
       par.settings = list(box.rectangle = list(fill = c('red','yellow','green'))))

# el stripplot lo ha dibujado encima del boxplot
# con el jitter.data hacemos que no se superpongan

# vemos que hay muy pocas ocurrencias con lluvia o nieve comparadas con el tiempo despejado
