install.packages("tydiverse")
library(tydiverse)
install.packages("haven")
library(haven)
library(readxl)

#dos paquetes comunes para abrir archvos dta. sin haven y foreign

#df es la abreviación del nombre de "mibasededatos"

df <-- haven :: read.dta("mibasededatos")   
colnames(df)
head(df)

#el paquete sjmisc tiene la funcion frq() que es muy util (frecuencia)
#especialmente si tienes datos con etiqueta
sjmisc::frq(df,a4)
# sjmisc para hacer conteo normalmente en variables categoricas
#a4 en su opinión, cual es el problema más grave que está enfrentando el país?

gruop_by(a4) %>% #te agrupa por variable, agrupa por unidad de analisis (problemática)
#(ej: agrupa partidos politicos, bancadas, etc)
summarise(n= n()) %>%   
arrange(-n) #es para ordenar nuestras categorias de mayor a menor
#usar la funcion "filter" para limpiar y filtrar
#filter()
#@mutate

# %>% se llama pipe (shift ctr M)

df %>%
select(x,y) %>%
filter(q1tb == 2) %>%
mutate(pn4_a = ::rec( pn4, rec = "1,2 = 1 [Muy satisfecho];
                    4,5 =3 [Muy insatisfecho];
                                3 =2 [Neutro]"))

df_a <- df %>%
group_by(a4, q1tb) %>%
