//: [Previous](@previous)

import Foundation

// write your own .contains() ignoring case

extension String    {
    func fuzzyContains(input: String) -> Bool {
        // .range(of: _) return the position of one string in another
        // if doesn't exist returns nil
        return self.range(of: input, options: .caseInsensitive) != nil
    }
}

