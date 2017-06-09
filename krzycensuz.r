krzycensuz <- function (x)
  {
  # Load Required Packages
  require(ggplot2)
  
  #making pot
  bars <- ggplot(x, aes(fill=county.name, height=.4, width=.05)) +
    geom_vline(xintercept=0, color = "grey70", size=2, linetype = "solid") +
    geom_tile(aes(x=x$Pop.n, y="Population"), stat="identity") +
    geom_tile(aes(x=x$MHincome.n, y="Median HIncome"), stat="identity") + 
    geom_tile(aes(x=x$pov.rate.n, y="Poverty Rate"), stat="identity") +
    geom_hline(yintercept=c(2.5,1.5), size = 3, color = "white" ) +
    theme(legend.position = "top",
          axis.title = element_blank(),
          panel.border = element_blank(),
          legend.title = element_blank())
  return(bars)
   
}
