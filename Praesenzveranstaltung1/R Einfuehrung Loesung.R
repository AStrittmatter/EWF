# R Einführung
# Wirkung von Insektensprays

# Frage 1: Datenüberblick
# Laden Sie den InsectSprays-Datensatz.
data(InsectSprays)

# Zeigen Sie die ersten Zeilen des Datensatzes an.
head(InsectSprays)

# Beantworten der Frage:
# Welche Variablen sind im Datensatz enthalten?
# Antwort: Der Datensatz enthält zwei Hauptvariablen: "count" und "spray". Die "count"-Variable gibt die Anzahl der getöteten Insekten an, während "spray" die Art des verwendeten Insektensprays angibt. Es gibt sechs verschiedene Arten von Sprays: A, B, C, D, E und F.

# Frage 2: Deskriptive Statistik
# Zeigen Sie eine statistische Zusammenfassung des Datensatzes an.
summary(InsectSprays)

# Beantworten der Frage:
# Wie hoch ist die durchschnittliche Wirkung aller Insektensprays zusammen?
# Antwort: Die durchschnittliche Wirkung aller Insektensprays zusammen beträgt etwa 9.5.


# Frage 3: Visualisierung
# Ein Histogramm für die Anzahl der behandelten Insekten (count) erstellen.
hist(InsectSprays$count)

# Erstellen Sie ein Balkendiagramm der durchschnittlichen Wirkung jedes Insektensprays.
barplot(tapply(InsectSprays$count, InsectSprays$spray, mean), 
        main="Durchschnittliche Wirkung pro Insektenspray",
        xlab="Insektenspray", ylab="Durchschnittliche Wirkung")

# Erstellen Sie ein Boxplot der Wirkungen der Insektensprays.
boxplot(count ~ spray, data=InsectSprays, 
        main="Verteilung der Wirkungen der Insektensprays",
        xlab="Insektenspray", ylab="Wirkung")

# Beantworten der Fragen:
# Welche Art der Verteilung ist zu erkennen
# Antwort: Rechtschiefe Verteilung
# Welches Insektenspray hat die höchste durchschnittliche Wirkung?
# Antwort: Das Insektenspray "sprayF" hat die höchste durchschnittliche Wirkung.
# Welches Insektenspray hat die geringste durchschnittliche Wirkung?
# Antwort: Das Insektenspray "sprayC" hat die geringste durchschnittliche Wirkung.

# Frage 4: Konditionaler Mittelwert
# Berechnen Sie den Durchschnitt (Mittelwert) der Wirkung des Sprays "sprayB".
mean_sprayB <- mean(InsectSprays$count[InsectSprays$spray == "B"])
mean_sprayB

# Beantworten der Frage:
# Welchen Wert ergibt die Berechnung?
# Antwort: Der Durchschnitt der Wirkung des Sprays "sprayB" beträgt etwa 15.3.

# Frage 5: Variabilität
# Berechnen Sie die Standardabweichung der Wirkung des Sprays "sprayD".
sd_sprayD <- sd(InsectSprays$count[InsectSprays$spray == "D"])
sd_sprayD

# Beantworten der Frage:
# Wie viel Variation gibt es in den Wirkungen dieses Sprays?
# Antwort: Die Standardabweichung der Wirkung des Sprays "sprayD" beträgt etwa 2.5.

# Frage 6: Korrelation
# Berechnen Sie die Korrelation zwischen den Wirkungen der Sprays "sprayE" und "sprayF".
cor_sprayE_F <- cor(InsectSprays$count[InsectSprays$spray == "E"], InsectSprays$count[InsectSprays$spray == "F"])
cor_sprayE_F

# Beantworten der Frage:
# Gibt es eine positive oder negative Korrelation zwischen den Wirkungen?
# Antwort: Die Korrelation zwischen den Wirkungen der Sprays "sprayE" und "sprayF" ist positiv.


