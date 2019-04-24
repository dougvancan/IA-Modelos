#install.packages("FactoMineR")
#install.packages("factoextra")

library("FactoMineR")
library("factoextra")

#1- Carrega o dataset íris:
newiris <- iris
newiris$Species <- NULL


#2- Executa o algoritmo k-means:
(kc <- kmeans(newiris, 3, nstart = 25))

#3- Exibe a quantidade de amostras por clusters x classes:
table(iris$Species, kc$cluster)

#4- Projeta os dados baseado no comprimento e largura das sépalas:
plot(newiris[c("Sepal.Length", "Sepal.Width")], col=kc$cluster)

#5- Projeta os protótipos utilizando os dados de comprimento e largura das sépalas:
points(kc$centers[,c("Sepal.Length", "Sepal.Width")], col=1:3, pch=8, cex=2)

#6- Projeta os dados baseado no comprimento e largura das pétalas:
plot(newiris[c("Petal.Length", "Petal.Width")], col=kc$cluster)

#7- Projeta os protótipos utilizando os dados de comprimento e largura das sépalas:
points(kc$centers[,c("Petal.Length", "Petal.Width")], col=1:3, pch=8, cex=2)


#8- Faz a projeção dos dados utilizando as duas primeira dimensões do PCA
fviz_cluster(kc, data = newiris)


