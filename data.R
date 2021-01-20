library(tidyverse)
install.packages(c("nycflights13", "Lahman", "gapminder"))
getwd()

data(mpg)
data(diamonds)
diamonds

ggplot(diamonds, aes(x = cut)) +
  geom_bar()


ggplot(diamonds) +
  geom_bar(aes(x = cut,
               fill = cut))

ggplot(diamonds) +
  geom_bar(aes(x = cut,
               fill = clarity))
#dodge 방식 
#100프로로 만들어서
ggplot(diamonds) +
  geom_bar(aes(x = cut,
               fill = clarity),
           position = "fill")
#상대적으로 보여주기
ggplot(diamonds) +
  geom_bar(aes(x = cut,
               fill = clarity),
           position = "dodge")

install.packages("maps")
nz <- map_data("nz")

ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = 
                 "black")


ggplot(nz, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = 
                 "black") +
  coord_quickmap()



#3
install.packages("tidyverse")
library(tidyverse)
#3.22
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
#3.23

#3.24
#1.
ggplot(data = mpg)

#2. 
nrow(mpg)
ncol(mpg)

#3.
?mpg

#4.
mpg %>% 
  ggplot(aes(x = cyl, y = hwy)) +
  geom_point()    

#5.
mpg %>% 
  ggplot(aes(x = class, y = drv)) +
  geom_point()


#3.3
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

# Left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

# Right
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

mpg %>% 
  ggplot() +
  geom_point(aes(x = displ, y = hwy), color = "blue")

#3.3.1연습문제
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
#.3.3.2
summary(mpg)
glimpse(mpg)#연속형 범주형 보기
?mpg
#3.3.3
ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy, size = class))

ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy, shape = class))


#3.3.4
ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy, 
                 color = class, 
                 size = class, 
                 shape = class))

#3.3.5
mpg
ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy,
                 stroke = 5))

#3.3.6
#5이상만 T,F로 나뉘어 색칠
mpg
ggplot(data = mpg) +
  geom_point(aes(x = displ, y = hwy,
                 color = displ < 5))

#3.4
ggplot(data = mpg) + 
  geom_point(aes(x = displ, y = hwy))

#3.5
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~class, nrow = 2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(drv~cyl)

##3.5.1

ggplot(data = mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

#3.5.2
#없음
ggplot(data = mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)

#3.5.3
#x축 y축
ggplot(data = mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

#3.5.4
ggplot(data = mpg) + 
  geom_point(aes(x = displ, y = hwy)) +
  facet_wrap(~class, nrow = 2)
#구별이 더 쉽지만 한 눈에 들어오진 않는다.

#3.5.5
?facet_wrap
#facet_wrap은 구간을 지정할 수 있지만 facet_grid 는 구간을 지정할 수 없다 때문에 인수가 없음


#3.5.6
#행으로 둘 경우 그래프를 제대로 볼 수 없다, 공간을 위해


#3.6
# left
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

# right
ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))


ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

ggplot(data = mpg) +
  geom_smooth(
    mapping = aes(x = displ, y = hwy, color = drv),
    show.legend = FALSE
  )

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth()
#서브컴팩 색칠
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(color = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)

#3.6.1
#1. geom_line, geom_boxplot, geom_hist, geom_area

#3.6.2
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)


#3.6.3 
#범례 삭제, 그래프 보기 편하게?
ggplot(data = mpg) +
  geom_smooth(aes(x = displ, y = hwy, color = drv),
              show.legend = FALSE)

#3.6.4
#추세선의 오차범위

#3.6.5

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
#똑같이 나타난다. plot안에 넣으면 한번만 하면 되고 따로 넣을 시 둘 다 해야 한다.

#3.6.6
#1
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(se = FALSE)

#2


ggplot(mpg, aes(x = displ, y = hwy)) + 
  geom_smooth(mapping = aes(group = drv), se = FALSE) +
  geom_point()


#3

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_smooth(aes(group = drv), se = FALSE) +
  geom_point()

#4
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv)) +
  geom_smooth(se = FALSE)

#5

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv)) +
  geom_smooth(aes(linetype = drv), se = FALSE) 
  
#6
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(size = drv), color = "white") +
  geom_point(aes(color = drv))
  


#3.7
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut))

ggplot(data = diamonds) + 
  stat_count(mapping = aes(x = cut))

demo <- tribble(
  ~cut,         ~freq,
  "Fair",       1610,
  "Good",       4906,
  "Very Good",  12082,
  "Premium",    13791,
  "Ideal",      21551
)

ggplot(data = demo) +
  geom_bar(mapping = aes(x = cut, y = freq), stat = "identity")


ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = stat(prop), group = 1))


ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )


#3.7.1




#5
library(tidyverse)
library(nycflights13)

data(flights)
flights
class(flights)


jan1 <- flights %>% 
  filter(month == 1 & day == 1)


dec25 <- flights %>% 
  filter(month == 12 & day == 25)

#1월
ggjan1 <- ggplot(jan1, aes(x = dep_delay)) +
  geom_histogram()

#12월
ggdec25 <- dec12 %>% 
  ggplot(aes(x = dep_delay)) +
  geom_histogram()

apr1 <- flights %>% 
  filter(month == 4, day == 1)
#4월
ggapr1 <- apr1 %>% 
  ggplot(aes(x = dep_delay)) +
  geom_histogram()


install.packages("egg")
library(egg)

ggarrange(ggjan1,
          ggdec25,
          ggapr1)


arr_deray

ggjan1_2 <- jan1 %>% 
  ggplot(aes(x = arr_delay)) +
  geom_histogram()

ggdec25_2 <- dec25 %>% 
  ggplot(aes(x = arr_delay)) +
  geom_histogram()

ggapr1_2 <- apr1 %>% 
  ggplot(aes(x = arr_delay)) +
  geom_histogram()


ggarrange(ggjan1_2,
          ggdec25_2,
          ggapr1_2)



month <- flights %>% 
  filter(month == 1 | month == 4 | month == 12)

dep120 <= 
 arr120 <=
  
  
flights %>% 
  filter(arr_delay <= 120,
         dep_delay <= 120)


#도착이 2시간 연착 출발은 안 늦음
flights %>% 
  filter(arr_delay >= 120,
         dep_delay <= 0)

flights %>% 
  arrange(-arr_delay, -dep_delay)


flights %>% 
  select(year, month, day)

flights %>% 
  select(-distance:-time_hour)

flights %>% 
  select(chulbalsigan = dep_time,
         yesansigan = sched_dep_time)

#셀렉트로 변수 우선순위 설정
flights %>% 
  select(dest:air_time, everything())

#내가 보고자 하는 단어
flights %>% 
  select(ends_with("delay"))

flights %>% 
  select(starts_with("arr"))

flights %>% 
  select(starts_with("sched"))



#5,5
flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time)

flights_sml %>% 
  mutate(gain = dep_delay - arr_delay,
         speed = distance / air_time)




#체공시간  airtime2(도착시간 - 출발시간)
flights %>% 
  mutate(air_time_2 = arr_time - dep_time) %>% 
  select(air_time, air_time_2)

#조건문 ifelse arr이 크면 트루
fflights_sml %>% 
  mutate(ind = ifelse(arr_delay > dep_delay, TRUE,
                      FALSE))
  
#논리연산자
flights_sml %>% 
  mutate(ind = arr_delay > dep_delay) %>% 
  filter(ind)

flights_sml %>% 
  filter(!(arr_delay > dep_delay))

#5.2.4
#1
flights %>% 
  filter(arr_delay >= 120)
#2
flights %>% 
  filter(dest == "IAH", dest ==  "HOU")

#3
flights %>% 
  filter(carrier == "UA", carrier == "DL")

#4
flights %>% 
  filter(month == 7 | month == 8 | month == 9)
#5
flights %>% 
  filter(arr_delay >= 120,
         dep_delay <= 0)
#6
flights %>% 
  filter(arr_delay >= 60,
         dep_delay >= 60,
         air_time >= 30)
#7
arrtime
flights %>% 
  filter(dep_time == 2400 |
         dep_time <= 600)

#5.2.4.2
table(is.na(flights$dep_time))

#5.3.1
#-, desc

#5.3.1.2
flights %>% 
  arrange(-arr_delay)

#5.3.1.3
flights %>% 
  arrange(-sched_dep_time)
#5.3.1.4.
flights %>% 
  arrange(-distance)
flights %>% 
  arrange(distance)

#5.4.1.1
flights %>% 
  select(c(dep_time, dep_delay, arr_time, arr_delay))

#5.4.1.2
flights %>% 
  select(c(dep_time, dep_delay, arr_time, arr_delay))
#5.4.1.3
vars <- c("year", "month", "day", "dep_delay", "arr_delay")

flights %>% 
  select(any_of(vars))
#5.4.1.4
#이름을 변경할 수 있다 


mutate(flights_sml,
       gain = dep_delay - arr_delay,
       hours = air_time / 60,
       gain_per_hour = gain / hours
)


#새로운 변수로만 만들 떄 transmute
transmute(flights,
          gain = dep_delay - arr_delay,
          hours = air_time / 60,
          gain_per_hour = gain / hours
)










rm(ggapr1, ggapr1_2, ggdec25,ggdec25_2, ggjan1, ggjan1_2)
