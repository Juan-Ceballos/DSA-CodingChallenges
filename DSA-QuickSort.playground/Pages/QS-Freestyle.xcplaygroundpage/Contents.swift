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

//quickSort(arr: &sampleArr, low: 0, high: sampleArr.count - 1)
//print(sampleArr)

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
//quickSort2(arr: &sampleArr2, low: 0, high: sampleArr2.count - 1)
//print(sampleArr2)

//-----------------------------------------------------------------------------

var sampleArr3 = [5, 3, 2, 7, 1]

func partition3(arr: inout [Int], low: Int, high: Int) -> Int {
    var i = low
    var pivot = high
    
    for j in low..<high {
        let pivotVal = arr[pivot]
        let currVal = arr[j]
        let compareVal = arr[i]
        
        // find every value lower than pivot to place before i
        if  currVal <= pivotVal {
            arr.swapAt(i, j)
            i += 1
        }
    }
    
    arr.swapAt(i, pivot)
    return i
}

func quickSort3(arr: inout [Int], low: Int, high: Int) {
    
    if low < high {
        let pivot = partition3(arr: &arr, low: low, high: high)
        // keep doing partition on both sides
        // pivot - 1, pivot + 1, pivot is sorted and place do
        // find middle for the 2 halves
        quickSort3(arr: &arr, low: low, high: pivot - 1)
        quickSort3(arr: &arr, low: pivot + 1, high: high)
    }
}

func quickSort3a(arr: inout [Int], low: Int, high: Int) {
    
    if low < high {
        let pivot = partition3(arr: &arr, low: low, high: high)
        // keep doing partition on both sides
        // pivot - 1, pivot + 1, pivot is sorted and place do
        // find middle for the 2 halves
        let left = arr[low..<pivot]
        let right = arr[(pivot + 1)...]
        //quickSort3a(arr: &<#T##[Int]#>, low: <#T##Int#>, high: <#T##Int#>)
        
        // sorting whole array in palce
        
        quickSort3(arr: &arr, low: low, high: pivot - 1)
        quickSort3(arr: &arr, low: pivot + 1, high: high)
    }
}

//quickSort3(arr: &sampleArr3, low: 0, high: sampleArr3.count - 1)
// print(sampleArr3)

//-----------------------------------------------------------------------------

// 4

func partition4(arr: inout [Int], low: Int, high: Int) -> Int {
    var i = low
    let pivot = high
    
    for j in low..<high {
        let pivotVal = arr[pivot]
        let currVal = arr[j]
        
        if pivotVal >= currVal {
            arr.swapAt(i, j)
            i += 1
        }
    }
    
    arr.swapAt(i, pivot)
    return i
}

func quicksort4(arr: inout [Int], low: Int, high: Int) {
    print()
}

//-----------------------------------------------------------------------------

// 5

var sampleArr5 = [5, 3, 2, 7, 1]

func partition5(arr: inout [Int], low: Int, high: Int) -> Int {
    
    var i = low
    var pivot = high
    
    for j in low..<high {
        let pivotVal = arr[pivot]
        let currVal = arr[j]
        
        if pivotVal >= currVal {
            arr.swapAt(i, j)
            i += 1
        }
    }
    
    arr.swapAt(i, pivot)
    return i
}

func quickSort5(arr: inout [Int], low: Int, high: Int) {
    
    if low < high {
        let pivot = partition5(arr: &arr, low: low, high: high)
        quickSort5(arr: &arr, low: low, high: pivot - 1)
        quickSort5(arr: &arr, low: pivot + 1, high: high)
    }
    
}

//quickSort5(arr: &sampleArr5, low: 0, high: sampleArr5.count - 1)
//print("sample arr 5")
//print(sampleArr5)

//-----------------------------------------------------------------------------

// 6

var sampleArr6 = [5, 3, 2, 7, 1]


func partition6(arr: inout [Int], low: Int, high: Int) -> Int {
    
    var i = low
    
    for j in low..<high {
        let currVal = arr[j]
        let pivotVal = arr[high]
        
        if currVal <= pivotVal {
            arr.swapAt(i, j)
            i += 1
        }
    }
    
    arr.swapAt(i, high)
    return i
}

func quickSort6(arr: inout [Int], low: Int, high: Int) {
    
    if low < high {
        let pivot = partition5(arr: &arr, low: low, high: high)
        quickSort5(arr: &arr, low: low, high: pivot - 1)
        quickSort5(arr: &arr, low: pivot + 1, high: high)
    }
    
}

//quickSort6(arr: &sampleArr6, low: 0, high: sampleArr6.count - 1)
//print("sample arr 6")
//print(sampleArr6)


//-----------------------------------------------------------------------------

var sampleArr7 = [5, 3, 2, 7, 1]

func partition7(arr: inout [Int],  low: Int, high: Int) -> Int {
    
    let pivot = high
    var i = low
    
    for j in low..<high {
        let pivotVal = arr[pivot]
        let currVal = arr[j]
        
        if currVal <= pivotVal {
            arr.swapAt(i, j)
            i += 1
        }
    }
    
    arr.swapAt(i, pivot)
    return i
}

func quickSort7(arr: inout [Int], low: Int, high: Int) {
    
    // recursion
    
    // recursion has  conditional base case stopping point
    if low < high {
        // needs this also to recursively know the two halves, before and after mid index and break down to sort
        let pivot = partition7(arr: &arr, low: low, high: high)
        
        quickSort7(arr: &arr, low: low, high: pivot - 1)
        quickSort7(arr: &arr, low: pivot + 1, high: high)
    }
    
}

print("hello")
quickSort7(arr: &sampleArr7, low: 0, high: sampleArr7.count - 1)
print(sampleArr7)


var sampleArr8 = [5, 3, 2, 7, 1]

func partition8(arr: inout [Int], low: Int, high: Int) -> Int {
    var i = low
    let pivotVal = arr[high]
    
    for j in low..<high {
        let currVal = arr[j]
        if currVal <= pivotVal {
            arr.swapAt(i, j)
            i += 1
        }
    }
    
    arr.swapAt(i, high)
    return i
}

func quickSort8(arr: inout [Int], low: Int, high: Int) {
    
    if low < high {
        let pivot = partition8(arr: &arr, low: low, high: high)
        quickSort8(arr: &arr, low: low, high: pivot - 1)
        quickSort8(arr: &arr, low: pivot + 1, high: high)
    }
}

quickSort8(arr: &sampleArr8, low: 0, high: sampleArr8.count - 1)
print("8")
print(sampleArr8)
