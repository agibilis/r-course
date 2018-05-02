clientes <- c("Juan Gabriel", "Ricardo", "Pedro")
fechas <- as.Date(c("2017-12-27", "2017-11-1", "2018-01-01"))
pago <- c(315, 192.55, 40.15)
pedidos <- data.frame(clientes, fechas, pago)

# salvamos el objeto pedidos en un fichero Rdata. 
# Se pueden guardar todos los objetos que queramos
save(pedidos, file="Data/Tema1/pedidos20180422.Rdata")
# salvamos los pedidos en un fichero rds
saveRDS(pedidos, file="Data/Tema1/pedidos20180422.rds")

#eliminamos de memoria
remove(pedidos)

# ahora cargamos los datos de un fichero Rdata
load("Data/Tema1/pedidos.Rdata")
# para cargar un rds se tiene que volcar el contenido a un archivo, podemos dar un nuevo nombre
orders <- readRDS("Data/Tema1/pedidos.rds")
# con R existn multitud de dataset que pueden ser interesantes 
iris
data(cars)
cars

# para guardar todos los objetos de la sesion 
save.image("Data/Tema1/alldata_20180403.Rdata")

primos <- c(2,3,5,7,11,13)
pow2 <- c(2,4,8,16,32,64,128)
# se pueden salvar en un formato Rdata varios objetos
save(list = c("primos","pow2"), file = "Data/Tema1/primos_and_pow2.Rdata")

# si cargamos el fichero no nos pregunta nada y sobrescriben los objetos
# salvo con attach que no permite cargar sobre objetos existentes
attach("Data/Tema1/primos_and_pow2.Rdata")

read.fwf()
