//: [Previous](@previous)

import Foundation

func longestPrefix(input: String)  -> String  {
    let seperatedWordArr = input.components(separatedBy: " ")
    var currentPrefix = seperatedWordArr[0]
    var bestPrefix = ""
    var bestPrefixFound = false
    
    for word in seperatedWordArr {
        bestPrefixFound = false
        while bestPrefixFound == false {
            if word.hasPrefix(currentPrefix) {
                bestPrefix = currentPrefix
                bestPrefixFound = true
                //print(bestPrefix)
                //print(currentPrefix)
                //print(word.hasPrefix(bestPrefix))
            } else {
                currentPrefix.popLast()
                //print(currentPrefix)
            }
        }
    }
    
    return bestPrefix
}

longestPrefix(input: "hello her help")
//let input = "hello her help"
//let seperated = input.components(separatedBy: " ")
//print(seperated)
//var curr = seperated[0]
//curr.popLast()
//print(curr)
