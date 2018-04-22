auto <-read.csv("Data/Tema1/auto-mpg.csv", header = T, sep= "," , na.strings = "" , stringsAsFactors = FALSE)
names(auto)
head(auto,2)
auto_custom_header <- read.csv("Data/Tema1/auto-mpg-noheader.csv",header = F, sep=",", 
    col.names = c("Numero","Millas.Galon","Cilindrada","Velocidad","HP","Peso","Aceleracion","Año","Modelo")
    )
names(auto_custom_header)  
head(auto_custom_header,2)

#ahora vamos a leer desde internet 

who_from_internet <- read.csv("https://frogames.es/course-contents/r/intro/tema1/WHO.csv",stringsAsFactors = F)
# el fichero tambien esta en el repositorio
head(who_from_internet,2)

who_from_file <-read.csv("Data/Tema1/WHO.csv")
head(who_from_file,2)

