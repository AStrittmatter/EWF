#Wirkung von Insektensprays

# Teil 1: Datenüberblick
# Laden Sie den InsectSprays-Datensatz.
data(InsectSprays)

# Zeigen Sie die ersten Zeilen des Datensatzes an.
head(InsectSprays)

# Beantworten der Frage:
# 1. Welche Variablen sind im Datensatz enthalten?
# Antwort: spray, count

# Teil 2: Statistische Zusammenfassung
# Zeigen Sie eine statistische Zusammenfassung des Datensatzes an.
summary(InsectSprays)
# 4. Wie hoch ist die durchschnittliche Wirkung aller Insektensprays zusammen?
# Antwort: Die durchschnittliche Wirkung aller Insektensprays zusammen beträgt etwa 9.5.


# Teil 3: Visualisierung
# Erstellen Sie ein Histogramm der Kraftstoffeffizienz (mpg).
hist(InsectSprays$count)


# Teil 3: Visualisierung
# Erstellen Sie ein Balkendiagramm der durchschnittlichen Wirkung jedes Insektensprays.
barplot(tapply(InsectSprays$count, InsectSprays$spray, mean), 
        main="Durchschnittliche Wirkung pro Insektenspray",
        xlab="Insektenspray", ylab="Durchschnittliche Wirkung")
# Beantworten der Fragen:
# 2. Welches Insektenspray hat die höchste durchschnittliche Wirkung?
# Antwort: Das Insektenspray "sprayD" hat die höchste durchschnittliche Wirkung (18.25).
# 3. Welches Insektenspray hat die geringste durchschnittliche Wirkung?
# Antwort: Das Insektenspray "sprayF" hat die geringste durchschnittliche Wirkung (2.083).


# Erstellen Sie ein Boxplot der Wirkungen der Insektensprays.
boxplot(count ~ spray, data=InsectSprays, 
        main="Verteilung der Wirkungen der Insektensprays",
        xlab="Insektenspray", ylab="Wirkung")

# Beantworten der Frage:
# 3. Welches Insektenspray scheint am effektivsten zu sein?
# Antwort: Das Insektenspray "sprayD" scheint am effektivsten zu sein.


# Teil 5: Berechnungen
# Berechnen Sie den Durchschnitt (Mittelwert) der Wirkung des Sprays "sprayB".
mean_sprayB <- mean(InsectSprays$count[InsectSprays$spray == "B"])
mean_sprayB

# Beantworten der Frage:
# 5. Welchen Wert ergibt die Berechnung?
# Antwort: Der Durchschnitt der Wirkung des Sprays "sprayB" beträgt etwa 15.333.

# Teil 6: Variabilität
# Berechnen Sie die Standardabweichung der Wirkung des Sprays "sprayD".
sd_sprayD <- sd(InsectSprays$count[InsectSprays$spray == "D"])
sd_sprayD

# Beantworten der Frage:
# 6. Wie viel Variation gibt es in den Wirkungen dieses Sprays?
# Antwort: Die Standardabweichung der Wirkung des Sprays "sprayD" beträgt etwa 4.465.

# Teil 7: Korrelation
# Berechnen Sie die Korrelation zwischen den Wirkungen der Sprays "sprayE" und "sprayF".
cor_sprayE_F <- cor(InsectSprays$count[InsectSprays$spray == "E"], InsectSprays$count[InsectSprays$spray == "F"])
cor_sprayE_F

# Beantworten der Frage:
# 7. Gibt es eine positive oder negative Korrelation zwischen den Wirkungen?
# Antwort: Die Korrelation zwischen den Wirkungen der Sprays "sprayE" und "sprayF" ist negativ.

# Anmerkung: Die Antworten können je nach den Dezimalstellen variieren, die in R angezeigt werden.
