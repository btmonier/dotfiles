#--------------------------------------------------------------------
# Title:         Brandon's R Profile Configs
# Author:        Brandon Monier
# Created:       2018-01-11 at 19:41:11
# Last Modified: 2020-01-30 at 16:58:25
#--------------------------------------------------------------------

# === Set permanent mirror ==========================================
local({
	r = getOption("repos")
	r["CRAN"] = "https://cran.rstudio.com/"
	options(repos = r)
})



# === General Options ===============================================
options(prompt = "> ")
options(digits = 4)
options(max.print = 500)
options(editor = "vim")



# === Miscellaneous checks ==========================================

## Load magrittr
if (require("magrittr")) {
    library("magrittr")
}


## Fortunes
if (interactive()) {
	try(fortunes::fortune(), silent = TRUE)
}



# === First function ================================================
.First <- function() {
	if (interactive()) {
		library(utils)
		timestamp(, prefix = paste("##------ [",getwd(),"]  ", sep = ""))
	}
}



# === Force no save on exit (`q()`) =================================
utils::assignInNamespace(
  "q",
  function(save = "no", status = 0, runLast = TRUE)
  {
    .Internal(quit(save, status, runLast))
  },
  "base"
)
