

# M10: Empirische Wirtschaftsforschung (HS23)
# Modul 3: Multivariate Regression

# Settings ---------

# Packages laden
install.packages("install.load")
library(install.load)
install_load("mlbench", "ggplot2")

# Daten laden
data(BostonHousing)

# Daten inspizieren
dim(BostonHousing) # Anzahl Zeilen und Spalten
summary(BostonHousing)
head(BostonHousing)

# Die chas Variable von Factor zu numeric konvertieren
BostonHousing$chas=as.numeric(BostonHousing$chas)-1
summary(BostonHousing)


# Partielle Regression ----------

# Wir schätzen denn Effekt von der Lage am Charles River (chas) auf den Häuserpreis (medv)
# mittels partieller Regression

# Schritt 1 - Regression von chas auf alle anderen Variablen exkl. medv
part_reg_formula=as.formula("chas ~ crim + zn + indus + nox + rm + age + dis + rad + tax + ptratio + b + lstat")
part_reg = lm(formula = part_reg_formula, data=BostonHousing)

# Summary der Regression anschauen
summary(part_reg)

# Schritt 2 - Residuen berechnen

part_reg_res=part_reg$residuals

# Residuals inspizieren
mean(part_reg_res)
ggplot() + geom_histogram()

# Schritt 3 - Berechnung von beta_1

# beta_1 = summe(res * medv) / summe (res * res)

res_medv = sum(part_reg_res * BostonHousing$medv)
res_res = sum(part_reg_res * part_reg_res)
beta_1 = res_medv/res_res

# Berechneter Koeffizient beta_1
beta_1


# Interpretation der Koeffizienten ----------

# Schätzen der multivariaten Regression
full_model = lm(formula = "medv ~ .", data = BostonHousing)

# Anzeigen der Resultate
summary(full_model)
ggplot(BostonHousing) + geom_boxplot(aes(group=chas, y=medv, col=as.factor(chas)))


# Übungsaufgabe ----------

# Breakout-Room 1: Sie sind interessiert am Effekt der Kriminalitätsrate (crim) 
# auf die Wohnpreise (medv)

# Breakout-Room 2: Sie sind interessiert am Effekt der Stickstoffoxid Konzentration  
# (nox) auf die Wohnpreise (medv)


# Schätzen Sie die Koeffizienten mittels partieller Regression, sowie 
# multivariater Regression. Verwenden Sie dazu das Modell welches sie zuvor 
# bestimmt haben. Sind die Resultate identisch?

# Vergleichen Sie die Resultate mit den Resultaten des maximalen Modells.


# Hypothesen-Tests

# Wir berechen den p-Wert der Variable chas

# Standardabweichung von beta_1
var_hat = sum((full_model$residuals)^2) / (nrow(BostonHousing) - 13 - 1)
SST = sum((BostonHousing$chas - mean(BostonHousing$chas))^2)
part_reg_rsq=summary(part_reg)$r.squared
beta_1_sd = sqrt(var_hat/(SST*(1-part_reg_rsq)))

# Test-Statistik
t = beta_1 / beta_1_sd

# p-Wert
p_wert = 2 * (1 - pt(abs(t), (nrow(BostonHousing) - 13 - 1)))
p_wert

# Vergleich mit direkter Funktion
summary(full_model)

