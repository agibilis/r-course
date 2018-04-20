install.packages("XML")
library(XML)
# Vamos a trabaajar con ficheros de XML 
# cargamos la ruta del primer fichero 
url <- "Data/Tema1/cd_catalog.xml"
# abrimos el fichero xml 
xmldoc<-xmlParse(url)  #XMLInternalDocument
# recorremos el primer nodo
rootnode <- xmlRoot(xmldoc) #Accede al nodo raiz y a todos los elementos contenidos
# primer valor del nodo
rootnode[1]

# le aplicamos una funcion sobre el nodo para sacarle el valor de cada valor del nodo
cds_data <- xmlSApply(rootnode,function(x) xmlSApply(x,xmlValue)) # iterativamente recorre los nodos y les aplica la función que sacara los hijos y sus valores
# Creamos un data frame
cds.catalog <- data.frame(t(cds_data),row.names=NULL) # con la funcion t (transpone los valores originales )
# Sacamos los primeros registros
head(cds.catalog)
# si queremos sacar un conjunto acotado de datos se hace de la siguiente forma. Las cinco primeras filas
cds.catalog[1:5,]

# otras funciones son la xpad sapply setnode set 
#xpathSApply()
#getNodeSet()

# Ahora vamos a leer un html 
population_url <- "Data/Tema1/WorldPopulation-wiki.htm"
# extraemos todas las tablas de la página
tables <- readHTMLTable(poulation_url)

#la tabla que deseamos es la 6ta
most_populated <- tables[[6]]
head(most_populated,3)
#Otra posibilidad es poder ir a la tabla que deseamos obtener 
custom_table <- readHTMLTable(population_url,which = 6)
