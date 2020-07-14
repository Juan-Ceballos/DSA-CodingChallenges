import UIKit

// Unique Strings case sensitive
func challenge1(input: String) -> Bool   {
    // best thing for checking unique letters
    // dictionary?
    // stack
    // letter goes in stack, no set
    var checkSet = Set<Character>()
    for char in input   {
        checkSet.insert(char)
    }
    
    if checkSet.count == input.count {
        return true
    }
    else {
       return false
    }
}

// 1 line
func cleanerChallenge1(input: String) -> Bool {
    // can turn string collection into a set collection
    // return result of condition itself
    return Set(input).count == input.count
}

print(Set("Hello"))
assert(challenge1(input: "No duplicates") == true, "Challenge 1 failed")
assert(challenge1(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(challenge1(input: "AaBbCc") == true, "Challenge 1 failed")
assert(challenge1(input: "Hello, world") == false, "Challenge 1 failed")
