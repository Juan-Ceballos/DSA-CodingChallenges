func merge(leftArr: [Int], rightArr: [Int]) -> [Int] {
  let leftSize = leftArr.count
  let rightSize = rightArr.count
  var leftIndex = 0
  var rightIndex = 0
  var result: [Int] = []
  while leftIndex < leftSize && rightIndex < rightSize {
    if leftArr[leftIndex] <= rightArr[rightIndex] {
      result.append(leftArr[leftIndex])
      leftIndex += 1
    }
    else {
      result.append(rightArr[rightIndex])
      rightIndex += 1
    }
  }
  if leftIndex <= leftSize {
    result.append(contentsOf: leftArr[leftIndex...])
  }
  if rightIndex <= rightSize {
    result.append(contentsOf: rightArr[rightIndex...])
  }
  return result
}
func mergeSort(arr: [Int]) -> [Int] {
  if arr.count <= 1 {
    return arr
  }
    let mid = arr.count / 2
    let leftArr = Array(arr[0..<mid])
    let rightArr = Array(arr[mid..<arr.count])
    let leftSort = mergeSort(arr: leftArr)
    let rightSort = mergeSort(arr: rightArr)
    return merge(leftArr: leftSort, rightArr: rightSort)
}
print("1")
let sampleArr = [4, 8, 2, 5, 1]
let resultArr = mergeSort(arr: sampleArr)
print(resultArr)
print("end")
// 2

func merge2(leftArr: [Int], rightArr: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var leftSize = leftArr.count
    var rightSize = rightArr.count
    var sortedArr = [Int]()
    
    while leftIndex < leftSize && rightIndex < rightSize {
        if leftArr[leftIndex] <= rightArr[rightIndex] {
            sortedArr.append(leftArr[leftIndex])
            leftIndex += 1
        } else {
            sortedArr.append(rightArr[rightIndex])
            rightIndex += 1
        }
    }
    
    if leftIndex <= leftSize {
        sortedArr.append(contentsOf: leftArr[leftIndex...])
    }
    
    if rightIndex <= rightSize {
        sortedArr.append(contentsOf: rightArr[rightIndex...])
    }
    
    return sortedArr
}

func mergeSort2(arr: [Int]) {
    
}
