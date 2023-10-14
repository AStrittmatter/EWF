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

summary(???)

View(???)

# Überprüfen Sie, wie viele Observationen der Datensatz enthält.
nrow(???)

###########################
# Deskriptive Statistiken #
###########################

# Mittelwerte
???(data$tscorek)
???(data$classize)

# Varianzen
???(data$tscorek)
???(data$classize)

# Kovarianz
???(data$tscorek,data$classize)

######################
# Regressionsanalyse #
######################

#Steigungsparameter
beta_1 = cov(???)/var(???)
print(beta_1)

#Achsenabschnittsparameter
beta_0 = mean(???) - beta_1*mean(???)
print(beta_0)


# Sie wollen nun den Effekt der Klassengrösse auf die Testergebnisse schätzen
ols <- lm(??? ~ ???, data) 
summary(ols)


# Plot Fitted Values
plot(tscorek ~ classize, data)
abline(coef(ols), col = "red")

#############
# R-Quadrat #
#############

ols$residuals

var(ols$residuals)
var(data$tscorek)

R_quadrat = 1-var(???)/var(data$tscorek)
print(R_quadrat)

###################
# Gefittete Werte #
###################

y_hat = ???
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




