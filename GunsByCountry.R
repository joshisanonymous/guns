gunstohomicides <- data.frame("Country" = c("Norway", "Australia", "Switzerland", "Germany", "Denmark", "Singapore", "Netherlands", "Ireland", "Iceland", "Canada", "United States", "New Zealand", "Sweden", "United Kingdom", "Japan", "South Korea", "Israel", "Luxembourg", "France", "Belgium", "Finland", "Austria", "Slovenia", "Italy", "Spain", "Czech Republic", "Greece", "Estonia", "Cyprus", "Qatar", "Poland", "Chile", "Slovakia", "Portugal", "Hungary", "Latvia", "Argentina", "Croatia", "Montenegro", "Romania", "Kuwait"), 
                              "Guns" = c(31.3, 21.7, 24.45, 30.3, 12, 0.5, 3.9, 3.89, 30.3, 30.8, 101.05, 30, 31.6, 6.6, 0.6, 1.1, 7.3, 15.3, 31.2, 17.2, 27.5, 30.4, 13.5, 11.9, 10.4, 16.3, 22.5, 9.2, 36.4, 19.2, 1.3, 10.7, 8.3, 8.5, 5.5, 19, 10.2, 21.7, 23.1, 0.7, 24.8), 
                              "Homicides" = c(0.56, 0.98, 0.69, 0.85, 0.99, 0.25, 0.61, 0.64, 0.91, 1.68, 4.88, 0.91, 1.15, 0.92, 0.31, 0.74, 1.36, 0.72, 1.58, 1.95, 1.6, 0.51, 1.21, 0.78, 0.66, 0.75, 0.85, 3.2, 1.29, 8.1, 0.74, 3.59, 0.88, 0.97, 1.48, 4.11, 6.53, 0.87, 2.72, 1.49, 1.78))

plot(gunstohomicides$Guns, gunstohomicides$Homicides)

cor(gunstohomicides$Guns, gunstohomicides$Homicides, method = "kendall")

hist(gunstohomicides$Guns, breaks = 12)
mean(gunstohomicides$Guns)
sd(gunstohomicides$Guns)
quantile(gunstohomicides$Guns)
1.5 * IQR(gunstohomicides$Guns)

hist(gunstohomicides$Homicides, breaks = 12)
mean(gunstohomicides$Homicides)
sd(gunstohomicides$Homicides)
quantile(gunstohomicides$Homicides)
1.5 * IQR(gunstohomicides$Homicides)

mean(gunstohomicides$Homicides) + 3 * sd(gunstohomicides$Homicides)

# US (11) is an outlier because of total guns and homicides, and Qatar (30), Argentina (37), Latvia (36), Chile (32), Estonia (28), Montenegro (39), and Belgium (20) because of homicides. So...

gunstohomsNoOutliers <- gunstohomicides[-c(11, 30, 37, 36, 32, 28, 39, 20),]

plot(gunstohomsNoOutliers$Guns, gunstohomsNoOutliers$Homicides)

cor(gunstohomsNoOutliers$Guns, gunstohomsNoOutliers$Homicides, method = "kendall")

# Ultimately, the outliers don't change the lack of a monotonic relationship much, so here's the original plot with the proper labels and all, which still shows that the US definitely has something else going on and it at least has something to do with guns...

cor(gunstohomicides$Guns, gunstohomicides$Homicides, method = "kendall")

png("GunsToHomicides.png", width = 500, height = 250)
par(mar = c(5, 6, 4, 2))
plot(gunstohomicides$Guns, gunstohomicides$Homicides, ylab = "Intentional Homicides per 100k inhabitants\nas per UNODC via Wikipedia", xlab = "Guns per 100 inhabitants as per Gunpolicy.org mostly\nvia Wikipedia", main = "Gun Ownership to Homicide Rate by Developed Country\nas per UN HDI via Wikipedia")
text(62, 6, expression(paste("Kendall's ", tau, " = 0.175")))
text(96, 5, "US")
text(26, 8, "Qatar")
text(19, 6.5, "Argentina")
text(26, 4.1, "Latvia")
dev.off()

svg("GunsToHomicides.svg", width = 14, height = 7)
par(mar = c(5, 6, 4, 2))
plot(gunstohomicides$Guns, gunstohomicides$Homicides, ylab = "Intentional Homicides per 100k inhabitants as per UNODC\nvia Wikipedia", xlab = "Guns per 100 inhabitants as per Gunpolicy.org mostly\nvia Wikipedia", main = "Gun Ownership to Homicide Rate by Developed Country\nas per UN HDI via Wikipedia")
text(60, 6, expression(paste("Kendall's ", tau, " = 0.175")))
text(98, 5, "US")
text(24, 8, "Qatar")
text(17, 6.5, "Argentina")
text(24, 4.1, "Latvia")
dev.off()
