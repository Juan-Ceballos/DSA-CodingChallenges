//: [Previous](@previous)

import Foundation

// remove extra spaces a[ ][ ]b = a[]b

private func formatSpacing(input: String) -> String    {
    // "a   b   c"
    var formatInput = ""
    var seenSpace = false
    for char in input {
        if char == " " {
            if seenSpace {continue}
            seenSpace = true
            } else {
            seenSpace = false
        }
        formatInput.append(char)
    }
    return formatInput
}

