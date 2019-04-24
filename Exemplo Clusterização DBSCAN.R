#Instala o pacore fpc necessária para a utilização do DBSCAN
install.packages("fpc", dependencies = TRUE)

#Carrega as bibliotecas fpc e factoextra
library(fpc)
library(factoextra)

#Atribui a matrix dados apenas os dados dos atributos do dataset Iris, removendo a coluna que contém as espécies
dados <- as.matrix(iris[, 1:4])

set.seed(123)

#Executa o dbscan com um raio de vizinhança igual a 0.4 e MinPts igual a 4
res <- dbscan(dados, eps = 0.4, MinPts = 4)

#Utiliza a função fviz_cluster (que faz um PCA internamente) para a visualização dos dados.
fviz_cluster(res, dados, geom = "point")

#Exibe o cluster definido para cada amostra de acordo com seu indice. A amostras cujo o cluster é igual a 0,
#são considerados outliers
print(res["cluster"])