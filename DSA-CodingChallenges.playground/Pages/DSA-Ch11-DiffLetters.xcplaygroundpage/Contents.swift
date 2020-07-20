//: [Previous](@previous)

import Foundation

func offByThree(input1: String, input2: String) -> Bool   {
    // no more than three different letters
    // same lenght, same order
    
    // convert string collection of chars to array collection of chars
    let input1Arr = Array(input1)
    let input2Arr = Array(input2)
    var count = 0
    
    if input1Arr.count == input2Arr.count   {
        for (index, element) in input1Arr.enumerated()   {
            if element == input2Arr[index]  {
                count += 1
            }
        }
    } else {return false}
    return count >= input1Arr.count - 3
}

offByThree(input1: "clamp", input2: "maple")
