# Solutions to the questions:

## 1 - Trigraph Counting:

Bugs in the code:
* R does not deal with equivalence classes, and its modulo function returns a number - therefore `-1` must instead be `25`.
* Use of brackets is important to establish precedence of mathematical expressions. `(A+B+C)%%26` not `A+B+C%%26`.
There are 126 trigraphs in the Diana Cryptosystem, and this number is unchanged by picking -1, 0, 22, etc. as the equivalence class.

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
* The code runs slowly because string concatenation is inefficient: it requires copying the whole string, which is an O(n) operation where n is the string length. Put this inside a for loop, and the calculation becomes O(n^2) in total, which starts getting computationally intensive if n = 100,000. To optimise this code, you could generate the one-time pad as a character vector (as mutating a mutable object does not require copying it) and then convert to a string at the end; this would only be O(n) in total. Assessing mathematical complexities of your code is important when looking at why your script is running slow!

3.2)
* Hopefully it should match! It's a good test to implement though.

3.3)
* Using `substr(one_time_pad, 1000)` only removes the first 999 letters from the pad, as R indexes from 1.
* Tearing off a page doesn't actually *do* anything (other than print the number of pages remaining) as the variable containing the one-time pad is a local variable to the function and so modifications are not made to the variable outside the function scope. Fix this by returning the modified one_time_pad as an output to the function.

## 4 - Reflections (an example):
* The use of R's `string` object when working with ciphertext keys and messages, while "obviously" the correct choice at first, turned out to cause lots of problems (things didn't work "as they should", since R assumes strings represent words or phrases).
* If the code was rewritten it might be better to use a character vector containing individual letters.
* Writing this in Python wouldn't cause such a problem, due to Python's duck-typing ("If it looks like a duck, and it quacks like a duck, then Python will treat it like a duck") - `length()`, for example, works fine on strings AND lists, which are Python's equivalent of vectors.
