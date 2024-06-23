//: [Previous](@previous)

import Foundation

// T(n - 1) + 1

// counts down n, n - 1
func recurrence1(n: Int) {
    if n > 0 {
        print(n)
        recurrence1(n: n - 1)
    }
    
}
print("1:")
recurrence1(n: 5)

//
// do something 5 times like a for loop
// do somthing with numbesr from n to n > 0
// adjust conditionl
// add more recurring var
func recurrence2(n: Int) {
    
    let arr = [0, 1, 2 , 3, 4]
    if n > 0 {
        print(arr[n  - 1])
        recurrence2(n: n - 1)
    }
}

print("2:")
recurrence2(n: 5)
print("end")

//

func recurrence3(n: Int, sum: Int) -> Int {
    
    if n > 0 {
        return recurrence3(n: n - 1, sum: sum + n)
    }
    
    return sum
}

var sum3 = 0
let result3 = recurrence3(n: 5, sum: sum3)
print("3:")
print(result3)


func recurrence4(n: Int, sum: Int) -> Int {
    
    if n > 0 {
        return recurrence4(n: n - 1, sum: sum + n)
    }
    
    return sum
}

var sum4 = 0
let result4 = recurrence3(n: 5, sum: sum4)
print("4:")
print(result4)
