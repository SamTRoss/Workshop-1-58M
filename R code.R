chaff <- read.table("chaff2.txt", header = TRUE)
chaff
library(tidyverse)

summary(chaff)
chaff2<- chaff%>% 
  pivot_longer(names_to = "sex", 
               values_to = "mass",
               cols = everything())
chaff2
library(ggplot2)

ggplot(chaff2)

chaff2 %>% group_by(sex) %>%
  summarise(mean = mean(mass),
            n = length(mass),
            sdev = sd(mass))
t.test(chaff)
t.test(data = chaff2, #two sample t.test 
       mass ~ sex,
       var.equal = T)

units <- "in"  
fig_w <- 3.5
fig_h <- fig_w
dpi <- 300
device <- "tiff" 

data <- data.frame("chaff2")

ggplot(data = data, aes(sex, mass)) +
  position_jitterdodge()

ggplot(chaff2, aes(sex, mass)) +
  geom_boxplot()
ggsave("fig1.png",
       plot = fig1,
       device = device,
       width = fig_w,
       height = fig_h,
       units = units,
       dpi = dpi)

#hello i made a change
