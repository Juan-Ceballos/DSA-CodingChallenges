import UIKit

func slidingWindowExample(arr: [Int], k: Int) -> Int {
    var leftPointer = 0
    var rightPointer = 0
    var currentSum = 0
    var result = Int.min
    
    while rightPointer < arr.count {
        // Expand the window by adding the current element
        currentSum += arr[rightPointer]
        
        // Check if the current window satisfies the condition
        if rightPointer - leftPointer + 1 == k {
            // Update result if necessary
            result = max(result, currentSum)
            
            // Shrink the window from the left
            currentSum -= arr[leftPointer]
            leftPointer += 1
        }
        
        // Move the right pointer to expand the window
        rightPointer += 1
    }
    
    return result
}

/*
 Window Definition:
 
 The window is defined by two pointers (often called left and right or start and end), which mark the boundaries of the current subarray or subsequence.
 Initialization:
 
 Initialize the pointers to the start of the array or sequence.
 Set up any necessary variables (like current sum, max sum, or any counters) before entering the main loop.
 Expanding the Window:
 
 The right pointer is moved to include new elements into the window.
 Update the state (like current sum or count) with the newly included element.
 Condition Check:
 
 Check if the current window satisfies the condition of the problem.
 Depending on the condition, decide whether to move the left pointer to shrink the window or perform other updates.
 Shrinking the Window:
 
 When the condition is not satisfied or needs re-evaluation, move the left pointer to exclude elements from the window.
 Update the state (like current sum or count) by removing the excluded element.
 Result Calculation:
 
 Throughout the process, track the result (like maximum sum, minimum length, etc.) and update it when necessary.
 
 Conclusion:
 All sliding window implementations share the core principles of defining a window with two pointers, expanding and shrinking the window based on conditions, and updating the result efficiently. This approach helps solve problems involving contiguous subarrays or subsequences in linear time complexity, making it a powerful technique for many algorithmic challenges.
 */

func longestKSubstring2(str: String, k: Int) -> String {
    if k == 0 {
        return ""
    }
    
    let strArr = Array(str)
    var charFreqDict = [Character: Int]()
    var leftPointer = 0
    var longestSubstring = ""
    var currSubstring = ""
    
    for rightPointer in 0..<strArr.count {
        let rightPointerElement = strArr[rightPointer]
        charFreqDict[rightPointerElement, default: 0] += 1
        currSubstring.append(rightPointerElement)
        
        while charFreqDict.count > k {
            let leftElement = strArr[leftPointer]
            charFreqDict[leftElement]! -= 1
            if charFreqDict[leftElement] == 0 {
                charFreqDict.removeValue(forKey: leftElement)
            }
            
            currSubstring.removeFirst()
            leftPointer += 1
        }
        
        if currSubstring.count > longestSubstring.count {
            longestSubstring = currSubstring
        }
    }
    
    return longestSubstring
    
}

print(longestKSubstring2(str: "sdfdsf", k:2))


/*
 Longest Substring with at most K Distinct Characters
 
 Given a string s and an integer k, write a function to find the length of the longest substring in s that contains at most k distinct characters.
 
 Input:
 
 s (String): A string consisting of lowercase English letters.
 k (Int): An integer representing the maximum number of distinct characters allowed in the substring.
 Output:
 
 (Int): The length of the longest substring with at most k distinct characters.
 Constraints:
 
 The length of the input string s will be in the range [1, 10^5].
 The integer k will be in the range [0, 26].
 If k is 0, the function should return 0 because no characters are allowed.
 
 Input:
 s = "eceba"
 k = 2
 
 Output:
 3
 
 Explanation:
 The longest substring with at most 2 distinct characters is "ece", which has a length of 3.
 
 Instructions:
 
 Write a function longestSubstringKDistinct that takes in a string s and an integer k.
 Implement the function to return the length of the longest substring of s that contains at most k distinct characters.
 Optimize your solution for large inputs as the string length can be up to 100,000 characters.
 Note: Use sliding window technique to optimize your solution. Make sure to handle edge cases like k = 0 properly.
 
 */

/*
 
 Question: Find the longest substring that has at least x different types of characters in it.
 
 edge cases
 empty string, k = 0, k > string length, k > 26, k = 1, string of all the same character, string of all different characters
 
 Input: k = 0, s = "a"
 out: ""
 
 input: k = 1, s = "abc"
 out: "a"
 
 input: k = 9, s = "abc"
 out: full string
 
 at most, the bigger k is the more of the substring can possibly be part of the output if k is small
 
 algo:
 
 use a set to keep count of unique characters in a substring
 initialize left pointer at start of list
 initialize right pointer at second index of list
 check element on right pointer, add element at right pointer to set
 while right pointer is less than count of array
 if count of set is less than or equal to k
 increment right pointer
 add element to a substring
 increase count of substring
 else
 check count of last substring if greater set as new result substring
 move left pointer to right pointer
 move right pointer to left pointer + 1
 
 
 */

// substring is a left to right check so can adjust left as move right
func longestKSubstring(str: String, k: Int) -> String {
    
    if k == 0 {
        return ""
    }
    // dict to keep track of unique chars and count them in string
    var charFreqDict = [Character: Int]()
    // string input as an array
    let strArr = Array(str)
    // left side of window
    var leftPointer = 0
    // tracking the max substring
    var longestSubstring = ""
    // curr substring to check if longest
    var currSubstring = ""
    
    // move right window forward through array
    for rightPointer in 0..<strArr.count {
        // current right element
        let rPElement = strArr[rightPointer]
        // adding char to dict and it's count in substring
        charFreqDict[rPElement, default: 0] += 1
        // add current right element to substring
        currSubstring.append(rPElement)
        
        // check if number of unique characters greater than limit
        // if so go in and reset and move left window
        // where doing this each time in the for loop we add for exceed
        while charFreqDict.count > k {
            // take current left element
            let lPelement = strArr[leftPointer]
            // reduce the frequency count of this element
            charFreqDict[lPelement]! -= 1
            // if down to zero in dict for element
            if charFreqDict[lPelement] == 0 {
                // remove left element from dict
                charFreqDict.removeValue(forKey: lPelement)
            }
            
            /* the count is instances in the string, reducing the count by           one means that in string we removed the left letter and
             went up one and the next letter could be another of the same
             it will keep doing this until left to right has less distinct characters since at 0 we remove it knowing the string is now in limit
             */
            currSubstring.removeFirst()
            leftPointer += 1
        }
        // now that the new string is right back on limit well check length
        if currSubstring.count > longestSubstring.count {
            longestSubstring = currSubstring
        }
    }
    
    // return result
    return longestSubstring
    
}

print(longestKSubstring(str: "String", k: 2))

let str = "aaabbcc"
let str2 = "abaccc"
let str3 = "abcdef"
let str4 = "aabbcc"
let str5 = "abcd"

let num = 2

// Problem 2

/*
 Maximum Sum of Subarray of Size K
 Problem: Given an array of integers and an integer k, find the maximum sum of any contiguous subarray of size k.
 
 
 Given an array of integers arr and an integer k, write a function to find the maximum sum of any contiguous subarray of size k.
 
 arr (Array of Int): An array of integers.
 k (Int): An integer representing the size of the subarray.
 Output:
 
 (Int): The maximum sum of any contiguous subarray of size k.
 Constraints:
 
 The length of the input array arr will be in the range [1, 10^5].
 The integer k will be in the range [1, the length of arr].
 The elements of the input array can be negative, zero, or positive integers.
 
 Input:
 arr = [1, 4, 2, 10, 23, 3, 1, 0, 20]
 k = 4
 
 Output:
 39
 
 Explanation:
 The maximum sum of a subarray of size 4 is obtained from the subarray [10, 23, 3, 1], which sums to 39.
 
 
 
 Input:
 arr = [-1, -2, -3, -4, -5]
 k = 2
 
 Output:
 -3
 
 Explanation:
 The maximum sum of a subarray of size 2 is obtained from the subarray [-1, -2], which sums to -3.
 
 
 
 Input:
 arr = [2, 1, 5, 1, 3, 2]
 k = 3
 
 Output:
 9
 
 Explanation:
 The maximum sum of a subarray of size 3 is obtained from the subarray [5, 1, 3], which sums to 9.
 
 Write a function maxSumSubarray that takes in an array arr and an integer k.
 Implement the function to return the maximum sum of any contiguous subarray of size k.
 Optimize your solution for large inputs as the array length can be up to 100,000 elements.
 Note: Use the sliding window technique to optimize your solution. Ensure that the solution handles arrays with negative numbers correctly.
 */

/*
 Algo:
 
 edge case of k = 0 or k > than arr.count return 0/total sum
 curr sum variable to hold memory to compare to largest
 larget sum variable to hold solution
 set left pointer to 0 for start
 set right pointer at k since size of window subarray
 iterate up to right pointer hitting end of array
 check current sum
 return sum
 */

func maxSumSubarray(arr: [Int], k: Int) -> Int {
    if k == 0 {return 0}
    if k >= arr.count {return arr.reduce(0, +)}
    
    var largestSum = arr[0..<k].reduce(0, +)
    var leftPointer = 0
    
    for rightPointer in k..<arr.count {
        let currSum = arr[leftPointer...rightPointer - 1].reduce(0, +)
        if currSum > largestSum {
            largestSum = currSum
        }
        leftPointer += 1
    }
    
    return largestSum
}

let arr1 = [1, 4, 2, 10, 23, 3, 1, 0, 20]
let arr2 = [-1, -2, -3, -4, -5]
let arr3 = [2, 1, 5, 1, 3, 2]

print("Problem2")
print(maxSumSubarray(arr: arr1, k: 4))
print(maxSumSubarray(arr: arr2, k: 2))
print(maxSumSubarray(arr: arr3, k: 3))
print(maxSumSubarray(arr: arr3, k: 1))

/*
 1:40pm
 Given an array of integers arr and an integer S, write a function to find the length of the smallest contiguous subarray whose sum is greater than or equal to S. If there isn't one, return 0 instead.
 
 arr (Array of Int): An array of integers.
 S (Int): An integer representing the target sum.
 
 (Int): The length of the smallest contiguous subarray whose sum is greater than or equal to S. If no such subarray exists, return 0.
 
 The length of the input array arr will be in the range [1, 10^5].
 The integer S will be a positive integer.
 The elements of the input array can be negative, zero, or positive integers.
 
 Input:
 arr = [2, 3, 1, 2, 4, 3]
 S = 7
 
 Output:
 2
 
 Explanation:
 The smallest subarray with a sum greater than or equal to 7 is [4, 3], which has a length of 2.
 
 Input:
 arr = [1, 4, 4]
 S = 4
 
 Output:
 1
 
 Explanation:
 The smallest subarray with a sum greater than or equal to 4 is [4], which has a length of 1.
 
 Input:
 arr = [1, 1, 1, 1, 1, 1, 1, 1]
 S = 11
 
 Output:
 0
 
 Explanation:
 There is no subarray with a sum greater than or equal to 11, so the function returns 0.
 
 Write a function minSubArrayLen that takes in an integer S and an array arr.
 Implement the function to return the length of the smallest contiguous subarray whose sum is greater than or equal to S. If no such subarray exists, return 0.
 Optimize your solution for large inputs as the array length can be up to 100,000 elements.
 */

/*
 Algo:
 
 sum >= s/target
 if equal stop
 if greater save move window compare to last sum
 if less than keep adding
 
 set smallestSum variable to hold return to 0 <= s >= target
 set count to track number of elements that make up sum
 left pointer to start at 0
 iterate using right pointer
 set currSum var to hold current sum as iterating through array
 add to sum, counter ++
 check sum if equal set to smallest and count
 if greater  check sum and count
 if less keep adding update count only
 return count
 */
// difference between right and left take sum?
func minSubArrayLen(_ s: Int, _ arr: [Int]) -> Int {
    var count = arr.count
    var currentCount = 0
    var leftPointer = 0
    var currSum = 0
    var equalFound = false
    
    for rightPointer in 0..<arr.count {
        currSum += arr[rightPointer]
        currentCount += 1
        if currSum == s {
            equalFound = true
            if currentCount < count {
                count = currentCount
                //leftPointer = rightPointer
                currentCount = 0
                currSum = 0
            }
        } else if currSum > s && equalFound == false {
            if currentCount < count {
                count = currentCount
                //leftPointer = rightPointer
                currentCount = 0
                currSum = 0
            }
        }
    }
    return count
}
print("Problem 3")
let msArr1 = [1, 2, 3, 4, 5]
let msS1 = 11
print(minSubArrayLen(msS1, msArr1))

func minSubArray2(_ s: Int, _ arr: [Int]) -> Int {
    var count = 0
    var smallestCount = arr.count
    var leftPointer = 0
    var currSum = 0
    
    for rightPointer in 0..<arr.count {
        currSum += arr[rightPointer]
        count += 1
        while currSum > s {
            currSum -= arr[leftPointer]
            smallestCount = (rightPointer - leftPointer) + 1
            leftPointer += 1
        }
        if currSum == s {
            if count < smallestCount {
                smallestCount = count
            }
        }
    }
    
    return smallestCount
}

print("Problem 3")
let msArr2 = [2, 3, 1, 2, 4, 3]
let msS2 = 7
print(minSubArray2(msS2, msArr2))

// correct solution to above
// misunderstood question which resulted in wrong functions above
func minSubArray3(_ s: Int, _ arr: [Int]) -> Int {
    // largest lenght is int max
    var smallestLength = Int.max
    // start left pointer at 0
    var leftPointer = 0
    // current sum to compare to target
    var currSum = 0
    
    // move right pointer through array
    for rightPointer in 0..<arr.count {
        // add current element of right pointer to sum start of window
        currSum += arr[rightPointer]
        // if hit sum greater or equal to target do following
        while currSum >= s {
            // grab min between current length and difference in pointer
            // that triggered condition
            smallestLength = min(smallestLength, rightPointer - leftPointer + 1)
            // subtract left pointer value and move up to check other subs
            currSum -= arr[leftPointer]
            leftPointer += 1
        }
    }
    
    // return check conditional
    return smallestLength == Int.max ? 0 : smallestLength
}

print("Problem 3")
let msArr3 = [2, 3, 1, 2, 4, 3]
let msS3 = 7
print(minSubArray3(msS3, msArr3))

/*
 DSA Question Prompt: Maximum Sum Subarray of Size K
 Given an array of integers arr and an integer k, write a function to find the maximum sum of any contiguous subarray of size k.
 
 arr (Array of Int): An array of integers.
 k (Int): An integer representing the size of the subarray.
 
 (Int): The maximum sum of any contiguous subarray of size k.
 
 The length of the input array arr will be in the range [1, 10^5].
 The integer k will be a positive integer and will be less than or equal to the length of arr.
 The elements of the input array can be negative, zero, or positive integers.
 
 Input:
 arr = [2, 1, 5, 1, 3, 2]
 k = 3
 
 Output:
 9
 
 Explanation:
 The maximum sum of a subarray of size 3 is [5, 1, 3], which sums to 9.
 
 Input:
 arr = [2, 3, 4, 1, 5]
 k = 2
 
 Output:
 7
 
 Explanation:
 The maximum sum of a subarray of size 2 is [3, 4], which sums to 7.
 
 Input:
 arr = [-1, 4, -2, 5, -3, 6]
 k = 2
 
 Output:
 8
 
 Explanation:
 The maximum sum of a subarray of size 2 is [5, -3, 6], which sums to 8.
 */

/*
 Algo:
 
 leftPointer = 0
 rightPointer = k
 add between the pointers
 keep track of sum
 iterate till right hits end of array
 
 */

func maxSumSubarrayOfSizeK(_ k: Int, _ arr: [Int]) -> Int {
    var currentSum = 0
    var largestSum = Int.min
    var leftPointer = 0
    
    for rightPointer in k - 1..<arr.count {
        let currSubArraySum = arr[leftPointer..<k].reduce(0, +)
        if currSubArraySum > largestSum {
            largestSum = currSubArraySum
        }
        leftPointer += 1
    }
    
    return largestSum
}

print("Problem 4")
print(maxSumSubarrayOfSizeK(3, [2, 1, 5, 1, 3, 2]))

func maxSumSubK(_ k: Int, _ arr: [Int]) -> Int {
    var currentSum = 0
    var largestSum = Int.min
    var leftPointer = 0
    
    for rightPointer in 0..<arr.count {
        currentSum += arr[rightPointer]
        if rightPointer >= k - 1 {
            largestSum = max(currentSum, largestSum)
            currentSum -= arr[leftPointer]
            leftPointer += 1
        }
    }
    
    return largestSum
}

print(maxSumSubK(3, [2, 1, 5, 1, 3, 2]))

//

/*
 Given an array of positive integers arr and a positive integer S, find the minimal length of a contiguous subarray of which the sum is greater than or equal to S. If there isn't one, return 0 instead.
 
 arr (Array of Int): An array of positive integers.
 s (Int): A positive integer representing the target sum.
 
 (Int): The minimal length of a contiguous subarray of which the sum is greater than or equal to S. If there isn't one, return 0.
 
 The length of the input array arr will be in the range [1, 10^5].
 The elements of the input array will be positive integers.
 s will be a positive integer.
 
 
 Input:
 arr = [2, 3, 1, 2, 4, 3]
 s = 7
 
 Output:
 2
 
 Explanation:
 The subarray [4, 3] has the minimal length of 2 with a sum >= 7.
 
 
 Input:
 arr = [1, 4, 4]
 s = 4
 
 Output:
 1
 
 Explanation:
 The subarray [4] has the minimal length of 1 with a sum >= 4.
 
 
 Input:
 arr = [1, 1, 1, 1, 1, 1, 1, 1]
 s = 11
 
 Output:
 0
 
 Explanation:
 There is no subarray with a sum >= 11.
 
 
 
 Algo:
 set leftPointer to 0
 set currSum = 0
 currLength = 0
 iterate through array with rightPointer
 add rightPointer element to currentSum
 check if sum is greater to or equal to input s/target
 while it is check length to set min to newLength
 remove left pointer element
 increment left pointer index
 return length
 */

func minLengthSubArray(arr: [Int], s: Int) -> Int {
    var leftPointer = 0
    var currSum = 0
    var minLength = Int.max
    
    for rightPointer in 0..<arr.count {
        currSum += arr[rightPointer]
        //currLength += 1
        
        while currSum >= s {
            minLength = min(minLength, rightPointer - leftPointer + 1)
            currSum -= arr[leftPointer]
            leftPointer += 1
        }
    }
    
    // if min length == max return 0 if not min length
    return minLength == Int.max ? 0 : minLength
}
print("problem 5")
//

// Notes
/*
 Sliding window maintains/stores sum or calculations of subarray by adjusting the window by incrementing left and right and only removing element no longer required in window, this removes all the repitive calculation done by re-evaluating all elements in window each time you have to move outer loop  to check the next subarray
 
 if k is static and problem can be tracked with one calculation of elements in subarray can just check window size and do conditional to see if calculation in subarray satisfy requirement or not
 
 
 */

func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
    // nums array of student scores
    // k number of students choosing from array
    // calculate difference between largest and smallest
    // track and return lowest difference
    /*
     Algo1:
     variable to hold largest
     variable to hold lowest
     left pointer variable starts at 0
     variable for smallestDifference
     iterate using right pointer from 0 to end of array
     variable store current element
     check if largest
     check if lowest
     if right - left + 1 == k you reached window size of k check for difference
     check for difference store
     move window left
     do we need to do anything with current left element?
     9, 4, 1, 7
     9, 4, 1
     9, 4, 7
     9, 1, 7
     Hint: sort so contiguous are the closest
     turn it into a sliding window by sorting it
     1, 4, 7, 9
     first window is 1, 4, 7
     smallest 1, largest 7
     nothing is going to be a smaller difference with 1 the left than what's in that window
     since outside everythin is greater when sorted
     so can move from one on to next since the smallest is required so can't use
     going left through smallest in window and the window has the limit largest for size
     1 is done and no other set with 1 works
     Algo 2:
     variable for sorted nums
     variable for left pointer set to 0
     variable for smallest difference set to Int.max
     iterate to end of array using right pointer
     if window size k as in right - left + 1 equals k limit reached check and adjust window
     check difference between left and right pointer element to set as smallest diff var
     move left pointer +1
     return smallest difference variable
     */
    if nums.count < 2 {return 0}
    var leftPointer = 0
    var smallestDifference = Int.max
    var sortedNums = nums.sorted {$0 < $1}
    for rightPointer in 0..<sortedNums.count {
        if rightPointer - leftPointer + 1 == k {
            let currentDifference = sortedNums[rightPointer] - sortedNums[leftPointer]
            if smallestDifference > currentDifference {
                smallestDifference = currentDifference
            }
            leftPointer += 1
        }
    }
    return smallestDifference
}
print("problem 6")
print(minimumDifference([1, 9, 4, 7], 3))

func divisorSubstrings(_ num: Int, _ k: Int) -> Int {
    // the number of contiguous substring that is a divisor of num
    // substring of size k
    /*
     Determine divisor
     int division remainder == 0
     move window up to size k
     remove left as right increments at size
     Algo:
     leftPointer variable set to 0
     divisor count variable set to 0
     string version of num variable
     var to track substring for checking set empty
     iterate through string num variable using rightPointer
     add char to curr substring
     check if right - left + 1 == k
     if so see if substring to int is divisor of num (num % subNum == 0)
     if so count += 1
     remove leftPointer
     return count
     */
    var leftPointer = 0
    var count = 0
    var currStr = ""
    let arrNum = Array(String(num))
    print(arrNum)
    for rightPointer in 0..<arrNum.count {
        currStr.append(arrNum[rightPointer])
        if rightPointer - leftPointer + 1 == k {
            let currNum = Int(currStr)!
            if currNum > 0 {
                if num % currNum == 0 {
                    count += 1
                }
            }
            leftPointer += 1
            if currStr.count == 1 {currStr = ""} else {
                var arrCurrStr = Array(currStr)
                arrCurrStr.removeFirst()
                currStr = String(arrCurrStr)
            }
        }
    }
    print(Int("005"))
    return count
}
print("problem 7")
print(divisorSubstrings(2005, 3))

func countGoodSubstrings(_ s: String) -> Int {
    // number if strings size 3 with no repeating in string input, same substring if occurs again counts
    /*
     sliding window of 3 check substring using set, adjust count
     */
    var leftPointer = 0
    var count = 0
    var currStr = ""
    let sArr = Array(s)
    for rightPointer in 0..<sArr.count {
        currStr.append(sArr[rightPointer])
        if rightPointer - leftPointer + 1 == 3 {
            if currStr.count == Set(currStr).count {
                count += 1
            }
            leftPointer += 1
            var currStrArr = Array(currStr)
            currStrArr.removeFirst()
            currStr = String(currStrArr)
        }
    }
    return count
}

print("problem 8")
print(countGoodSubstrings("aababcabc"))

func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
    /*
     find specific sub out of all subs that meets largest condition
     window has to be k size so can continue adding until k
     all elements distinct in sub
     return count for number of max sum with distinct
     */
    var leftPointer = 0
    var largestSum = 0
    var currSum = 0
    var currArr: [Int] = []
    var freqDict: [Int: Int] = [:]
    for rightPointer in 0..<nums.count {
        let curr = nums[rightPointer]
        currSum += curr
        freqDict[curr, default: 0] += 1
        currArr.append(nums[rightPointer])
        if rightPointer - leftPointer + 1 == k {
            if freqDict.count == k {
                if largestSum < currSum {
                    largestSum = currSum
                }
            }
            currSum -= currArr[0]
            freqDict[currArr[0]]! -= 1
            if freqDict[currArr[0]] == 0 {
                freqDict.removeValue(forKey: currArr[0])
            }
            currArr.removeFirst()
            leftPointer += 1
        }
    }
    return largestSum
}
