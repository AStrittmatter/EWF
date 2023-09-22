
# Teil 1: Datenüberblick
# Zeigen Sie die ersten Zeilen des Datensatzes mtcars an.
head(mtcars)

# Beantworten der Fragen:
# 1. Welche Variablen sind im Datensatz enthalten?
# Antwort: mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb
# 2. Wie viele Beobachtungen (Autos) sind im Datensatz?
# Antwort: 32 Beobachtungen

# Teil 2: Statistische Zusammenfassung
# Zeigen Sie eine statistische Zusammenfassung des Datensatzes mtcars an.
summary(mtcars)

# Beantworten der Fragen:
# 3. Wie hoch ist der Durchschnittswert (Mittelwert) der Kraftstoffeffizienz (mpg) der Autos im Datensatz?
# Antwort: Der Durchschnittswert von mpg beträgt etwa 20.09.
# 4. Welches Auto hat die höchste PS-Zahl (hp)?
# Antwort: Das Auto mit der höchsten PS-Zahl ist der "Maserati Bora" mit 335 PS.
# 5. Welches Auto hat den niedrigsten Kraftstoffverbrauch (mpg)?
# Antwort: Das Auto mit dem niedrigsten Kraftstoffverbrauch ist der "Toyota Corolla" mit etwa 10.4 mpg.


# Teil 5: Korrelation
# Berechnen Sie die Korrelation zwischen der Anzahl der Zylinder (cyl) und dem Gewicht (wt) der Autos im Datensatz.
cor_cyl_wt <- cor(mtcars$cyl, mtcars$wt)

# Beantworten der Fragen:
# 9. Wie lautet der Korrelationskoeffizient?
# Antwort: Der Korrelationskoeffizient zwischen cyl und wt beträgt etwa -0.852.
# 10. Gibt es eine positive oder negative Korrelation zwischen der Anzahl der Zylinder und dem Gewicht?
# Antwort: Es gibt eine starke negative Korrelation zwischen der Anzahl der Zylinder und dem Gewicht.

# Anmerkung: Die Antworten können je nach den Dezimalstellen variieren, die in R angezeigt werden.