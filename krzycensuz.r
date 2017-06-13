krzycensuz <- function (x)
{
  # Load Required Packages
  require(ggplot2)
  require(gridExtra)
  options(scipen = 999)

  #making pot
  bar.pop <- ggplot(x, aes(fill=county.name)) +
    #geom_vline(xintercept=0, color = "grey70", size=2, linetype = "solid") +
    geom_point(aes(x=x$Pop, y="Population        "), stat="identity", shape = 23, size = 10) +
    #theme_bw() +
    theme(legend.position = "none",
          axis.title = element_blank(),
          panel.border = element_blank(),
          legend.title = element_blank())
  
  bar.inc <- ggplot(x, aes(fill=county.name)) +
    geom_point(aes(x=x$MHincome, y="Median Income"), stat="identity", shape = 23, size = 8) +
    #theme_bw() +
    theme(legend.position = "none",
          axis.title = element_blank(),
          panel.border = element_blank(),
          legend.title = element_blank())
  
  bar.pov <- ggplot(x, aes(fill=county.name)) +
    geom_point(aes(x=x$pov.rate, y="Poverty Rate     "), stat="identity", shape = 23, size = 8) +
    #theme_bw() +
    theme(legend.position = "none",
          axis.title = element_blank(),
          panel.border = element_blank(),
          legend.title = element_blank())
  
  leg <- ggplot(x, aes(fill=county.name)) +
  geom_point(aes(x=2:(length(levels(x$county.name))+1), y=""), stat="identity", shape = 23, size = 8) +
  theme_bw() +
  coord_cartesian(xlim = 1:(length(levels(x$county.name))+2)) +
  geom_text(aes(x=2:(length(levels(x$county.name))+1), y=.8, label = paste0(levels(x$county.name))),
            size= 4,
            hjust = .5,
            vjust = .5,
            colour = "grey20") +
  labs(caption = "(* Poverty Rate is a percentage /n * Median Income is by Household") +
  theme(legend.position = "none",
          axis.title = element_blank(),
          axis.text=element_blank(), 
          axis.ticks=element_blank(),
          panel.grid=element_blank(),
          panel.border = element_blank(),
          legend.title = element_blank()
          )
     
  bars <- grid.arrange(bar.pop, bar.inc, bar.pov, leg, nrow= 4, ncol=1, heights=c(1,1,1,1), widths=c(1))
  
  return(bars)
}
