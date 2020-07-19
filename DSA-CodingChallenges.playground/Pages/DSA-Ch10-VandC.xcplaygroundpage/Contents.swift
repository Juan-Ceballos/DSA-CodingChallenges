//: [Previous](@previous)

import Foundation

func vowelsConsonants(input: String) -> (Int, Int)  {
    // return number of vowels and consonants
    // not case sensitive
    // Apple = v: 2, c: 3
    // letters only
    // not unique Vs and Cs
    
    // an array of vowels
    // 2 counts
    // for loop to compare lowercased version
    //
    let vowels: [Character] = ["a", "e", "i", "o", "u"]
    var vowelCount = 0
    var consonantCount = 0
    let lowercased = input.lowercased()
    
    for letter in lowercased {
        if vowels.contains(letter) && letter.isLetter  {
            vowelCount += 1
        }
        else if letter.isLetter {
            consonantCount += 1
        }
    }
    
    return (v: vowelCount, c: consonantCount)
}

vowelsConsonants(input: "Apple!")
