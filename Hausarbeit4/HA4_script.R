
# Skript für die Hausarbeit 4

# Aufgabe 1: Laden sie den Datensatz winequality.csv und verschaffen Sie sich einen Überblick. 
# Kommentieren Sie insbesonders fehlende Werte und Variablentypen (numerisch, kategorisch, ...).
# Wieviele Rot-, bzw. Weissweine gibt es im Datensatz.

# Working directory setzen
setwd("...")

# Laden der Daten
winequality=read.csv("winequality.csv")

# Inspizieren der Daten
...

# Aufgabe 2: Regressieren sie quality auf das ganze Set an unabhängigen Variablen 
# (ohne Interaktionsterme und Transformationen). Beurteilen Sie die Signifikanz 
# der Variablen im Modell.

# Erstellen von einer Dummy Variable aus color
winequality$red = ifelse(winequality$color=="red", 1, 0)

# Löschen der nicht mehr verwendeten color Variable
winequality=winequality[,colnames(winequality)!="color"]

# Schätzen der Regression
lm_restr = lm(...)

summary(lm_restr)

# Aufgabe 3: Wir möchten nun überprüfen, ob es ein unterschiedliches Modell für Rotweine und
# Weissweine gibt. Schätzen Sie ein uneingeschränktes Modell, indem sie die Dummy
# Variablen mit den restlichen unabhängigen Variablen interagieren. Beurteilen Sie die 
# Signifikanz der Interaktionsterme im erweiterten Modell.

lm_unrestr = lm(...)

# Aufgabe 4: Führen Sie einen Heterogenitätstest durch um zu entscheiden, ob Rotweine und Weissweine
# einem unterschiedlichen Modell folgen. Wie lautet Ihre Schlussfolgerung?

# Sum of Squared Residuals
ssr_unrestr=...
ssr_restr=...

# Differenz der Freiheitsgrade
df_diff <- lm_restr$df.residual - lm_unrestr$df.residual
df_diff

# Test Statistik
test_stat= (ssr_restr-ssr_unrestr)/ssr_unrestr * 6485/df_diff
test_stat
  
# Kritischer Wert
F_crit=qf(p= 1 - .01, df1=df_diff, df2=6485)
F_crit
