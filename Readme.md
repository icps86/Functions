Instructions to install costume functions into your environment:

```{r}
# Create a simple function that can import other functions from Github
source_github <- function( url ) {
  require(RCurl)
  script <- getURL(url, ssl.verifypeer = FALSE)
  eval(parse(text = script), envir=.GlobalEnv)
} 

#run the function to call costume functions in gihub
source_github( "RAW URL TO FUNCTION .R FILE" )

```
