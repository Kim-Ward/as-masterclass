
letter2num <- function(x) {utf8ToInt(x) - utf8ToInt("a") + 1}

trigraph_finder <- function(A, B){
  #Finds the other letter making a trigraph with A and B.
  A <- letter2num(A)
  B <- letter2num(B)
  C <- (25 - A - B) %% 26
  C <- letters[C]
  return(C)
}
#' 3) Look at the manual trigraph key. Are the trigraphs generated above correct?

repeat_key <- function(key, length_to_repeat){
  #Repeats a key to the desired length.
  repeated_key <- ""
  while (length_to_repeat > length(key)){
    repeated_key <- paste(repeated_key, key)
    length_to_repeat <- length_to_repeat - length(key)
  }
  repeated_key <- paste(repeated_key, substr(key, 1, length_to_repeat))
  return(repeated_key)
}
#' 4) Is the key repeating correctly?
#' Clue: there are *two* separate errors in the above code.

crypto <- function(message, key){
  #Encrypts or decrypts a message.
  repeated_key <- repeat_key(key, nchar(message))
  
  output <- ""
  for (i in 1:nchar(message)){
    m = substr(message, i, i)
    k = substr(repeated_key, i, i)
    substr(output, i, i) <- trigraph_finder(m, k)
  }
  return(output)
}
#' 5) Do messages encrypt without error?
#' 6) If you encrypt and decrypt with the same key,
#' do you get back the original message?
#' 