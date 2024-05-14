import Foundation

/*
 Create a function that accepts an array of unsorted numbers from 1 to 100 where zero or more
 numbers might be missing, and returns an array of the missing numbers.
 Sample input and output
 If your test array were created like this:
 var testArray = Array(1...100)
 testArray.remove(at: 25)
 testArray.remove(at: 20)
 testArray.remove(at: 6)
 Then your method should [7, 21, 26], because those are the numbers missing from the array.
 
 Hints
 Hint #1: There’s a naïve solution involving arrays, but it’s very slow.
 Hint #2: You should try using a Set, which has a significantly faster contains() method.
 Hint #3: You can compute the different between two sets using symmetricDifference().
 */

/*
 Questions:
 inputs: array of ints, unsorted
 output: array of missing number from 1 to 100
 
 edge: empty -> return 1 to 100 array
 
 [1, 9, 10]
 
 
 Algo:
 
 go from 0 to 100 = num
 if input.contains(num), continue
 else add to empty array
 at end return array
 
 sample input
 var testArray = Array(1...100)
 testArray.remove(at: 25)
 testArray.remove(at: 20)
 testArray.remove(at: 6)
 
 1 cont...7 not add[7]
 return
 
 Pseudo:
 */

func findMissingNumbers(input: [Int]) -> [Int] {
    var result = [Int]()
    for count in 0...100 {
        if !input.contains(count) {
            result.append(count)
        }
    }
    return result
}

print(findMissingNumbers(input: Array(5...95)))
