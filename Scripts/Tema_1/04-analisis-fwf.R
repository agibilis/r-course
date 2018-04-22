#Tabajamos con ficheros de formato fijo. 
students_data <- read.fwf("Data/Tema1/student-fwf.txt",widths = c(4, 15, 20, 15, 4), 
                          col.names = c("id","nombre","email","carrera","año"))

# ahora tenemos un fichero con cabecera y dos filas iniciales que no tienen interes
# a parte del tamaño de cada columna si habilitamos la columna ya no es necesario dar los nombres.

student_dat_header <- read.fwf("Data/Tema1/student-fwf-header.txt",widths = c(4, 15, 20, 15, 4),
                               header = TRUE, sep= "\t", skip=2)

# Si ahor nos queremos saltar alguna columna que no nos interesa para el analisis

student_data_no_email <- read.fwf("Data/Tema1/student-fwf-header.txt",widths = c(4, 15, -20, 15, 4),
                               header = F, col.names = c("id","nombre","carrera","año"), sep= "\t", skip=3)
