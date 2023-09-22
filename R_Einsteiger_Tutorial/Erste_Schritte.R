# Erste Schritte in R

# Daten laden
data(mtcars)
head(mtcars)

# Mittelwert
mean(mtcars$mpg)


# Packete muessen nur einmal installiert werden
install.packages('ggplot2') 

# Packet laden
library(ggplot2)

# Scatterplot
ggplot(mtcars, aes(x=mpg, y=hp)) + geom_point()

# Hilfe
?ggplot2

