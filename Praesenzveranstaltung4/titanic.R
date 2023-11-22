# Laden des Titanic-Datensatzes
library(titanic)
data("titanic_train")  # Lädt den Trainingsdatensatz

# Anzeigen der ersten paar Zeilen des Datensatzes
head(titanic_train)

# Zusammenfassung der Fare-Spalte im Titanic-Datensatz
summary(titanic_train$Fare)

# Lineare Regression: Überleben in Bezug auf den Fahrpreis (in Pfund Sterling)
ols <- lm(Survived ~ Fare, data = titanic_train)
summary(ols)

#####################################
## Skalierung unabhängige Variable ##
#####################################

# Umrechnung von Fare in Schweizer Franken (CHF)
titanic_train$Fare_CHF = titanic_train$Fare * 25

# Zusammenfassung der Fare_CHF-Spalte
summary(titanic_train$Fare_CHF)

# Lineare Regression: Überleben in Bezug auf den Fahrpreis in CHF
ols_chf <- lm(Survived ~ Fare_CHF, data = titanic_train)
summary(ols_chf)

###################################
## Skalierung abhängige Variable ##
###################################

# Zusammenfassung der Überlebensrate (Survived)
summary(titanic_train$Survived)

# Umrechnung der Überlebensrate in Prozent
titanic_train$Survived_Percent = titanic_train$Survived * 100

# Lineare Regression: Überlebensrate in Prozent in Bezug auf den Fahrpreis in Tausend CHF
ols_perc <- lm(Survived_Percent ~ Fare_CHF, data = titanic_train)
summary(ols_perc)
