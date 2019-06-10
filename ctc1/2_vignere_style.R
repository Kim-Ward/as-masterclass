
letter2num <- function(x) {utf8ToInt(x) - utf8ToInt("a") + 1}

trigraph_finder <- function(A, B){
  #Finds the other letter making a trigraph with A and B.
  A <- letter2num(A)
  B <- letter2num(B)
  C <- (25 - A - B) %% 26
  C <- letters[C]
  return(C)
}
#' 2.1) Remember that (S, N, U) is a trigraph, and other trigraphs can be found by looking at the paper decoder.
#' Are the trigraphs generated above correct?

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
#' 2.2) Is the key repeating correctly?
#' Clue: "paste" and "length".

crypto <- function(message, key){
  #Encrypts or decrypts a message.
  repeated_key <- repeat_key(key, length(message))
  
  output <- ""
  for (i in 1:length(message)){
    m = substr(message, i, i)
    k = substr(repeated_key, i, i)
    output <- paste(output, trigraph_finder(m, k))
  }
  return(output)
}
#' 2.3) Do messages encrypt without error?
#' 2.4) If you encrypt and decrypt with the same key,
#' do you get back the original message?
