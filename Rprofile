#---------------------------------------------------------------------
# Title:         Brandon's R Profile Configs
# Author:        Brandon Monier
# Created:       2018-01-11 at 19:41:11
# Last Modified: 2018-01-11 at 19:41:31
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
options(max.print = 100) 
options(editor = "vim")



# Miscellaneous checks

## Fortunes
if (interactive()) {
	try(fortunes::fortune(), silent = TRUE)
}

## Minimal R version and system info
v.str <- R.Version()$version.string
v.str <- substring(v.str, 11)
cat("#------------------------------------", "\n")
cat("# R - Interactive Console\n")
cat("#------------------------------------", "\n")
cat(paste0("# Version:  ", v.str, "\n"))
cat(paste0("# Nickname: ", R.Version()$nickname, "\n"))
cat(paste0("# Platform: ", R.Version()$platform, "\n"))
cat(paste0("# Date:     ", date(), "\n"))
cat("#------------------------------------", "\n\n")



# First function
.First <- function() {
	if (interactive()) {
		library(utils)
		timestamp(, prefix = paste("##------ [",getwd(),"]  ", sep = ""))
	}
}
