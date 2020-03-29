//
//  DSA.swift
//  DSATest1
//
//  Created by Lynk on 3/12/20.
//  Copyright © 2020 Lynk. All rights reserved.
//

import Foundation


//Do not modify these two node classes!!
class Node {
    var value: Int
    var next: Node?
    var previous: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class BinaryNode {
    var value: Int
    var left: BinaryNode?
    var right: BinaryNode?
    
    init(value: Int) {
        self.value = value
    }
}

//*********************************


class DSA {
    
    // Do not change any of the function names or the function signatures (the number of arguments in a function)
    // or else the tests will not pass.
    // e.g. don't change multiply(x, y) to multiply(x,y,z)

    
    
    // Question 1
    // Write a function that returns two numbers multiplied
    // ex: multiply(x: 5, y: 10) should return 50

    func multiply(x: Int, y: Int) -> Int {
        
        return x*y
    }

    
    // Question 2
    // Given an array of integers, return a new array of the same length that contains the original values squared.
    // ex: arraySquare(arr: [1,3,5,8]) should return [1,9,25,64]

    func arraySquare(arr:[Int]) -> [Int] {
        let squaredArr : [Int] = arr.map { num in
            return num * num
        }
        return squaredArr
    }

    // Question 3
    // Given two integers (low and high), return how many numbers are in that range that
    // DO NOT contain the number 5. This includes any number that has a 5, like 15, 352, etc.
    // ex: integerRange(1, 10) should return 9
    // ex: integerRange(4, 25) should return 19

    func integerRange( _ low: Int, _ high: Int) -> Int {
        let numRange = low..<high + 1
        var fiveCount = 0
        
        for num in numRange {
            var val = num
            while val != 0 {
                if val % 10 == 5 || val % 10 == -5 {
                    fiveCount += 1
                    break
                }
                else {
                    val = val/10
                    continue
                }
            }
        }
        
        return numRange.count - fiveCount
    }
    
    
    // Question 4
    // Write a function that takes an integer and an unsorted array of Ints
    // and returns true if there's any pair of numbers in that array that can be
    // summed up to the input integer.
    // ex: inputSum([1,3,5,4,2], 7) should return true
    // ex: inputSum([1,3,5,4,2], 2) should return false

    func inputSum( _ arr: [Int], _ targetInt: Int) -> Bool {
        var left = 0
        var right = arr.count - 1
        var arrayList = arr
        mergeSort(array: &arrayList, startIndex: 0, endIndex: arr.count - 1)
        
        while left != right {
            let sum = arrayList[left] + arrayList[right]
            if sum > targetInt {
                right -= 1
            }
            else if sum < targetInt {
                left += 1
            }
            else {
                return true
            }
        }
        
        return false
    }
    
    func mergeSort<T: Comparable>(array: inout [T], startIndex: Int, endIndex: Int) {
        if startIndex >= endIndex {
            return
        }
        let middleIndex = (startIndex + endIndex) / 2
        mergeSort(array: &array, startIndex: startIndex, endIndex: middleIndex)
        mergeSort(array: &array, startIndex: middleIndex+1, endIndex: endIndex)
        merge(array: &array, startIndex: startIndex, middleIndex: middleIndex, endIndex: endIndex)
    }
    
    func merge<T: Comparable> (array: inout [T], startIndex: Int, middleIndex: Int, endIndex: Int) {
        let leftSubarray = Array(array[startIndex...middleIndex])
        let rightSubarray = Array(array[middleIndex+1...endIndex])
        
        var index = startIndex
        var leftIndex = 0
        var rightIndex = 0
        
        while leftIndex < leftSubarray.count && rightIndex < rightSubarray.count {
            if leftSubarray[leftIndex] < rightSubarray[rightIndex] {
                array[index] = leftSubarray[leftIndex]
                leftIndex += 1
            }
            else {
                array[index] = rightSubarray[rightIndex]
                rightIndex += 1
            }
            index += 1
        }
        
        while leftIndex < leftSubarray.count {
            array[index] = leftSubarray[leftIndex]
            index += 1
            leftIndex += 1
        }
        
        while rightIndex < rightSubarray.count {
            array[index] = rightSubarray[rightIndex]
            index += 1
            rightIndex += 1
        }
    }
    
    
    // Question 5
    // Implement a function that accepts an array of integers as an argument.
    // This function should return the sum of all integers in the array.
    // Your solution should be **recursive**.
    // ex: recursiveSum([1,2,3,4,5]) should return 15

    func recursiveSum( _ input: [Int]) -> Int {
        if input.count == 1 {
            return input[0]
        }
        var arr = input
        let sum = input[0] + input[1]
        
        arr[0] = sum
        arr.remove(at: 1)

        return recursiveSum(arr)
    }

    // Question 6
    // Given a linked list, write a function that takes it as input,
    // traverses it, and returns an array with all the values in the linked list.
    // Assume the linked list starts with 1 as the root node and looks like: 1->9->8->5
    // ex: traverseLinkedList(firstNode) should return [1,9,8,5]
   

    func traverseLinkedList( _ inputList: Node) -> [Int] {
        var arrayList: [Int] = []
        var list : Node? = inputList

        repeat {
            guard let val = list?.value else {
                return arrayList
            }
            arrayList.append(val)
            list = list?.next
        } while list != nil
        
          return arrayList
    }

    // Question 7
    // Given a binary tree, find its maximum depth.
    // The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
    // Note: A leaf is a node with no children.
    //
    // Example tree, depth is 3. Your function should return an integer only.
    //     3
    //    / \
    //   2   20
    //      /  \
    //     7   25
    //

    func maxDepth(tree: BinaryNode?) -> Int {
        
        if tree == nil {
            return 0
        }
        else {
            let leftSide = maxDepth(tree: tree?.left)
            let rightSide = maxDepth(tree: tree?.right)
            return max(leftSide, rightSide) + 1
        }
    }
}
