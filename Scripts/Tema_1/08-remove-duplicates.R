family.salary <- c(40000,60000,50000,80000,60000,70000,60000)
family.size <- c(4,3,2,2,3,4,3)
family.car <- c("Lujo","Compacto","Utilitario","Lujo","Compacto","Compacto","Compacto")

family <-data.frame(family.salary,family.size,family.car)

# como existen datos duplicados ahora vamos a eliminar los datos que se encuentran duplicados con la funcion unique
unique(family)
# ya solo aparecen datos sin duplicar. hemos pasado de 7 a 5 registros 

# podemos detectar si existen objetos duplicados 
duplicated(family)

family[duplicated(family),]
