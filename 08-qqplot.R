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
# 

# tenemos qqplot
