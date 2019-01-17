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

**You should now be able to look at R script 1, trigraph_counting.R, and answer the questions within. Beware: The code contains problems, and it's up to you and your testing skills to solve them! The questions will give you a start on where the problems are.**

## 2 - Codeword keys

Though it wasn't how the US Special Forces used it, it's possible to use this cryptosystem to send messages
