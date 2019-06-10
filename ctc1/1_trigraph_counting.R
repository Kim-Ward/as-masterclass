
is_trigraph <- function(A, B, C){
  #Tests if the triple (A, B, C) is a trigraph in the Diana cryptosystem.
  return(A + B + C %% 26 == 25)
}

count_trigraphs <- function(){
  #Counts the number of trigraphs in the Diana cryptosystem.
  trigraphs <- 0
  trigraph_list <- c()
  for (A in 0:25){
    for (B in A:25){
      for (C in B:25){
        if (is_trigraph(A, B, C)){
          trigraphs <- trigraphs + 1
        }
      }
    }
  }
  return(trigraphs)
}

#' 1.1) How many trigraphs are there in this cryptosystem? Is this affected by our choice of "25" as a remainder value?
