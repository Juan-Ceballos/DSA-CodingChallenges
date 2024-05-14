//: [Previous](@previous)

import Foundation

/*
 Questions
 Empty returns empty array, all lowercase
 
 In/Out
 "" -> []
 "a" -> ["a"]
 "ab" -> ["ab", "ba"]
 "abc" -> ["abc", "acb", "bac", "bca", "cab", "cba"]
 "wombat" -> 720 permutations
 
 Algo
 1) simplest return is "a", 1 character
 2) if arr.count < 2 {return ["a"]}
 3) ["a", "b"] -> ab ba
 */

func permutations(string: String, current: String = "") {
    let length = string.count
    // abc, length = 3
    let strArray = Array(string)
    // strArray = ["a", "b", "c"]
    if (length == 0) {
        // there's nothing left to re-arrange; print the result
        print(current)
        print("******") }
    else {
            print(current) // current = ""
            // loop through every character
            for i in 0 ..< length { // a
                // get the letters before me
                print("i \(i)")
                print(strArray)
                print(current)
                let left = String(strArray[0 ..< i]) // ""
                print("left \(left)")
                // get the letters after me
                let right = String(strArray[i+1 ..< length]) // "bc"
                print("right \(right)")
                // put those two together and carry on
                permutations(string: left + right, current: current +
                                String(strArray[i])) // "" + bc, "" + "a"
            } }
    
    
}

//permutations(string: "a")
//permutations(string: "ab")
permutations(string: "abc")
