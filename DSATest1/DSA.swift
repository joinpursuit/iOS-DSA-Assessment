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
        print(x * y)
        
        return x * y 
    }

    
    // Question 2
    // Given an array of integers, return a new array of the same length that contains the original values squared.
    // ex: arraySquare(arr: [1,3,5,8]) should return [1,9,25,64]

    func arraySquare(arr:[Int]) -> [Int] {
        
        //print(returnSquares(withOriginalArray: arr))
    
        return returnSquares(withOriginalArray: arr)
    }
    
    private func returnSquares(withOriginalArray originalArray: [Int]) -> [Int] {
        guard originalArray.count > 0 else {return [Int]()}
        
        var squaredArray = [Int]()
        
        for number in originalArray {
            squaredArray.append(number * number)
        }
        
        return squaredArray
    }

    // Question 3
    // Given two integers (low and high), return how many numbers are in that range that
    // DO NOT contain the number 5. This includes any number that has a 5, like 15, 352, etc.
    // ex: integerRange(1, 10) should return 9
    // ex: integerRange(4, 25) should return 19

    func integerRange( _ low: Int, _ high: Int) -> Int {
        
        var rangeArr = [Int]()
        
        for number in low...high {
            
            if number <= 10 {
                
                if number != 5 && number != -5 {
                    rangeArr.append(number)
                }
                
            } else {
                let numberString = Array(String(number))
                
                if !numberString.contains("5")  {
                    rangeArr.append(number)
                }
            }
        }
        
        return rangeArr.count
    }
    
    
    // Question 4
    // Write a function that takes an integer and an unsorted array of Ints
    // and returns true if there's any pair of numbers in that array that can be
    // summed up to the input integer.
    // ex: inputSum([1,3,5,4,2], 7) should return true
    // ex: inputSum([1,3,5,4,2], 2) should return false

    func inputSum( _ arr: [Int], _ targetInt: Int) -> Bool {
        let differences = Array(createDictionary(withArray: arr, andTarget: targetInt).values)
        for difference in differences {
            if arr.contains(difference) {
                return true
            } else {
                return false
            }
        }
      
        return false
    }
    
    private func createDictionary(withArray arr:[Int], andTarget target: Int) -> [Int: Int]{
        
        var differenceDict = [Int: Int]()
        
        for number in arr {
            let difference = target - number
            differenceDict[number] = difference
        }
        
        return differenceDict
    }
    
    // Question 5
    // Implement a function that accepts an array of integers as an argument.
    // This function should return the sum of all integers in the array.
    // Your solution should be **recursive**.
    // ex: recursiveSum([1,2,3,4,5]) should return 15

    func recursiveSum( _ input: [Int]) -> Int {
        

        return findSum(withInputArr: input)
    }
    
    private func findSum(withInputArr inputArr: [Int]) -> Int {
        var inputArrDup = inputArr
        var total = 0
        
        while !inputArrDup.isEmpty {
            total += inputArrDup.popLast()!
        }
        return total
    }

    // Question 6
    // Given a linked list, write a function that takes it as input,
    // traverses it, and returns an array with all the values in the linked list.
    // Assume the linked list starts with 1 as the root node and looks like: 1->9->8->5
    // ex: traverseLinkedList(firstNode) should return [1,9,8,5]
   

    func traverseLinkedList( _ inputList: Node) -> [Int] {
        var linkedListValues = [Int]()
        var rootNode = inputList.next
        linkedListValues.append(inputList.value)
        while rootNode != nil {
            linkedListValues.append(rootNode!.value)
            rootNode = rootNode?.next
        }
        return linkedListValues
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
        } else {
            let leftDepth = maxDepth(tree: tree?.left)
            let rightDepth = maxDepth(tree: tree?.right)
            
            if leftDepth > rightDepth {
                return leftDepth + 1
            } else {
                return rightDepth + 1
               
            }
        }
    }
}
