krzycensuz <- function (x)
{
  # Load Required Packages
  require(ggplot2)
  require(gridExtra)
  options(scipen = 999)
  
  #the function will make three plots, save them into objects and stack them together using gridExtra

  #making the first plot
  bar.pop <- ggplot(x, aes(fill=county.name)) +
    geom_vline(xintercept=317309, color = "grey80", size=4, linetype = "solid") +
    geom_text(aes(x=317309, y="Population        ", label= "NY Average"), size = 3, colour = "grey40", angle = 90) +
    geom_point(aes(x=x$Pop, y="Population        "), stat="identity", shape = 23, size = 8) +
    theme_bw() +
    xlim(4700,max(x$Pop)+1000) + 
    theme(legend.position = "none",
          axis.title = element_blank(),
          panel.border = element_blank(),
          legend.title = element_blank(),
          panel.grid.minor = element_blank(), 
          panel.grid.major =element_blank(),
          panel.grid.major.x = element_line())
  
  #second plot
  bar.inc <- ggplot(x, aes(fill=county.name)) +
    geom_vline(xintercept=55276, color = "grey80", size=4, linetype = "solid") +
    geom_text(aes(x=55276, y="Median Income", label= "NY Average"), size = 3, colour = "grey40", angle = 90) +
    geom_point(aes(x=x$MHincome, y="Median Income"), stat="identity", shape = 23, size = 8) +
    theme_bw() +
    xlim(34200,max(x$MHincome)+800) +
    theme(legend.position = "none",
          axis.title = element_blank(),
          panel.border = element_blank(),
          legend.title = element_blank(),
          panel.grid.minor = element_blank(), 
          panel.grid.major =element_blank())
  
  #third plot
  bar.pov <- ggplot(x, aes(fill=county.name)) +
    geom_vline(xintercept=13.8, color = "grey80", size=4, linetype = "solid") +
    geom_text(aes(x=13.8, y="Poverty Rate     ", label= "NY Average"), size = 3, colour = "grey40", angle = 90) +
    geom_point(aes(x=x$pov.rate, y="Poverty Rate     "), stat="identity", shape = 23, size = 8) +
    theme_bw() +
    xlim(5,max(x$pov.rate)+1) +
    theme(legend.position = "none",
          axis.title = element_blank(),
          panel.border = element_blank(),
          legend.title = element_blank(),
          panel.grid.minor = element_blank(), 
          panel.grid.major =element_blank())
  
  #making a legend with a plot.
  leg <- ggplot(x, aes(fill=county.name)) +
  geom_point(aes(x=2:(length(levels(x$county.name))+1), y=""), stat="identity", shape = 23, size = 8) +
  theme_bw() +
  coord_cartesian(xlim = 1:(length(levels(x$county.name))+2)) +
  geom_text(aes(x=2:(length(levels(x$county.name))+1), y=.8, label = paste0(levels(x$county.name))),
            size= 4,
            hjust = .5,
            vjust = .5,
            colour = "grey20") +
  labs(caption = "Source: ACS 2015 Census data. \n *Poverty Rate is a percentage; Median Income is by Household") +
  theme(legend.position = "none",
          axis.title = element_blank(),
          axis.text=element_blank(), 
          axis.ticks=element_blank(),
          panel.grid=element_blank(),
          panel.border = element_blank(),
          legend.title = element_blank())
  
  #compiling everything for output
  bars <- grid.arrange(bar.pop, bar.inc, bar.pov, leg, nrow= 4, ncol=1, heights=c(1,1,1,1), widths=c(1))
  
  return(bars)
}
