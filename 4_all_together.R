#' Brings previous work together.
#' There are no intentional errors in this script!
#' First of all, swap computers with a friend.
#' Have you swapped? Good. Try not to break your friend's computer.

source('2_vignere_style.R')
source('3_one_time_pads.R')

random_timestamp <- as.numeric(Sys.time())
my_one_time_pad <- generate_one_time_pad(random_timestamp)
otp_name = paste(random_timestamp, ".txt", sep="")
save_one_time_pad(my_one_time_pad, otp_name)

#' Run the code above to get yourself a unique one-time pad.
#' Then run the code below, editing to add your own secret message.

my_message <- "mysecretmessage"
ciphertext <- crypto(my_message, my_one_time_pad)
print(ciphertext)
my_message <- ""
my_one_time_pad <- ""

#' Now swap back to your own computer.
#' Have you swapped? Good. Welcome back!

friends_one_time_pad <- load_one_time_pad(otp_name)
friends_message <- crypto(ciphertext, friends_one_time_pad)

#' Can you decipher your friend's message? Does it all work?
#' In practice, encrypted messages were sent using morse code over insecure radio waves.

my_one_time_pad <- tear_off_page(my_one_time_pad)
save_one_time_pad(my_one_time_pad, otp_name)

#' You can tear off a page and send another message if you want, up to 10 in total per pad.

#' Finally: Commit your changes back to GitHub!
