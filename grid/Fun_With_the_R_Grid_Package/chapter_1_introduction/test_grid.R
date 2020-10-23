library(grid)

gr_rect_1 <- grid::grid.rect(x = 0.2, y = 0.6, width = 0.1, height = 0.1, name = "gr_rect_1")
gr_rect_2 <- grid::grid.rect(x = 0.7, y = 0.75, width = 0.1, height = 0.1, name = "gr_rect_2")
gr_rect_3 <- grid::grid.rect(x = 0.5, y = 0.4, width = 0.1, height = 0.1, name = "gr_rect_3")

for(i in 1:1000)
  grid.edit("gr_rect_1", vp = viewport(x = 0.2, y = 0.6, angle = i))
  grid.edit("gr_rect_2", vp = viewport(x = 0.7, y = 0.75, angle = i*2))
  grid.edit("gr_rect_3", vp = viewport(x = 0.5, y = 0.4, angle = i*3))
