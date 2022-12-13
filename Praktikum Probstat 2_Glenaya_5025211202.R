# 1.A
sebelum <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
sesudah <-c(100, 95, 70, 90, 90, 90, 89, 90, 100)

sd(sebelum)
sd(sesudah)
sd(sebelum - sesudah)

#1.B
t.test(sebelum, sesudah, paired = TRUE)

#2.B
#install.packages("BSDA")
library(BSDA)

klaim_mean <- 20000
n <- 100
sampel_mean <- 23500
sd_populasi <-3900

zsum.test(mean.x = sampel_mean, sigma.x = sd_populasi, n.x = n, alternative = "greater", mu = klaim_mean)

#Nomor 3
n1 <- 19
n2 <- 27
x1 <- 3.64
x2 <- 2.79
sigma1 <- 1.67
sigma2 <- 1.32

#3.B
s_pool <- (((n1 - 1)*(sigma1^2) + (n2 - 1)*(sigma2^2))/(n1 + n2 -2))^0.5
s_pool

#3.C
tsum.test (mean.x = x1, s.x = sigma1, n.x = n1, 
           mean.y = x2, s.y = sigma2, n.y = n2,
           alternative = "two.sided", var.equal =  TRUE)

#3.D
qchisq(p = 0.05, df = 2, lower.tail = FALSE)

#4
dataKucing <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"),h=T)
attach(dataKucing)
names(dataKucing)

#4.A
dataKucing$Group <- as.factor(dataKucing$Group)
dataKucing$Group = factor(dataKucing$Group,labels = c("Kucing Oren", "Kucing Hitam", "Kucing Putih"))

class(dataKucing$Group)

Group1 <- subset(dataKucing, Group == "Kucing Oren")
Group2 <- subset(dataKucing, Group == "Kucing Hitam")
Group3 <- subset(dataKucing, Group == "Kucing Putih")

qqnorm(Group1$Length)
qqline(Group1$Length, col = "orange")

qqnorm(Group2$Length)
qqline(Group2$Length, col = "black")

qqnorm(Group3$Length)
qqline(Group3$Length, col = "red")

#4.B
bartlett.test(Length ~ Group, data = dataKucing)

#4.C
model1 = lm(Length ~ Group, data = dataKucing)
anova(model1)

#4.E
TukeyHSD(aov(model1))

#4.F
library("ggplot2")
ggplot(dataKucing, aes(x = Group, y = Length)) +
  geom_boxplot(fill = "red", colour = "black") +
  scale_x_discrete() + xlab("Treatment Group") +
  ylab("Cat Length")


#5.A
install.packages("multcompView")
install.packages("readr", repos=c("http://rstudio.org/_packages",   "http://cran.rstudio.com"))
library(dplyr)
library(ggplot2)
library(readr)
library(multcompView)

GTLImport <- read_csv("GTL.csv")
head(GTLImport)
str(GTLImport)

qplot(x = Temp, y = Light, geom = "point", data = GTLImport) +
  facet_grid(.~Glass, labeller = label_both)

#5.B
GTLImport$Glass <- as.factor(GTLImport$Glass)
GTLImport$Temp_Factor <- as.factor(GTLImport$Temp)
str(GTLImport)

anova <- aov(Light ~ Glass*Temp_Factor, data = GTLImport)
summary(anova)

#5.c
data_summary <- group_by(GTLImport, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

#5.D
tukey <- TukeyHSD(anova)
print(tukey)

#5.E
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
















