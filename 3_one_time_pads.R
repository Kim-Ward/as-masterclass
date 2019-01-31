generate_one_time_pad <- function(seed){
  #generates a one-time pad from a seed for a random number generator.
  #obviously, they didn't have cheap random number generators lying around back when
  #this cipher was used!
  set.seed(seed)
  one_time_pad <- ""
  
  for (i in 1:100000){
    one_time_pad <- paste(one_time_pad, letters[sample(26, size=1)], sep="")
  }
  return(one_time_pad)
}
#' 3.1 - ADVANCED) Why does this code run so slowly? Can you speed it up at all?
#' Feel free to skip this exercise if you can't figure out the answer:
#' after all, code that runs slowly *does* run.
#' (That's what many people do in real life!)

save_one_time_pad <- function(filename, one_time_pad){
  #Saves a one-time pad to a file.
  writeLines(c(one_time_pad), filename)
}

load_one_time_pad <- function(filename){
  #Loads a one-time pad from a file.
  one_time_pad <- readLines(filename, 1)
  return(one_time_pad)
}

#' 3.2) Does saving then loading the same one-time pad match?
#' 
tear_off_page <- function(one_time_pad){
  #Destroys the first "page" (1000 letters) of the one-time pad.
  one_time_pad <- substring(one_time_pad, 1000)
  pages <- nchar(one_time_pad) / 1000
  cat("There are ", pages, " pages remaining.")
}


#' 3.3) Does tearing off a page work correctly?
#' Clue: there are *two* errors in the above code. The print statement should
#' immediately make one of them obvious.
