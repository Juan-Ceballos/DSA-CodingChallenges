//: [Previous](@previous)

import Foundation

//same characters if reversed isPalindrome
func isPalindrome(input: String) -> Bool {
    let lowercased = input.lowercased()
    return String(lowercased.reversed()) == lowercased
}

isPalindrome(input: "hello")
isPalindrome(input: "rotator")
isPalindrome(input: "A man, a plan, a canal: Panama")
// mb try w/out using .reversed()

func isPalindromeAdvanced(_ s: String) -> Bool  {
    var arrS = Array(s.lowercased())
    //print(arrS)
    
    for (index, element) in arrS.enumerated() {
        if !element.isLetter && !element.isNumber   {
            arrS[index] = Character(" ")
        }
    }
    
    let removeSpaces = String(arrS).replacingOccurrences(of: " ", with: "")
    return String(removeSpaces.reversed()) == removeSpaces
}

isPalindromeAdvanced("Hello!")
isPalindromeAdvanced("A man, a plan, a canal: Panama")
