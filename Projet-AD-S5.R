
#*************  OBJECTIF PRINCIPALE DU PROJET  *****************

#*** L’objectif principal du projet est de comprendre les facteurs associés***
#*** à la présence de la maladie cardiaque en explorant les données, en sélectionnant***
#***les variables pertinentes, en construisant un modèle prédictif, et en évaluant sa performance**

# ------La premiere étape a réaliser--------

#***** $ EXPLORATION DES DONNEES $ *******
#*************** 1.Chargement des Donnees ************

#1:Importer le jeu de donéees Cleveland Heart Disease.

rm(list = ls())
setwd("D:/3eme_annee_esisa/ANALYSE_DONNEE-TP/Projet-AD")
heart_data <- read.csv("heart_cleveland_upload.csv",header = TRUE,dec = ',')
View(heart_data)

#2:Examiner la structure des données et afficher les premières lignes

str(heart_data)
head(heart_data)

#*************** 2.Statistiques Descriptives ************

#1:le calcule des statistiques descriptives pour comprendre la distribution des variables

summary(heart_data)

#-----Identifier les valeurs manquantes dans le jeu de données
#--- compter le nombre de valeurs manquantes dans chaque colonne

help("colSums")
valeurs_manquantes<-colSums(is.na(heart_data)) # il n y ait pas de valeurs manquantes dans notre jeu de données 
print(valeurs_manquantes)
# is.na(heart_data) renvoie une matrice de VM.

#2:Prendre des mesures appropriées pour les valeurs manquantes
#---is.na(heart_data$age):identifie les lignes où la variable "age" est manquante, 
#--- calcule la moyenne de "age" en excluant les valeurs manquantes (na.rm = TRUE).

heart_data$age[is.na(heart_data$age)] <- mean(heart_data$age, na.rm = TRUE)

# Ou supprimer les lignes avec des valeurs manquantes

heart_data <- na.omit(heart_data)

#******* $ ANALYSE UNIVARIABLE $ *******
#***************  1.Analyse de la maladie cardique  ***********

#1:Visualiser la distribution de la variable de reponse (Presence de maladie cardiaque)=> "Condition"

library(ggplot2) # chargement d'un graphique à barres qui représente la répartition des cas de maladie cardiaque en fonction de la variable "condition".
help("aes")
#(aesthetic mapping) pour définir que l'axe x du graphique sera représenté par la variable "condition"

ggplot(heart_data, aes(x = factor(condition))) + 
  geom_bar(fill = "skyblue", color = "black") +
  labs(title = "Répartition des cas de maladie cardiaque",
       x = "Maladie cardiaque", y = "Nombre de cas")
         
#2:Calculer le pourcentage de cas de maladie cardiaque dans l’echantillon.

condition_valeurs<-heart_data$condition
pourcentage_condition <- mean(condition_valeurs)*100
help("cat")
cat("le pourcentage de cas de maladie cardiaque dans notre echantillon est :" , pourcentage_condition , "%")

#***************  2.Analyse des Variables Explicatives***********
#Explorer les distributions des variables explicatives
#en fonction de la presence de maladie cardiaque.

modele_complet<-glm(condition ~ .,data=heart_data,family = "binomial")
resume <- summary(modele_complet)
print(resume)

#******* $ Tests Statistiques $ ******
##***************  1.TRV(ANOVA)  ***********

# tester l'effet de test juste de variable catégorielle (oldpeak) sur la maladie cardiaque
#***1er méthode**
#*
modele<-glm(condition ~ .-age -sex - cp -trestbps - chol - fbs -restecg -thalach -exang -slope -ca -thal,data=heart_data,family = "binomial")
resumee<-summary(modele)
resumee

#***2eme méthode***
#Création du modèle incluant toutes les variables explicatives, y compris les variables catégorielles
modele_globale<- glm(condition ~ ., data = heart_data, family = "binomial")

# Test de l'effet global des variables catégorielles en utilisant l'ANOVA
anova_modele <- anova(modele_globale, test = "Chisq")
print(anova_modele)

##***************  2.Test de Wald ************
##*H0 : on suppose que Bi = 0 (parametre non significative)
##*H1 : on suppose que Bi != 0 (parametre significative)
##*modele_complet$coefficient
coef_age=modele_complet$coefficients['age']
coef_age
matco=resume$cov.scaled
matco
variance_age=matco[2,2]
wald_age=(coef_age^2)/variance_age
wald_age
qchisq(0.95,1)

coef_sex=modele_complet$coefficients['sex']
matco=resume$cov.scaled
variance_sex=matco[3,3]
wald_sex=(coef_sex^2)/variance_sex
wald_sex
qchisq(0.95,1)

coef_cp=modele_complet$coefficients['cp']
matco=resume$cov.scaled
variance_cp=matco[4,4]
wald_cp=(coef_cp^2)/variance_cp
wald_cp
qchisq(0.95,1)

coef_fbs=modele_complet$coefficients['fbs']
matco=resume$cov.scaled
variance_fbs=matco[7,7]
wald_fbs=(coef_fbs^2)/variance_fbs
wald_fbs
qchisq(0.95,1)

wald= function(resume,n){
  matco= resume$cov.scaled
  COEF=modele_complet$coefficients
  for (i in seq(2,n,1)) {
    xcoef=COEF[i]
    xvar=matco[i,i]
    wald_x=(xcoef^2)/xvar
    print(wald_x)
  }
}
wald(resume,14)
qchisq(0.95,1)

##***************  3.Test de Khi deux ************
# 1:Utiliser le test du Khi-deux pour évaluer la significativité globale du modele de régression logistique.

modele_complet<-glm(condition ~ .,data=heart_data,family = "binomial")
resume <- summary(modele_complet)
print(resume)
# pour mieux s'assurer il faut utiliser le TRV tester la significativité globale du modèle 
attributes(resume)
modele_complet$null.deviance
modele_complet$deviance
khi=modele_complet$null.deviance-modele_complet$deviance# khi mean D equivalent on F ANOVA
khi
qchisq(0.95,14)
#puisque khi>qchisque ce qui indique que les variables explicatives
#incluses dans le modèle contribuent de manière significative 
#à la prédiction de la présence de maladie cardiaque.

##***************  4.Test F partiel  ************
# Création du modèle de régression logistique avec interaction
modele <- glm(condition ~ sex * cp * trestbps * thalach * oldpeak, data = heart_data, family = "binomial")

# Réalisation du test F partiel pour l'interaction
summary(modele)

# Extrait de la table d'analyse
inter_table <- anova(modele, test = "F")

# Affichage des résultats
print(inter_table)
#************* $ Selection des Variables Utilisant la Methode Descendante $ ***********
library(MASS)

# Création d'un modèle complet avec toutes les variables
modele_complet <- glm(condition ~ ., data = heart_data, family = "binomial")

# Application de la méthode stepAIC pour la sélection de variables
modele_selection <- stepAIC(modele_complet, direction = "backward")

# Résumé du modèle sélectionné
summary(modele_selection)

#*************Modélisation********

modele_final <- glm(condition ~ ., data = heart_data, family = "binomial")

# Prédictions du modèle
predictions <- predict(modele_final, newdata = heart_data, type = "response")

# Permet de visualiser les performances d'un modèle de classification
table(heart_data$condition, predictions > 0.5)

# Courbe ROC
# Une AUC plus proche de 1 indique une meilleure performance du modèle.
library(pROC)
roc_curve <- roc(heart_data$condition, predictions)
plot(roc_curve, main = "Courbe ROC")
auc(roc_curve)

# Test de Hosmer-Lemeshow
library(ResourceSelection)
hoslem.test(heart_data$condition, predictions)
