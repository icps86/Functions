tablez <- function (x)
{
  # Load Required Packages
  require(formattable)
  
  x <- x[, c(1:4)]
  
  x$Pop <- accounting(x$Pop, digits = 0)
  x$MHincome <- accounting(x$MHincome, digits = 0)
  x$pov.rate <- percent(x$pov.rate/100, digits = 1)
  colnames(x)<- c("County", "Population", "Income", "Poverty Rate")

  tab <- formattable(x,
              list(Population = color_tile("steelblue1", "gray90"),
                   Income = color_tile("steelblue1", "gray90"),
                   "Poverty Rate" = color_tile("steelblue1", "gray90")))
  return(tab)
  }
