

# Skript für die Huasarbeit 2

# Einlesen der Daten
highjump=data.frame(performance=c(234,234,234,234,234,239,237,235,235,232,232,236,234,234,236,234,234),
                    bodyheight=c(195,200,192,199,184,184,192,185,190,195,189,181,201,196,198,187,198))

# Inspizieren der Daten
View(highjump)
summary(highjump)

# Frage 1
#  Diskutieren Sie ob die vier Annahmen zur univariaten Regression in diesem Anwendungsbeispiel 
#  erfüllt sind.


# Frage 2
#  Schätzen Sie die Parameter (\beta_0,\beta_1) des Modells anhand der Methode der kleinsten 
#  Quadrate. Berechnen Sie dazu einzeln die Mittelwert, Varianz und Covarianz der beiden 
#  Variablen und setzen Sie diese in die entsprechenden Formeln für die Parameter ein.

highjump_mean= ?
Highjump_var = ?
bodyweight_mean = ?
bodyweight_var = ?
covariance = ?

beta_0 = ?
  
beta_1 = ?
  
  
# Frage 3
#  Wie interpretieren Sie die geschätzten Parameter. Ist das Resultat wie erwartet?
  
  
# Frage 4
#  Schätzen Sie die univariate Regression mittels der bereits implementierten funktion \textit{lm()}'. 
#  Nutzen Sie dafür die R-Hilfe zu der korrekten Verwendung der Funktion. Sind die Resultate identisch?
  
regression_results = lm(?)

summary(regression_results)

