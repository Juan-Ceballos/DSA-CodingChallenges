import Foundation

func partition(arr: inout [Int], low: Int, high: Int) -> Int {
    var low = low
    var high = high
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
    
    //print(arr)
    return pivot
}

func quickSort(arr: inout [Int], low: Int, high: Int) {
    /*
     [1, 2, 3, 4, 5] - [], [], p?
     
     */
    //split an array
    //let low = 0
    //let high = arr.count - 1
    //while
    if low < high {
        let j = partition(arr: &arr, low: low, high: high)
        quickSort(arr: &arr, low: low, high: j - 1)
        quickSort(arr: &arr, low: j + 1, high: high)
    }
    
}

var sampleArr = [5, 3, 2, 7, 1]

//let partitionVal = partition(arr: &sampleArr)

//print(partitionVal)

quickSort(arr: &sampleArr, low: 0, high: sampleArr.count - 1)
print(sampleArr)

//-----------------------------------------------------------------------------


func partition2(arr: inout [Int], low: Int, high: Int) -> Int {
    var i = low
    var pivot = high
    
    for j in low..<high {
        if arr[j] <= arr[pivot] {
            arr.swapAt(i, j)
            i += 1
        }
    }
    
    arr.swapAt(i, high)
    return i
}

func quickSort2(arr: inout [Int], low: Int, high: Int) {
    
    if low < high {
        var j = partition2(arr: &arr, low: low, high: high)
        quickSort2(arr: &arr, low: low, high: j - 1)
        quickSort2(arr: &arr, low: j + 1, high: high)
    }
}

var sampleArr2 = [5, 3, 2, 7, 1]
quickSort2(arr: &sampleArr2, low: 0, high: sampleArr2.count - 1)
print(sampleArr2)


