# The Diana Cryptosystem

## Background

Imagine you're the US Army Special Forces. And it's the 1960s, and you're in the middle of the Vietnam War. "Computers" are strange things that beep and whir in large rooms, and much of what we now know as modern cryptography has yet to be invented. Nevertheless, it's imperative that you have a way to communicate strategy and plans effectively, quickly, and most of all - securely.

So how do you do it?

## 1 - Trigraphs

The Diana Cryptosystem is a variant of the famous and much older Vignere Cipher optimised for manual encryption/decryption speed.

Central to the cipher is its symmetry: encryption and decryption use the same operation, and it doesn't matter what order message and key are provided in. It uses a system of "trigraphs": triplets of letters that encode and decode into each other. For example, the triple (S, N, U) is a trigraph, thus:
* a message S and key N would encrypt to a ciphertext U
* a message N and key U would encrypt to a ciphertext S
* a ciphertext N and key U would decrypt to give a message S
* etc.

Mathematically, trigraphs are calculated by representing the letters A-Z as numbers 0-25, and then following the rule:

(t1, t2, t3) is a trigraph <=> t1 + t2 + t3 = 25 mod 26 (remainder 25 when divided by 26)

A telegraph operator sending thousands of letters a day would quickly memorise the trigraphs and be able to encrypt and decrypt on the fly, but until then they would use a [paper aid](https://programmingpraxis.files.wordpress.com/2014/12/3ffa5-trigraph.jpg?w=511&zoom=2).

**You should now be able to look at the first R script, 1_trigraph_counting.R, and catch the bugs hidden in the code via implementing some unit tests. The questions will give you a hint about where the problems are.**

## 2 - Codeword keys

It's possible to use this cryptosystem to send messages "Vignere-style" using a key of just one word (or phrase). To do so, you would write out the key again and again until you reached a string of the same length as the message, encrypt each letter of the message with the corresponding letter of the repeated key, and obtain your ciphertext.

How secure is this? Well, if an attacker finds out the key, anything you've encrypted using that key is immediately compromised. If the attacker can guess a portion of your message (for instance if your letters always begin "Hello"), it's easy to obtain the key.

This cipher is also breakable using fairly simple statistical techniques such as the [Index of Concidence](http://practicalcryptography.com/cryptanalysis/stochastic-searching/cryptanalysis-vigenere-cipher/) Chi-squared test. However, the Vignere cipher was state-of-the-art in secret message transmission for three centuries, earning the name "le chiffre indechiffrable".

**You should now be able to look at the second R script, 2_vignere_style.R, and catch the bugs hidden in the code via implementing some unit tests. The questions will give you a hint about where the problems are.**

## 3 - The One-time Pad

What if our key was the same length as the message? Then it would be pretty much impossible to crack! A ciphertext could decrypt to *anything*.

The problem then becomes: how do we transmit, store, and eventually destroy the key? The KGB (Russian secret service) used one-time-pads (pairs of randomly generated keys used only once) during the Cold War, printing them on pads of flash paper so pages could be torn off and burned to leave no trace.

Another problem that we don't even consider these days is how to *generate* the key. Before computers became widespread, "random numbers" were expensive to make, leading to serious publications of books such as [this](https://www.amazon.co.uk/Million-Random-Digits-Normal-Deviates/dp/0833030477) that have today acquired some rather amusing Amazon reviews.

**You should now be able to look at the third R script, 3_one_time_pads.R, and catch the bugs hidden in the code via implementing some unit tests. The questions will give you a hint about where the problems are.**
