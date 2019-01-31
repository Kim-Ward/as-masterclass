#' Brings previous work together.
#' There are no intentional errors in this script!

source('diana.R')
source('one_time_pads.R')

random_timestamp <- as.numeric(Sys.time())

my_one_time_pad <- generate_one_time_pad(random_timestamp)

save_one_time_pad(paste(random_timestamp, ".txt", sep=""))

#' Run the code above to get yourself a unique one-time pad.
#' Send your one-time pad to a friend and receive theirs - 
#' in practice, these were delivered by hand,
#' under top secret conditions, well in advance of message sending.

friends_one_time_pad <- load_one_time_pad('some_numbers.txt')

#' Change the following string:

my_message <- "mysecretmessage"
my_ciphertext <- crypto(my_message, my_one_time_pad)
print(my_ciphertext)

#' Send the ciphertext to your friend, and have them send you theirs.

friends_ciphertext <- "whatevertheysentme"
friends_message <- crypto(friends_ciphertext, friends_one_time_pad)

#' Can you decipher your friend's message? Does it all work?
#' In practice, encrypted messages were sent using morse code over insecure radio waves.

my_one_time_pad <- tear_off_page(my_one_time_pad)

#' You can tear off a page and send another message, up to 100 in total per pad.


#' Finally: Commit your changes back to GitHub!
