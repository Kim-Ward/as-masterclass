# Solutions to the questions:

## 1 - Trigraph Counting:

* R does not deal with equivalence classes, and its modulo function returns a number - therefore `-1` must instead be `25`.
* Use of brackets is important to establish precedence of mathematical expressions. `(A+B+C)%%26` not `A+B+C%%26`.
1.1) There are 126 trigraphs in the Diana Cryptosystem, and 1.2) this number is unchanged by picking -1, 0, 22, etc. as the equivalence class.

## 2 - Vignere Style:

2.1)
* The trigraphs are incorrect because the Diana cryptosystem uses 0-25 instead of 1-26 for its A-Z letter to number conversions. This can be fixed by (for example) editing "letter2num" to remove the +1, and by replacing 25 by 24 in the calculation inside "trigraph_finder".

2.2)
* The "paste()" function R uses to concatenate strings adds spaces by default; use `sep=""` as an argument to the paste function to fix this.
* R's `length()` function is designed for character vectors not strings, and will return 1 when called on a string of any length. Use the `nchars()` function instead.

2.3, 2.4)
* The `substr()` selection method of editing strings cannot append to a string: you need to use the `paste()` function (with the separator argument as above!) to do this.

## 3 - One Time Pads:

3.1)
* The code runs slowly because string concatenation is inefficient: it requires copying the whole string, which is an O(n) operation where n is the string length. Put this inside a for loop, and the calculation becomes O(n^2) in total, which starts getting computationally intensive if n = 100,000. To optimise this code, you could generate the one-time pad as a character vector (as editing a mutable object does not require copying it) and then convert to a string at the end; this would only be O(n) in total. Assessing mathematical complexities of your code is important when looking at why your script is running slow!

3.2)
* Hopefully it should match! It's a good test to implement though. The important thing here is that even though a "character vector of length 1 containing a string" is returned, that is how R stores strings normally, so it doesn't cause any errors.

3.3)
* Using `substring(one_time_pad, 1000)` only removes the first 999 letters from the pad, as R indexes from 1.
* Tearing off a page doesn't actually *do* anything (other than print the number of pages remaining) as the variable containing the one-time pad is a local variable to the function and so modifications are not made to the variable outside the function scope. Fix this by returning the modified one_time_pad as an output to the function.

## 4 - Reflections (examples):
### Example 1:
* The use of R's `string` object when working with ciphertext keys and messages, while "obviously" the correct choice at first, turned out to cause lots of problems (things didn't work "as they should", since R assumes strings represent words or phrases).
* If the code was rewritten it might be better to use a character vector containing individual letters as the central way to store ciphertext information.
* But then again, this might cause its own problems such as increading the work needed for manual input of messages.
* If written in Python, strings could handle everything neatly except the computationally inefficient one-time-pad generation.

### Example 2:
* The code does not contain a means to store punctuation or capitalisation. Extra functionality could be added on to do this.
* However, this would increase complexity for little practical reason, since English is usually perfectlyunderstandableevenwhenwrittenlikethis
* Having punctuation/capitalisation also decreases the security of the ciphertext by revealing syntactical information about it, so it's probably best to leave things as they are.
