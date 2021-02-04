//: [Previous](@previous)

import Foundation

/*
 Write a function that counts from 1 through 100, and prints “Fizz” if the counter is evenly divisible by 3, “Buzz” if it’s evenly divisible by 5, “Fizz Buzz” if it’s even divisible by three and five, or the counter number for all other cases.
 Sample input and output
 • 1 should print “1”
 • 2 should print “2”
 • 3 should print “Fizz”
 • 4 should print “4”
 • 5 should print “Buzz”
 • 15 should print “Fizz Buzz”
 Hints
 Hint #1: You’ll need to use modulus: %.
 Hint #2: Check for the “Fizz Buzz” case first, because that’s most specific.
 Hint #3: Remember to use the closed range operator to include the number 100 at the end.

 */

/*
 Questions:
 fizz %3, buzz %5, fizzBuzz both, else num
 counts from 1 to 100
 input: none, out: none
 std Out: 1 to 100 fizz buzz
 
 Algo:
 
 check count
 if count %3 and 5 fizzBuzz
 if one or other
 else count
 increment count
 
 Pseudo:
 for count in 0 to 100 {
    if count % 5 and 3 == 0 {
 print fizz buzz
 } else if {
  
 }
 */

func fizzBuzz() {
    for count in 0...100 {
        if count % 3 == 0 && count % 5 == 0 {
            print("Fizz Buzz")
        } else if count % 3 == 0 {
            print("Fizz")
        } else if count % 5 == 0 {
            print("Buzz")
        } else {
            print(count)
        }
    }
}

fizzBuzz()
