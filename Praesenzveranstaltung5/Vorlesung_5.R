

# M10: Empirische Wirtschaftsforschung (HS23)
# Modul 5: Datenqualitätsprobleme

# Settings ---------

# Packages laden
library("ggplot2")

# Daten laden
winequality=read.csv("~/Praesenzveranstaltung5/winequality.csv")

# Daten inspizieren ----------
dim(winequality) # Anzahl Zeilen und Spalten
summary(winequality)
table(winequality$color)
head(winequality)

# Erstellen von einer Dummy Variable aus color
winequality$red = as.numeric(winequality$color=="red")
# Löschen der nicht mehr verwendeten color Variable
winequality=winequality[,colnames(winequality)!="color"]

head(winequality)


# Schätzen der Basis-Regression ----------

# Schätzen der Regression
lm_basic = lm(data=winequality, 
              formula="quality ~ alcohol")

summary(lm_basic)

# zufälliger Messfehler in der abhängigen Variable -----------------

# zufälliger Messfehler auf Quality
set.seed(127127)
e=rnorm(nrow(winequality),0,1)

# Neue Outcome-Variable mit Messfehler
winequality$quality_faulty=winequality$quality+e

# Schätzen der Regression
lm_faulty = lm(data=winequality, 
               formula="quality_faulty ~ alcohol")

summary(lm_faulty)

# Vergleich des alcohol Schätzwert
b_alcohol_basic=lm_basic$coefficients[names(lm_basic$coefficients)=="alcohol"]
b_alcohol_basic

b_alcohol_faulty=lm_faulty$coefficients[names(lm_faulty$coefficients)=="alcohol"]
b_alcohol_faulty

# korrelierter Messfehler in der abhängigen Variable -----------------

# zufälliger Messfehler auf Quality
set.seed(127127)
e_cor=rnorm(nrow(winequality),winequality$alcohol-mean(winequality$alcohol),1)

# Neue Outcome-Variable mit Messfehler
winequality$quality_cor=winequality$quality+e_cor

# Inspektion der Korrelation
ggplot(winequality) + geom_point(aes(x=alcohol, y=e), col="blue")+theme_classic()
ggplot(winequality) + geom_point(aes(x=alcohol, y=e_cor), col="red")+theme_classic()

# Schätzen der Regression
lm_cor = lm(data=winequality, 
               formula="quality_cor ~ alcohol")

summary(lm_cor)

# Vergleich des alcohol Schätzwert
b_alcohol_basic=lm_basic$coefficients[names(lm_basic$coefficients)=="alcohol"]
b_alcohol_basic

b_alcohol_cor=lm_cor$coefficients[names(lm_cor$coefficients)=="alcohol"]
b_alcohol_cor

# Simulation der Auswirkungen von einem zufälligen Messfehler -----------------

set.seed(127127)
b_alcohol_vector=c()

for(i in 1:100){
  # Korrelierter Messfehler
  e=rnorm(nrow(winequality),0,1)
  winequality$quality_sim=winequality$quality+e
  
  # Regression
  lm_loop = lm(data=winequality, 
              formula="quality_sim ~ alcohol")
  
  # Schätzwert
  b_alcohol_vector[i]=lm_loop$coefficients[names(lm_loop$coefficients)=="alcohol"]
}

# Alle Schätzwerte
b_alcohol_vector
ggplot()+ geom_histogram(aes(b_alcohol_vector))+ theme_classic()


# Theoretischer Mittelwert
b_1 = lm_basic$coefficients[names(lm_basic$coefficients)=="alcohol"]
cov_x_e = 0
var_x1 = var(winequality$alcohol)

b_1+cov_x_e/var_x1

# Praktischer Mittelwert
mean(b_alcohol_vector)

# Theoretische Varianz
var_u = var(lm_basic$residuals)
var_e = 1
var_x1 = var(winequality$alcohol)
             
(var_u + var_e) / (nrow(winequality) * var_x1)

# Praktische Varianz
var(b_alcohol_cor_vector)


# Messfehler in der unabhängigen Variable -------------


# Fügen sie einen zufälligen standard-normalverteilten Messfehler zu der Variable 'alcohol' hinzu.


# Vergleichen Sie den theoretischen Mittelwert und die Varianz des geschätzten Parameters mit den 
# Werten der Simulation (Analog zur vorherigen Übung ‚Messfehler in der abhängigen Variable‘)



# Instrumental Variable Schätzung --------------------------------

library("ivreg")

## data
data("CigaretteDemand", package = "ivreg")

summary(CigaretteDemand)
?CigaretteDemand

## model 
iv_model = ivreg(log(packs) ~ log(rprice) + log(rincome) | salestax + log(rincome),
           data = CigaretteDemand)
summary(iv_model)

