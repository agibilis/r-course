s <- seq (0.01, 0.99, 0.01)
s
# sacamos los valores normales
qn <-qnorm(s)
qn
df <- data.frame (p = s, q = qn)
df
# podriamos generar una distribucion aleatoria segun una distribucion normal 

sample <- rnorm(200)
sample
quantile(sample,probs=s)
# los cauntiles se empiezan a ajustar a la distribucion teorica

# para hacer el grafico qqplot se ordenan la muestra y se enfrenta con la normal. 
# tenemos qqnorm
trees # dataset de r
# ¿podemos asumir que la altura tiene distribucion normal?
qqnorm(trees$Height)
# se ve bastante recta y por tanto podriamos decir que sigue una distribucion normal

# tenemos qqplot
randu # numeros aleatorios (no son normales sino uniforme)
n <- length(randu$x)
n
y <- qunif(ppoints(n)) # he generado 400 puntos de distribucion uniforme
# ppoints me da 400 probabilidades
# hacemos un qqplot enfrentando los teoricos con la muestra
qqplot(y,randu$x)
# por ejemplo 
qqnorm(randu$x)
# vemos que no es normal. ...

# vamos a sacar una discrtibucion de chi de 3 grados de libertad


chi3 <- qchisq(ppoints(30),df =3)
n30 <- qnorm(ppoints(30))
qqplot(n30,chi3) # estan sesgados hacia la derecha
# no es una normal 

# vemos una distribucion con una larga cola como es cauchy
cauchy <- qcauchy(ppoints(30))
qqplot(n30,cauchy)
# los centrales se parecen a las normales pero las colas son pesadas 

par(mfrow=c(1,2))
x <-seq(-3,3,0.01)
plot(x,dnorm(x))
plot(x,pnorm(x))

plot(x,dchisq(x,df=3))
plot(x,pchisq(x,df=3))

plot(x,dcauchy(x))
plot(x,pcauchy(x))
