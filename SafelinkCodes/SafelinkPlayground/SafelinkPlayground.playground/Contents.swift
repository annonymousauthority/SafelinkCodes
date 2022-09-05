import Foundation
import UIKit

func mergedSortAlgo<T: Comparable>(_ array: [T]) -> [T] {
    if array.count <= 1 {
        return array
    }

    let midpoint = array.count / 2
    let left = mergedSortAlgo(Array(array[0..<midpoint]))
    let right = mergedSortAlgo(Array(array[midpoint..<array.count]))
    var sortedArray = Array<T>()

    var leftIndex = 0
    var rightIndex = 0
    while leftIndex < left.count && rightIndex < right.count{
        if left[leftIndex] < right[rightIndex] {
            sortedArray.append(left[leftIndex])
            leftIndex += 1
        }else{
            sortedArray.append(right[rightIndex])
            rightIndex += 1
        }
    }

    sortedArray.append(contentsOf: left[leftIndex..<left.count])
    sortedArray.append(contentsOf: right[rightIndex..<right.count])
    print(sortedArray)
    return sortedArray

}
mergedSortAlgo(["Aaron Allum", "Aaron Augustine", "Andrew Tate", "Barnabas Philip", "Felix Camile"])

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {

    for i in 0..<nums.count{
        let value = abs(target - nums[i])
        for j in 1..<nums.count{
            if value == nums[j] {
                return [i,j]
            }
        }
    }

    return []
}
twoSum([3,2,4], 6)

