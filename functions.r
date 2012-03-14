#````````````````````````````````````````````````````
# This script contains functions for analyzing the dispersal dataset
# Author: Karthik Ram <kram@ucsc.edu>

#````````````````````````````````````````````````````

rm(list=ls())
len=length
 
# 1.  >>>> Settings for the dispersal plots. >>>>

no_small_grid = opts(panel.grid.minor=theme_line(colour=NA))
no_large_grid = opts(panel.grid.major=theme_line(colour=NA))
large_x = opts(axis.text.x=theme_text(size=10,vjust=1.2,colour="black"))
large_y = opts(axis.text.y=theme_text(size=10,hjust=1.2,colour="black"))
no_bg = opts(panel.background=theme_rect(colour=NA))
draw_axis = opts(axis.line=theme_segment(colour="black",linetype="solid",size=0.8))
x_a_ticks = opts(axis.title.x=theme_text(colour="black",size=14),vjust=-1)
y_a_ticks = opts(axis.title.y=theme_text(colour="black",size=14,angle=90))
my_scales = list(no_small_grid,no_large_grid,no_bg,draw_axis,x_a_ticks,y_a_ticks)
