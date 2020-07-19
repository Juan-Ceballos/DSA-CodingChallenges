//: [Previous](@previous)

import Foundation

func isRotated(word1: String, word2: String) -> Bool   {
    // contains the same collection of characters
    // swift and ftswi
    // swift and wifts
    // swift and swift, swift
    // first letter is anchor
    // [s, w, i, f, t]
    // find f t s w i
    // go up to s index and see if sub collection is there
    let wordTwice = word1 + word1
    if word1.count == word2.count   {
        return wordTwice.contains(word2)
    }
    else    {
        return false
    }
}

isRotated(word1: "cat", word2: "atc")
