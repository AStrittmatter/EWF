#############################################################################
# Empirische Wirtschaftsforschung 
#############################################################################

# Packages installieren
# install.packages("ggplot2")

# Packages laden
library(ggplot2)

# Daten laden 
load("classize.RData")

# Verschaffen Sie sich mit Hilfe der summary und des RStudio Viewer (View()) einen 
# ersten Eindruck. 

summary(data)

View(data)

# Überprüfen Sie, wie viele Observationen der Datensatz enthält.
nrow(data)

###########################
# Deskriptive Statistiken #
###########################

# Mittelwerte
mean(data$tscorek)
mean(data$classize)

# Varianzen
var(data$tscorek)
var(data$classize)

# Kovarianz
cov(data$tscorek,data$classize)

######################
# Regressionsanalyse #
######################

#Steigungsparameter
beta_1 = cov(data$tscorek,data$classize)/var(data$classize)
print(beta_1)

#Achsenabschnittsparameter
beta_0 = mean(data$tscorek) - beta_1*mean(data$classize)
print(beta_0)


# Sie wollen nun den Effekt der Klassengrösse auf die Testergebnisse schätzen
ols <- lm(tscorek ~ classize, data) 
summary(ols)


# Plot Fitted Values
plot(tscorek ~ classize, data)
abline(coef(ols), col = "red")

#############
# R-Quadrat #
#############

var(ols$residuals)
var(data$tscorek)

R_quadrat = 1-var(ols$residuals)/var(data$tscorek)
print(R_quadrat)

###################
# Gefittete Werte #
###################

y_hat = beta_0 + beta_1*10
print(y_hat)

new_data <- data[1,]
new_data$classize <- 10
predict(ols, newdata = new_data)

############################
# Goesse der Koeffizienten #
############################

ols$coefficients
ols$coefficients["classize"]

sd(data$tscorek)

ols$coefficients["classize"]/sd(data$tscorek)

# Wechsel von kleinsert (10) zur grössten (29) Klasse

(29-10)*ols$coefficients["classize"]/sd(data$tscorek)


# Sie wollen nun den Effekt einem kostenlosen Mittagessen auf die Testergebnisse schätzen

ols <- lm(tscorek ~ freelunk, data) 
summary(ols)


# Sie wollen nun den Effekt der der Erfahrung der Lehrer auf die Testergebnisse schätzen

ols <- lm(tscorek ~ totexpk, data) 
summary(ols)

