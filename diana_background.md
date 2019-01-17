# The Diana Cryptosystem

## Background

Imagine you're the US Army Special Forces. And it's the 1960s, and you're in the middle of the Vietnam War. "Computers" are strange things that beep and whir in large rooms, and much of what we now know as modern cryptography has yet to be invented. Nevertheless, it's imperative that you have a way to communicate strategy and plans effectively, quickly, and most of all - securely. You know that the enemy will try everything in its power to find out what you're saying.

* You could send physical messengers with physical messages, but that's not quick, and it's dangerous to move around in a warzone.
* You could send telegrams over a telegraph wire, only laying miles of cable in a hostile jungle is an impossible task.
* Communication over the airwaves is the only viable way, but the enemy will be listening to everything sent.

So how do you do it?

## 1 - Trigraphs

The Diana Cryptosystem is a variant of the famous and much older Vignere Cipher optimised for manual encryption/decryption speed and intended for use with a one-time pad. The name of its creator is lost to the secrets of history; its name comes from the codeword DIANA allocated by the US Special Forces that used it.

Central to the cipher is its symmetry: encryption and decryption use the same operation, and it doesn't matter what order message and key are provided in. It uses a system of "trigraphs": triplets of letters that encode and decode into each other. For example, the triple (S, N, U) is a trigraph, thus:
* a message S and key N would encrypt to a ciphertext U
* a message N and key U would encrypt to a ciphertext S
* a ciphertext N and key U would decrypt to give a message S
* etc.

Mathematically, trigraphs are calculated by representing the letters A-Z as numbers 0-25, and then following the rule:

(t1, t2, t3) is a trigraph <=> t1 + t2 + t3 = -1 mod 26

The total number of trigraphs is relatively small. A telegraph operator sending thousands of letters a day would quickly memorise them and be able to encrypt and decrypt on the fly, but until then they would use a [paper aid](https://programmingpraxis.files.wordpress.com/2014/12/3ffa5-trigraph.jpg?w=511&zoom=2), which was itself optimised for quick lookups (note how the eye first travels down the side to reach the first letter and then across to reach the second, wherein the third letter is provided in handy red font).

**You should now be able to look at R script 1, 1_trigraph_counting.R, and answer the questions within. Beware: The code contains problems, and it's up to you and your testing skills to solve them! The questions will give you a hint about where the problems are.**

## 2 - Codeword keys

Though it wasn't how the US Special Forces used it, it's possible to use this cryptosystem to send messages "Vignere-style" using a key of just one word (or phrase). To do so, you would write out the key again and again until you reached a string of the same length as the message, encrypt each letter of the message with the corresponding letter of the repeated key, and obtain your ciphertext. To decrypt, you just do the exact same thing (remember: Diana is symmetric!).

How secure is this? Well, if an attacker finds out the key, anything you've encrypted using that key is immediately compromised. If the attacker can guess a portion of your message (for instance if you send daily updates always in a specific format), it's easy to obtain the key. So the cipher is vulnerable to human error.

Mathematically, this method of encryption isn't very strong either. The main problem is that English is predictable (which shouldn't be a surprise to anyone who has ever used predictive typing!): you don't need to write a lot of message before it becomes theoretically possible, given unlimited computer power, to figure out the message and the key. The "Unicity distance" of a cipher is how many letters you can transmit before it becomes likely that a unique decode exists. For this cipher, omitting some mathematics, it's about 1.5x the length of the key if your key is random letters: if your key must also be in English, it's about 2/3x the length of the key, meaning your message could theoretically be cracked before you've even gone round once!

Practically, this cipher is breakable with limited resources using fairly simple statistical techniques such as the [Index of Concidence](http://practicalcryptography.com/cryptanalysis/stochastic-searching/cryptanalysis-vigenere-cipher/) Chi-squared test. However, the Vignere cipher was state-of-the-art in secret message transmission for three centuries, earning the name "le chiffre indechiffrable" until its defeat in the mid-1800s.

**You should now be able to look at the second R script, 2_vignere_style.R, and answer the questions within. Beware: The code contains problems, and it's up to you and your testing skills to solve them! The questions will give you a hint about where the problems are.**

## 3 - The One-time Pad

It's easy to generalise the above line of thinking: what if our key was longer? Our message would be harder to crack. In fact, what if our key was the same length as the message? Then it would be pretty much impossible! In fact, if we add the additional stipulation that our key be uniformly randomly generated, instead of English text, then the "Unicity distance" above guarantees that there is never a unique decode, making our cryptosystem infinitely secure (at least from a mathematical perspective). A ciphertext could decrypt to *anything* with equal probability.

The problem then becomes: how do we transmit the key? This must be carried out ahead of time, through a channel that is known to be secure (probably a physical handover); stored in a place where only trusted people can access, and used precisely once before being destroyed (as finding an old key would allow decryption of the message it was used to send). The KGB (Russian secret service) used one-time-pads during the Cold War, printing them on flash paper so pages could be torn off and burned to leave no trace.

Another problem that we don't even consider these days is how to *generate* the key. Before computers became widespread, "random numbers" were expensive to make, leading to serious publications of books such as [this](https://www.amazon.co.uk/Million-Random-Digits-Normal-Deviates/dp/0833030477) that have today acquired some rather amusing Amazon reviews. For the purposes of this exercise, we use a (non-cryptographically secure) pseudo-random number generator that comes packaged as standard in R. If we wanted to truly make a secure cryptosystem, we'd be using a more secure number generation method, which do exist in the computing world.

**You should now be able to look at the third R script, 3_one_time_pads.R, and answer the questions within. Beware: The code contains problems, and it's up to you and your testing skills to solve them! The questions will give you a hint about where the problems are.**

## 4 - Bringing it All Together

The final script in our 4-part series doesn't contain any errors (intentionally, at least). If you have successfully dealt with all previous ones, you should be able to use it to send secure messages over insecure channels via the Diana cryptosystem and a one-time-pad. Get into pairs and go through an example using **4_all_together.R**. This is an integration test. Does it work? If not, you have some head-scratching to do. What have you and your partner done differently that could be causing the problem?

Once you're happy that your code works (or have given up hope of it ever doing so), commit your changes back to GitHub into a fork of the main repository. Congratulations, you are now a superspy!

As a final exercise, think about how the code you have debugged during this masterclass was written:
* What made your job harder, and what made it easier?
* Was there anything you would have done differently if you had been told to write the code from scratch?
* R has many quirks that make coding in it both satisfying and exasperating, and what's best practice in one language might not be in another. If you had to rewrite this in Python, what changes would you make as a result of the linguistic switch?
