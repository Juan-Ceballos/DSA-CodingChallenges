import Foundation

func binarySearch(arr: [Int], target: Int) -> Int? {
    var left = 0
    var right = arr.count - 1
    
    while left <= right {
        let mid = left + (right - left) / 2

        if arr[mid] == target {
            return mid
        }
        
        else if arr[mid] > target {
            right = mid - 1
        } else  {
            left = mid + 1
        }
    }
    
    return nil
}

var sampleArr = [1, 2, 3, 4, 5, 6, 7, 8, 9]

let found = binarySearch(arr: sampleArr, target: 3)
print(found ?? -1)
