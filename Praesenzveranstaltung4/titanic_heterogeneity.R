# Laden des Titanic-Datensatzes
library(titanic)
data("titanic_train")  # Lädt den Trainingsdatensatz

# Anzeigen der ersten paar Zeilen des Datensatzes
head(titanic_train)

# Untersuchung der Häufigkeit der Einschiffungsorte
table(titanic_train$Embarked)

# Erstellung von Dummy-Variablen für Einschiffungsorte (C = Cherbourg, Q = Queenstown, S = Southampton)
titanic_train$FR <- ifelse(titanic_train$Embarked == 'C', 1, 0)
titanic_train$IR <- ifelse(titanic_train$Embarked == 'Q', 1, 0)
table(titanic_train$FR)
table(titanic_train$IR)

# Untersuchung der Geschlechterverteilung
table(titanic_train$Sex)

# Erstellung einer Dummy-Variable für das Geschlecht (1 für Frau, 0 für Mann)
titanic_train$Woman <- ifelse(titanic_train$Sex == 'female', 1, 0)
table(titanic_train$Woman)

# Lineare Regression: Überleben in Bezug auf den Fahrpreis (in Pfund Sterling) mit beschränktem Modell
ols_restr <- lm(Survived ~ Fare + FR + IR, data = titanic_train)
summary(ols_restr)

# Generierung von Interaktionsvariablen
titanic_train$Wo_Fare <- titanic_train$Woman * titanic_train$Fare
titanic_train$Wo_FR <- titanic_train$Woman * titanic_train$FR
titanic_train$Wo_IR <- titanic_train$Woman * titanic_train$IR

# Lineare Regression: Überleben in Bezug auf den Fahrpreis (in Pfund Sterling) mit unbeschränktem Modell
ols_unrestr <- lm(Survived ~ Fare + FR + IR + Woman + Wo_Fare + Wo_FR + Wo_IR, data = titanic_train)
summary(ols_unrestr)

# Berechnung der Summe der quadratischen Residuen für beschränktes und unbeschränktes Modell
ssr_restr <- sum((fitted(ols_restr) - titanic_train$Survived)^2)
ssr_unrestr <- sum((fitted(ols_unrestr) - titanic_train$Survived)^2)

# Anzahl an Beobachtungen im Datensatz
n_obs <- nrow(titanic_train)
n_obs

# Freiheitsgrade für beschränktes Modell
df_restr <- ols_restr$df.residual
df_restr

# Freiheitsgrade für unbeschränktes Modell
df_unrestr <- ols_unrestr$df.residual
df_unrestr

# Differenz der Freiheitsgrade
df_diff <- df_restr - df_unrestr
df_diff

# Berechnung der Teststatistik
test_stat <- (ssr_restr - ssr_unrestr) / ssr_unrestr * (df_unrestr) / df_diff
test_stat

# Berechnung des kritischen Werts
F_crit <- qf(p = 1 - 0.01, df1 = df_diff, df2 = df_unrestr)
F_crit
