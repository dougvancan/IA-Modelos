#1 Carregar o dataset Titanic
load("C:/caminhodoarquivo/titanic.raw.rdata")

#2 Instalar Pacote 
#install.packages("arules")
#3-	Carregar a biblioteca arules:
library("arules")

#4-	Encontrar as regras de associação com os parâmetros Defaults
regras <- apriori(titanic.raw)
inspect(regras)

regrasOrdenadas <- sort(regras, by="confidence")
inspect(regrasOrdenadas)

#5-	Encontrar as regras de associação com a consequência da regra envolvendo o atributo sobrevivente (Survived), lista mínima de 2 itens, suporte mínimo de 0,005 e confiança de 0.8:
regras <- apriori(titanic.raw,parameter = list(minlen=2, supp=0.005, conf=0.8),appearance = list(rhs=c("Survived=No", "Survived=Yes")))

#6-	Ordenar as regras por confiança:
regrasOrdenadas <- sort(regras, by="confidence")
inspect(regrasOrdenadas)

#7 Encontra as regras redundantes
inspect(regrasOrdenadas[is.redundant(regrasOrdenadas)])

#8 Exclui as Regras redundantes
regraslimpas <- regrasOrdenadas[!is.redundant(regrasOrdenadas)]
inspect(regraslimpas)

#9 Exemplo usando todos os parâmetros encontrar todos os sobreviventes utilizando a Classe e idade do passageiro
regras <- apriori(titanic.raw, control = list(verbose=F),
                  parameter = list(minlen=3, supp=0.002, conf=0.2),
                  appearance = list(rhs=c("Survived=Yes"),
                                    lhs=c("Class=1st", "Class=2nd", "Class=3rd",
                                          "Age=Child", "Age=Adult")))

regrasOrdenadas <- sort(regras, by="confidence")
inspect(regrasOrdenadas)

regras <- apriori(titanic.raw, control = list(verbose=F),
                  parameter = list(minlen=2, supp=0.002, conf=0.2),
                  appearance = list(rhs=c("Survived=Yes"),
                                    lhs=c("Class=Crew", "Age=Adult")))

regrasOrdenadas <- sort(regras, by="confidence")
inspect(regrasOrdenadas)

