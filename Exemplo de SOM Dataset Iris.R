#install.packages("kohonen")

#Exemplo Dataset iris:
#1 - Carrega a biblioteca kohonen:
library("kohonen")

set.seed(593)

#2- Faz a escala e normaliza??o dos dados do dataset iris:
#Media da coluna - valor do atributo dividido pelo desvio padrão da coluna
iris.sc = scale(iris[, 1:4])


#3- Faz o setup da grade de vizinhan?a da rede SOM:
iris.grid = somgrid(xdim = 5, ydim=5, topo="hexagonal")
#3- Constr?i o modelo de rede com os dados do dataset iris, a grade de vizinhan?a, n?mero de itera??es de treinamento e taxa de aprendizado:
iris.som = som(iris.sc, grid=iris.grid, rlen=500, alpha=c(0.05,0.01))


plot(iris.som, type="changes")

#4 - Exibe a quantidade de amostras mapeadas por neur?nio:
plot(iris.som, type="count")

#5 - Exibe a m?dias dos atributos mapeados por neur?nio:
plot(iris.som, type="codes")



#6 - Faz o heatmap baseado em cada atributo:
#Comprimento da p?tala
coolBlueHotRed <- function(n, alpha = 1) {rainbow(n, end=4/6, alpha=alpha)[n:1]}
plot(iris.som, type = "property", property = iris.som$codes[[1]][,4], main=names(iris.som$data)[4], palette.name=coolBlueHotRed)
#Largura da p?tala
coolBlueHotRed <- function(n, alpha = 1) {rainbow(n, end=4/6, alpha=alpha)[n:1]}
plot(iris.som, type = "property", property = iris.som$codes[[1]][,3], main=names(iris.som$data)[3], palette.name=coolBlueHotRed)
#Comprimento da s?tala
coolBlueHotRed <- function(n, alpha = 1) {rainbow(n, end=4/6, alpha=alpha)[n:1]}
plot(iris.som, type = "property", property = iris.som$codes[[1]][,2], main=names(iris.som$data)[2], palette.name=coolBlueHotRed)
#Largura da s?tala
coolBlueHotRed <- function(n, alpha = 1) {rainbow(n, end=4/6, alpha=alpha)[n:1]}
plot(iris.som, type = "property", property = iris.som$codes[[1]][,1], main=names(iris.som$data)[1], palette.name=coolBlueHotRed)



#7 - Exibe a rela??o de vizinhan?a em dist?ncia, algo muito semelhan?a a matriz U:
plot(iris.som, type="dist.neighbours")


#8- Faz uma clusteriza??o hier?rquica, dos dados j? clusterizados, apenas para facilitar a exibi??o:
groups = 3
iris.hc = cutree(hclust(dist(iris.som$codes[[1]][,1:4])), groups)
#9- Adiciona a fronteira de cada cluster:
add.cluster.boundaries(iris.som, iris.hc)


plot(iris.som, type="codes", bgcol=rainbow(groups)[iris.hc])

View(iris.som$codes[[1]])

clusterneuronio <-iris.hc[iris.som$unit.classif]

clusterneuronio

iris$cluster <- clusterneuronio
