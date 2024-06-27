import Foundation

func binarySearch(arr: [Int], target: Int) -> Bool {
    let left = 0
    let right = arr.count - 1
    
    while left < right {
        let mid = left + (right - left) / 2
        if mid > target {
            right = mid - 1
        } if mid < target {
            left = mid + 1
        } else {
            return true
        }
    }
    
    return false
}

var sampleArr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

let found = binarySearch(arr: sampleArr, target: 2)
print(found)
