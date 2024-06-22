//: [Previous](@previous)

import Foundation

// T(n - 1) + 1

func recurrence1(n: Int) {
    if n > 0 {
        print(n)
        recurrence1(n: n - 1)
    }
}

recurrence1(n: 5)
