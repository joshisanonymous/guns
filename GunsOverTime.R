gunstohomicidesbyyear <- data.frame("Year" = c("1980", "1982", "1984", "1985", "1987", "1988", "1989", "1990", "1991", "1993", "1994", "1996", "1998", "2000", "2002", "2004", "2006", "2008", "2010", "2012", "2014"),
                                    "Guns" = c(28.1, 28.2, 25.3, 30.5, 28, 24.9, 27.1, 29.5, 27, 29.3, 28.2, 27.1, 22.4, 22.3, 26.3, 25.2, 21.6, 23.5, 20.6, 21.8, 22.4),
                                    "Homicides" = c(10.2, 9.1, 7.9, 7.9, 8.3, 8.4, 8.7, 9.4, 9.8, 9.5, 9, 7.4, 6.3, 5.5, 5.6, 5.5, 6.1, 5.4, 4.8, 4.7, 4.5))

plot(gunstohomicidesbyyear$Guns, gunstohomicidesbyyear$Homicides)

cor(gunstohomicidesbyyear$Guns, gunstohomicidesbyyear$Homicides, method = "pearson")

hist(gunstohomicidesbyyear$Guns)
mean(gunstohomicidesbyyear$Guns)
sd(gunstohomicidesbyyear$Guns)
quantile(gunstohomicidesbyyear$Guns)
1.5 * IQR(gunstohomicidesbyyear$Guns)

# No outliers by guns.

hist(gunstohomicidesbyyear$Homicides)
mean(gunstohomicidesbyyear$Homicides)
sd(gunstohomicidesbyyear$Homicides)
quantile(gunstohomicidesbyyear$Homicides)
1.5 * IQR(gunstohomicidesbyyear$Homicides)

# No outliers by homicides, so...

cor(gunstohomicidesbyyear$Guns, gunstohomicidesbyyear$Homicides, method = "pearson")

png("GunsByYear.png", width = 500, height = 250)
par(mar = c(5, 6, 4, 2))
plot(gunstohomicidesbyyear$Guns, gunstohomicidesbyyear$Homicides, ylab = "Intentional Homicides per 100k\nInhabitants as per the FBI", xlab = "% of Gun Owning Inhabitants as per the General Social Survey\nfrom the NORC at the University of Chicago", main = "Gun Ownership to Homicide Rate in the US\nfor Most Years Between 1980-2014")
text(23, 9.5, "Correlation Coefficient = 0.815")
dev.off()
