import Foundation

func partition(arr: inout [Int]) -> Int {
    
    var low = 0
    var high = arr.count - 1
    var pivot = low + (high - low) / 2
    
    while low < high {
        let lowVal = arr[low]
        let highVal = arr[high]
        let pivotVal = arr[pivot]
        
        if lowVal > pivotVal {
            arr.swapAt(low, pivot)
            low += 1
        }
        else if highVal < pivotVal {
            arr.swapAt(high, pivot)
            high -= 1
        } else {
            low += 1
            high -= 1
        }
    }
    
    print(arr)
    return arr[pivot]
}

var sampleArr = [5, 3, 2, 7, 1]

let partitionVal = partition(arr: &sampleArr)

print(partitionVal)
