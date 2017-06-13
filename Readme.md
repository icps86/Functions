Instructions to install costume functions into your environment:

```{r}
#First, create a simple function that can import other functions from Github
source_github <- function( url ) {
  require(RCurl)
  script <- getURL(url, ssl.verifypeer = FALSE)
  eval(parse(text = script), envir=.GlobalEnv)
} 

#Then run the function to call specific costume functions in gihub. You only need the RAW URL address.
source_github( "URL" )

```
