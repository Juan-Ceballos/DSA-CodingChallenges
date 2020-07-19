//: [Previous](@previous)

import Foundation

// remove duplicate letters

func removeDups(input: String) -> String  {
    // put the string in a set
    // holding each char in a place in memory
    //
    
    // let inputToSet = Set(input)
    // let backToString = String(inputToSet)
    // return backToString
    // need NSOrderedSet
    
    // .contains, for loop
    var modifiedWord = [Character]()
    for char in input   {
        if !modifiedWord.contains(char) {
            modifiedWord.append(char)
        }
    }
    
    return String(modifiedWord)
    
}


removeDups(input: "hello")
