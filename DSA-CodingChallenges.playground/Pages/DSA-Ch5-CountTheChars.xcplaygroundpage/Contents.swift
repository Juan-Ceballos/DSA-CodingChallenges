//: [Previous](@previous)

import Foundation

//number of times input char appears in string
func charCount(word: String, letter: Character) -> Int   {
    // apple, p
    // 2
    // freq dict, for loop with count, recursion
    var count = 0
    for char in word {
        if char == letter {
            count += 1
        }
    }
    return count
}

charCount(word: "applep", letter: "p")
