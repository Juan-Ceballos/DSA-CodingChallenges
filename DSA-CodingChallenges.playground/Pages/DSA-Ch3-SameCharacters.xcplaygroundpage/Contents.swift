//: [Previous](@previous)

import Foundation

// do they contain same characters
// tried doing it w/out remove by checking if count the same but
// second word can "contain" all letters of first w/ same count
// since it only checks if any of the addresses has said letter
// left count in but w/ .remove(at: _) don't need it can return .count == 0 at end
func sameChars(input1: String, input2: String) -> Bool  {
    var input2Clone = input2
    // arrays, strings, dict, sets
    if input1.count != input2.count {
        return false
    }
    else {
        for char in input1 {
            if let firstIndex = input2Clone.firstIndex(of: char) {
                input2Clone.remove(at: firstIndex)
            } else {return false}
        }
    }
    return true
}

// cleaner solution using .sorted()
// sort first than compare. Sorting algorithms? Sort alphabetical order.
func challenge3b(string1: String, string2: String) -> Bool {
    return string1.sorted() == string2.sorted()
}

sameChars(input1: "char", input2: "char")
sameChars(input1: "dot", input2: "doo")
sameChars(input1: "car", input2: "card")
sameChars(input1: "doo", input2: "dot")
// "tar" and "rat" = true
