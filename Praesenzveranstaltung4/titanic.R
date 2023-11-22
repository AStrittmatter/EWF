# Laden des Titanic-Datensatzes
library(titanic)
data("titanic_train")  # Lädt den Trainingsdatensatz

# Die Titanic, das damals größte und luxuriöseste Passagierschiff, kollidierte auf ihrer Jungfernfahrt von Southampton nach New York in der Nacht vom 14. auf den 15. April 1912 mit einem Eisberg und sank. Etwa 1.500 Menschen verloren ihr Leben aufgrund von fehlenden Sicherheitsmaßnahmen, wie unzureichender Anzahl an Rettungsbooten. Das Unglück führte zu einer Überarbeitung der Schifffahrtsgesetze und hatte weltweit einen enormen Einfluss auf die Sicherheitsstandards auf See.

# Anzeigen der ersten paar Zeilen des Datensatzes
head(titanic_train)

# Zusammenfassung der Fare-Spalte im Titanic-Datensatz
summary(titanic_train$Fare)

# Der Fahrpreis im Titanic-Datensatz wird in Pfund Sterling (£) angegeben. Damals wurde der Preis für die Tickets in Pfund Sterling angegeben, da die Titanic zu ihrer Zeit hauptsächlich zwischen Großbritannien und den USA verkehrte, und die Tickets in der Regel in der Währung des Abfahrtslandes ausgestellt wurden.

# Lineare Regression: Überleben in Bezug auf den Fahrpreis (in Pfund Sterling)
ols <- lm(Survived ~ Fare, data = titanic_train)
summary(ols)

#Der Wechselkurs zwischen dem Pfund Sterling (GBP) und dem Schweizer Franken (CHF) zum Zeitpunkt des Untergangs der Titanic im April 1912 war ungefähr 1 GBP = 25 CHF. Es ist wichtig zu beachten, dass historische Wechselkurse Schwankungen unterlagen und verschiedene Quellen leicht unterschiedliche Werte liefern könnten.

# Umrechnung von Fare in Schweizer Franken (CHF)
titanic_train$Fare_CHF = titanic_train$Fare * 25

# Lineare Regression: Überleben in Bezug auf den Fahrpreis in CHF
ols_chf <- lm(Survived ~ Fare_CHF, data = titanic_train)
summary(ols_chf)

# Zusammenfassung der Fare_CHF-Spalte
summary(titanic_train$Fare_CHF)

# Umrechnung des Fahrpreises in Tausend Schweizer Franken (CHF)
titanic_train$Fare_CHF_1000 = titanic_train$Fare_CHF / 1000

# Lineare Regression: Überleben in Bezug auf den Fahrpreis in Tausend CHF
ols_chf_1000 <- lm(Survived ~ Fare_CHF_1000, data = titanic_train)
summary(ols_chf_1000)

# Zusammenfassung der Überlebensrate (Survived)
summary(titanic_train$Survived)

# Umrechnung der Überlebensrate in Prozent
titanic_train$Survived_Percent = titanic_train$Survived * 100

# Lineare Regression: Überlebensrate in Prozent in Bezug auf den Fahrpreis in Tausend CHF
ols_perc <- lm(Survived_Percent ~ Fare_CHF_1000, data = titanic_train)
summary(ols_perc)
