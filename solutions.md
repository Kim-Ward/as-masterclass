# Solutions to the questions:

## 1 - Trigraph Counting:

* Use of brackets is important to establish precedence of mathematical expressions. `(A+B+C)%%26` not `A+B+C%%26`. There are 126 trigraphs in the Diana Cryptosystem

## 2 - Vignere Style:

2.1)
* The trigraphs are incorrect because the Diana cryptosystem uses 0-25 instead of 1-26 for its A-Z letter to number conversions. This can be fixed by (for example) editing "letter2num" to remove the +1, and by replacing 25 by 24 in the calculation inside "trigraph_finder".

2.2)
* The "paste()" function R uses to concatenate strings adds spaces by default; use `sep=""` as an argument to the paste function to fix this.
* R's `length()` function is designed for character vectors not strings, and will return 1 when called on a string of any length. Use the `nchars()` function instead.

2.3, 2.4) as above.

## 3 - One Time Pads:

3.1)
* Hopefully it should match! It's a good test to implement though.

3.3)
* Using `substring(one_time_pad, 1000)` only removes the first 999 letters from the pad, as R indexes from 1.

## Reflections (examples):
### Example 1:
* The use of R's `string` object when working with ciphertext keys and messages, while "obviously" the correct choice at first, turned out to cause lots of problems (things didn't work "as they should", since R assumes strings represent words or phrases).
* If the code was rewritten it might be better to use a character vector containing individual letters as the central way to store ciphertext information.
* But then again, this might cause its own problems such as increasing the work needed for manual input of messages.

### Example 2:
* The code does not contain a means to store punctuation or capitalisation. Extra functionality could be added on to do this.
* However, this would increase complexity for little practical reason, since English is usually perfectlyunderstandableevenwhenwrittenlikethis
* Having punctuation/capitalisation also decreases the security of the ciphertext by revealing syntactical information about it, so it's probably best to leave things as they are.
