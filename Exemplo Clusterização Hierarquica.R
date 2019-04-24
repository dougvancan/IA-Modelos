
#Normaliza os dados do Dataset Iris
irissc =  scale(iris[, 1:4])
labels = iris[, 5]
#Calcula a distânca Euclidiana entre todas as amotras
d = dist(irissc)

#Realiza a clusterização Hierarquica por meio da média
output_cluster<-hclust(d,method='average')

#Plota o Dendograma gerado 
plot(output_cluster,labels=labels,ylab='distancia')

