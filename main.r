require(PCAmixdata)
# Chargement des données
donnees <- readRDS("activation.RData")
res<-PCAmix(donnees[,-1:-2])
round(res$eig,digit=2)
barplot(res$eig[,1],main="Eigenvalues",names.arg=1:nrow(res$eig))
abline(h=1,col=2,lwd=2)
?plot.PCAmix # permet d’afficher la fenetre d’aide de la commande "plot.PCA"
plot(res,axes=c(1,2),choice="ind") # on retrouve ici le graphique des individus (plan 1-2)
plot(res,axes=c(1,2),choice="cor") # on retrouve ici le cercle des corr\’elations
# des variables (plan 1-2)
plot(res,axes=c(1,2),choice="sqload") # on retrouve ici le graphique des "square loadings" (plan 1-2)
# Test de Shapiro-Wilk pour la variable Prod_G_Frontal_Inf_Tri_1_L
shapiro_test <- shapiro.test(donnees$PROD_G_Frontal_Inf_Tri_1_L)

# Affichage des résultats du test
print(shapiro_test)
