//: [Previous](@previous)

import Foundation

func findPangram(input: String) -> Bool {
    // string has every letter at least once
    // not case sensitive
    let lowerCased = input.lowercased()
    var letterSet = Set<Character>()
    for char in lowerCased {
        if char.isLetter    {
            letterSet.insert(char)
        }
    }
    
    return letterSet.count == 26
}

findPangram(input: "The quick brown fox jumped over the lazy dog")
