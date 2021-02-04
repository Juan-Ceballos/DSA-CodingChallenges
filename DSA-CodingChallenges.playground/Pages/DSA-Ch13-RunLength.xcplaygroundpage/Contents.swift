//: [Previous](@previous)

import Foundation

func RunLengthIndex(str: String) -> String {
    
    var count = 1
    var tempArr = Array(str)
    //var currentLetter = tempArr[0]
    var tempStr = ""
    
    if tempArr.isEmpty {
        return ""
    }
    
    for num in 0...tempArr.count - 1 {
        
        var currentLetter = tempArr[num]
        
        if tempArr.count == 1 {
            return String(currentLetter) + String(count)
        }
        
        if num == tempArr.count - 1 {
            if tempArr[tempArr.count - 1] == tempArr[tempArr.count - 2] {
                tempStr += String(currentLetter) + String(count)
                break
            } else {
                tempStr += String(currentLetter) + String(count)
                break
            }
        }
        
        if tempArr[num] == tempArr[num + 1] {
            count += 1
        } else {
            tempStr += String(currentLetter) + String(count)
            count = 1
        }
    }
    
    print(tempArr)
    print(tempStr)
    return tempStr
}

RunLengthIndex(str: "")

let someStr = ""
var someArr = Array(someStr)
print(someArr)
