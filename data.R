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
