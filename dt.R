library(ggplot2)
library(tidyverse)
data("diamonds")
diamonds

ggplot(diamonds) + 
  geom_bar(aes(x = cut))

diamonds %>% 
  count(cut)
#geom_bar(1변수), geom_col(2변수), count(1변수), group_by %>% count(2변수)를 그래프로 표현


diamonds %>% 
  group_by(color) %>% 
  count(cut)

ggplot(diamonds) +
  geom_col(aes(x = color,
           y = cut,
           fill = color))

ggplot(diamonds) +
  geom_histogram(aes(x = carat), binwidth = 0.5)

diamonds %>% 
  count(cut_width(carat, 0.5))

smaller <- diamonds %>% 
  filter(carat < 3)

ggplot(smaller, aes(x = carat)) +
  geom_histogram(binwidth = 0.1)

ggplot(smaller, aes(x = carat, color = cut)) +
  geom_freqpoly(binwidth = 0.1)


ggplot(smaller, aes(x = carat)) +
  geom_histogram(binwidth = 0.01)

ggplot(faithful, aes(x = eruptions)) +
  geom_histogram(binwidth = 0.2)

ggplot(faithful, aes(x = eruptions)) +
  geom_histogram(binwidth = 0.05)

#이상치
ggplot(diamonds) +
  geom_histogram(aes(x = y),
                 binwidth = 0.5)
diamonds %>% 
  count(cut_width(y, 0.5))

ggplot(diamonds) +
  geom_histogram(aes(x = y),
                 binwidth = 0.5) +
  coord_cartesian(ylim = c(0,50))


unusual <- diamonds %>% 
  filter(y < 3 | y > 20) %>% 
  select(price, x, y, z) %>% 
  arrange(y)

unusual


#1
ggplot(diamonds) +
  geom_histogram(aes(x = x), binwidth = 0.5)

ggplot(diamonds) +
  geom_histogram(aes(x = y), binwidth = 0.5)

ggplot(diamonds) +
  geom_histogram(aes(x = z), binwidth = 0.5)

diamonds %>% 
  count(cut_width(x, 0.5))

diamonds %>% 
  count(cut_width(y, 0.5))

diamonds %>% 
  count(cut_width(z, 0.5))


#2
ggplot(diamonds) +
  geom_histogram(aes(x = price))

ggplot(smaller, aes(x = price, color = cut)) +
  geom_freqpoly(binwidth = 30)

#3
diamonds %>% 
  filter(carat == 0.99)

diamonds %>% 
  filter(carat == 1)

ggplot(diamonds) +
  geom_point(aes(x = carat,
             y = price))

diamonds2 <- diamonds %>% 
  filter(between(y, 3, 20))

diamonds2 <- diamonds %>% 
  mutate(y = ifelse(y < 3  | y > 20, NA, y))


ggplot(diamonds2, aes(x = x,
                     y = y)) +
  geom_point(na.rm = TRUE)


library(nycflights13)

flights %>% 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60) %>% 
  ggplot(aes(x = sched_dep_time)) +
  geom_freqpoly(aes(color = cancelled),
                binwidth = 1/4)
  )


#1
ggplot(diamonds2, aes(x = y)) +
  geom_histogram()


ggplot(diamonds2, aes(x = y)) +
  geom_bar()
  
#2. 
na,rm = T 

sum(diamonds2$x, na.rm = TRUE)
mean(diamonds2$x, na.rm = TRUE)
sum(c(1,2,3,NA), na.rm = TRUE)
mean(c(1,2,3,NA), na.rm = TRUE)

#7.51
ggplot(diamonds, aes(x = price)) +
  geom_freqpoly(aes(color = cut), binwidth = 500)

#7.5.1.1
#1
flights %>% 
  mutate(
    cancelled = is.na(dep_time),
    sched_hour = sched_dep_time %/% 100,
    sched_min = sched_dep_time %% 100,
    sched_dep_time = sched_hour + sched_min / 60) %>% 
  ggplot() +
  geom_boxplot(aes(x = cancelled, y = sched_dep_time))
  

#2
ggplot(diamonds, aes(x = carat, y = price)) + 
  geom_point()

ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)), orientation = "x")


#3
ggstance, coord_flip()

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  coord_flip()
library("ggstance")

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point() +
  ggstance

#4
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_lv()

#5


ggplot(diamonds, aes(x = price)) +
  geom_histogram(aes(color = cut), binwidth = 500)


ggplot(data = diamonds, mapping = aes(x = cut, y = price)) +
  geom_violin() +
  coord_flip()

ggplot(diamonds, aes(x = price)) +
  geom_freqpoly(aes(color = cut), binwidth = 500)

#6


#7.5.2

#1

diamonds %>% 
  count(color, cut) %>%  
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = n))



diamonds %>%
  count(color, cut) %>%
  group_by(color) %>%
  mutate(prop = n / sum(n)) %>%
  ggplot(mapping = aes(x = color, y = cut)) +
  geom_tile(mapping = aes(fill = prop))
#2
flights %>% 
  group_by(month, dest) %>% 
  summarise(dep_delay = mean(dep_delay, na.rm = TRUE)) %>% 
  group_by(dest) %>% 
  filter(n() == 12) %>%   
  ungroup() %>% 
  ggplot(aes(x = month, y = dest, fill = dep_delay)) +
  geom_tile() +
  

flights %>%
  group_by(month, dest) %>%                                 # This gives us (month, dest) pairs
  summarise(dep_delay = mean(dep_delay, na.rm = TRUE)) %>%
  group_by(dest) %>%                                        # group all (month, dest) pairs by dest ..
  filter(n() == 12) %>%                                     # and only select those that have one entry per month 
  ungroup() %>%
  mutate(dest = reorder(dest, dep_delay)) %>%
  ggplot(aes(x = factor(month), y = dest, fill = dep_delay)) +
  geom_tile() +
  labs(x = "Month", y = "Destination", fill = "Departure Delay")

#7.5.3.3

#1
ggplot(diamonds, aes())