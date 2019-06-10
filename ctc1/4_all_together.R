#' Brings previous work together.
#' There are no intentional errors in this script!
#' First of all, swap computers with a friend.
#' Have you swapped? Good. Try not to break your friend's computer.

random_timestamp <- as.numeric(Sys.time())
my_one_time_pad <- generate_one_time_pad(random_timestamp)
otp_name = paste(random_timestamp, ".txt", sep="")
save_one_time_pad(otp_name, my_one_time_pad)

#' Run the code above to get yourself a unique one-time pad.
#' Then run the code below, editing to add your own secret message.

my_message <- "asecretmessageformyfriend"
ciphertext <- crypto(my_message, my_one_time_pad)
my_message <- ""
my_one_time_pad <- tear_off_page(my_one_time_pad)
cat("\f") #clears the screen
print(ciphertext)

#' Now swap back to your own computer.
#' Have you swapped? Good. Welcome back!

friends_one_time_pad <- load_one_time_pad(otp_name)
friends_message <- crypto(ciphertext, friends_one_time_pad)
friends_one_time_pad <- tear_off_page(friends_one_time_pad)
print(friends_message)

#' Can you decipher your friend's message? Does it all work?
#' In practice, encrypted messages were sent using morse code over insecure radio waves.
#' You can send another message if you want, up to 10 in total per pad.

#' Finally: Commit your changes back to GitHub!
