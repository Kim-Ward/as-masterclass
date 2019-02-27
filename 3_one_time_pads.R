generate_one_time_pad <- function(seed){
  #generates a one-time pad from a seed for a random number generator.
  set.seed(seed)
  one_time_pad <- ""
  
  for (i in 1:10000){
    one_time_pad <- paste(one_time_pad, letters[sample(26, size=1)], sep="")
  }
  return(one_time_pad)
}

save_one_time_pad <- function(filename, one_time_pad){
  #Saves a one-time pad to a file.
  writeLines(c(one_time_pad), filename)
}

load_one_time_pad <- function(filename){
  #Loads a one-time pad from a file.
  one_time_pad <- readLines(filename, 1)
  return(one_time_pad)
}

#' 3.1) Does saving then loading the same one-time pad match?

tear_off_page <- function(one_time_pad){
  #Destroys the first "page" (1000 letters) of the one-time pad.
  one_time_pad <- substring(one_time_pad, 1000)
  pages <- nchar(one_time_pad) / 1000
  cat("There are ", pages, " pages remaining.")
  return(one_time_pad)
}


#' 3.2) Does tearing off a page work correctly?
