//: [Previous](@previous)

import Foundation

// string plosion - given string Code
// return CCoCodCode

// break string up into array for each character
// for each char for each array size, add chars to empty string

func stringSplosion(input: String) -> String {
    var result = ""
    let inputArr = Array(input)
    
    for (index, _) in inputArr.enumerated() {
        for num in 0...inputArr.count - 1 {
            result += String(inputArr[num])
            if num == index {
                break
            }
        }
    }
    print(inputArr)
    
    return result
}

print(stringSplosion(input: "code"))
