.First <- function() {
  local({
    r <- getOption("repos")
    r["CRAN"]<-"http://username:hashedpassword@art-p-01/artifactory/list/v-cran-repo/"

    options(repos=r)
  })
library(utils)
ap<-available.packages()
if (nrow(ap)!=0){
	print("You can download packages")
} else {
	print("Can not open package repository, is your username correct? has your windows password changed?")

}

rm(ap)

}
.libPaths("D:/R/lib")

