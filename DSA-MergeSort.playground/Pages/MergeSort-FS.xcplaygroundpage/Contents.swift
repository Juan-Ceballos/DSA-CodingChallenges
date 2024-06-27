func merge(left: [Int], right: [Int]) -> [Int] {
  let leftSize = left.count - 1
  let rightSize = right.count - 1
  var i = 0
  var j = 0
  var result: [Int] = []
  while i <= leftSize && j <= rightSize {
    if left[i] <= right[j] {
      result.append(left[i])
      i += 1
    }
    else {
      result.append(right[j])
      j += 1
    }
  }
  if i <= leftSize {
    result.append(contentsOf: left[i...])
  }
  if j <= rightSize {
    result.append(contentsOf: right[j...])
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
    return merge(left: leftSort, right: rightSort)
}
print("1")
let sampleArr = [4, 8, 2, 5, 1]
let resultArr = mergeSort(arr: sampleArr)
print(resultArr)

