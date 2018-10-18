#---------------------------------------------------------------------
# Title:         Brandon's R Profile Configs
# Author:        Brandon Monier
# Created:       2018-01-11 at 19:41:11
# Last Modified: 2018-02-11 at 10:21:19
#---------------------------------------------------------------------

# Set permanent mirror
local({
	r = getOption("repos")
	r["CRAN"] = "https://cran.rstudio.com/"
	options(repos = r)
})



# Options
options(prompt = "> ")
options(digits = 4)
options(max.print = 500) 
options(editor = "vim")



# Miscellaneous checks

## Fortunes
if (interactive()) {
	try(fortunes::fortune(), silent = TRUE)
}



# First function
.First <- function() {
	if (interactive()) {
		library(utils)
		timestamp(, prefix = paste("##------ [",getwd(),"]  ", sep = ""))
	}
}

