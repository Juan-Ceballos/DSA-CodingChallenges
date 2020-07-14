//: [Previous](@previous)

import Foundation

//same characters if reversed isPalindrome
func isPalindrome(input: String) -> Bool {
    let lowercased = input.lowercased()
    return String(lowercased.reversed()) == lowercased
}

isPalindrome(input: "hello")
isPalindrome(input: "rotator")
