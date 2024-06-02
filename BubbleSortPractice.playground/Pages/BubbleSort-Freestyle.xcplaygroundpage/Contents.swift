//: [Previous](@previous)

import Foundation

let sampleArr = [7, 3, 5, 1, 4, 2, 6]

/*
 Bubble Sort Algo
 Iterate through entire array up to second last element
 using the iterator index into current element
 using (iterator value + 1) index the array to access following adjacent value
 store this value in a temporary variable
 if current value greater or equal to adjacent value swap element poistion in array
 else iterate to next element
 repeat process a number of times equal to array using outer while loop
 */

func sortBubble(arr: [Int]) -> [Int] {
    var result = arr
    let n = result.count - 1
    var count = 0
    while count < n {
        for i in 0..<n {
            let curr = result[i]
            let adj = result[i + 1]
            if curr >= adj {
                result.swapAt(i, i + 1)
            }
        }
        count += 1
    }
    return result
}

let bSortedArr1 = sortBubble(arr: sampleArr)
//print(bSortedArr1)

/*
 iterate through full array n times n being count of array
 set up count to keep track of array size
 for each full iterationg add one to count up to the size of array
 inner loop index into current position in array based on the iterator and compare it to the adjacent value i + 1 if larger swap else continue
 return arr when done with both loops
 */

func bubbleSort2(arr: [Int]) -> [Int] {
    var resultArr = arr
    var count = 0
    var arrSize = arr.count - 1
    
    while count < arrSize {
        for i in 0..<arrSize {
            let curr = resultArr[i]
            let adj = resultArr[i + 1]
            
            if curr >= adj {
                resultArr.swapAt(i, i + 1)
            }
        }
        count += 1
    }
    
    return resultArr
}

//print(bubbleSort2(arr: sampleArr))

//-------------------------------------------------------------

// 3

var sampleArr3 = [7, 3, 5, 1, 4, 2, 6]

func bubbleSort3(arr: inout [Int]) {
    
    var count = arr.count - 1
    
    while count > 0 {
        for i in 0..<count {
            let curr = arr[i]
            if curr >= arr[i + 1] {
                arr.swapAt(i, i + 1)
            }
        }
        count -= 1
    }
    
}

bubbleSort3(arr: &sampleArr3)
print(sampleArr3)
