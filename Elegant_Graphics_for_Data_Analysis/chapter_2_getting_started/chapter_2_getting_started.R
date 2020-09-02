library(ggplot2)
library(dplyr)

glimpse(mpg)

# -------------------chapter 2.2.1 Exercises----------------------
# 2. Other datasets in ggplot2?
data()

# 4. Manufacturers with the most models
models_total <- mpg %>%
  group_by(manufacturer, model) %>%
  summarise(
    n = n()
  ) %>%
  arrange(desc(n))

# --------------------------chapter 2.3.1 Exercises-----------------------------
# !. Relation between cty and hwy -- appears to be highly correlated.
ggplot(mpg, aes(cty, hwy)) +
  geom_point()

# 2. Relation between model and manufacturer -- does not appear useful
ggplot(mpg, aes(model, manufacturer)) +
  geom_point()
# group by manufacturer, class and get the totals

totals <- mpg %>%
  group_by(manufacturer, class) %>%
  mutate(total_veh = n()) %>%
  slice(1)
?ggplot2::coord_flip
ggplot(totals, aes(manufacturer, total_veh, fill = class)) +
  geom_col() +
  coord_flip()

# 3.
glimpse(economics)
ggplot(economics, aes(date, unemploy)) + geom_line()

# --------------------------chapter 2.4 Color, size, shape aesthetic attributes-----------------
ggplot(mpg, aes(displ, cty, color = class)) +
  geom_point()

# define the color in a separate aes to fix it to one value:
ggplot(mpg, aes(displ, hwy)) + geom_point(aes(color="blue"))
ggplot(mpg, aes(displ, hwy)) + geom_point(color = "blue")

# ------------------------chapter 2.4.1 Exercises-----------------------------------
# 4. drive train vs fuel economy:
ggplot(mpg, aes(drv, hwy)) +
  geom_point()
# drive train vs engine size and class:
ggplot(mpg, aes(drv, cyl, color = class)) + geom_point()

# --------------------chapter 2.5 Facetting------------------------------
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(~class)

# --------------------chapter 2.5.1 Exercises--------------------
# 1. facet by continuous variable:
ggplot(mpg, aes(displ, drv))+
  geom_point() +
  facet_wrap(~hwy)
# 2. facet no of cylinders with engine size and fuel economy:
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  facet_wrap(~cyl)
# 3. help on facet_wrap -- rows and columns: nrow, ncol
?ggplot2::facet_wrap

# --------------------------chapter 2.6 plot geoms---------------------
# ----------------------chapter 2.6.1 adding a smoother to a plot-----------------------
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth()

# ------------------chapter 2.6.3 histograms and frequency polygons------------------
ggplot(mpg, aes(hwy)) + geom_histogram() # using 30 bins

ggplot(mpg, aes(hwy)) + geom_freqpoly() # using 30 bins

# comparing distributions:
ggplot(mpg, aes(displ, color = drv)) +
  geom_freqpoly(binwidth = 0.5)

ggplot(mpg, aes(displ, fill = drv)) +
  geom_histogram(binwidth = 0.5) +
  facet_wrap(~drv, ncol = 1)










